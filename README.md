# qnarre-public

> Lean4 axiomatic theorem-proving with LLM-backed predicate functions
> for the **legal** domain. The redacted public slice of the
> `proving/` subproject. Backs the **Qnarre** product.

A weekly-refreshed window into the formal-legal kernel that runs
alongside the private working repository. The whole point of the
subproject is **strict jurisdictional separation** between three
layers: a Lean4 kernel that does no I/O, predicate sub-agents that
read natural language but never write Lean, and a thin Python driver
that coordinates without legal reasoning of its own.

- Parent organisation: <https://github.com/quantapix>
- Engineering output: <https://quantapix.com>
- Product site (early beta; the hosted verifier is the drive-window
  deliverable, not yet serving): <https://qnarre.quantapix.com>

## The three-layer split

| Layer | Reads | Writes | Tools |
|---|---|---|---|
| **Formal kernel** (`Proving/<Framework>/*.lean`) | only Lean | only Lean | Lean elaborator. No I/O, no LLM calls. |
| **Predicate functions** (`predicates/<framework>/*.md`) | one complaint text + entity refs | a single `Bool` (plus evidence + uncertainty) | LLM sub-agent with `context: fork`. May consult a semantic memory store. |
| **Driver** (`scripts/extract_facts.py`) | manifest + complaint | `Proving/<Framework>/Facts.lean` (axioms) + audit JSON | LLM `--print` invocations, **model-locked to the strongest available model**. |

The Lean kernel never reads natural language. The predicate
sub-agents never write Lean. The driver is a thin coordinator. The
verifiable proof IS the Lean elaboration trace produced by
`lake build`.

Model choice is a capability constraint, not a cost knob: production predicate
runs hard-fail on a weaker model unless an explicit smoke-test flag is passed.
A measured bake-off found a weaker model fabricated a "cannot read the document"
hedge on a document it was handed and mis-placed its one uncertainty flag on that
fabrication; the stronger model produced zero such hedges and flagged high
uncertainty only on genuine knife-edge calls. The driver therefore carries two
guards — one rejects-and-retries a result that claims it couldn't read the input
or carries no evidence (a substantive negative finding is a legitimate `False`,
not an error); the other treats a high-uncertainty band as a human-review flag,
never an auto-reject.

## Why this works

1. The semantic memory store sees only natural-language artifacts. It
   never tries to embed Lean dependent types.
2. Predicate functions have a very narrow output domain (one Bool per
   call) — they fit comfortably inside a forked sub-agent.
3. Lean's kernel verifies composition. Once each predicate fact is
   recorded as an axiom, the validity theorem is a pure
   structure-introduction proof. If it type-checks, the result is
   mathematically guaranteed **given the predicate truths**.
4. The audit trail is the JSON in `examples/<id>/facts.json` — every
   predicate output, with evidence quotes and an uncertainty score.

### Predicates can be decomposed

A predicate need not be a single opaque `Bool`. A high-level element can be
**derived** in the kernel from finer **leaf predicates**: the LLM sub-agent
decides only the leaves — the narrow, case-law-anchored questions it can
answer from the document — and the kernel composes them into the high-level
element through procedural theorems discharged by a small, core-only tactic
(no external proof library). This stratifies the work by cost and trust: some
elements are decided entirely in the kernel with no model call at all; leaf
extraction runs on the strongest available model; and the proof search that
assembles them is itself model-driven but kernel-checked. The decomposition
never weakens the guarantee — every derived element still bottoms out in
recorded axioms and a type-checked composition.

## Frameworks

Each framework lives under `Proving/<Framework>/` (kernel) +
`predicates/<framework>/` (specs).

