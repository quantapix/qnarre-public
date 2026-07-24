# qnarre-public — status

_Snapshot: 2026-07-24. Refreshed weekly (Fridays) during the
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

Every archived wave has been classified against a transcript audit:

- **87 archived waves classified — 65 certified blind, 20 aged-off and
  unauditable, 2 void.** The 20 aged-off waves predate transcript retention.
  There is no way to certify them after the fact, so they are not certified;
  a blind re-slice is their only remedy.
- Of **373 catalogued sections, 272 now rest on post-fix blind evidence and
  101 still owe a re-slice** — 72 of those sit in certified waves but carry an
  independent defect (a ground-truth corpus gap or an attribution phantom), 22
  sit in aged-off waves, 7 are unattributed. _(Census stamped 2026-07-17; it
  trails the two most recent promotions, which added sections it has not yet
  counted. The encoded census below is current.)_
- In the week to 2026-07-24 the program re-earned **83 sections** across waves
  covering aircraft and animal-protection offences, assault and bankruptcy
  fraud, biological weapons, bribery and graft (§§ 201–227), obstruction,
  transport of stolen property, and the Reconstruction-era civil-rights core
  with the institutionalized-persons statute.

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

## Encoded census (mechanical; unaffected by the correction)

- **388 sections encoded across 11 U.S. Code titles.** Counted as distinct
  statutory sections at their best achieved tier; derived from the per-section
  records, never hand-maintained.
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
complaint) runs end-to-end through the pipeline. The two most recent goldens'
worked samples are still landing.

## Kernel and toolchain

- Lean toolchain pinned to **v4.32.0**; no Mathlib dependency, which keeps
  `lake build` fast.
- The results-propagation suite is **47 of 47 green**, and no longer writes to
  the tree while running — six cases had been silently overwriting committed run
  artefacts and status slots. A test that mutates the tree it is testing is not a
  test; those six now redirect to a sandbox.
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

- Work the 101-section re-slice backlog down; the aged-off waves have no remedy
  short of it.
- Continue whole-title passes on the remaining non-golden sections.
- Land the worked end-to-end samples for the two newest goldens (Title II
  enforcement and the ADA).
- The hosted verifier's streaming proof-graph UI — the early-beta deliverable.

## How to verify

- Clone, `lake build`, and watch the kernel accept or reject the bundled demo.
  There is no "sort of holds."
- Every statutory citation resolves against the pinned U.S. Code mirror; specs
  that cite an obsolete subsection number fail the build rather than silently
  elaborating.
- Once the endpoint is live, submit a redacted complaint and read the streamed
  proof trace back; nothing un-redacted is accepted.
