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
| **Driver** (`scripts/extract_facts.py`) | manifest + complaint | `Proving/<Framework>/Facts.lean` (axioms) + audit JSON | LLM `--print --model haiku` invocations. |

The Lean kernel never reads natural language. The predicate
sub-agents never write Lean. The driver is a thin coordinator. The
verifiable proof IS the Lean elaboration trace produced by
`lake build`.

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

Spec roster at launch: RICO 28 specs (14 common + 4 c + 3 a + 3 b +
4 d); Title VI 17 specs (7 coverage + 2 intentional + 5
disparate-impact + 3 retaliation); CivilRights 14 specs (4 § 1981 +
5 § 1983 + 5 § 1985(3)).

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

MIT.
