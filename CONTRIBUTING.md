# Contributing to qnarre-public

> **What this is:** the front door to one open lane of the qagents
> framework — the **axiomatization of the U.S. Code** in Lean4, backed by
> LLM-evaluated predicates. Nothing else in the framework is open to
> outside contribution today, and this file is deliberately explicit about
> where that line runs.

## Read this first: what state the lane is actually in

The honest picture as of **2026-08-07**, so you can judge whether it is
worth your time before you clone anything:

- **A first tranche of starter tasks is written**, in
  [`GOOD-FIRST-ISSUES.md`](./GOOD-FIRST-ISSUES.md) — **five open, of an
  original nine**, each a defect re-derived against the tree with its own
  acceptance criteria and the commands to re-derive its counts, not an
  invented exercise. Four of the original nine were swept internally in the
  week after the roster was first published; they keep their numbers and are
  marked closed in place, so a returning reader can see what happened rather
  than finding tasks silently missing. Expect that to keep happening — the
  roster is a snapshot of a tree under active work, which is why the
  remaining tooling task (a committed spec linter) matters more than any
  single sweep. None of these are **filed as individual issues** on the
  tracker, which is still empty; this file is the roster. Earlier copy on the
  org profile said to "start at the good-first-issues here"; that was a claim
  ahead of the artifact, and this is the artifact catching up.
- **Discussions are not enabled** on any repo in the org. Until they are,
  an issue on this repo is the channel.
- **This repo is a redacted, weekly-refreshed slice**, not the working
  tree. You cannot open a pull request against the private repository, and
  a PR here cannot be fast-forwarded into it mechanically — see
  "How a contribution actually lands" below.
- **The project is one developer working with AI assistance**, opening one
  well-isolated lane. It is not a community project, and response latency
  will look like a single person's, because it is.
- **The sources are not here yet.** This repo currently carries the
  narrative documents only. The Lean kernel, the predicate specs, and the
  helper scripts that every acceptance criterion in
  [`GOOD-FIRST-ISSUES.md`](./GOOD-FIRST-ISSUES.md) refers to are in the
  private working tree and are being prepared for a source drop. Until that
  lands, the issues are readable as a specification of the work and as an
  honest inventory of the tree's defects, but you cannot run their commands
  against a clone. Open an issue if you want to be told when the sources
  land.

If that is disqualifying for you, better to know now than after a weekend
of encoding work.

## Why this lane and no other

The U.S. Code program is separable from everything else the framework
does, on a property that matters: it operates over **public federal
statutes only**. No private case material, no docket record, no personal
data is ever in scope. That means collaboration here carries **no
privacy-floor surface** — the constraint that keeps the rest of the
framework closed simply does not apply to statutory text.

The redundancy design also makes an outside encoding worth more than an
internal one: independent cells encode the same section blind to each
other, and a cross-strategy bridge measures their agreement inside the
kernel. An encoding written by someone who has not read the existing one
is *useful precisely because* it was written blind.

## What a contribution looks like

Pick a unit at whatever size fits your time:

| Unit | Shape | Typical size |
|---|---|---|
| **A section** | One U.S. Code section encoded as Lean4 definitions + the elements it decomposes into | an evening |
| **A predicate** | One LLM-evaluated predicate spec: what question it asks of the statutory text, what evidence it must return | an evening |
| **A title pass** | A sweep across one title, encoding the operative sections and reconciling overlaps | a sustained effort |

Three properties are non-negotiable, because they are what the kernel
checks rather than style preferences:

1. **The kernel does no I/O.** Predicates read natural language; the
   kernel composes their Booleans into a proof. Never blur the two — an
   encoding that reaches for the text inside a proof is rejected on sight.
2. **Every citation resolves against vendored canonical text.** Statutory
   text is vendored and pinned, never pasted inline. A `usc_cite` resolves
   through the index; a spec citing an obsolete subsection number fails
   loudly instead of silently encoding a repealed rule.
3. **`sorry` is not a contribution.** Every promoted proof elaborates
   under `lake build` and is `sorry`-free. There is no "sort of holds."

## How a contribution actually lands

The mechanics are unusual and worth stating plainly, because the normal
GitHub assumption (open a PR, maintainer merges it) does not hold:

1. You open an **issue on this repo** describing the section, predicate,
   or title you intend to take, before doing the work. This is the
   coordination point — it is how you find out whether an internal wave is
   already encoding that section, which is the single most likely way for
   your effort to be wasted.
2. You do the work against this repo's Lean sources and open a PR here,
   or attach the encoding to the issue.
3. The encoding is reviewed against the frozen **golden-reference cells**
   — the hand-built frameworks that the automated program is itself scored
   against. They are frozen precisely so a new cell has a fixed target.
4. On acceptance it is carried into the private working tree and flows
   back out through the next weekly refresh. Attribution rides the commit.

Because step 4 is a carry rather than a merge, your commit hash here will
not survive into the mirror. The attribution does; the hash does not.

## Licensing

This repo is Apache-2.0 (code-class). By contributing you agree your
contribution ships under that license. Do not paste code from a source
whose license you have not read — the framework carries **zero
third-party license entanglement** by design, and a single GPL-derived
snippet in a Lean file would be a real problem, not a paperwork one.

## Contact

Open an issue on this repo. Answered in public; there is no contact email.
