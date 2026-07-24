# Good first issues — U.S. Code axiomatization (`proving/`)

Starter contributor tasks for the open U.S. Code axiomatization. Every task
below is a **verified defect in the tree** (counts re-derived 2026-07-22, see
§ "Re-deriving the counts"), not an invented exercise.

The project is currently **a single developer working with AI assistance — now
opening contribution and actively seeking collaborators.** These issues are the
front door.

Everything here works over **public federal statutes only**. No PII, no
litigation record, no redaction surface.

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
#   install elan; the toolchain pin is read from ./lean-toolchain (leanprover/lean4:v4.32.0)
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
   Its world is the complaint text + the statutory rubric. Where an issue needs
   you to know an axiom's signature, the signature is **quoted in the issue
   text** — copy it from there, do not go read the kernel and cite a `.lean`
   path in your spec.
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

Run from `proving/`:

```bash
python3 scripts/uscode.py lint          # every usc_cite in every spec resolves
python3 scripts/test_uscode.py          # hermetic tests for the resolver + lint
python3 scripts/validate_common_mints.py
```

`uscode.py lint` currently reports **1485 file(s) scanned; 125 distinct cite(s);
125 resolvable, 0 dead** — your PR must keep `0 dead`.

Only if your change touches `Proving/**` (issues 8 and 9 may):

```bash
lake build Proving ProvingUSC           # BOTH libs — a bare `lake build` is red by design
python3 scripts/check_olean_closure.py  # exit 5 if a tracked .lean is never elaborated
```

---

## Issue 1 — Add the non-positive-law *prima facie* caveat to the Title 29 Deontic specs

**Difficulty:** easy · **~45 min** · *no Lean, no LLM*

**Files:** all 17 specs in `predicates/usc/t29/deontic/`

**Background.** Only some U.S. Code titles have been enacted into *positive
law*. For the rest, the printed Code is only *prima facie* evidence of the law
and the Statutes at Large controls on conflict (1 U.S.C. § 204). Title 29
(Labor) is **not** positive law — the ground truth is
the vendored corpus categorization index (a `positive_law: true|false` flag), where each title carries a
`positive_law: true|false` flag.

The authoring contract (`predicates/README.md` § "Non-positive-law caveat")
makes the caveat **mandatory** on any spec citing a non-positive-law title, and
calls a missing caveat "a correctness defect, not cosmetic". All 17 specs in
`predicates/usc/t29/deontic/` cite Title 29 and none carries it.

**What to do.** In each of the 17 files, add the caveat immediately after the
`# <Name> — <cite>` heading, matching the wording already used for Title 29
elsewhere in the tree:

```
- Title 29 is **non-positive law** — the *prima facie* caveat applies
  (1 U.S.C. § 204: the Code text is prima facie evidence of the law; the
  Statutes at Large controls on any conflict).
```

Working examples to copy the placement from:
`predicates/usc/t29/lmra/procedure/order-reviewable.md` (Title 29 phrasing) and
`predicates/usc/t42/titleviidef/deontic/protected-ground-motivating-factor.md`
(the fuller one-line blockquote form). Match the phrasing already used for the
same title.

**Acceptance criteria.**
- All 17 files under `predicates/usc/t29/deontic/` match `grep -l "prima facie"`.
- `python3 scripts/uscode.py lint` → `0 dead`.
- No other file changed. No file renamed.

**Do NOT.** Do not add the caveat to a *positive-law* title (check
`positive_law` in the vendored corpus categorization index (a `positive_law: true|false` flag) first — Titles 5, 9, 18
are positive law and must not get it). Do not paste statute text into the spec.
Do not touch `Proving/**`.

---

## Issue 2 — Add the *prima facie* caveat to the Title 42 Title-VII-enforcement specs

**Difficulty:** easy · **~2 h** · *no Lean, no LLM* · **independent of issue 1 —
the two can be worked in parallel**

**Files:** 56 specs, all missing the caveat, all citing Title 42 (not positive
law):

| directory | files missing caveat |
|---|---|
| `predicates/usc/t42/titleviienf/elements/` | 17 / 17 |
| `predicates/usc/t42/titleviienf/procedure/` | 17 / 17 |
| `predicates/usc/t42/titleviienf/deontic/` | 12 / 12 |
| `predicates/usc/t42/titleviienf/ontology/` | 10 / 10 |

**Background.** Same rule as issue 1. Title 42 is non-positive law. 310 specs
in the tree already carry the caveat; these 56 do not.

**What to do.** Add, after the file's `# …` heading:

```
> Title 42 is NOT positive law (1 U.S.C. § 204): the text is *prima facie*
> evidence of the law; the Statutes at Large controls on any conflict.
```

Model: `predicates/usc/t42/titleviidef/deontic/protected-ground-motivating-factor.md`
(line 10).

**Acceptance criteria.**
- All 56 files match `grep -l "prima facie"`.
- `python3 scripts/uscode.py lint` → `0 dead`.
- Diff is caveat lines only.

**Do NOT.** Same "do not" list as issue 1. Do not reword the surrounding rubric
while you are in the file — keep the diff mechanical and reviewable.

---

## Issue 3 — Add the missing `context: fork` / `allowed-tools` frontmatter (Title 29 LMRA)

**Difficulty:** easy · **~1 h** · *no Lean, no LLM*

**Files:** 36 specs —
`predicates/usc/t29/lmra/procedure/` (20) and
`predicates/usc/t29/lmra/ontology/` (16).

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

315 specs across the tree are missing `context: fork`; these 36 are a
self-contained batch. Without the declaration the spec is ambiguous about how it
is meant to run.

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
names in `predicates/usc/_axes/README.md`, and for these files it is determined
by the directory (`procedure`, `ontology`). Do not set `shared: true` — that
status is only granted by the Reconcile-phase collapse, never by hand
(`predicates/README.md` § "Shared predicate collapse").

---

## Issue 4 — Add the missing `context: fork` / `allowed-tools` frontmatter (Title 42 Deontic)

**Difficulty:** easy (bulk) · **~2–3 h** · *no Lean, no LLM*

**Files:** the 77 specs in `predicates/usc/t42/deontic/` that lack
`context: fork` (the directory holds 100).

Same background, same shape, same acceptance criteria as issue 3 — this is the
largest single batch, kept separate so it does not block the smaller ones.
`axis: deontic` is already present in these files; the Deontic axis also carries
the extra output field `modality`, which you should leave exactly as-is.

**Acceptance criteria.**
- `grep -L "^context: fork" predicates/usc/t42/deontic/*.md` prints nothing.
- `python3 scripts/uscode.py lint` → `0 dead`.

**Bonus (optional, say so in the PR):** these files are also in scope for issue
2's caveat rule (Title 42). Doing both in one pass is welcome, but keep them as
two commits so the reviewer can read each mechanically.

---

## Issue 5 — Write the missing `## Test cases` sections for the Title VII specs

**Difficulty:** medium · **~3 h** · *reading statute required; no Lean, no LLM*

**Files:** 35 specs —
`predicates/usc/t42/titlevii/elements/` (16) and
`predicates/usc/t42/titlevii/deontic/` (19).

**Background.** The spec contract (`predicates/README.md` § "Spec contract",
item 6) requires **at minimum one positive and one negative example** in every
spec. Test cases are how a human reviewer checks that the rubric actually
decides the thing it claims to decide — a rubric with no worked examples is
untested prose. 198 specs in the tree have no `## Test cases` section at all;
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

## Issue 6 — Fix the two predicate specs that cite kernel `.lean` paths (Hard rule 2)

**Difficulty:** easy · **~30 min** · *judgment required, tiny diff*

**Files:**
- `predicates/usc/common/engaged-in-interstate-commerce.md` (line 18)
- `predicates/usc/common/is-venture-refines-enterprise.md` (line 55)

**Background.** Hard rule 2: *"Predicate specs MUST NOT cite or read
`Proving/<Framework>/*.lean`. Their world is the complaint text + spec rubric."*
This is a jurisdictional boundary, not a style preference — a sub-agent that
reads the kernel can reverse-engineer the answer the kernel wants instead of
reading the complaint, which silently destroys the independence the whole
correctness argument rests on.

These two specs each name a kernel file path in prose.