| Framework | Kernel | Specs | Statutory basis |
|---|---|---|---|
| **Civil RICO** | `Proving/Rico/` | `predicates/rico/` | 18 U.S.C. §§ 1961–1968; § 1962(a)(b)(c)(d) + § 1964(c) standing |
| **Title VI** | `Proving/TitleVI/` | `predicates/titlevi/` | 42 U.S.C. §§ 2000d et seq.; intentional, disparate impact, retaliation |
| **CivilRights** | `Proving/CivilRights/` | `predicates/civilrights/` | 42 U.S.C. §§ 1981, 1983, 1985(3); equal contracting, color-of-law, civil-rights conspiracy |
| **Title IX** | `Proving/TitleIX/` | `predicates/titleix/` | 20 U.S.C. §§ 1681–1688; sex discrimination in federally funded education |
| **Title VII** | `Proving/TitleVII/` (three goldens) | `predicates/titlevii/` | 42 U.S.C. § 2000e family; § 2000e-5(f)(1) enforcement, § 2000e-6(a) pattern-or-practice, § 2000e-16(c) federal-sector |
| **Rehab § 504** | `Proving/Rehab504/` | `predicates/rehab504/` | 29 U.S.C. § 794; disability discrimination in federally assisted or conducted programs |
| **Age Act** | `Proving/AgeAct/` | `predicates/ageact/` | 42 U.S.C. §§ 6101–6107; age discrimination in federally assisted programs |
| **Title II Enf** | `Proving/TitleIIEnf/` | `predicates/titleiienf/` | 42 U.S.C. § 2000a-5(b); the enforcement-mechanism golden — three-judge-court track + single-judge fallback for an Attorney-General pattern-or-practice action (a procedural shape, not a discrimination claim: chief-judge addressee, panel composition, an "in every way expedited" duty, and a direct Supreme-Court appeal as first-class elements) |
| **ADA** | `Proving/ADA/` | `predicates/ada/` | 42 U.S.C. ch126 §§ 12111/12112 (Title I employment), §§ 12131/12132 (Title II public services), §§ 12181/12182 (Title III public accommodations), § 12203 (retaliation) — a disability framework with three title-specific coverage regimes (employer / public entity / public-accommodation operator) and "on the basis of" / "by reason of" causation; impact is judicially enforceable, so there is no administrative-only split; a six-route validity theorem |

Spec roster: RICO 25 (plus 9 leaf specs under `predicates/rico/hier/`, the
hierarchical decomposition); Title VI 17; CivilRights 14; Title IX 21;
Title VII 19; Rehab § 504 19; Age Act 17; Title II Enf 10; ADA 24 — **nine
frameworks, eleven hand-built golden reference cells** (Title VII carries
three). Three orphaned RICO axioms — predicates no theorem reached — were
retired rather than left standing as unused surface.

Title IX was the first golden added by the **golden-expansion path**, and the
pattern has since produced four more frameworks. The path is mechanical: a
blind agent cell encoding a new statute can only bridge to an existing golden
at a *partial* tier, with the gap localized to a real statutory element
outside the golden's closed shape — Title IX's `sex` ground sits categorically
outside Title VI's `{race, color, national origin}` enumeration, § 504's
`disability` ground adds a federally-conducted prong and an
"otherwise qualified" gate, the Age Act's `age` ground carries a statutory
carve-out schedule as a first-class coverage element. Each irreducible gap
earned the statute its own hand-built golden, encoded as a *sibling* rather
than an instance; the same blind cell then re-bridges to the new golden at
full tier without a `sorry`. The employment-discrimination title contributed
three goldens at once — its mixed public/private enforcement provision, the
pattern-or-practice action, and the federal-sector channel are three distinct
enforcement shapes, each with its own validity theorem. The first seven
frameworks are driver-operational: predicate specs, a worked end-to-end
sample, and a status roster per framework. The eighth — the Title II
enforcement golden — is the first **procedural** reference (an enforcement
mechanism rather than a discrimination cause of action); it is golden-bridged
and driver-operational, and its worked end-to-end samples have landed — three
of them, covering the three-judge track, the single-judge fallback, and a
second three-judge fact pattern.

The ninth framework — the Americans with Disabilities Act — is the first built
**golden-first**: the hand-written kernel and predicate specs landed ahead of
any blind encoding wave, where the earlier expansion goldens were each
discovered when a blind cell failed to fully bridge an existing reference. It
is encoded as a *sibling* of the Rehabilitation Act § 504 disability
framework, but splits into three title-specific coverage regimes — employer,
public entity, and public-accommodation operator — and drops § 504's "solely
by reason of" causation for the ADA's "on the basis of" / "by reason of"
standard. Because the statute makes disparate-impact judicially enforceable,
it has no administrative-only branch, and validity resolves through any of six
routes. Its bridging encodings against the public-statute corpus are forward
work, not a re-derivation of a prior anchor.

