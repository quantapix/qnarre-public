









































namespace Proving.USC.Common













syntax "prove_element" : tactic

macro_rules
  | `(tactic| prove_element) =>
    `(tactic| first
        | assumption
        | (constructor! <;> prove_element)
        | grind)

end Proving.USC.Common