**What to do.** Rewrite each sentence so it conveys the same information without
a `Proving/**.lean` path. Prefer naming the **Lean namespace** (e.g.
`Proving.USC.Common`) or the collapse-record fact, not a file path; better
still, state the fact in spec-layer terms ("this predicate is the canonical
cross-title form of the interstate-commerce nexus"). If the sentence exists only
to record build provenance, move it out of the sub-agent-facing body.

**Acceptance criteria.**
- `grep -rn "Proving/[A-Za-z0-9/]*\.lean" predicates/` returns hits only in
  `predicates/README.md` (the human-facing roster, which is not a sub-agent
  prompt), and nothing under `predicates/usc/`.
- The rubric's meaning is unchanged — a reviewer should be able to read the
  before/after and agree the sub-agent decides the same thing.
- `python3 scripts/uscode.py lint` → `0 dead`.

**Do NOT.** Do not "fix" it by deleting the whole sentence if it carries real
rubric content — reword it. Do not touch `predicates/README.md` in this PR.

---

## Issue 7 — Add a `## Test cases` section to five `usc/common` specs

**Difficulty:** easy · **~90 min** · *writing, no code*

**Background.** Every predicate spec MUST carry six sections (see § "Spec
contract" in `predicates/README.md`); item 6 of that contract is **Test
cases** — "at minimum one positive and one negative example". A spec without
them gives the sub-agent no calibration for where the threshold sits, which is
exactly where borderline complaints get decided inconsistently.

The `predicates/usc/common/` specs are the highest-leverage place to fix this:
a `Common` predicate is the collapsed cross-title form, so it is reused by every
title that witnesses it — one vague rubric there propagates everywhere.

**What to do.** Pick five specs under `predicates/usc/common/` that have no
`## Test cases` heading and write one for each. Re-derive the list yourself
(the counts in § "Re-deriving the counts" tell you how) rather than trusting a
list pasted here — it moves.

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

**Do NOT.** Do not paste real case names, real dockets, or anything from
`a real matter's archive` into an example — these specs render on a public surface. Invent
neutral fact patterns, as the existing specs do.

---

## Issue 8 — Write three missing `Proving.USC.Common` predicate specs

**Difficulty:** medium · **~3–4 h** · *the most substantive starter task*

**Files to create** (all three currently do not exist):

| new file | axiom signature (copy this — do not go read the kernel) | statutory anchor | model to follow |
|---|---|---|---|
| `predicates/usc/common/is-person-in-us.md` | `IsPersonInUS (p : Person) (c : ComplaintText) : Prop` | `42 USC § 2000d` | `predicates/titlevi/is-person-in-us.md` |
| `predicates/usc/common/acts-under-color-of-state-law.md` | `ActsUnderColorOfStateLaw (p : Person) (c : ComplaintText) : Prop` | `42 USC § 1983` | `predicates/civilrights/acts-under-color-of-state-law.md` |
| `predicates/usc/common/proximate-cause.md` | `ProximateCause (p : Person) (c : ComplaintText) : Prop` | `18 USC § 1964` | `predicates/rico/proximate-cause.md` |

**Background.** `Proving/USC/Common/` holds cross-title predicates that several
titles share. Each such axiom is supposed to have exactly one authoring spec at
`predicates/usc/common/<kebab-name>.md`. Eleven `Proving.USC.Common` axioms
currently have no spec file; the three above are the ones with the clearest
statutory anchor and an existing hand-built golden spec to model on.

Note the file-naming contract: **predicate spec file = kebab-case of the axiom
name** (`IsPersonInUS` → `is-person-in-us.md`).

**What to do.** For each of the three, author a spec with the six locked
sections from `predicates/README.md` § "Spec contract":

1. `## Lean signature` — the signature quoted in the table above, in a fenced
   block. Nothing else about the kernel.
2. `## Inputs` — the JSON piped on stdin (`{"complaint_path": ..., "subject": ...}`).
3. `## Authority` — the statutory basis, resolved via
   `python3 scripts/uscode.py text "<cite>"`, plus the controlling case law
   already named in the model spec.
4. `## Decision rubric` — numbered conditions; `true` iff a documented threshold
   is met. This is the cross-title form, so state the rubric **generally**, not
   in one title's vocabulary.
5. `## Output schema` — the base `{value, evidence:[{quote,location,rationale}],
   uncertainty}`.
6. `## Test cases` — ≥1 positive, ≥1 negative, synthetic facts only.

Plus the YAML frontmatter:

```yaml
---
context: fork
allowed-tools: [Read, Bash]
axis: <the axis whose lens the rubric takes>
shared: true
usc_cite: "<the anchor from the table>"
---
```

**Acceptance criteria.**
- The three files exist at exactly the paths above.
- `python3 scripts/uscode.py lint` → `0 dead` (your `usc_cite` values resolve).
- `python3 scripts/validate_common_mints.py` → exit 0.
- Each file contains all six `## ` sections named above.
- No `Proving/**.lean` path appears anywhere in the three files.

**Do NOT.** Do not edit `Proving/USC/Common/Predicates.lean` — this issue adds
specs only, and the axioms already exist. Do not add a *fourth* spec for one of
the other eight orphans without opening a separate issue (each needs its own
anchor decision). Do not set `shared: true` on any spec outside
`predicates/usc/common/`.

---

## Issue 9 — Write `scripts/check_predicate_specs.py`, a mechanical spec linter

**Difficulty:** medium (Python) · **~4–6 h** · *the tooling task*

**Files to create:**
- `scripts/check_predicate_specs.py`
- `scripts/test_check_predicate_specs.py`

**Background.** Every defect class in issues 1–6 above was found by an ad-hoc
`grep`. There is no committed checker, so the same defects keep reappearing in
new waves. `proving/` already has the pattern to follow:
`scripts/check_olean_closure.py`, `scripts/validate_common_mints.py`, and the
`lint` subcommand of `scripts/uscode.py` are all stdlib-only, read-only,
system-`python3` scripts with a documented exit code; `scripts/test_uscode.py`
shows the hermetic-fixture test style (build a temp tree, run the checker
against it, assert the exit code — never depend on the live corpus).

**What to do.** Write a read-only checker over every tracked
`predicates/**/*.md` (excluding `README.md` files and `predicates/usc/_axes/*`)
that reports, per file:

- missing YAML frontmatter, or missing `context: fork` / `allowed-tools`;
- for `predicates/usc/**`: missing `axis` / `shared` / `usc_cite`, or an `axis`
  value outside the ten names in `predicates/usc/_axes/`;
- missing any of the six locked sections (`## Lean signature`, `## Inputs`,
  `## Authority`, `## Decision rubric`, `## Output schema`, `## Test cases`);
- a `Proving/**.lean` path anywhere in the body (Hard rule 2);
- a `usc_cite` on a non-positive-law title (from
  the vendored corpus categorization index (a `positive_law: true|false` flag)) with no *prima facie* caveat in the body.

Design constraints:

- **Report-only by default, exit 0.** The tree currently has hundreds of
  findings in every category; a default-failing checker would just be turned
  off. Add `--strict` (non-zero exit on any finding) and `--path <glob>` so a
  cleaned-up directory can be gated incrementally.
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
  exits 0 (that directory is clean) — and exits non-zero on a directory with
  known findings.
- `python3 scripts/test_check_predicate_specs.py` passes against hermetic
  fixtures in a temp directory; it must not read the real `predicates/` tree.
- `python3 scripts/uscode.py lint` and `python3 scripts/test_uscode.py` still
  pass.

**Do NOT.** Do not make the checker rewrite specs (no `--fix` in this PR — a
bulk auto-rewriter over the whole spec tree needs its own review). Do not read or parse
`Proving/**/*.lean` for spec-side rules. Do not add a dependency (no PyYAML —
the frontmatter here is simple enough for a hand parser, as `uscode.py` already
demonstrates).

---

## Re-deriving the counts

Every number above is reproducible from the tree. Run from `proving/`:

```bash
# specs with no "## Test cases" section (excludes the axis briefings)
for f in $(git ls-files 'predicates/**/*.md' | grep -v '_axes/' | grep -v 'README.md'); do
  grep -q '^## Test cases' "$f" || echo "$f"; done | wc -l

# specs missing the forked-execution declaration
for f in $(git ls-files 'predicates/**/*.md' | grep -v '_axes/' | grep -v 'README.md'); do
  grep -q '^context: fork' "$f" || echo "$f"; done | wc -l

# specs missing the USC-program join key
for f in $(git ls-files 'predicates/usc/**/*.md' | grep -v '_axes/' | grep -v 'README.md'); do
  grep -q '^usc_cite:' "$f" || echo "$f"; done | wc -l

# Hard-rule-2 kernel-path cites
grep -rn "Proving/[A-Za-z0-9/]*\.lean" predicates/

# cite resolvability
python3 scripts/uscode.py lint
```

Snapshot at the time of writing (2026-07-22): 1,484 tracked markdown files under
`predicates/` (including the per-framework READMEs and the ten axis briefings);
198 predicate specs with no
`## Test cases`; 315 missing `context: fork`; 23 missing `usc_cite` (all in
`predicates/usc/common/`); 359 on non-positive-law titles missing the *prima
facie* caveat (310 carry it); 3 files cite a kernel `.lean` path (one is
`predicates/README.md`); `uscode.py lint` reports 125/125 cites resolvable, 0
dead.

## Submitting

- One issue per PR. Keep mechanical sweeps mechanical — a caveat sweep PR
  should contain caveat lines and nothing else.
- Paste the output of the acceptance-criteria commands into the PR description.
- If a spec's rubric looks substantively wrong to you, **say so in the PR
  description rather than fixing it inline** — rubric changes are reviewed
  against the statute, not merged as drive-by edits.
