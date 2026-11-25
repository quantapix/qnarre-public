





import Proving.USC.T20.Procedure.Types
import Proving.USC.T20.Procedure.Predicates
import Proving.USC.T20.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T20.Procedure

open Proving.USC.Common (Person ComplaintText)



theorem effectiveRule1682_intro {a : Agency} {prog : EducationProgram}
    {rl : Rule} {c : ComplaintText}
    (hEmp : EmpoweredToExtendAssistance a prog c)
    (hIss : RuleIssuedUnder1682 a rl c)
    (hCon : RuleConsistentWithStatuteObjectives rl c)
    (hApp : PresidentApprovedRule rl c) :
    EffectiveRule1682 a prog rl c :=
  ⟨hEmp, hIss, hCon, hApp⟩



theorem terminationAuthorized1682_intro {a : Agency} {r : Recipient}
    {prog : EducationProgram} {act : EnforcementAction} {c : ComplaintText}
    (hAdv : AdvisedOfNoncompliance a r c)
    (hVol : VoluntaryComplianceUnsecurable a r c)
    (hHear : OpportunityForHearing r c)
    (hFind : ExpressFindingOnRecord a r c)
    (hScopeR : TerminationLimitedToFoundRecipient act r c)
    (hScopeP : TerminationLimitedToFoundProgram act prog c) :
    TerminationAuthorized1682 a r prog act c :=
  ⟨hAdv, hVol, hHear, hFind, hScopeR, hScopeP⟩



theorem complianceMeans1682_termination_intro {a : Agency} {r : Recipient}
    {prog : EducationProgram} {act : EnforcementAction} {c : ComplaintText}
    (h : TerminationAuthorized1682 a r prog act c) :
    ComplianceMeans1682 a r prog act c :=
  .termination h



theorem complianceMeans1682_otherMeans_intro {a : Agency} {r : Recipient}
    {prog : EducationProgram} {act : EnforcementAction} {c : ComplaintText}
    (hAdv : AdvisedOfNoncompliance a r c)
    (hVol : VoluntaryComplianceUnsecurable a r c)
    (hOther : OtherMeansAuthorizedByLaw a act c) :
    ComplianceMeans1682 a r prog act c :=
  .otherMeans hAdv hVol hOther



theorem terminationEffective1682_intro {a : Agency} {r : Recipient}
    {prog : EducationProgram} {act : EnforcementAction} {c : ComplaintText}
    (hAuth : TerminationAuthorized1682 a r prog act c)
    (hRep : ReportFiledWithCommittees a act c)
    (hWait : ThirtyDaysElapsedAfterReport act c) :
    TerminationEffective1682 a r prog act c :=
  ⟨hAuth, hRep, hWait⟩


theorem apaReviewAvailable1683_intro {p : Person} {act : EnforcementAction}
    {a : Agency} {c : ComplaintText}
    (hUnder : ActionUnder1682 act a c)
    (hTerm : TerminatesOrRefusesAssistance act c)
    (hNotOtherwise : ¬ OtherwiseSubjectToJudicialReview act c)
    (hAggr : PersonAggrieved p act c) :
    ApaReviewAvailable1683 p act a c :=
  ⟨hUnder, hTerm, hNotOtherwise, hAggr⟩


theorem transitionExemption1681_intro {inst : EducationalInstitution}
    {c : ComplaintText}
    (hBegan : BeganTransitionToCoeducation inst c)
    (hPlan : TransitionPlanApprovedBySecretary inst c)
    (hCarry : CarryingOutApprovedPlan inst c)
    (hWin : WithinTransitionExemptionWindow inst c) :
    TransitionExemption1681 inst c :=
  ⟨hBegan, hPlan, hCarry, hWin⟩

end Proving.USC.T20.Procedure
