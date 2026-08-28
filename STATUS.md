# qnarre-public — status

_Snapshot: 2026-08-28. Refreshed weekly (Fridays) during the
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

## What changed since the correction: the channel now has a guard

The July correction rested on an uncomfortable fact — the blind-encoding
lane's isolation was **contractual**. Cells were told not to enumerate the
shared predicate vocabulary; nothing stopped them, and when a wave's cells all
read a golden roster by faithfully following their own contract, the contract
was the defect.

That is now enforced at the moment of the act rather than asserted in a
briefing. A write-guard refuses a blind cell's attempt to glob, list, or
sweep the shared predicate namespace, and refuses a staged namespace dump.
The recognizer that decides what counts as an enumeration lives in a **single
shared seat**, consumed both by the runtime guard and by the after-the-fact
transcript audit — so the guard and the auditor cannot drift into disagreeing
about what they are measuring, which is the failure mode that would quietly
re-open the channel. It was measured against the frozen transcript corpus
before being armed: no false refusal on any legitimate cell act across the
corpus, and both arms verified red under deliberate sabotage.

Separately, a wave's certification profile is now **frozen into the archive
record at archive time** for every new wave, rather than inferred afterwards
from the wave's date. That is the durable fix this page previously listed as
owed. It is forward-looking only: waves already archived keep their existing
records, so the audit backlog below is unchanged by it.

## The re-slice program: what it covers, what it does not

Two instruments measure this, they do not agree, and reporting only the
flattering one would be the same mistake this page exists to correct.

**A transcript audit**, run 2026-07-27 over the 86 waves archived at that date,
re-read the surviving agent transcripts and certified **57 of those 86** as
blind, with **272 sections** resting on post-fix blind evidence. Twenty waves
predate transcript retention and are **unauditable** — there is no way to
certify them after the fact, so they are not certified; a blind re-slice is
their only remedy. Two are void. The wave corpus has grown since that audit and
the newer waves sit outside it; the figures are that instrument's, on that date,
and are not a running total.

**A wave-class census** asks a different question — does the wave's own
manifest record a certification verdict — and the answer is starker. A
wave-time certification fact is the rare exception; the great majority sit
inside the audited window and are counted as *inferred*, which is countable but
is not an audited verdict, and we will not present it as one. Earlier copy on
this page reported a certified-wave count that came from a classifier deriving
the class from the wave's **date**, with no audit fact consulted anywhere. That
classifier is replaced; it now reads the recorded verdict, and an adverse
verdict — breach, review, unauditable — obliges a re-slice rather than aging
into "certified" because the wave is recent. **The figure this page previously
published for certified waves is withdrawn.**

Worth stating against our own interest: writing the certification at archive
time has been armed for a month. Thirty-three waves have been archived under it.
**None of them is certified.** We reported that last week as a forward-looking
fix being slower than it sounds. That was not the reason.

The reason is structural and it is in our own code. A cell that follows its
contract to the letter must copy a shared artefact by name, and that copy trips
the very channel the certifier grades — so a **compliant** cell cannot score
clean, and the wave verdict floors one step below certified no matter how the
wave went. Every one of those thirty-three sits at that floor: a review verdict
the wave earned by obeying its instructions, or an adverse verdict on top of it.
"Certified at archive time" is unreachable under the contract as written. It is
not a queue we are working through.

That is a contract defect, not a wave defect, and the remedy is to change what
the contract makes a cell do — not to relax what the certifier looks for. The
one wave-time-certified wave on the books predates the arming and was audited by
hand, within the hour, precisely because the wave it superseded had aged out of
auditability first. One in a hundred and twenty-four is the real rate, and it is
a hand rate.

Writing the certification at archive time, so a wave cannot default to
uncertified, is the durable fix. It is now wired, for new waves only — see
above. Every wave archived before it keeps the record it had, so the backlog
below does not move on account of it.

**The backlog, as an upper bound.** A share of the catalogued sections owe a
re-slice; a smaller share of those hold a golden bridge. We are still not
quoting the count, but the reason has changed and the old one no longer holds:
the census now re-cuts its derivation stamp at every emit, so a figure lifted
off it is no longer a figure of unknown age. What remains is a population
question. Two of our own censuses report a section count under the same word,
they do not agree, and until we can say plainly which set each one counts we
will not put a second number on this page beside the one below. Publishing a
figure we cannot label is worse than publishing none.

