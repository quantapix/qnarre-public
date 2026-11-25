








import Proving.USC.T42.TitleVI.Scienter.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Scienter

open Proving.USC.Common (Person ComplaintText)






axiom MentalStateProven (p : Person) (rung : MentalState) (c : ComplaintText) : Prop








def RequiredMentalState2000d : MentalState := .Specific










def RequiredMentalState2000d1 : MentalState := .StrictLiability








def RequiredMentalState2000d7 : Option MentalState := none

end Proving.USC.T42.TitleVI.Scienter