One thing worth being precise about, because "worked end-to-end sample" can be
read two ways. Every framework's sample runs the full pipeline — driver,
generated axiom block, `lake build` — but seven of the bundled samples are
**stub-built**: the driver was run with predicate evaluation canned to `True`
rather than dispatched to a model, so the sample exercises the plumbing and the
kernel composition, not the predicate rubrics. An `ACCEPTED` verdict from a
stub-built sample says nothing about the complaint. The racketeering sample,
the funding-discrimination sample, and the three enforcement-mechanism samples
are real predicate runs; the other seven are scaffolds awaiting one. They are
marked as such rather than quietly counted, and un-stubbing them is tracked
work.

Kernels pin to a current stable Lean toolchain (`v4.32.0`); the build needs no
Mathlib dependency, which keeps `lake build` fast.

## Axiomatizing the full U.S. Code

The nine hand-built frameworks above are the **golden reference** for a
larger program: a kernel-checked Lean4 encoding of the operative content
of the **entire** United States Code — all 54 titles — produced not by a
single model pass but redundantly, by independent agent teams working
along several orthogonal strategies, then reconciled.

The motivation is an honest admission. A single model that reads a statute
and emits Lean has no oracle: there is no ground-truth "correct encoding"
to check it against. So we manufacture one out of redundancy. If **N
independent strategies**, each blind to the others, encode the same section
and the kernel can prove their encodings mutually consistent, then agreement
is mechanical evidence of a faithful mapping — and disagreement localizes
exactly where a human should look. Redundancy replaces the missing oracle.

### The orthogonal strategies

Each strategy is a genuinely different lens on the same text. An agent working
one strategy never sees the others, so the views are statistically independent —
the precondition for treating agreement as evidence. **Five core strategies** are
fanned out on every section; **five specialized strategies** are opt-in for the
sections that need them.

| Strategy | Lane | The lens |
|---|---|---|
| **Elements** | core | the pleading elements a litigant must prove — the cause-of-action view (the method the hand-built frameworks already use) |
| **Deontic** | core | the normative operator — obligation, prohibition, permission, power, definition |
| **Ontology** | core | the interlocking definitions — what each defined term denotes, as a dependency graph |
| **Procedure** | core | the process as a state machine — filing, notice, deadline, limitations, appeal |
| **Structure** | core | the cross-references — incorporation, exception, override, savings clauses across sections |
| **Remedy** | specialized | who may enforce and what they recover — private right of action vs. agency-only, the standing chain |
| **Scienter** | specialized | the required mental state — knowledge, intent, recklessness, strict liability |
| **Sanction** | specialized | the penalty schedule — fine, forfeiture, term, debarment |
| **Intertemporal** | specialized | effective-date and savings dynamics — which version governs which conduct |
| **Evidentiary** | specialized | the proof burdens and presumptions a section imposes |

Specialized strategies that recur **across** titles — a scienter standard, a
penalty schedule, an evidentiary presumption — are collapsed onto a single shared
algebra, each collapse licensed by its own kernel-checked Bridge rather than by a
name match.

### Agreement is a kernel-checked Bridge

When two strategies encode the same section, a **Bridge lemma** states that
one strategy's composite implies the other's, under a declared
correspondence between their predicates. A Bridge that type-checks *without
a `sorry`* is mechanical proof the two independent encodings agree; one that
cannot be discharged localizes a real disagreement and routes it to human
review. Sections are then graded into confidence tiers — **corroborated**
(three or more strategies agree in the kernel), **partial**, and
**single / conflicting** (not promoted; reviewed).

Agreement lemmas are held to a stricter standard than the rest of the kernel:
a Bridge must be discharged by an explicit term-level proof, never by the
automated proof search the rest of the build may use — a syntactic gate
rejects an automated discharge of an agreement lemma outright, so "the two
encodings agree" can never be an artifact of search heuristics.

A practical lesson from the first calibration wave: agreement is measured by
these Bridges, **not** by comparing predicate *names*. Blind agents
re-derived a statute's element decomposition exactly while sharing almost no
vocabulary with the hand-built reference — naming is a free variable, so a
name-match score is unwinnable, but a Bridge that maps the two vocabularies
discharges cleanly. The correctness signal is the kernel proof, never the
spelling.

