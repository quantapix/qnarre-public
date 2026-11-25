

















import Proving.USC.T20.Ch38.Reearn.Procedure.Types
import Proving.USC.T20.Ch38.Reearn.Procedure.Predicates

set_option autoImplicit false

namespace Proving.USC.T20.Ch38.Reearn.Procedure

open Proving.USC.Common







abbrev ThirtyDayReportWaitElapsed
    (rep : ComplianceReport) (act : EnforcementAction) (c : ComplaintText) : Prop :=
  dayOfReportFilingWithCommittees rep c + 30 ≤ dayEnforcementActionEffective act c



noncomputable abbrev admissionsExemptionWindowEnd
    (prog : EducationProgram) (c : ComplaintText) : Nat :=
  max (dayOfTitleIXEnactment c + 2190) (dayTransitionProcessBegan prog c + 2555)



abbrev WithinAdmissionsTransitionExemption
    (prog : EducationProgram) (c : ComplaintText) : Prop :=
  dayOfChallengedAdmissionsAction prog c ≤ admissionsExemptionWindowEnd prog c



abbrev WithinEnactmentGracePeriod
    (prog : EducationProgram) (c : ComplaintText) : Prop :=
  dayOfChallengedAdmissionsAction prog c ≤ dayOfTitleIXEnactment c + 365


abbrev TaskForceEstablishedByDeadline (tf : TaskForce) (c : ComplaintText) : Prop :=
  dayTaskForceEstablished tf c ≤ dayOfTaskForceStatutoryDeadline c



abbrev RecommendationsWithinNinetyDays
    (tf : TaskForce) (rec : TaskForceRecommendations) (c : ComplaintText) : Prop :=
  dayRecommendationsSubmitted rec c ≤ dayTaskForceEstablished tf c + 90


abbrev DetailWithinThreeYearLimit (d : PersonnelDetail) (c : ComplaintText) : Prop :=
  daysOfPersonnelDetail d c ≤ 1095







structure RuleEffectivenessPrerequisites
    (a : FederalAgency) (prog : EducationProgram) (r : AgencyRule)
    (c : ComplaintText) : Prop where
  empowered      : AgencyEmpoweredToExtendAssistance a prog c
  notInsurance   : AssistanceNotInsuranceOrGuaranty a prog c
  generalRule    : RuleIssuedOfGeneralApplicability a r c
  consistentObj  : RuleConsistentWithStatutoryObjectives r c
  presidentialOk : RuleApprovedByPresident r c



structure PreActionNoticeSatisfied
    (a : FederalAgency) (rc : Recipient) (c : ComplaintText) : Prop where
  advised            : RecipientAdvisedOfFailureToComply a rc c
  voluntaryUnsecured : VoluntaryComplianceDeterminedUnsecurable a rc c



structure HearingAndFindingSatisfied
    (a : FederalAgency) (rc : Recipient) (h : AdministrativeHearing)
    (c : ComplaintText) : Prop where
  hearingAfforded : OpportunityForHearingAfforded h rc c
  expressFinding  : ExpressFindingOnRecordOfNoncompliance a rc c


structure TerminationScopeLimited
    (act : EnforcementAction) (rc : Recipient) (prog : EducationProgram)
    (c : ComplaintText) : Prop where
  toFoundRecipient : TerminationLimitedToFoundRecipient act rc c
  toFoundProgram   : TerminationLimitedToFoundProgram act prog c


structure CongressionalReportFiled
    (a : FederalAgency) (rep : ComplianceReport) (c : ComplaintText) : Prop where
  filed          : WrittenReportFiledWithCommittees a rep c
  fullAndGrounds : ReportStatesCircumstancesAndGrounds rep c




structure TimelyTerminationOfAssistance
    (a : FederalAgency) (rc : Recipient) (prog : EducationProgram)
    (r : AgencyRule) (h : AdministrativeHearing) (act : EnforcementAction)
    (rep : ComplianceReport) (c : ComplaintText) : Prop where
  rulePrereqs  : RuleEffectivenessPrerequisites a prog r c
  preAction    : PreActionNoticeSatisfied a rc c
  hearingFind  : HearingAndFindingSatisfied a rc h c
  scopeLimited : TerminationScopeLimited act rc prog c
  reportFiled  : CongressionalReportFiled a rep c
  tookEffect   : EnforcementActionTakenEffect act c
  thirtyDayOk  : ThirtyDayReportWaitElapsed rep act c




inductive EnforcementRoute
    (a : FederalAgency) (rc : Recipient) (prog : EducationProgram)
    (r : AgencyRule) (h : AdministrativeHearing) (act : EnforcementAction)
    (rep : ComplianceReport) (c : ComplaintText) : Prop where

  | byTermination
      (timely : TimelyTerminationOfAssistance a rc prog r h act rep c) :
      EnforcementRoute a rc prog r h act rep c


  | byOtherMeansAuthorizedByLaw
      (rulePrereqs : RuleEffectivenessPrerequisites a prog r c)
      (preAction : PreActionNoticeSatisfied a rc c)
      (otherMeans : EnforcementByOtherMeansAuthorizedByLaw act c) :
      EnforcementRoute a rc prog r h act rep c






