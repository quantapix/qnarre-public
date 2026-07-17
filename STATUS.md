# qnarre-public — status

_Snapshot: 2026-07-17. Refreshed weekly (Fridays) during the
2026-06-01 → 2026-12-01 drive window._

This is the release-narrative status of the legal-domain slice: what
has landed, the wave tally on the full-U.S.-Code program, and what is
next. It is a companion to the [README](./README.md), not a substitute.

## Correction — 2026-07-17

On 2026-07-14 our own adversarial review lane found leak channels in the
cross-axis **agreement oracle** — the mechanism that scored the
per-section confidence grades below (the "corroborated / partial /
single-or-conflicting" tally, and any "scored on cross-strategy
agreement" wording). Independent verification cells could, in principle,
observe one another's outputs, so blind-agreement figures minted before
that date are not established as blind. Accordingly:

- The agreement-based grades are **withdrawn** pending a fresh blind
  re-slice under the corrected fan-out contracts. Treat every
  "corroborated" count on this page as provisional and dated pre-07-14.
- What is unaffected: **kernel soundness.** Every `lake build` is green
  and every promoted proof is `sorry`-free. The count of sections
  *encoded* is a mechanical census, not an agreement figure — it stands.
- The re-slice for the legal-domain corpus is a multi-week program; this
  page keeps the encoded and soundness figures and drops the agreement
  grades until it lands. Earlier weekly digests (W24–W28) are dated
  records, left intact; this correction supersedes their agreement-grade
  language.

We surfaced this because the cells check one another and one lane caught
it — not because the earlier numbers were right all along.

## Overall

**Early-beta window.** The hosted verifier endpoint at
`qnarre.quantapix.com` and its streaming proof-graph UI remain the
launch deliverable for the drive window. The nine hand-built
frameworks, the predicate specs, and the full-Code axiomatization
program are live in the private working tree.

## Hand-built golden frameworks

Nine frameworks — eleven golden reference cells (the employment title
carries three) — elaborate under `lake build` and serve as the
reference the automated program is scored against. All are
driver-operational: predicate specs, a worked end-to-end sample, and a
status roster each (the two most recent goldens' worked samples are
still landing).

| Framework | Statutory basis | Specs |
|---|---|---:|
| **Civil RICO** | 18 U.S.C. §§ 1961–1968 (§ 1962(a)(b)(c)(d) + § 1964(c) standing) | 28 |
| **Title VI** | 42 U.S.C. §§ 2000d et seq. (intentional / disparate-impact / retaliation) | 17 |
| **CivilRights** | 42 U.S.C. §§ 1981, 1983, 1985(3) | 14 |
| **Title IX** | 20 U.S.C. §§ 1681–1688 (sex discrimination in federally funded education) | 21 |
| **Title VII** | 42 U.S.C. § 2000e family — three goldens: § 2000e-5(f)(1) enforcement, § 2000e-6(a) pattern-or-practice, § 2000e-16(c) federal-sector | 19 |
| **Rehab § 504** | 29 U.S.C. § 794 (disability; federally assisted or conducted programs) | 19 |
| **Age Act** | 42 U.S.C. §§ 6101–6107 (age; federally assisted programs) | 17 |
| **Title II Enf** | 42 U.S.C. § 2000a-5(b) — the enforcement-mechanism golden (three-judge-court track + single-judge fallback for a pattern-or-practice action; a procedural shape, not a discrimination claim) | 10 |
| **ADA** | 42 U.S.C. ch126 §§ 12111/12112, 12131/12132, 12181/12182, 12203 — a disability framework with three title-specific coverage regimes and a six-route validity theorem | 24 |

The two most recent goldens extend the pattern past discrimination
causes of action: the Title II enforcement golden is the first
**procedural** reference (an enforcement mechanism, not a cause of
action), and the ADA golden is the first built **golden-first** — the
hand-written kernel and predicate specs landed ahead of any blind
encoding wave, encoded as a sibling of the § 504 disability framework
but splitting into three title-specific coverage regimes. Each
top-level validity theorem is an inductive over its substantive
subsections; predicate facts enter as kernel axioms and the validity
proof is a pure structure-introduction. A bundled worked demo (a
fictional *Doe v. Acme* complaint) runs end-to-end through the pipeline.

## Full-U.S.-Code program

- **Ground truth in place.** A pinned, full-Code markdown mirror — all
  54 titles, on the order of tens of thousands of sections — bound to a
  specific published release point, with a durable off-site archive so a
  proof stays reproducible after the source rotates. Each promoted wave
  is itself frozen into an immutable off-site snapshot at promotion time.
  Conventions, per-axis strategy briefings, and a shared cross-strategy
  predicate library are frozen.
- **Calibration anchor kernel-green.** The canonical racketeering
  operating-or-managing provision is hand-encoded under the strategy
  fan-out with its cross-strategy Bridges discharged at full tier
  (no `sorry`). This anchor is the template every blind cell mirrors and
  the reference the fan-out is scored against.
- **Corpus rollup: 268 sections encoded — 153 corroborated / 77 partial /
  38 single-or-conflicting.** Up from 34 sections at the start of the
  window; the civil-rights chapter's employment family is **fully
  sliced**, and subsequent waves carried the pattern into further titles —
  the labor-relations and administrative-procedure titles, the
  racketeering predicate-offense catalog, and two further whole titles
  (immigration-and-nationality and trafficking-victims-protection) — every
  section encoded, scored, and graded. Counted as distinct statutory
  sections at their best achieved tier; the tally is derived mechanically
  from the per-section records, never hand-maintained.
- **Wave tally (most recent first):**
  - **Predicate-offense-catalog expansion** — document fraud,
    loansharking (extortionate credit), and counterfeiting of both
    obligations and trafficked goods, plus interstate transport of stolen
    property, each encoded blind and bridged into the kernel; the
    counterfeiting-of-obligations chapter earned its own kernel-checked
    golden bridge. Recurring notions (a "financial institution"
    definition, an interstate-commerce nexus) collapsed onto the shared
    cross-title algebra under their own Bridges.
  - **Immigration-and-nationality title opened** — no hand-built
    reference; the core provisions plus an inadmissibility follow-up wave,
    scored on cross-strategy agreement alone.
  - **Trafficking-victims-protection provisions opened** (foreign-relations
    title) — a definitions wave grounded the defined terms and lifted one
    previously-partial section to corroborated; an enforcement-apparatus
    wave followed.
  - **Human-trafficking chapter tail completed** — the remaining
    peonage / slavery / trafficking sections, encoded and graded.
  - _(Earlier waves — the employment chapter-tail and enforcement/definitions
    reconciliation, the funding-sibling and Title II / ADA golden expansions,
    the labor-relations and administrative-procedure passes — as previously
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
- **Programmatic batch lane** — same mechanics, unattended; stays
  specified but **paused** pending a provider-plan change.

## Next

- Fan out the remaining non-golden sections of the racketeering and
  civil-rights titles, and continue the whole-title passes.
- Land the worked end-to-end samples for the two newest goldens (Title II
  enforcement and the ADA).
- The hosted verifier's streaming proof-graph UI (the early-beta
  deliverable).
- Later phases (broader title coverage, the live freeform-submission
  path) ride the programmatic lane, gated on a provider-plan change.

## How to verify

- Clone, `lake build`, and watch the kernel accept or reject the bundled
  demo. There is no "sort of holds."
- Every statutory citation resolves against the pinned U.S. Code mirror;
  specs that cite an obsolete subsection number fail the build rather
  than silently elaborating.
- Once the endpoint is live, submit a redacted complaint and read the
  streamed proof trace back; nothing un-redacted is accepted.
