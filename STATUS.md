# qnarre-public — status

_Snapshot: 2026-07-31. Refreshed weekly (Fridays) during the
2026-06-01 → 2026-12-01 drive window._

This is the release-narrative status of the legal-domain slice: what has
landed, where the corpus program stands, and what is next. It is a companion
to the [README](./README.md), not a substitute.

## Standing correction — 2026-07-17, still in force

On 2026-07-14 our own adversarial review lane found leak channels in the
cross-axis **agreement oracle** — the mechanism that scored the per-section
confidence grades. Independent verification cells could, in principle, observe
one another's outputs, so blind-agreement figures minted before that date are
not established as blind.

That correction **stands**. The corpus-wide grade tally is still withdrawn.
What is unaffected, and was never in doubt: **kernel soundness** — every
`lake build` is green and every promoted proof is `sorry`-free — and the count
of sections *encoded*, which is a mechanical census, not an agreement figure.

Two things have changed since: a blind re-slice program is running and has
covered a defined fraction of the corpus (below), and a second, narrower leak
was found and closed the same way (below). Earlier weekly digests (W24–W28) are
dated records and are left intact; this page supersedes their grade language.

## The re-slice program: what it covers, what it does not

Two instruments measure this, they do not agree, and reporting only the
flattering one would be the same mistake this page exists to correct.

**A transcript audit** re-read the surviving agent transcripts and certified
**57 of 86 archived waves** as blind, with **272 sections** resting on post-fix
blind evidence. Twenty waves predate transcript retention and are
**unauditable** — there is no way to certify them after the fact, so they are
not certified; a blind re-slice is their only remedy. Two are void.

**A wave-class census** asks a different question — does the wave's own
manifest record a certification verdict — and the answer is starker: **exactly
one wave in 86 carries a wave-time certification fact.** The rest sit inside
the audited window and are counted as *inferred*, which is countable but is
not an audited verdict, and we will not present it as one. Earlier copy on this
page reported a certified-wave count that came from a classifier deriving the
class from the wave's **date**, with no audit fact consulted anywhere. That
classifier is replaced; it now reads the recorded verdict, and an adverse
verdict — breach, review, unauditable — obliges a re-slice rather than aging
into "certified" because the wave is recent. **The figure this page previously
published for certified waves is withdrawn.**

Writing the certification at archive time, so a wave cannot default to
uncertified, is the durable fix and is not yet wired.

**The backlog, as an upper bound.** Of **376 catalogued sections, 117 owe a
re-slice** against **259 eligible** — 28 of those hold a golden bridge. The
number is an upper bound and we would rather say so than quote it clean: the
census attributes a section's standing wave by reading a wave-archive tree
that is **local to one workstation**, and waves run elsewhere read here as
owing a re-slice they have already served. Three such waves are known. The
fix — make the census print its own scope, and cross-check against a
tree-global artifact — is open.

An audit **certifies**; it never **cures**. A wave can be certified blind and
still owe a re-slice for an unrelated defect. Those are separate properties and
we track them separately.

## What the re-slice found

**A previously-reported result did not survive.** The equal-contracting
provision (42 U.S.C. § 1981) had stood at full tier under an aged-off wave. Its
fresh blind re-slice graded it one tier lower. We are reporting the lower grade.
The adjacent equal-property-rights provision (§ 1982) — the marquee
cross-statute bridge, where a blind encoding was mapped onto the hand-built
equal-contracting framework sorry-free — **held at full tier** on post-fix blind
evidence.

**A second, narrower leak was found and closed.** In the institutionalized-persons
statute, one section had been graded down because a superseding cell enumerated a
shared defined term and, in doing so, pulled back a prior encoding of the very
same citation — a targeted cross-run leak rather than a corpus-wide one. A clean
targeted re-slice removed the cap and the section recovered a tier. We surface
this for the same reason as the July finding: the cells check one another, and
one lane caught it.

