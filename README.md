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
- Live product: <https://qnarre.quantapix.com>

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

## Frameworks

Each framework lives under `Proving/<Framework>/` (kernel) +
`predicates/<framework>/` (specs).

| Framework | Kernel | Specs | Statutory basis |
|---|---|---|---|
| **Civil RICO** | `Proving/Rico/` | `predicates/rico/` | 18 U.S.C. §§ 1961–1968; § 1962(a)(b)(c)(d) + § 1964(c) standing |
| **Title VI** | `Proving/TitleVI/` | `predicates/titlevi/` | 42 U.S.C. §§ 2000d et seq.; intentional, disparate impact, retaliation |
| **CivilRights** | `Proving/CivilRights/` | `predicates/civilrights/` | 42 U.S.C. §§ 1981, 1983, 1985(3); equal contracting, color-of-law, civil-rights conspiracy |
| **Title IX** | `Proving/TitleIX/` | _kernel-only_ | 20 U.S.C. §§ 1681–1688; sex discrimination in federally funded education |

Spec roster at launch: RICO 28 specs (14 common + 4 c + 3 a + 3 b +
4 d); Title VI 17 specs (7 coverage + 2 intentional + 5
disparate-impact + 3 retaliation); CivilRights 14 specs (4 § 1981 +
5 § 1983 + 5 § 1985(3)).

Title IX is the **fourth** golden framework and the newest. It is the structural
twin of Title VI — Congress patterned the funded-education nondiscrimination rule
after the funding-discrimination rule — but it is encoded as a *sibling*, not an
instance: its protected ground is `sex`, which sits categorically outside Title
VI's closed `{race, color, national origin}` enumeration, and it carries a
nine-part statutory exception schedule and an education-specific coverage clause
that Title VI lacks. That irreducible domain mismatch surfaced mechanically: a
blind encoding of the Title IX core could only bridge to the Title VI golden at a
*partial* tier, with the gap localized to exactly the ground-correspondence
hypothesis — so Title IX earned its own golden, against which the same blind cell
re-bridges at full tier without a `sorry`. It is kernel-only today (predicate
specs, a worked sample, and a status roster are open work); its role is to serve
as a calibration target for the automated program.

Kernels pin to a current stable Lean toolchain (`v4.30.0`); the build needs no
Mathlib dependency, which keeps `lake build` fast.

## Axiomatizing the full U.S. Code

The three hand-built frameworks above are the **golden reference** for a
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

A practical lesson from the first calibration wave: agreement is measured by
these Bridges, **not** by comparing predicate *names*. Blind agents
re-derived a statute's element decomposition exactly while sharing almost no
vocabulary with the hand-built reference — naming is a free variable, so a
name-match score is unwinnable, but a Bridge that maps the two vocabularies
discharges cleanly. The correctness signal is the kernel proof, never the
spelling.

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

The remaining work is scale: the same pattern, title by title, in waves, now
across ten strategies rather than six. The fan-out runs on two lanes — a
programmatic batch lane (gated on a 2026-06-15 credit activation) and a
manual-interactive bridge lane available now — driven by a single repeatable
procedure with one hard rule: the agent fan-out must draw zero manual approvals,
so a wave runs unattended end to end. Every cell writes to a sandbox, never to
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
engineering practice opening one well-isolated lane. Start with the
`CONTRIBUTING` notes and the good-first-issues here, and the project
[Discussions](https://github.com/quantapix/qagents-public). The
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
framework: rico | titlevi | civilrights
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

## Contact

[`quantapix@gmail.com`](mailto:quantapix@gmail.com)

## License

Apache-2.0 (`LICENSE.txt`). Code-class repo — Lean axioms,
predicate stubs, and the driver are reused under the standard
Apache patent grant.
