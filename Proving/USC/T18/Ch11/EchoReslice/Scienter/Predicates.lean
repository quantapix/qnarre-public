











import Proving.USC.T18.Ch11.EchoReslice.Scienter.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Scienter

open Proving.USC.Common














def RequiredMentalState : Paragraph201 → MentalState
  | .b1A | .b1B | .b1C => .Specific
  | .b2A | .b2B | .b2C => .Specific
  | .b3Influence | .b3Absence => .Specific
  | .b4Influence | .b4Absence => .Specific
  | .c1A | .c1B => .Knowledge
  | .c2 | .c3 => .Knowledge









axiom ActsCorruptly (p : Person) (c : ComplaintText) : Prop







axiom HoldsQuidProQuoUnderstanding (p : Person) (c : ComplaintText) : Prop








axiom IntendsToInfluenceOfficialAct (giver : Person) (c : ComplaintText) : Prop







axiom IntendsToInduceFraudOnUnitedStates (giver : Person) (c : ComplaintText) : Prop






axiom IntendsToInduceBreachOfLawfulDuty (giver : Person) (c : ComplaintText) : Prop







axiom AcceptsInReturnForInfluenceInOfficialAct (official : Person) (c : ComplaintText) : Prop




axiom AcceptsInReturnForFraudOnUnitedStates (official : Person) (c : ComplaintText) : Prop




axiom AcceptsInReturnForBreachOfOfficialDuty (official : Person) (c : ComplaintText) : Prop








axiom IntendsToInfluenceTestimony (giver : Person) (c : ComplaintText) : Prop





axiom IntendsToInduceAbsenceFromProceeding (giver : Person) (c : ComplaintText) : Prop






axiom AcceptsInReturnForInfluenceInTestimony (witness : Person) (c : ComplaintText) : Prop



axiom AcceptsInReturnForAbsenceFromProceeding (witness : Person) (c : ComplaintText) : Prop










axiom KnowsValueIsForOrBecauseOfOfficialAct (p : Person) (c : ComplaintText) : Prop






axiom KnowsValueIsForOrBecauseOfTestimony (p : Person) (c : ComplaintText) : Prop








axiom NotAuthorizedByLawForProperDischargeOfDuty (p : Person) (c : ComplaintText) : Prop









axiom PaymentIsExemptWitnessFeeOrExpense (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch11.EchoReslice.Scienter