The scope problem behind it is unchanged and is worth stating on its own. The
census attributes a section's standing wave by reading a wave-archive tree that
is **local to one workstation**, and waves run elsewhere read here as owing a
re-slice they have already served. The census now prints the scope it measured:
which workstation it ran on, how many waves that host can see against the union
it knows of, and an explicit list of the waves it is attributing to a peer. That
converts a silent under-count into a disclosed one. It does not cure it — a host
cannot observe a peer's completed work by construction — so any figure would
remain an upper bound. The cross-check against a tree-global artifact is still
open.

An audit **certifies**; it never **cures**. A wave can be certified blind and
still owe a re-slice for an unrelated defect. Those are separate properties and
we track them separately.

## What the re-slice found

**A wave discharged every theorem sorry-free and was thrown away anyway.** A
re-slice over three trafficking sections discharged all four of its golden
theorems `sorry`-free with zero gap hypotheses on the element-wise targets — the
cleanest result the lane can produce — and was **not promoted, not tiered, and
left no basis stamped**. The shared authoring document that governs this work is
delivered to every blind cell in its **system prompt**, and one line of it named
the golden composite identifiers, their field counts, and the contested holding
the wave existed to test. That is the wave's answer key, and it was in every
cell's context before the cell did anything.

The blindness auditor had graded all six cells into its *cleanest* class. It was
not malfunctioning. Every channel it grades grades a **read** — what a cell
looked at — and a system-context injection is not a read. The auditor was
answering a question that no longer covered the failure. One cell disclosed the
contamination itself, and it was right to.

The re-run was sliced from a session opened after the offending text was split
out, and the channel was verified closed on **two** instruments: a search of the
tree for every composite identifier, section cite and field count, and a
fresh-session probe that read its own context with no tools available. The probe
carried an anti-vacuity arm — it had to prove it could still see the cured
paragraph by quoting it — because a probe that finds nothing because it can see
nothing is not evidence. Neither instrument alone is the answer.

The clean re-run then did what the voided one could not: it lifted two sections
to full tier on **element-level** agreement. A third moved the other way,
retiered down on two independently-reproduced dissents. Both directions are the
design working.

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
naming-independent, but not element-level agreement. Every full-tier section now
records which of the two it earned: of **48** sections holding a full-tier golden
bridge, **14 rest on element-level agreement and 34 on statutory enumeration**
(2026-08-28). Eighteen bridge modules had their headers rewritten to say so.
Nothing was re-proved; the proofs were always these proofs. The labels now match.

Both figures moved down this week, and the page said last week that they would
not move in one direction only. Full-tier holdings fell from 50 to 48 — the
enumeration arm lost two on a second independent look, the element-level arm
held flat at 14. Four sections left the top tier for the one below it. A count
that only ever rises is a count nobody is checking; this is what checking looks
like when it goes against you.

Neither arm moves monotonically, and last week's copy on this page said
otherwise. Element-level agreement has grown as new hand-built references landed;
the enumeration count went **up** as new chapters bridged through the clause and
then **down** again when a section retiered out of full tier on a second look. A
count that only ever rises is a count nobody is checking.

**Agreement over the wrong statute.** A resolver that mapped a citation to a
file was silently picking the first alphabetical match when a bare section
number was not unique within a title — and a section number frequently is not.
One title has five files whose name is the same section number. A batch of
catalogued sections turn out to have had their independent encodings agree on
text that was **not the section they were pointed at**, some of them at full
tier. The resolver now prefers a real section over a rendered note
heading and **fails loud** rather than guessing when more than one real
candidate survives. That fixes every future read. It cannot retroactively make
a past agreement mean anything, so those sections owe a fresh blind encoding —
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

- **424 sections encoded across 11 of the Code's 53 titles (appendix volumes
  excluded).** Counted as distinct
  statutory sections at their best achieved tier; derived from the per-section
  records, never hand-maintained.
- The share of the whole Code is small and the point is that we say so: this is
  a method demonstrated at scale, not a finished encoding.
- Every promoted wave is frozen into an immutable off-site snapshot at promotion
  time, so a wave's blind cells stay reproducible after the working sandbox is
  pruned.
- Ground truth is a pinned full-Code mirror — all 53 titles, appendix volumes
  excluded — bound to a specific
  published release point, with a durable off-site archive so a proof stays
  reproducible after the source rotates.

## Hand-built golden frameworks

Eleven frameworks — thirteen golden reference cells (the employment title
carries three) — elaborate under `lake build` and serve as the reference the
automated program is scored against. Counted from the kernel tree: one framework
per hand-built module directory, one golden cell per validity theorem.

