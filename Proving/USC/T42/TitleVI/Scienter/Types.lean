





















import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Scienter

open Proving.USC.Common (Person ComplaintText)




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



def MentalState.atLeast (a b : MentalState) : Prop := b.rank ≤ a.rank

end Proving.USC.T42.TitleVI.Scienter
