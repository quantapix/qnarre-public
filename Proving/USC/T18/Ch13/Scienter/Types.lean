
















import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch13.Scienter

open Proving.USC.Common (Person ComplaintText)




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


theorem MentalState.atLeast_refl (a : MentalState) : a.atLeast a := Nat.le_refl a.rank



theorem MentalState.atLeast_trans {a b c : MentalState}
    (hab : a.atLeast b) (hbc : b.atLeast c) : a.atLeast c :=
  Nat.le_trans hbc hab

end Proving.USC.T18.Ch13.Scienter