**What a full-tier bridge certifies got narrower.** Some golden predicates are
flat opaque axioms with no element structure. A bridge to one of those certifies
that a blind encoding is type-compatible with being *named* a predicate offence
by the statute's enumeration clause — a real statutory fact, and
naming-independent, but not element-level agreement. Of the 36 sections holding a
full-tier golden bridge, **8 rest on element-level agreement and 28 on statutory
enumeration.** Eighteen bridge modules had their headers rewritten to say so.
Nothing was re-proved; the proofs were always these proofs. The labels now match.
(The split has since moved to 43 total — 8 element-level, 35 enumeration — as
new chapters bridged through the enumeration clause; the README explains why
that gap cannot close without new hand-built references.)

**Agreement over the wrong statute.** A resolver that mapped a citation to a
file was silently picking the first alphabetical match when a bare section
number was not unique within a title — and a section number frequently is not.
One title has five files whose name is the same section number. Eleven
catalogued sections turn out to have had their independent encodings agree on
text that was **not the section they were pointed at**; four of the eleven held
a full tier. The resolver now prefers a real section over a rendered note
heading and **fails loud** rather than guessing when more than one real
candidate survives. That fixes every future read. It cannot retroactively make
a past agreement mean anything, so those eleven owe a fresh blind encoding —
and they are deliberately tracked apart from the main backlog, which partitions
by wave rather than by this kind of defect and would otherwise never reach
them.

**A reference cell was itself wrong, and a blind cell is what caught it.** The
federal-sector employment-discrimination golden — a hand-built cell, one of the
things the automated program is scored *against* — conjoins a 90-day
suit-filing window onto a route the statute does not attach it to. The statute
gives two disjunctive routes: within 90 days of a final agency action, **or**
after 180 days of agency inaction, the second of which runs precisely while no
final action exists, so no 90-day clock can attach to it. The blind encoding
read the statute correctly and the hand-built reference did not; the
disagreement surfaced as a named gap hypothesis rather than a silent pass. The
repair is specified and needs a build session. Worth stating plainly: a
defective oracle inflates nothing here — the gap **capped** the section at a
lower tier rather than lifting it — but it does mean at least one calibration
reference was unverified against the statute it encodes, and redundancy is what
found it.

## Encoded census (mechanical; unaffected by the correction)

- **402 sections encoded across 11 U.S. Code titles.** Counted as distinct
  statutory sections at their best achieved tier; derived from the per-section
  records, never hand-maintained.
- That is 11 of the Code's 58 titles, and about 0.64% of its ~62,800 operative
  sections. The share is small and the denominator is the point: the program is
  a method demonstrated at scale, not a finished encoding.
- Every promoted wave is frozen into an immutable off-site snapshot at promotion
  time, so a wave's blind cells stay reproducible after the working sandbox is
  pruned.
- Ground truth is a pinned full-Code mirror — all 54 titles — bound to a specific
  published release point, with a durable off-site archive so a proof stays
  reproducible after the source rotates.

## Hand-built golden frameworks

Nine frameworks — eleven golden reference cells (the employment title carries
three) — elaborate under `lake build` and serve as the reference the automated
program is scored against.

| Framework | Statutory basis | Specs |
|---|---|---:|
| **Civil RICO** | 18 U.S.C. §§ 1961–1968 (§ 1962(a)(b)(c)(d) + § 1964(c) standing) | 25 + 9 leaf |
| **Title VI** | 42 U.S.C. §§ 2000d et seq. (intentional / disparate-impact / retaliation) | 17 |
| **CivilRights** | 42 U.S.C. §§ 1981, 1983, 1985(3) | 14 |
| **Title IX** | 20 U.S.C. §§ 1681–1688 (sex discrimination in federally funded education) | 21 |
| **Title VII** | 42 U.S.C. § 2000e family — three goldens: § 2000e-5(f)(1) enforcement, § 2000e-6(a) pattern-or-practice, § 2000e-16(c) federal-sector | 19 |
| **Rehab § 504** | 29 U.S.C. § 794 (disability; federally assisted or conducted programs) | 19 |
| **Age Act** | 42 U.S.C. §§ 6101–6107 (age; federally assisted programs) | 17 |
| **Title II Enf** | 42 U.S.C. § 2000a-5(b) — the enforcement-mechanism golden (three-judge-court track + single-judge fallback; a procedural shape, not a discrimination claim) | 10 |
| **ADA** | 42 U.S.C. ch126 §§ 12111/12112, 12131/12132, 12181/12182, 12203 — three title-specific coverage regimes and a six-route validity theorem | 24 |

