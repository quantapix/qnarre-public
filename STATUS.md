# qnarre-public — status

_Snapshot: 2026-06-12. Refreshed weekly (Fridays) during the
2026-06-01 → 2026-12-01 drive window._

This is the release-narrative status of the legal-domain slice: what
has landed, the wave tally on the full-U.S.-Code program, and what is
next. It is a companion to the [README](./README.md), not a substitute.

## Overall

**Early-beta window.** The hosted verifier endpoint at
`qnarre.quantapix.com` and its streaming proof-graph UI remain the
launch deliverable for the drive window. The seven hand-built
frameworks, the predicate specs, and the full-Code axiomatization
program are live in the private working tree.

## Hand-built golden frameworks

Seven frameworks — nine golden reference cells — elaborate under
`lake build` and serve as the reference the automated program is
scored against. All are driver-operational: predicate specs, a worked
end-to-end sample, and a status roster each.

| Framework | Statutory basis | Specs |
|---|---|---:|
| **Civil RICO** | 18 U.S.C. §§ 1961–1968 (§ 1962(a)(b)(c)(d) + § 1964(c) standing) | 28 |
| **Title VI** | 42 U.S.C. §§ 2000d et seq. (intentional / disparate-impact / retaliation) | 17 |
| **CivilRights** | 42 U.S.C. §§ 1981, 1983, 1985(3) | 14 |
| **Title IX** | 20 U.S.C. §§ 1681–1688 (sex discrimination in federally funded education) | 21 |
| **Title VII** | 42 U.S.C. § 2000e family — three goldens: § 2000e-5(f)(1) enforcement, § 2000e-6(a) pattern-or-practice, § 2000e-16(c) federal-sector | 19 |
| **Rehab § 504** | 29 U.S.C. § 794 (disability; federally assisted or conducted programs) | 19 |
| **Age Act** | 42 U.S.C. §§ 6101–6107 (age; federally assisted programs) | 17 |

Five of the nine golden cells landed this week, all via the
golden-expansion path: a blind cell bridges to an existing golden only
partially, the gap localizes to a real statutory element outside the
golden's closed shape, and the statute earns its own sibling golden —
against which the same blind cell re-bridges at full tier, sorry-free.
Title IX, previously kernel-only, is now fully driver-operational
(21 specs + a worked sample). Each top-level validity theorem is an
inductive over its substantive subsections; predicate facts enter as
kernel axioms and the validity proof is a pure structure-introduction.
A bundled worked demo (a fictional *Doe v. Acme* complaint) runs
end-to-end through the pipeline.

## Full-U.S.-Code program

- **Ground truth in place.** A pinned, full-Code markdown mirror — all
  54 titles, on the order of tens of thousands of sections — bound to a
  specific published release point, with a durable off-site archive so a
  proof stays reproducible after the source rotates. Each promoted wave
  is itself frozen into an immutable off-site snapshot at promotion time
  (17 waves archived to date). Conventions, per-axis strategy briefings,
  and a shared cross-strategy predicate library are frozen.
- **Calibration anchor kernel-green.** The canonical racketeering
  operating-or-managing provision is hand-encoded under the strategy
  fan-out with its cross-strategy Bridges discharged at full tier
  (no `sorry`). This anchor is the template every blind cell mirrors and
  the reference the fan-out is scored against.
- **Corpus rollup: 48 sections encoded — 29 corroborated / 12 partial /
  7 single-or-conflicting.** Up from 34 sections at the start of the
  window; the civil-rights chapter's employment family is now **fully
  sliced** — every section encoded, scored, and graded.
- **Wave tally (most recent first):**
  - **Chapter-tail wave** — the employment family's miscellaneous
    sections plus the definitional fragment its funding-discrimination
    sibling depends on, five strategies blind; 5 sections corroborated,
    4 partial, none conflicting; 33 bridge theorems sorry-free. The
    definitional fragment bridges to the hand-built
    funding-discrimination golden at **full tier, sorry-free**. One
    corpus-conversion defect was found and queued by the same wave's
    review — the gate catching a ground-truth bug is the design working.
  - **Enforcement-wave promotion** — the employment title's enforcement
    provisions (eight strategies blind, held un-promoted pending a
    definitions slice) re-reconciled and promoted: one deliberate
    polarity decision re-tiered a conflicting section to corroborated,
    and golden bridges were authored against all three hand-built
    employment-enforcement goldens, completing golden-bridge coverage.
  - **Definitions wave** — the employment title's definitions +
    substantive block, seven strategies blind; **3/3 sections
    corroborated**, 11 cross-axis bridges sorry-free. Grounded four of
    the held enforcement wave's five dangling ontology terms; shared
    predicates collapsed onto the existing cross-title library with
    zero new signatures.
  - **Golden-expansion, employment enforcement** — three hand-built
    goldens added at once (mixed public/private enforcement,
    pattern-or-practice, federal-sector): three distinct enforcement
    shapes, each with its own validity theorem; the blind enforcement
    cell bridges to its golden.
  - **Golden-expansion, funding siblings** — disability (§ 504) and age
    discrimination encoded as siblings of the funding-discrimination
    golden: same coverage spine, irreducibly different protected ground
    plus their own statutory gates (federally-conducted prong,
    "otherwise qualified", a carve-out schedule as a first-class
    coverage element).
  - _(Earlier waves — Title IX golden-expansion, golden-trio
    re-slice, employment-discrimination cross-axis wave,
    golden-adjacent wave, golden-core + FAA wave — as previously
    reported.)_
- **Confidence tiers.** Sections grade into **corroborated** (three or
  more strategies agree in the kernel), **partial**, and
  **single / conflicting** (not promoted; routed to human review).
  Agreement is measured by kernel-checked Bridges, never by comparing
  predicate names — naming is a free variable.

## Lanes

- **Manual-interactive bridge lane** — available now; every promoted
  wave to date ran on it, from inside an interactive session via a
  subagent fan-out with a hard zero-manual-approval rule.
- **Programmatic batch lane** — gated on the 2026-06-15 credit
  activation; same mechanics, unattended.

## Next

- Regenerate the one corpus-conversion defect found by the chapter-tail
  wave's review and re-tier the affected section.
- Fan out the remaining non-golden sections of the racketeering and
  civil-rights titles.
- The hosted verifier's streaming proof-graph UI (the early-beta
  deliverable).
- Later phases (broader title coverage, the live freeform-submission
  path) are gated on the 2026-06-15 credit activation.

## How to verify

- Clone, `lake build`, and watch the kernel accept or reject the bundled
  demo. There is no "sort of holds."
- Every statutory citation resolves against the pinned U.S. Code mirror;
  specs that cite an obsolete subsection number fail the build rather
  than silently elaborating.
- Once the endpoint is live, submit a redacted complaint and read the
  streamed proof trace back; nothing un-redacted is accepted.
