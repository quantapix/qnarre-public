








import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch21Tail.Elements.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch21Tail.Elements

open Proving.USC.Common






axiom MadeReportOfConditions (p : Person) (r : Report) (c : ComplaintText) : Prop





axiom ConditionsReportedAtInstitution
    (r : Report) (i : Institution) (c : ComplaintText) : Prop





axiom IsCoveredInstitution (i : Institution) (c : ComplaintText) : Prop





axiom ConditionsMayConstituteSubchapterViolation
    (r : Report) (c : ComplaintText) : Prop




axiom SubjectedToRetaliation
    (v : Person) (d : Person) (a : RetaliatoryAct) (c : ComplaintText) : Prop




axiom RetaliationBecauseOfReport
    (a : RetaliatoryAct) (r : Report) (c : ComplaintText) : Prop




axiom SufferedCognizableInjury (p : Person) (c : ComplaintText) : Prop






axiom ConditionsAreDeplorable (i : Institution) (c : ComplaintText) : Prop




axiom ConditionsDepriveConstitutionalRights
    (i : Institution) (c : ComplaintText) : Prop




axiom ConditionsDepriveFederalStatutoryRights
    (i : Institution) (c : ComplaintText) : Prop




axiom FederalFundsAvailableForInstitutionalImprovement
    (i : Institution) (f : FundingProgram) (c : ComplaintText) : Prop




axiom PriorityGivenToCorrectionOfConditions
    (i : Institution) (f : FundingProgram) (c : ComplaintText) : Prop





axiom ReliefRequiresRedirectionOfFunds (f : FundingProgram) (c : ComplaintText) : Prop




axiom CorrectionSoughtByLitigation (i : Institution) (c : ComplaintText) : Prop




axiom VoluntaryGoodFaithEffortByGovernmentAgency
    (g : GovernmentAgency) (i : Institution) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21Tail.Elements