#### What an enumeration bridge does and does not certify

Not every full-tier bridge certifies the same thing, and the difference is
worth stating before anyone reads a tier as a fidelity score.

Some golden predicates are **flat opaque axioms** — the golden side has no
element structure to compare against. When a blind encoding bridges to one of
those, it discharges through a single declared correspondence, and what the
kernel certifies is narrow: the blind composite is **type-compatible with being
named** a predicate offence by the statute's own enumeration clause. That is a
real statutory fact and a real proof, and it is *naming-independent* — the
bridge never relies on the blind cell's choice of predicate names, which are a
free variable. But it is **not** element-level agreement, and it is not evidence
that the two encodings decompose the statute the same way.

Where the golden side does carry element structure, the bridge tests exactly
that, and the result is a fidelity read.

Every full-tier section now records which of the two it earned. Of the 43
sections holding a full-tier golden bridge, **8 rest on element-level agreement
and 35 on statutory enumeration.** The distinction was not visible in the
tier alone, so the tier stopped being reported alone.

The gap does not close by trying harder. A recent wave over a previously
unencoded chapter of the criminal title discharged every one of its golden
bridges sorry-free — and all of them through the enumeration clause, because
the golden-side predicate for that clause is a flat opaque axiom and no
hand-built reference encodes those offences element-wise. Element-level
agreement was unavailable **by construction**, not unearned. The only cure is
to hand-build a golden for that subject matter, and that has to be authored
outside the blind fan-out: the fan-out is scored *against* a golden, so it can
never be the thing that mints one.

### Where it stands

The ground-truth corpus — the full Code, pinned to a specific published
release point so an encoding is reproducibly bound to exact statutory text —
is in place, alongside a durable off-site archive of that release point so a
proof remains reproducible even after the source is rotated. The conventions,
the strategy briefings, and a shared cross-strategy predicate library are
frozen. A hand-built calibration cell on the canonical racketeering
operating-or-managing provision is encoded under all six strategies and is
kernel-green, with its cross-strategy Bridges discharged. A first wave of
**blind** agent cells — RICO investment / acquisition / conspiracy, the three
Title VI theories, and the §§ 1981 / 1983 / 1985(3) civil-rights provisions —
has been scored against the golden reference via committed Bridge modules.

A second wave widened the pattern along two new axes. It took a title with **no
hand-built reference** — the Federal Arbitration Act — and encoded it under all
five applicable strategies; the cross-strategy Bridges discharged in the kernel,
the first agreement measured on sections the golden reference does not cover. It
also took the racketeering prohibited-activities provisions and ran two
independent strategies — the pleading-elements view and the deontic-operator
view — blind of the hand-built reference; their cross-strategy Bridge and a
Bridge back to the golden reference both discharged without a `sorry`, so the
blind encodings now sit in the authoritative tree under a separate namespace,
alongside the reference they were scored against rather than replacing it.
Predicates that recur **across** titles — an interstate-commerce nexus, a
limitations window, a conspiracy agreement — were collapsed onto a single shared
definition, each collapse licensed by its own kernel-checked Bridge rather than
by a name match.

A subsequent wave family took an entire **labor-relations title** — the
National Labor Relations Act — with no hand-built reference, and encoded its
enforcement core, its self-organization and representation sections, and its
miscellaneous provisions blind across the applicable strategies. Cross-strategy
Bridges discharged in the kernel; recurring predicates — a jurisdictional
threshold, a limitations window, a savings clause — collapsed onto the shared
cross-title algebra under their own kernel-checked Bridges. It is the second
body of statute (after arbitration) where agreement is measured purely on
cross-strategy consistency, the golden reference being silent on it.

A subsequent **golden-adjacent** wave proved the pattern on sections that sit
*next to* a hand-built reference without being it. The marquee result: a blind
encoding of the equal-property-rights provision was bridged to the hand-built
equal-contracting framework, **full-tier and sorry-free**, mapping the
property right onto the contract right through a declared correspondence — the
kernel certifying that two independently-derived encodings of adjacent
civil-rights statutes agree. The civil-RICO private-right-of-action standing
chain was bridged at a lower confidence tier, with the gap surfaced as a named
hypothesis a human reviewer can localize rather than a silent omission. A
parallel **employment-discrimination** wave (no golden twin — the employment
title is not the funding-discrimination reference) encoded the core-liability
sections under all five strategies and scored them on cross-axis agreement
alone.

