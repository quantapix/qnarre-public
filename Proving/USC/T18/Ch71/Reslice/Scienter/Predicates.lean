













import Proving.USC.T18.Ch71.Reslice.Scienter.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch71.Reslice.Scienter

open Proving.USC.Common (Person ComplaintText)





axiom MentalStateProven (p : Person) (rung : MentalState) (c : ComplaintText) : Prop








def RequiredMentalState1462 : MentalState := .Knowledge






def RequiredMentalState1465 : MentalState := .Specific

end Proving.USC.T18.Ch71.Reslice.Scienter
