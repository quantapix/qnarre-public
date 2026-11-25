










import Proving.USC.T18.Ch71.Reslice.Scienter.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch71.Reslice.Scienter

open Proving.USC.Common (Person ComplaintText)



def Scienter1462 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState1462 ∧ MentalStateProven p rung c



def Scienter1465 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState1465 ∧ MentalStateProven p rung c

end Proving.USC.T18.Ch71.Reslice.Scienter
