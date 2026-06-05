# qnarre-public — status

_Snapshot: 2026-06-05. Refreshed weekly (Fridays) during the
2026-06-01 → 2026-12-01 drive window._

This is the release-narrative status of the legal-domain slice: what
has landed, the wave tally on the full-U.S.-Code program, and what is
next. It is a companion to the [README](./README.md), not a substitute.

## Overall

**Pre-beta.** The hosted verifier at `qnarre.quantapix.com` enters
early beta on or about **2026-06-01**. The three hand-built frameworks,
the predicate specs, and the full-Code axiomatization program are live
in the private working tree; the public endpoint and its streaming
proof-graph UI are the launch deliverable.

## Hand-built golden frameworks

Four frameworks elaborate under `lake build` and serve as the golden
reference the automated program is scored against:

| Framework | Statutory basis | Specs |
|---|---|---:|
| **Civil RICO** | 18 U.S.C. §§ 1961–1968 (§ 1962(a)(b)(c)(d) + § 1964(c) standing) | 28 |
| **Title VI** | 42 U.S.C. §§ 2000d et seq. (intentional / disparate-impact / retaliation) | 17 |
| **CivilRights** | 42 U.S.C. §§ 1981, 1983, 1985(3) | 14 |
| **Title IX** | 20 U.S.C. §§ 1681–1688 (sex discrimination in federally funded education) | kernel-only |

Each top-level validity theorem is an inductive over its substantive
subsections; predicate facts enter as kernel axioms and the validity
proof is a pure structure-introduction. A bundled worked demo (a
fictional *Doe v. Acme* complaint) runs end-to-end through the pipeline.

## Full-U.S.-Code program

- **Ground truth in place.** A pinned, full-Code markdown mirror — all
  54 titles, on the order of tens of thousands of sections — bound to a
  specific published release point, with a durable off-site archive so a
  proof stays reproducible after the source rotates. Each promoted wave
  is itself frozen into an immutable off-site snapshot at promotion time,
  so a wave's blind cells stay reproducible after the working sandbox is
  pruned. Conventions, per-axis strategy briefings, and a shared
  cross-strategy predicate library are frozen.
- **Calibration anchor kernel-green.** The canonical racketeering
  operating-or-managing provision is hand-encoded under all ten
  strategies (five core fanned out on every section + five specialized
  opt-in) with its cross-strategy Bridges discharged at full tier
  (no `sorry`). This anchor is the template every blind cell mirrors and
  the reference the fan-out is scored against.
- **Wave tally (most recent first):**
  - **Title IX golden-expansion** — a blind encoding of the
    funded-education nondiscrimination title that *failed* to fully
    bridge to the funding-discrimination golden, localizing the gap to a
    single protected-ground hypothesis; promoted to a fourth hand-built
    golden, against which the same blind cell re-bridges full-tier and
    sorry-free.
  - **Golden-trio re-slice (evidence-only)** — the three blind golden
    re-derivations (racketeering, equal-contracting, funding-
    discrimination) re-run on the model-locked lane and held as
    evidence-only archives without disturbing the hand-built anchors;
    all three still bridge.
  - **Employment-discrimination wave** — core-liability sections of the
    employment-discrimination title encoded under all five applicable
    strategies, scored on cross-axis agreement (no golden twin exists
    for that title).
  - **Golden-adjacent wave** — sections adjacent to a hand-built
    reference. Marquee: a blind equal-property-rights encoding bridged
    to the hand-built equal-contracting framework, **full-tier and
    sorry-free**. The civil-RICO standing chain bridged at a lower tier
    with the gap surfaced as a named hypothesis.
  - **Golden-core + FAA wave** — the funding-discrimination title's
    golden core under all five strategies, the racketeering title's
    blind cells, and a no-hand-built-reference title (the Federal
    Arbitration Act) under all five strategies; cross-title shared
    predicates collapsed onto single definitions, each collapse licensed
    by its own kernel-checked Bridge.
- **Confidence tiers.** Sections grade into **corroborated** (three or
  more strategies agree in the kernel), **partial**, and
  **single / conflicting** (not promoted; routed to human review).
  Agreement is measured by kernel-checked Bridges, never by comparing
  predicate names — naming is a free variable.

## Lanes

- **Manual-interactive bridge lane** — available now; runs a wave from
  inside an interactive session via a subagent fan-out with a hard
  zero-manual-approval rule.
- **Programmatic batch lane** — gated on the 2026-06-15 credit
  activation; same mechanics, unattended.

## Next

- Fan out the remaining non-golden sections of the racketeering and
  civil-rights titles (dozens still uncovered).
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