Each top-level validity theorem is an inductive over its substantive
subsections; predicate facts enter as kernel axioms and the validity proof is a
pure structure-introduction. A bundled worked demo (a fictional *Doe v. Acme*
complaint) runs end-to-end through the pipeline, as do the
funding-discrimination sample and all three enforcement-mechanism samples.
Seven of the bundled samples are **stub-built** — the pipeline runs, but
predicate evaluation was canned rather than dispatched to a model, so their
verdicts exercise the plumbing and say nothing about the complaint. They are
labelled, not counted as results. Un-stubbing them is real work: it is a
production predicate run on the strongest model, and one of the seven has to
wait on a golden repair so the fixture does not bake in a known defect.

## Kernel and toolchain

- Lean toolchain pinned to **v4.32.0**; no Mathlib dependency, which keeps
  `lake build` fast.
- The results-propagation suite is **48 of 48 green**, and no longer writes to
  the tree while running — six cases had been silently overwriting committed run
  artefacts and status slots. A test that mutates the tree it is testing is not a
  test; those six now redirect to a sandbox. The newest case is a
  reproducibility gate that derives its own roster from two properties of a
  run — the inputs are still present, and its facts are not wholly stubbed —
  rather than from a hand-maintained list, so un-stubbing a fixture pulls it
  into the gate automatically. It found stale telemetry in seven of nine
  committed run reports on its first execution; they were repaired under a
  round-trip guard that refuses the write unless re-serializing reproduces the
  file's original bytes, so no whole-file reformat could ride along.
- Search automation never discharges an agreement lemma. A syntactic gate
  rejects an automated discharge of a bridge outright, so "the two encodings
  agree" can never be an artifact of a search heuristic.

## Lanes

- **Manual-interactive bridge lane** — available now; every promoted wave to
  date ran on it, from inside an interactive session via a subagent fan-out with
  a hard zero-manual-approval rule.
- **Programmatic batch lane** — same mechanics, unattended; stays specified but
  **paused** pending a provider-plan change.

## Next

- Work the re-slice backlog down; the unauditable waves have no remedy short of
  it, and the eleven wrong-statute sections need their own pass.
- Fix the wave census so it prints the scope it measured, and write each wave's
  certification at archive time instead of inferring it afterwards.
- Repair the federal-sector golden, then un-stub the seven scaffold samples.
- Author a synthetic complaint that genuinely fails an element, so the refusal
  path is demonstrable and not merely asserted.
- Hand-build a golden for the terrorism offences, so bridges into that clause
  can be measured element-wise instead of by enumeration alone.
- Continue whole-title passes on the remaining non-golden sections.
- The hosted verifier's streaming proof-graph UI — the early-beta deliverable.

## How to verify

- Clone, `lake build`, and watch the kernel elaborate the bundled demo. There
  is no "sort of holds": either the validity theorem type-checks or the failing
  theorem names the element that does not.
- One caveat we would rather state than have you discover: **every synthetic
  example in the tree currently accepts.** There is no bundled synthetic
  complaint that genuinely fails an element, so a cloner cannot presently watch
  a refusal happen. Authoring one is owed, and it cannot be faked with a
  stub-built run, because a stubbed run cans every predicate to `True` and
  therefore always accepts.
- Every statutory citation resolves against the pinned U.S. Code mirror; specs
  that cite an obsolete subsection number fail the build rather than silently
  elaborating.
- Once the endpoint is live, submit a redacted complaint and read the streamed
  proof trace back; nothing un-redacted is accepted.
