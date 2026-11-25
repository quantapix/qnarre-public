
















import Proving.USC.Common.Types
import Proving.USC.T18.Ch75.Scienter.Types

namespace Proving.USC.T18.Ch75.Scienter




open Proving.USC.Common (Person ComplaintText MentalState)





axiom MentalStateProven (p : Person) (rung : MentalState) (c : ComplaintText) : Prop








def RequiredMentalState : Ch75Offense → MentalState
  | .s1542  => .Specific
  | .s1543  => .Specific
  | .s1544  => .Specific
  | .s1546a => .Knowledge
  | .s1546b => .Negligence

end Proving.USC.T18.Ch75.Scienter