A subsequent pass re-ran the three blind golden re-derivations — the
racketeering, equal-contracting, and funding-discrimination frameworks — on the
model-locked lane, holding them as evidence-only archives without disturbing the
hand-built anchors they reproduce; all three still bridge to their goldens. Each
promoted wave is now frozen into an immutable, off-site-archived snapshot at
promotion time, so a wave's blind cells stay reproducible after the working
sandbox is pruned. The most recent golden expansion added a **fourth** hand-built
reference — the funded-education nondiscrimination title — discovered exactly
when a blind cell *failed* to fully bridge to an existing golden and localized
the gap to a single protected-ground hypothesis.

The most recent waves closed out an entire statutory chapter family. The
employment-discrimination title's enforcement provisions were encoded blind
under eight strategies, held un-promoted while their definitions block was
encoded in a follow-up wave, then reconciled and promoted together — the
definitions wave grounded four of the enforcement wave's five dangling
ontology terms, and one deliberately-asserted polarity decision re-tiered a
conflicting section to corroborated. Golden bridges now discharge against all
three hand-built employment-enforcement goldens. A final tail wave swept the
chapter's miscellaneous sections plus the definitional fragment its
funding-discrimination sibling depends on — that fragment bridges to the
hand-built golden at full tier, sorry-free. The chapter family is now fully
sliced: every section is encoded, scored, and graded. Subsequent waves
carried the same pattern into further titles — the administrative-procedure
title among them. The most recent waves widened the racketeering
**predicate-offense catalog** — the enumerated offenses a pattern is built
from — well past the initial set: document fraud, loansharking (extortionate
credit transactions), counterfeiting of both obligations and trafficked goods,
and interstate transport of stolen property were each encoded blind and bridged
into the kernel, with the counterfeiting-of-obligations chapter earning its own
kernel-checked golden bridge. Two further titles were opened with no hand-built
reference — the immigration-and-nationality title and the
trafficking-victims-protection provisions of the foreign-relations title, the
latter's definitions block lifting one previously-partial section to
corroborated once its defined terms were grounded. Recurring notions — a
"financial institution" definition, an interstate-commerce nexus — continue to
collapse onto the shared cross-title algebra under their own Bridges. The
running corpus rollup now stands at **402 encoded sections across 11
titles** — 11 of the Code's 58 titles, and roughly two-thirds of one percent of
its ~62,800 operative sections — counted as distinct statutory sections (a
section encoded under two lenses counts once), derived mechanically from the
per-section records and never hand-maintained, with every promoted wave frozen
into an immutable off-site archive at promotion time. Confidence grades are
reported separately and under narrower scope than they once were — see
[`STATUS.md`](./STATUS.md), which carries the 2026-07-17 correction and the
re-slice program that answers it.

The most recent cycle did two things the earlier waves had not. It ran a
**second independent blind encoding of a cluster already encoded eight days
earlier** — the Reconstruction-era civil-rights sections — with different cells
and a different reconciler, which is a re-witness measurement the program has
no other way to buy. Five of seven sections graded identically across the two
encodings; two diverged, in opposite directions, which is what makes them
informative rather than noise. The equal-property-rights section discharged its
golden bridge sorry-free **twice, independently**. Where the two encodings
disagreed, the grade was resolved by **conjunction — full tier only where both
waves agree** — so the second look could lower a grade and not only raise one,
and it did. And it took a previously-unencoded chapter of the criminal title
and sliced it complete across six lenses, as a clean append with no overlap.

The remaining work is scale: the same pattern, title by title, in waves, now
across ten strategies rather than six. The fan-out runs on two lanes — a
manual-interactive lane, the current lane, and a programmatic batch lane that
stays specified but paused pending a provider-plan change — driven by a single
repeatable procedure with one hard rule: the agent fan-out must draw zero
manual approvals, so a wave runs unattended end to end. Every cell writes to a sandbox, never to
the authoritative tree, until a reconciliation gate and a human review promote
it. See [`STATUS.md`](./STATUS.md) for the current wave tally.