def tRuleApproved (r : AgencyRule) (c : ComplaintText) : Transition :=
  { src := EnforcementState.RuleProposed
    dst := EnforcementState.RuleEffective
    guard := RuleApprovedByPresident r c }


def tAdviseRecipient
    (a : FederalAgency) (rc : Recipient) (c : ComplaintText) : Transition :=
  { src := EnforcementState.RuleEffective
    dst := EnforcementState.RecipientAdvised
    guard := RecipientAdvisedOfFailureToComply a rc c }


def tVoluntaryComplianceFails
    (a : FederalAgency) (rc : Recipient) (c : ComplaintText) : Transition :=
  { src := EnforcementState.RecipientAdvised
    dst := EnforcementState.VoluntaryComplianceFailed
    guard := VoluntaryComplianceDeterminedUnsecurable a rc c }


def tAffordHearing
    (h : AdministrativeHearing) (rc : Recipient) (c : ComplaintText) : Transition :=
  { src := EnforcementState.VoluntaryComplianceFailed
    dst := EnforcementState.HearingAfforded
    guard := OpportunityForHearingAfforded h rc c }


def tMakeFinding
    (a : FederalAgency) (rc : Recipient) (c : ComplaintText) : Transition :=
  { src := EnforcementState.HearingAfforded
    dst := EnforcementState.FindingOnRecord
    guard := ExpressFindingOnRecordOfNoncompliance a rc c }


def tOrderAction
    (act : EnforcementAction) (rc : Recipient) (prog : EducationProgram)
    (c : ComplaintText) : Transition :=
  { src := EnforcementState.FindingOnRecord
    dst := EnforcementState.ActionOrdered
    guard := TerminationScopeLimited act rc prog c }


def tFileReport
    (a : FederalAgency) (rep : ComplianceReport) (c : ComplaintText) : Transition :=
  { src := EnforcementState.ActionOrdered
    dst := EnforcementState.ReportFiled
    guard := CongressionalReportFiled a rep c }



def tActionBecomesEffective
    (rep : ComplianceReport) (act : EnforcementAction) (c : ComplaintText) : Transition :=
  { src := EnforcementState.ReportFiled
    dst := EnforcementState.ActionEffective
    guard := EnforcementActionTakenEffect act c ∧ ThirtyDayReportWaitElapsed rep act c }


def tSeekJudicialReview
    (pty : AggrievedParty) (pet : JudicialReviewPetition) (act : EnforcementAction)
    (c : ComplaintText) : Transition :=
  { src := EnforcementState.ActionEffective
    dst := EnforcementState.UnderJudicialReview
    guard := PartyAggrievedByAction pty act c ∧ JudicialReviewSoughtUnderAPA pet act c }





inductive Section1682Progress
    (a : FederalAgency) (rc : Recipient) (prog : EducationProgram)
    (r : AgencyRule) (h : AdministrativeHearing) (act : EnforcementAction)
    (rep : ComplianceReport) (c : ComplaintText) : EnforcementState → Prop where
  | ruleProposed
      (empowered : AgencyEmpoweredToExtendAssistance a prog c)
      (notInsurance : AssistanceNotInsuranceOrGuaranty a prog c)
      (generalRule : RuleIssuedOfGeneralApplicability a r c)
      (consistentObj : RuleConsistentWithStatutoryObjectives r c) :
      Section1682Progress a rc prog r h act rep c EnforcementState.RuleProposed
  | ruleEffective
      (prev : Section1682Progress a rc prog r h act rep c EnforcementState.RuleProposed)
      (guard : (tRuleApproved r c).guard) :
      Section1682Progress a rc prog r h act rep c EnforcementState.RuleEffective
  | recipientAdvised
      (prev : Section1682Progress a rc prog r h act rep c EnforcementState.RuleEffective)
      (guard : (tAdviseRecipient a rc c).guard) :
      Section1682Progress a rc prog r h act rep c EnforcementState.RecipientAdvised
  | voluntaryComplianceFailed
      (prev : Section1682Progress a rc prog r h act rep c EnforcementState.RecipientAdvised)
      (guard : (tVoluntaryComplianceFails a rc c).guard) :
      Section1682Progress a rc prog r h act rep c EnforcementState.VoluntaryComplianceFailed
  | hearingAfforded
      (prev : Section1682Progress a rc prog r h act rep c EnforcementState.VoluntaryComplianceFailed)
      (guard : (tAffordHearing h rc c).guard) :
      Section1682Progress a rc prog r h act rep c EnforcementState.HearingAfforded
  | findingOnRecord
      (prev : Section1682Progress a rc prog r h act rep c EnforcementState.HearingAfforded)
      (guard : (tMakeFinding a rc c).guard) :
      Section1682Progress a rc prog r h act rep c EnforcementState.FindingOnRecord
  | actionOrdered
      (prev : Section1682Progress a rc prog r h act rep c EnforcementState.FindingOnRecord)
      (guard : (tOrderAction act rc prog c).guard) :
      Section1682Progress a rc prog r h act rep c EnforcementState.ActionOrdered
  | reportFiled
      (prev : Section1682Progress a rc prog r h act rep c EnforcementState.ActionOrdered)
      (guard : (tFileReport a rep c).guard) :
      Section1682Progress a rc prog r h act rep c EnforcementState.ReportFiled
  | actionEffective
      (prev : Section1682Progress a rc prog r h act rep c EnforcementState.ReportFiled)
      (guard : (tActionBecomesEffective rep act c).guard) :
      Section1682Progress a rc prog r h act rep c EnforcementState.ActionEffective
  | underJudicialReview
      (pty : AggrievedParty) (pet : JudicialReviewPetition)
      (prev : Section1682Progress a rc prog r h act rep c EnforcementState.ActionEffective)
      (guard : (tSeekJudicialReview pty pet act c).guard) :
      Section1682Progress a rc prog r h act rep c EnforcementState.UnderJudicialReview






