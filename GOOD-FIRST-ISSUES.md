# Good first issues — U.S. Code axiomatization

Starter contributor tasks for the open U.S. Code axiomatization. Every **open**
task below is a defect **re-derived against the working tree on 2026-08-21**,
not an invented exercise. The four closed tasks were re-verified against the tree
on the same date rather than assumed closed.

The project is currently **a single developer working with AI assistance — now
opening contribution and actively seeking collaborators.** These issues are the
front door.

Everything here works over **public federal statutes only**. No PII, no
litigation record, no redaction surface.

> **The commands below do not run against this clone yet.** This repo carries
> the narrative documents only — the Lean kernel, the predicate specs, and the
> helper scripts every acceptance criterion names are in the private working
> tree, being prepared for a source drop (`CONTRIBUTING.md` § "what state the
> lane is actually in"). Until it lands, read these as a specification of the
> work and an inventory of the tree's defects. The counts are the maintainer's,
> re-derived on the date stated; you will be able to re-derive them yourself
> when the sources land.

> **Four of the original nine closed between refreshes.** This roster was first
> published on 2026-07-31 with nine open tasks. Issues 1, 2, 6 and 8 were swept
> internally in the week that followed and are marked closed in place, keeping
> their numbers. That is the expected failure mode of a public roster over a
> tree under active work — and the reason issue 9, the *committed checker*, is
> the highest-value task here: it is the only one that stops the classes from
> coming back.
>
> Re-derived again on 2026-08-21. Nothing closed and nothing changed scope: all
> five open tasks reproduced their per-directory counts **exactly**, for a third
> consecutive week, across a spec population that grew by about 38%. The four
> closed ones were re-verified rather than assumed.

---

## 0. What this project is (60-second orientation)

Three layers, strictly separated:

| Layer | Where | Reads | Writes |
|---|---|---|---|
| **Formal kernel** | `Proving/**/*.lean` | only Lean | only Lean |
| **Predicate specs** | `predicates/**/*.md` | one complaint text + entity refs | a single `Bool` (+ evidence + uncertainty) |
| **Driver** | `scripts/extract_facts.py` | manifest + complaint | generated `Facts.lean` + audit JSON |

The Lean kernel never reads natural language. An LLM sub-agent decides each
atomic fact; Lean composes those facts into a statutory judgment. The
verifiable proof **is** the Lean elaboration trace produced by `lake build`.

A *predicate spec* is one markdown file describing one such sub-agent: what it
reads, the statutory authority, the decision rubric, the JSON it emits, and
worked test cases. Almost every issue below is a predicate-spec task — no Lean
required.

### Setup

```bash
git clone <repo> && cd qnarre-public
# Lean (only needed for issues that touch Proving/**):
#   install elan; the toolchain pin is read from ./lean-toolchain (leanprover/lean4:v4.33.0)
python3 --version          # ≥ 3.10; no venv, no pip deps for the checks below
```

Statutory ground truth is resolved through a helper — never hand-paste statute
text:

```bash
python3 scripts/uscode.py path "29 USC § 158"   # -> absolute path to the markdown
python3 scripts/uscode.py text "29 USC § 158"   # -> operative text only
python3 scripts/uscode.py list                  # -> every cite in the corpus
```

### Read before you start

- `predicates/README.md` — the authoring contract (six locked sections; the
  USC-program frontmatter fields; the naming rules).
- `predicates/usc/_axes/README.md` — the ten orthogonal axes.
- Two model specs: `predicates/usc/t18/hier/is-juridical-person.md` and
  `predicates/usc/t18/hier/is-natural-person.md`.
- `CLAUDE.md` § "Hard rules — DO NOT violate".

### The hard rules that apply to *every* issue here

1. **A predicate spec MUST NOT cite or read `Proving/**/*.lean`** (Hard rule 2).
   Its world is the complaint text + the statutory rubric. Name the declaring
   **namespace** instead — e.g. a line reading *Declared in namespace*
   `Proving.USC.T29.Procedure` — never a file path.
   Where an issue needs you to know an axiom's signature, the signature is
   **quoted in the issue text** — copy it from there.
2. **`Facts.lean` is generated. Never hand-edit it** (Hard rule 4). Every
   `Proving/<Framework>/Facts.lean` and `Proving/USC/**/Facts.lean` is
   gitignored build output.
3. **Do not run the driver** (`scripts/extract_facts.py`) as part of these
   issues. It costs model calls and it overwrites committed run artefacts under
   `examples/<id>/` unless `--sandbox-out` is passed.
4. **Do not edit `coverage.json`, `remediation-roster.json`, or anything under
   `data/status/`.** Those are generated ledgers with their own producers.
5. **Do not remove a compiler option to make something pass.** `lakefile.toml`
   sets `autoImplicit = false` on both `lean_lib`s deliberately (Hard rule 8).

### Acceptance gates

Run from the repo root:

```bash
python3 scripts/uscode.py lint          # every usc_cite in every spec resolves
python3 scripts/test_uscode.py          # hermetic tests for the resolver + lint
python3 scripts/validate_common_mints.py
```

`uscode.py lint` currently reports **scanned 8118 file(s); 212 distinct cite(s);
211 resolvable, 0 dead, 1 note-slot**; your PR must keep `0 dead`. The note-slot
category is new: the citation resolver now fails loud and names a slot it cannot
uniquely resolve, rather than silently taking the first alphabetical match.

Only if your change touches `Proving/**` (issue 9 may):

```bash
lake build Proving ProvingUSC           # BOTH libs — a bare `lake build` is red by design
python3 scripts/check_olean_closure.py  # exit 5 if a tracked .lean is never elaborated
```

---

## Issue 1 — CLOSED 2026-08-01

*Add the non-positive-law prima facie caveat to the Title 29 Deontic specs.*

Closed by an internal sweep that ruled the *prima facie* caveat across the spec
tree in one titled pass. All 17 specs in `predicates/usc/t29/deontic/` now carry
it; 0 missing, re-verified 2026-08-21. The rule itself is unchanged and still
mandatory — see issue 9, which makes it mechanically checkable.

---

## Issue 2 — CLOSED 2026-08-01

*Add the prima facie caveat to the Title 42 Title-VII-enforcement specs.*

Closed by the same sweep as issue 1. All four directories under
`predicates/usc/t42/titleviienf/` (elements 17, procedure 17, deontic 12,
ontology 10) now carry the caveat; 0 missing across all 56, re-verified
2026-08-21.

Tree-wide a real remaining population still lacks the caveat, but it no longer
partitions into a clean per-directory starter task, and we are not quoting a
count for it. The reason is worth knowing before you write the checker: the
authoring contract records this concept under **two** frontmatter spellings, and
a third near-homonym key means something entirely unrelated (that an *element*
establishes only a prima facie case under burden-shifting, nothing to do with
how authoritative the statutory text is). A naive tree-wide grep conflates them
and returns a number that is not measuring one thing. Defining the class
mechanically is part of issue 9, and is a good argument for it.

---

## Issue 3 — Add the missing `context: fork` / `allowed-tools` frontmatter (Title 29 LMRA)

**Difficulty:** easy · **~1 h** · *no Lean, no LLM* · **OPEN**

**Files:** 36 specs —
`predicates/usc/t29/lmra/procedure/` (20 of 20) and
`predicates/usc/t29/lmra/ontology/` (16 of 16).

**Background.** Each predicate spec is executed as a **forked** Claude Code
sub-agent: it gets its own context, sees only the complaint, and returns one
JSON object. That execution mode is declared in the spec's YAML frontmatter:

```yaml
---
context: fork
allowed-tools: [Read, Bash]
axis: procedure
shared: false
usc_cite: "29 USC § 160"
---
```

314 specs across the tree are missing `context: fork` — unchanged across four
snapshots now, while the tree more than doubled over that span; these 36 are a
self-contained batch. Without the declaration the spec is ambiguous about how it
is meant to run.

This count has not moved in a week while the spec population grew ~38% — nothing
sweeps it, which is exactly why it is still here.

**What to do.** For each file, ensure the YAML frontmatter block exists and
carries `context: fork` and `allowed-tools: [Read, Bash]`, preserving any
`axis` / `shared` / `usc_cite` / axis-extra keys already present. Model:
`predicates/usc/t09/elements/agreement-in-writing.md`.

**Acceptance criteria.**
- `grep -L "^context: fork" predicates/usc/t29/lmra/procedure/*.md predicates/usc/t29/lmra/ontology/*.md` prints nothing.
- Every touched file still starts with `---` on line 1 and has a closing `---`.
- `python3 scripts/uscode.py lint` → `0 dead` (it parses frontmatter; a broken
  YAML block will show up as a scanned-file count change).

**Do NOT.** Do not invent an `axis:` value — it must be one of the ten axis
names in `predicates/usc/_axes/` (`deontic`, `elements`, `evidentiary`,
`intertemporal`, `ontology`, `procedure`, `remedy`, `sanction`, `scienter`,
`structure`), and for these files it is determined by the directory. Do not set
`shared: true` — that status is only granted by the Reconcile-phase collapse,
never by hand (`predicates/README.md` § "Shared predicate collapse").

---

## Issue 4 — Add the missing `context: fork` / `allowed-tools` frontmatter (Title 42 Deontic)

**Difficulty:** easy (bulk) · **~2–3 h** · *no Lean, no LLM* · **OPEN**

**Files:** the 77 specs in `predicates/usc/t42/deontic/` that lack
`context: fork` (the directory holds 100).

Same background, same shape, same acceptance criteria as issue 3 — this is the
largest single batch, kept separate so it does not block the smaller ones.
`axis: deontic` is already present in these files; the Deontic axis also carries
the extra output field `modality`, which you should leave exactly as-is.

**Acceptance criteria.**
- `grep -L "^context: fork" predicates/usc/t42/deontic/*.md` prints nothing.
- `python3 scripts/uscode.py lint` → `0 dead`.

---

## Issue 5 — Write the missing `## Test cases` sections for the Title VII specs

**Difficulty:** medium · **~3 h** · *reading statute required; no Lean, no LLM* · **OPEN**

**Files:** 35 specs —
`predicates/usc/t42/titlevii/elements/` (16 of 16) and
`predicates/usc/t42/titlevii/deontic/` (19 of 19).

**Background.** The spec contract (`predicates/README.md` § "Spec contract",
item 6) requires **at minimum one positive and one negative example** in every
spec. Test cases are how a human reviewer checks that the rubric actually
decides the thing it claims to decide — a rubric with no worked examples is
untested prose. 559 specs in the tree have no `## Test cases` section at all;
these 35 are the Title VII batch.

**What to do.** For each spec, read its `usc_cite` statute
(`python3 scripts/uscode.py text "<cite>"`), read the file's `## Decision
rubric`, and append a `## Test cases` section with **at least one clear
positive and one clear negative** — plus, where the rubric has a genuine
knife-edge, one `uncertainty: "high"` case. Write short synthetic fact patterns
(`Doe v. Acme` style); never use a real party, docket, or address.

Model (terse form): `predicates/usc/t09/elements/agreement-in-writing.md`.
Model (rich form, with quoted fact patterns):
`predicates/usc/t18/hier/is-juridical-person.md`.

**Acceptance criteria.**
- `grep -L "^## Test cases" predicates/usc/t42/titlevii/elements/*.md predicates/usc/t42/titlevii/deontic/*.md` prints nothing.
- Each new section names at least one `true` outcome and one `false` outcome.
- `python3 scripts/uscode.py lint` → `0 dead`.

**Do NOT.** Do not derive the test cases from the Lean kernel (Hard rule 2) —
derive them from the statute text and the spec's own rubric. Do not use any
real complaint, party, or docket number. Do not run the driver to "check" your
cases.

---

## Issue 6 — CLOSED 2026-08-01

*Fix the predicate specs that cite kernel `.lean` paths (Hard rule 2).*

Closed by a tree-wide sweep: **253 kernel-path cites → 0** across
`predicates/`, by a shape-aware transform plus two hand edits. Every
"Discharged in `Proving/….lean`" provenance line is now "Declared in namespace
`…`", and the spec population carries **zero** kernel-path cites — re-verified
2026-08-21.

Check it with the `specs()`-filtered command in § "Re-deriving the counts", not
with a bare recursive grep: the golden rosters are not specs and legitimately
cite kernel paths, so an unfiltered grep shows hits while the spec population is
clean.

The **authoring path** was fixed in the same pass, which is what actually
retires the issue rather than just clearing its instances: both the spec-format
contract (`predicates/README.md` § "Spec contract", item 1) and the encoding
sub-agent's own contract now require the namespace form and name the file-path
form as the Hard-rule-2 breach. A new wave can no longer mint the defect.

Hard rule 2 itself is unchanged and is one of the five rules listed above.
Issue 9 includes a check for it so the class stays at zero.

---

## Issue 7 — Add a `## Test cases` section to five `usc/common` specs

**Difficulty:** easy · **~90 min** · *writing, no code* · **OPEN**

**Background.** Every predicate spec MUST carry six sections (see § "Spec
contract" in `predicates/README.md`); item 6 of that contract is **Test
cases** — "at minimum one positive and one negative example". A spec without
them gives the sub-agent no calibration for where the threshold sits, which is
exactly where borderline complaints get decided inconsistently.

The `predicates/usc/common/` specs are the highest-leverage place to fix this:
a `Common` predicate is the collapsed cross-title form, so it is reused by every
title that witnesses it — one vague rubric there propagates everywhere.

As of 2026-08-21 the directory holds **51 specs and all 51 lack a
`## Test cases` section**, so there is no shortage of candidates. Take any five.

**What to do.** Pick five specs under `predicates/usc/common/` and write one
section for each. Re-derive your five from the tree (the commands in
§ "Re-deriving the counts" show how) rather than trusting a list pasted here.

Model your section on `predicates/usc/t18/hier/is-natural-person.md`, which is
the current reference shape: labelled **Positive** / **Negative** cases, each a
short verbatim-style complaint excerpt followed by the expected
`{"value": …, "uncertainty": …}` and a one-line reason. Aim for at least one
positive, one negative, and one genuinely borderline case with
`uncertainty: "medium"`.

**Acceptance criteria.**
- Each edited spec has a `## Test cases` heading with ≥ 1 positive and ≥ 1
  negative example.
- The examples are consistent with that spec's existing **Decision rubric** —
  if you find a case the rubric does not actually decide, say so in the PR
  instead of inventing a threshold.
- `python3 scripts/uscode.py lint` → `0 dead`.
- No Lean file, no `coverage.json`, no `data/status/` slot touched.

**Scope note — an overlap, deliberately left out of this issue.** 24 of those
51 specs also lack `context: fork` and `usc_cite` (they are the whole of the
tree's remaining `usc_cite` gap). That is issues 3 and 4's defect class in this
directory. Fixing it here would be welcome but is **a different review** — keep
this PR to test cases, and open a separate one if you want to take the
frontmatter too.

**Do NOT.** Do not paste real case names, real docket numbers, or material from
any actual litigation record into an example — these specs render on a public
surface. Invent neutral synthetic fact patterns, as the existing specs do.

---

## Issue 8 — CLOSED 2026-07-30 / 2026-08-01

*Write the missing `Proving.USC.Common` predicate specs.*

Closed: all six residual `Proving.USC.Common` axioms were given authoring specs
internally, including the three this issue named
(`acts-under-color-of-state-law.md`, `is-attorney-general.md`,
`is-employer.md`), each with the non-positive-law caveat ruled at authoring
time. All three files re-verified present 2026-08-21.

The file-naming contract this issue documented still holds and is worth knowing:
**predicate spec file = kebab-case of the axiom name** (`IsPersonInUS` →
`is-person-in-us.md`), and `shared: true` is set only on specs under
`predicates/usc/common/`.

One decision from this issue remains genuinely open, and is *not* a starter
task: the trafficking-victim predicate is declared with zero consumers, and
whether it should retire rather than gain a spec is unresolved.

---

## Issue 9 — Write `scripts/check_predicate_specs.py`, a mechanical spec linter

**Difficulty:** medium (Python) · **~4–6 h** · *the tooling task* · **OPEN — and now the most valuable task on this list**

**Files to create:**
- `scripts/check_predicate_specs.py`
- `scripts/test_check_predicate_specs.py`

**Background.** Every defect class in issues 1–8 above was found by an ad-hoc
`grep`, and four of those classes were then cleared by ad-hoc internal sweeps in
the week after this roster was first published — while **no committed checker
was written**. That is the whole argument for this issue, and the week made it
concrete: sweeping a class is cheap and repeatable; the class comes back with
the next encoding wave, because nothing mechanical rejects it. The two classes
that *no* sweep touched (`context: fork`, `usc_cite`) held exactly flat at 314
and 24 while the spec tree grew ~28%.

A fourth snapshot has since confirmed it. `context: fork` and `usc_cite` are
still at exactly 314 and 24, unmoved for a fourth week, and the test-case class
grew again — 559 to 694 — almost entirely in directories the newest waves
created. The classes are not just failing to shrink; one of them is being
manufactured faster than any sweep would clear it. Nothing here is a
maintainer's opinion: two of these counts have not moved by a single file across
four measurements while everything around them grew by more than a third.

The tree already has the pattern to follow: `scripts/check_olean_closure.py`,
`scripts/validate_common_mints.py`, and the `lint` subcommand of
`scripts/uscode.py` are all stdlib-only, read-only, system-`python3` scripts
with a documented exit code; `scripts/test_uscode.py` shows the
hermetic-fixture test style (build a temp tree, run the checker against it,
assert the exit code — never depend on the live corpus).

**What to do.** Write a read-only checker over every tracked
`predicates/**/*.md` (excluding `README.md` files and `predicates/usc/_axes/*`)
that reports, per file:

- missing YAML frontmatter, or missing `context: fork` / `allowed-tools`;
- for `predicates/usc/**`: missing `axis` / `shared` / `usc_cite`, or an `axis`
  value outside the ten names in `predicates/usc/_axes/`;
- missing any of the six locked sections (`## Lean signature`, `## Inputs`,
  `## Authority`, `## Decision rubric`, `## Output schema`, `## Test cases`);
- a `Proving/**.lean` path anywhere in the body (Hard rule 2 — currently at zero
  in the spec population, and this check is what keeps it there);
- a `usc_cite` on a non-positive-law title, read from the vendored corpus
  categorization index's per-title `positive_law: true|false` flag, with no
  *prima facie* caveat in the body.

Design constraints:

- **Report-only by default, exit 0.** The tree still has hundreds of findings in
  several categories; a default-failing checker would just be turned off. Add
  `--strict` (non-zero exit on any finding) and `--path <glob>` so a cleaned-up
  directory can be gated incrementally — that is how the classes issues 1, 2, 6
  and 8 cleared stay cleared.
- Stdlib only. System `python3` (≥ 3.10). No pip install, no venv.
- Deterministic, sorted output; one line per finding; a summary count last.
- Never writes. Never shells out to `lake` or `claude`.
- Load the script under a unique module key in the test — a bare
  `import check_predicate_specs` collides in this repo's script layout; copy the
  `importlib.util.spec_from_file_location` idiom from `scripts/test_uscode.py`.

**Acceptance criteria.**
- `python3 scripts/check_predicate_specs.py` runs clean over the live tree, exits
  0, and prints a summary count per defect class.
- `python3 scripts/check_predicate_specs.py --strict --path 'predicates/usc/t18/hier/*'`
  exits 0 — that directory is clean, re-verified 2026-08-21: 6 specs, zero
  findings in all five classes above — **and** exits non-zero on a directory with
  known findings (`predicates/usc/t29/lmra/procedure/*` will do; still 20 of 20
  missing `context: fork` as of the same date).
- `python3 scripts/test_check_predicate_specs.py` passes against hermetic
  fixtures in a temp directory; it must not read the real `predicates/` tree.
- `python3 scripts/uscode.py lint` and `python3 scripts/test_uscode.py` still
  pass.

**Do NOT.** Do not make the checker rewrite specs (no `--fix` in this PR — a
bulk auto-rewriter over the whole spec tree needs its own review). Do not read or
parse `Proving/**/*.lean` for spec-side rules. Do not add a dependency (no
PyYAML — the frontmatter here is simple enough for a hand parser, as
`uscode.py` already demonstrates).

---

## Re-deriving the counts

Every number above is reproducible from the tree — once the sources land in this
repo (see the banner at the top). These are the commands the maintainer runs:

```bash
# the spec population (excludes axis briefings, READMEs, and the golden rosters)
specs() { git ls-files 'predicates/**/*.md' \
  | grep -v '_axes/' | grep -v 'README.md' | grep -v 'GOLDEN-ROSTERS.md'; }

# specs with no "## Test cases" section
for f in $(specs); do grep -q '^## Test cases' "$f" || echo "$f"; done | wc -l

# specs missing the forked-execution declaration
for f in $(specs); do grep -q '^context: fork' "$f" || echo "$f"; done | wc -l

# specs missing the USC-program join key
for f in $(git ls-files 'predicates/usc/**/*.md' | grep -v '_axes/' | grep -v 'README.md'); do
  grep -q '^usc_cite:' "$f" || echo "$f"; done | wc -l

# Hard-rule-2 kernel-path cites, over the spec population only
for f in $(specs); do grep -Hn "Proving/[A-Za-z0-9/]*\.lean" "$f"; done

# cite resolvability
python3 scripts/uscode.py lint
```

A bare `grep -rn "Proving/[A-Za-z0-9/]*\.lean" predicates/` also matches the
golden rosters, which are not specs and legitimately cite kernel paths — it will
show hits while the spec population is clean. Filter through `specs()`, as above.

Snapshot 2026-08-21 (2026-08-14 in brackets): **8,116** tracked markdown
files under `predicates/` [5,863], of which **8,105** are the spec population
[5,852]; **694** specs with no `## Test cases` [559]; **314** missing
`context: fork` [314]; **24** missing `usc_cite`, all in
`predicates/usc/common/` [24]; **0** kernel-path cites in the spec population
[0]; `uscode.py lint` reports **211 / 212** cites resolvable, 0 dead, 1
note-slot [199 / 200].

Read three things off that table before you pick a task.

The spec population grew about **38% in one week** as encoding waves promoted,
and every **per-directory** count in the surviving issues (3, 4, 5, 7, 9)
reproduced exactly. The per-issue scopes are stable targets.

The two classes that no sweep touches — `context: fork` and `usc_cite` —
held at **exactly** 314 and 24 for the fourth snapshot running. A corpus-wide
count moves when someone sweeps it and otherwise does not move at all.

And the `## Test cases` class **grew by 135**, concentrated almost entirely
in the directories the newest waves created. That is the clearest evidence
on this page for why issue 9 matters: the class is not merely un-swept, it
is actively minted by every wave, because nothing mechanical rejects a spec
that arrives without test cases.

## Submitting

- One issue per PR. Keep mechanical sweeps mechanical — a frontmatter sweep PR
  should contain frontmatter lines and nothing else.
- Paste the output of the acceptance-criteria commands into the PR description.
- If a spec's rubric looks substantively wrong to you, **say so in the PR
  description rather than fixing it inline** — rubric changes are reviewed
  against the statute, not merged as drive-by edits.
- These tasks are **not filed as individual GitHub issues**; this file is the
  roster. Open an issue on the repo to claim one before starting, so you do not
  collide with an internal wave.
