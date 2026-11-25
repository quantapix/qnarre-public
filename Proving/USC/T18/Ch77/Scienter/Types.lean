import Proving.USC.Common.Types
set_option autoImplicit false









namespace Proving.USC.T18.Ch77.Scienter

open Proving.USC.Common




inductive MentalState
  | StrictLiability
  | Negligence
  | Recklessness
  | Knowledge
  | Specific
  deriving DecidableEq, Repr



def MentalState.rank : MentalState → Nat
  | .StrictLiability => 0
  | .Negligence      => 1
  | .Recklessness    => 2
  | .Knowledge       => 3
  | .Specific        => 4




def MentalState.atLeast (a b : MentalState) : Prop := b.rank ≤ a.rank

instance (a b : MentalState) : Decidable (a.atLeast b) :=
  inferInstanceAs (Decidable (b.rank ≤ a.rank))


theorem MentalState.atLeast_refl (a : MentalState) : a.atLeast a := Nat.le_refl _

end Proving.USC.T18.Ch77.Scienter