| Framework | Statutory basis | Specs |
|---|---|---:|
| **Civil RICO** | 18 U.S.C. §§ 1961–1968 (§ 1962(a)(b)(c)(d) + § 1964(c) standing) | 25 + 9 leaf |
| **Title VI** | 42 U.S.C. §§ 2000d et seq. (intentional / disparate-impact / retaliation) | 17 |
| **CivilRights** | 42 U.S.C. §§ 1981, 1983, 1985(3) | 14 |
| **Title IX** | 20 U.S.C. §§ 1681–1688 (sex discrimination in federally funded education) | 21 |
| **Title VII** | 42 U.S.C. § 2000e family — three goldens: § 2000e-5(f)(1) enforcement, § 2000e-6(a) pattern-or-practice, § 2000e-16(c) federal-sector | 21 |
| **Rehab § 504** | 29 U.S.C. § 794 (disability; federally assisted or conducted programs) | 19 |
| **Age Act** | 42 U.S.C. §§ 6101–6107 (age; federally assisted programs) | 17 |
| **Title II Enf** | 42 U.S.C. § 2000a-5(b) — the enforcement-mechanism golden (three-judge-court track + single-judge fallback; a procedural shape, not a discrimination claim) | 10 |
| **ADA** | 42 U.S.C. ch126 §§ 12111/12112, 12131/12132, 12181/12182, 12203 — three title-specific coverage regimes and a six-route validity theorem | 24 |
| **Terrorism** | 18 U.S.C. ch. 113B §§ 2332a/2332b, 2339–2339D — the offences the racketeering predicate clause reaches by list membership | 18 |
| **Trafficking** | 18 U.S.C. ch. 77 §§ 1590(a)(b), 1591(a)(d), 1592(a)(c) — a six-route validity theorem; the chapter the predicate clause reaches by range of sections | 27 |

Each top-level validity theorem is an inductive over its substantive
subsections; predicate facts enter as kernel axioms and the validity proof is a
pure structure-introduction. A bundled worked demo (a fictional *Doe v. Acme*
complaint) runs end-to-end through the pipeline, as do the
funding-discrimination sample and all three enforcement-mechanism samples.
No bundled sample cans its predicates any more. Every one is a real run
against the strongest available model, carrying evidence quotes and an
uncertainty band. The federal-sector golden this page previously reported as
defective has been repaired — the 90-day suit-filing window is now attached
only to the final-agency-action route, leaving the 180-day-inaction route
standing on its own predicate, which is what the statute says — and its
fixture was regenerated against the corrected shape. One bundled sample now
**refuses**: see "How to verify".

## Kernel and toolchain

- Lean toolchain pinned to **v4.33.0**; no Mathlib dependency, which keeps
  `lake build` fast. The pin moved this cycle, and the accepted *and* rejected
  example proofs were replayed green on the bump before it was taken.
- The results-propagation suite is **46 of 46 green**, and no longer writes to
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
- Extend the act-time guard backward: the arming covers new waves, and the
  archived corpus was measured but not retro-fitted.
- Answer the census's remaining blind spot — a host still cannot see a peer's
  completed re-slice, so the backlog is an upper bound by construction.
- Last week this list said: hand-build a golden for the terrorism offences, so
  bridges into that clause can be measured element-wise instead of by enumeration
  alone. The golden was built. **It did not make element-wise measurement
  reachable, and the stated reason it would was wrong.** The racketeering statute
  reaches the terrorism offences by *list membership* — a provision is a
  predicate act because it appears on a list — so the correspondence surface is a
  single field and the cap is structural, not a matter of effort. It reaches the
  trafficking offences by a *range of sections*, where predicate status turns on
  the offence elements, and that is where element-level agreement became
  reachable. The distinction is in kind. We are recording the refutation rather
  than quietly re-scoping the item.
- Continue hand-building goldens where the incorporating clause turns on elements
  rather than membership — that is now the selection rule, and it is a property
  of the citing statute, not of the subject matter.
- Continue whole-title passes on the remaining non-golden sections.
- The hosted verifier's streaming proof-graph UI — the early-beta deliverable.

## How to verify

- Clone, `lake build`, and watch the kernel elaborate the bundled demo. There
  is no "sort of holds": either the validity theorem type-checks or the failing
  theorem names the element that does not.
- There is now a bundled sample that **fails**. A toy federal-sector
  employment-discrimination complaint pleads its merits adequately and does
  not satisfy the administrative-exhaustion family; `lake build` returns
  `REJECTED` and the error names the element that did not discharge, not a
  score. This is the one thing a stubbed run could never demonstrate — a
  stub cans every predicate to `True`, so it always accepts — which is why
  it had to wait for the un-stubbing to finish.
- Every statutory citation resolves against the pinned U.S. Code mirror; specs
  that cite an obsolete subsection number fail the build rather than silently
  elaborating.
- Once the endpoint is live, submit a redacted complaint and read the streamed
  proof trace back; nothing un-redacted is accepted.