structure JudicialReviewInvoked
    (pty : AggrievedParty) (pet : JudicialReviewPetition)
    (act : EnforcementAction) (c : ComplaintText) : Prop where
  pursuantTo1682 : ActionTakenPursuantToSection1682 act c
  aggrieved      : PartyAggrievedByAction pty act c
  reviewSought   : JudicialReviewSoughtUnderAPA pet act c









inductive JudicialReviewAvailability
    (pty : AggrievedParty) (pet : JudicialReviewPetition)
    (act : EnforcementAction) (c : ComplaintText) : Prop where

  | otherwiseProvidedByLaw
      (pursuantTo1682 : ActionTakenPursuantToSection1682 act c)
      (otherwiseReviewable : ActionOtherwiseSubjectToJudicialReview act c) :
      JudicialReviewAvailability pty pet act c


  | residualAPAReview
      (pursuantTo1682 : ActionTakenPursuantToSection1682 act c)
      (notOtherwiseReviewable : ¬ ActionOtherwiseSubjectToJudicialReview act c)
      (terminatingOrRefusing : ActionTerminatingOrRefusingAssistance act c)
      (invoked : JudicialReviewInvoked pty pet act c) :
      JudicialReviewAvailability pty pet act c








structure AdmissionsTransitionExemption
    (pl : TransitionPlan) (prog : EducationProgram) (c : ComplaintText) : Prop where
  admissionsAction : AdmissionsActionChallenged prog c
  begunTransition  : InstitutionBegunSingleSexToCoedTransition prog c
  planApproved     : TransitionPlanApprovedBySecretary pl prog c
  carryingOutPlan  : CarryingOutApprovedTransitionPlan pl prog c
  withinWindow     : WithinAdmissionsTransitionExemption prog c




inductive AdmissionsExemptionWindow
    (pl : TransitionPlan) (prog : EducationProgram) (c : ComplaintText) : Prop where

  | enactmentGrace
      (admissionsAction : AdmissionsActionChallenged prog c)
      (withinGrace : WithinEnactmentGracePeriod prog c) :
      AdmissionsExemptionWindow pl prog c

  | transitionWindow
      (exempt : AdmissionsTransitionExemption pl prog c) :
      AdmissionsExemptionWindow pl prog c









structure StatisticalEvidenceConsiderable
    (pr : ChapterProceeding) (c : ComplaintText) : Prop where
  chapterProceeding : ProceedingUnderThisChapter pr c
  evidenceOffered   : StatisticalImbalanceEvidenceOffered pr c






structure Section1688PenaltyBarTriggered (p : Person) (c : ComplaintText) : Prop where
  penaltySought      : PenaltySoughtAgainstPerson p c
  abortionRelatedGrd : PenaltyGroundIsAbortionRelatedBenefit p c






structure TaskForceEstablishmentTimely (tf : TaskForce) (c : ComplaintText) : Prop where
  establishedJointly : TaskForceEstablishedJointly tf c
  byDeadline         : TaskForceEstablishedByDeadline tf c



structure TaskForcePlanSubmissionTimely
    (tf : TaskForce) (rec : TaskForceRecommendations) (c : ComplaintText) : Prop where
  established   : TaskForceEstablishedJointly tf c
  submitted     : TaskForceRecommendationsSubmittedToCongress tf rec c
  withinNinety  : RecommendationsWithinNinetyDays tf rec c


structure PersonnelDetailWithinLimits
    (d : PersonnelDetail) (tf : TaskForce) (c : ComplaintText) : Prop where
  jointlyAgreed : PersonnelDetailAgreedByComponentHeadAndTaskForce d tf c
  withinCap     : DetailWithinThreeYearLimit d c


structure TaskForceAnnualReporting
    (tf : TaskForce) (rep : AnnualReport) (c : ComplaintText) : Prop where
  established : TaskForceEstablishedJointly tf c
  reported    : AnnualReportSubmittedAndMadePublic tf rep c

end Proving.USC.T20.Ch38.Reearn.Procedure
