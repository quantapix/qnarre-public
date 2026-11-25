







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch21Tail.Elements.Types
import Proving.USC.T42.Ch21Tail.Elements.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.Ch21Tail.Elements

open Proving.USC.Common






structure ProtectedReport1997d
    (p : Person) (r : Report) (i : Institution) (c : ComplaintText) : Prop where
  reported   : MadeReportOfConditions p r c
  concerns   : ConditionsReportedAtInstitution r i c
  covered    : IsCoveredInstitution i c
  mayViolate : ConditionsMayConstituteSubchapterViolation r c



abbrev ReportedProtectedConditions
    (p : Person) (r : Report) (i : Institution) (c : ComplaintText) : Prop :=
  ProtectedReport1997d p r i c




structure Section1997d
    (v : Person) (d : Person) (r : Report) (i : Institution)
    (a : RetaliatoryAct) (c : ComplaintText) : Prop where
  protectedReport : ReportedProtectedConditions v r i c
  retaliation     : SubjectedToRetaliation v d a c
  causation       : RetaliationBecauseOfReport a r c





structure ValidSection1997dRetaliationClaim
    (v : Person) (d : Person) (r : Report) (i : Institution)
    (a : RetaliatoryAct) (c : ComplaintText) : Prop where
  violation      : Section1997d v d r i a c
  protectedPerson : IsPersonInUS v c
  injury         : SufferedCognizableInjury v c
  proximateCause : ProximateCause v c
  timely         : WithinLimitations v c





inductive DeprivationOfProtectedRights
    (i : Institution) (c : ComplaintText) : Prop where
  | constitutional   (h : ConditionsDepriveConstitutionalRights i c)
  | federalStatutory (h : ConditionsDepriveFederalStatutoryRights i c)




structure CorrectableConditions1997g
    (i : Institution) (c : ComplaintText) : Prop where
  covered     : IsCoveredInstitution i c
  deplorable  : ConditionsAreDeplorable i c
  deprivation : DeprivationOfProtectedRights i c



abbrev ConditionsWarrantCorrection (i : Institution) (c : ComplaintText) : Prop :=
  CorrectableConditions1997g i c




inductive CorrectionRoute1997g
    (i : Institution) (c : ComplaintText) : Prop where
  | litigation        (h : CorrectionSoughtByLitigation i c)
  | voluntaryGoodFaith (g : GovernmentAgency)
                       (h : VoluntaryGoodFaithEffortByGovernmentAgency g i c)






structure Section1997gFundingPriority
    (i : Institution) (f : FundingProgram) (c : ComplaintText) : Prop where
  conditions     : ConditionsWarrantCorrection i c
  fundsAvailable : FederalFundsAvailableForInstitutionalImprovement i f c
  priority       : PriorityGivenToCorrectionOfConditions i f c
  noRedirection  : ¬ ReliefRequiresRedirectionOfFunds f c

end Proving.USC.T42.Ch21Tail.Elements
