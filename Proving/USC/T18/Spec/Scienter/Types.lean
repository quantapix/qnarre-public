














import Proving.USC.Common.Types

namespace Proving.USC.T18.Spec.Scienter

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


theorem MentalState.atLeast_refl (a : MentalState) : a.atLeast a := Nat.le_refl _



theorem MentalState.atLeast_trans {a b c : MentalState}
    (h₁ : a.atLeast b) (h₂ : b.atLeast c) : a.atLeast c :=
  Nat.le_trans h₂ h₁

end Proving.USC.T18.Spec.Scienter