### Open to outside contributors

This program — **axiomatize the U.S. Code, in the age of AI** — is open to
outside contributors. It is the natural place to build the project in the
open: it works over **public federal statutes only**, so collaboration
carries no privacy-floor surface, and the redundancy design means an
independent encoding is *useful precisely because* it was written blind to
the others. Pick up a section, a predicate, or a title; encode it under one
of the ten strategies; a cross-strategy Bridge measures agreement in the
kernel.

The project today is **a single developer working with AI assistance, now
opening this effort to contributors** — not a community project, an
engineering practice opening one well-isolated lane. Start with
[`CONTRIBUTING.md`](./CONTRIBUTING.md) and the curated
[`GOOD-FIRST-ISSUES.md`](./GOOD-FIRST-ISSUES.md) — **five open tasks of an
original nine**, each with acceptance criteria and counts re-derived against
the working tree on 2026-08-07. The other four were swept internally in the
week after the roster was first published and are marked closed in place; the
roster says which, and why that makes the linter task the most valuable one on
the list. They are not filed as individual issues and Discussions are not
enabled, so an issue on this repo is the channel. The
strategy briefings, the shared cross-strategy predicate library, and the
golden-reference cells are frozen, so a new cell has a fixed target to
score against.

## Statutory text is vendored, not pasted

The operative statutory text lives under a vendored, pinned mirror
of canonical U.S. Code text — never pasted inline into specs.
Predicate sub-agents resolve a `usc_cite` via a path/text lookup
against an index file. This way a statutory revision is a single
re-vendor step; specs that cite obsolete subsection numbers fail
the build, not silently elaborate.

## Predicate spec shape

Every predicate is a markdown file with a fixed frontmatter shape:

```yaml
---
predicate: <name>
framework: rico | titlevi | civilrights | titleix | titlevii | rehab504 | ageact | titleiienf | ada
returns: Bool
inputs:
  complaint: <slug>
  entities: [...]
usc_cite: <e.g. "42 U.S.C. § 1983">
evidence_required: <one-line description>
uncertainty_cap: 0.20
---
```

Body sections: **Question**, **Authority**, **Evidence**,
**Adversary case**, **Output**. The sub-agent returns a JSON object
with `{ value: Bool, evidence: [{quote, locator}], uncertainty:
[0,1) }`. The driver records it as a Lean `axiom` in the framework's
generated `Facts.lean`.

## Build and verify

```
lake build
```

Either the kernel elaborates against the generated facts — the
theorem holds — or it does not, in which case the failing theorem
names the predicate that does not provide enough evidence under the
current axiom set. There is no "sort of holds." The Lean kernel
draws a hard line.

## Worked examples

`examples/<id>/` holds per-run artifacts: `facts.json`,
`facts.lean` (the generated axiom block), the driver's audit log,
and the Lean elaboration trace. Each example is a complete
end-to-end demonstration of one complaint passed through the
pipeline. Refreshed alongside the predicate specs.

## What this repo is not

- Not legal advice. The verifier checks a redacted complaint's
  predicate structure against named statutes; it does not opine on
  whether to file, when to file, or whom to file against.
- Not a chat surface. Predicate sub-agents are scoped, audited, and
  short-lived. They do not retain conversation state across calls.
- Not a private-PII surface. The hosted service accepts only
  redacted documents. No real names, dockets, addresses, financial
  account numbers, or other PII ever flow to the server or to any
  LLM.

## Cadence

Refreshed weekly from the private working tree. Spec rewrites, new
predicates, framework extensions, and kernel-shape changes are
committed as ordinary diffs — the commit log is the change record.

Authored by a sole developer working with an AI assistant (Claude Code) under written CLAUDE.md contracts — methodology in [qagents-public](https://github.com/quantapix/qagents-public).

## Contact

[github.com/quantapix](https://github.com/quantapix) — open an issue on any repo
in the org. Answered in public; there is no contact email.

## License

Apache-2.0 (`LICENSE.txt`). Code-class repo — Lean axioms,
predicate stubs, and the driver are reused under the standard
Apache patent grant.
