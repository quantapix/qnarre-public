








import Proving.USC.T20.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T20.Procedure

open Proving.USC.Common (Person ComplaintText)







axiom EmpoweredToExtendAssistance (a : Agency) (prog : EducationProgram)
    (c : ComplaintText) : Prop




axiom RuleIssuedUnder1682 (a : Agency) (rl : Rule) (c : ComplaintText) : Prop




axiom RuleConsistentWithStatuteObjectives (rl : Rule) (c : ComplaintText) : Prop




axiom PresidentApprovedRule (rl : Rule) (c : ComplaintText) : Prop






axiom AdvisedOfNoncompliance (a : Agency) (r : Recipient) (c : ComplaintText) : Prop




axiom VoluntaryComplianceUnsecurable (a : Agency) (r : Recipient)
    (c : ComplaintText) : Prop




axiom OpportunityForHearing (r : Recipient) (c : ComplaintText) : Prop




axiom ExpressFindingOnRecord (a : Agency) (r : Recipient) (c : ComplaintText) : Prop





axiom TerminationLimitedToFoundRecipient (act : EnforcementAction)
    (r : Recipient) (c : ComplaintText) : Prop





axiom TerminationLimitedToFoundProgram (act : EnforcementAction)
    (prog : EducationProgram) (c : ComplaintText) : Prop




axiom OtherMeansAuthorizedByLaw (a : Agency) (act : EnforcementAction)
    (c : ComplaintText) : Prop








axiom ReportFiledWithCommittees (a : Agency) (act : EnforcementAction)
    (c : ComplaintText) : Prop






axiom ThirtyDaysElapsedAfterReport (act : EnforcementAction)
    (c : ComplaintText) : Prop





axiom ActionUnder1682 (act : EnforcementAction) (a : Agency)
    (c : ComplaintText) : Prop





axiom OtherwiseSubjectToJudicialReview (act : EnforcementAction)
    (c : ComplaintText) : Prop





axiom TerminatesOrRefusesAssistance (act : EnforcementAction)
    (c : ComplaintText) : Prop





axiom PersonAggrieved (p : Person) (act : EnforcementAction)
    (c : ComplaintText) : Prop







axiom BeganTransitionToCoeducation (inst : EducationalInstitution)
    (c : ComplaintText) : Prop




axiom TransitionPlanApprovedBySecretary (inst : EducationalInstitution)
    (c : ComplaintText) : Prop




axiom CarryingOutApprovedPlan (inst : EducationalInstitution)
    (c : ComplaintText) : Prop







axiom WithinTransitionExemptionWindow (inst : EducationalInstitution)
    (c : ComplaintText) : Prop

end Proving.USC.T20.Procedure
