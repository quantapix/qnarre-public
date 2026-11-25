







import Proving.USC.T20.Procedure.Types
import Proving.USC.T20.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T20.Procedure

open Proving.USC.Common (Person ComplaintText)




structure Transition where
  src   : State
  dst   : State
  guard : Prop








structure EffectiveRule1682 (a : Agency) (prog : EducationProgram) (rl : Rule)
    (c : ComplaintText) : Prop where
  empowered  : EmpoweredToExtendAssistance a prog c
  issued     : RuleIssuedUnder1682 a rl c
  consistent : RuleConsistentWithStatuteObjectives rl c
  approved   : PresidentApprovedRule rl c








structure TerminationAuthorized1682 (a : Agency) (r : Recipient)
    (prog : EducationProgram) (act : EnforcementAction)
    (c : ComplaintText) : Prop where
  advised         : AdvisedOfNoncompliance a r c
  voluntaryFailed : VoluntaryComplianceUnsecurable a r c
  hearing         : OpportunityForHearing r c
  finding         : ExpressFindingOnRecord a r c
  scopeRecipient  : TerminationLimitedToFoundRecipient act r c
  scopeProgram    : TerminationLimitedToFoundProgram act prog c





inductive ComplianceMeans1682 (a : Agency) (r : Recipient)
    (prog : EducationProgram) (act : EnforcementAction)
    (c : ComplaintText) : Prop
  | termination
      (h : TerminationAuthorized1682 a r prog act c) :
      ComplianceMeans1682 a r prog act c
  | otherMeans
      (advised : AdvisedOfNoncompliance a r c)
      (voluntaryFailed : VoluntaryComplianceUnsecurable a r c)
      (authorized : OtherMeansAuthorizedByLaw a act c) :
      ComplianceMeans1682 a r prog act c





structure TerminationEffective1682 (a : Agency) (r : Recipient)
    (prog : EducationProgram) (act : EnforcementAction)
    (c : ComplaintText) : Prop where
  authorized  : TerminationAuthorized1682 a r prog act c
  reported    : ReportFiledWithCommittees a act c
  waitElapsed : ThirtyDaysElapsedAfterReport act c








structure ApaReviewAvailable1683 (p : Person) (act : EnforcementAction)
    (a : Agency) (c : ComplaintText) : Prop where
  under1682    : ActionUnder1682 act a c
  terminating  : TerminatesOrRefusesAssistance act c
  notOtherwise : ¬ OtherwiseSubjectToJudicialReview act c
  aggrieved    : PersonAggrieved p act c







structure TransitionExemption1681 (inst : EducationalInstitution)
    (c : ComplaintText) : Prop where
  began        : BeganTransitionToCoeducation inst c
  planApproved : TransitionPlanApprovedBySecretary inst c
  carryingOut  : CarryingOutApprovedPlan inst c
  inWindow     : WithinTransitionExemptionWindow inst c





inductive Step (a : Agency) (r : Recipient) (prog : EducationProgram)
    (rl : Rule) (act : EnforcementAction) (c : ComplaintText) :
    State → State → Prop
  | approve
      (hEmp : EmpoweredToExtendAssistance a prog c)
      (hIss : RuleIssuedUnder1682 a rl c)
      (hCon : RuleConsistentWithStatuteObjectives rl c)
      (hApp : PresidentApprovedRule rl c) :
      Step a r prog rl act c .assisted .ruleEffective
  | advise
      (hAdv : AdvisedOfNoncompliance a r c) :
      Step a r prog rl act c .ruleEffective .advised
  | find
      (hVol : VoluntaryComplianceUnsecurable a r c)
      (hHear : OpportunityForHearing r c)
      (hFind : ExpressFindingOnRecord a r c) :
      Step a r prog rl act c .advised .found
  | order
      (hScopeR : TerminationLimitedToFoundRecipient act r c)
      (hScopeP : TerminationLimitedToFoundProgram act prog c) :
      Step a r prog rl act c .found .ordered
  | report
      (hRep : ReportFiledWithCommittees a act c) :
      Step a r prog rl act c .ordered .reported
  | takeEffect
      (hWait : ThirtyDaysElapsedAfterReport act c) :
      Step a r prog rl act c .reported .effective



inductive Reachable (a : Agency) (r : Recipient) (prog : EducationProgram)
    (rl : Rule) (act : EnforcementAction) (c : ComplaintText) :
    State → State → Prop
  | refl (s : State) : Reachable a r prog rl act c s s
  | tail {s t u : State}
      (hReach : Reachable a r prog rl act c s t)
      (hStep : Step a r prog rl act c t u) :
      Reachable a r prog rl act c s u

end Proving.USC.T20.Procedure
