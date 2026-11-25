import Proving.USC.Common.Types

set_option autoImplicit false









namespace Proving.USC.T18.Ch113.Reslice.Scienter

open Proving.USC.Common




inductive MentalState
  | StrictLiability
  | Negligence
  | Recklessness
  | Knowledge
  | Specific
deriving DecidableEq


def MentalState.rank : MentalState → Nat
  | .StrictLiability => 0
  | .Negligence      => 1
  | .Recklessness    => 2
  | .Knowledge       => 3
  | .Specific        => 4






@[reducible] def MentalState.atLeast (a b : MentalState) : Prop := b.rank ≤ a.rank

end Proving.USC.T18.Ch113.Reslice.Scienter
