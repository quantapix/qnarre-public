import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch21CivilRights.Recert.Procedure.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Procedure.Predicates

set_option autoImplicit false












namespace Proving.USC.T42.Ch21CivilRights.Recert.Procedure

open Proving.USC.Common (Person ComplaintText)



structure GuardedTransition (σ : Type) where
  source : σ
  target : σ
  guard  : Prop





def reportWaitingPeriodDays : Nat := 30


def threeJudgeCourtSize : Nat := 3




structure CoveredFederalAssistanceNexus (r : Recipient) (pa : ProgramOrActivity)
    (c : ComplaintText) : Prop where
  receivesAssistance : ReceivesFederalFinancialAssistance r c
  coveredProgram     : IsCoveredProgramOrActivity pa r c






structure EffectiveImplementingRule (a : FederalAgency) (u : AgencyRule)
    (c : ComplaintText) : Prop where
  agencyEmpowered   : AgencyEmpoweredToExtendAssistance a c
  issued            : RuleOfGeneralApplicabilityIssued a u c
  consistent        : RuleConsistentWithAuthorizingStatuteObjectives u c
  presidentApproved : RuleApprovedByPresident u c



structure NoncomplianceFindingOnRecord (r : Recipient) (u : AgencyRule)
    (c : ComplaintText) : Prop where
  hearingOpportunity : OpportunityForHearingAfforded r c
  expressFinding     : ExpressFindingOnRecordOfNoncompliance r u c




structure PriorNoticeAndVoluntaryEffort (a : FederalAgency) (r : Recipient)
    (c : ComplaintText) : Prop where
  advised               : RecipientAdvisedOfFailureToComply a r c
  voluntaryUnobtainable : VoluntaryComplianceDeterminedUnobtainable a r c




def ThirtyDayReportPeriodElapsed (rep : CongressionalReport) (e : EnforcementAction)
    (c : ComplaintText) : Prop :=
  reportWaitingPeriodDays ≤ daysFromReportFilingToActionEffective rep e c



structure CongressionalReportingComplete (a : FederalAgency)
    (rep : CongressionalReport) (e : EnforcementAction) (c : ComplaintText) : Prop where
  reportFiled       : FullWrittenReportFiledWithCommittees a rep e c
  thirtyDaysElapsed : ThirtyDayReportPeriodElapsed rep e c



structure LawfulFundTermination (a : FederalAgency) (r : Recipient)
    (pa : ProgramOrActivity) (u : AgencyRule) (rep : CongressionalReport)
    (e : EnforcementAction) (c : ComplaintText) : Prop where
  effectiveRule      : EffectiveImplementingRule a u c
  nexus              : CoveredFederalAssistanceNexus r pa c
  finding            : NoncomplianceFindingOnRecord r u c
  proviso            : PriorNoticeAndVoluntaryEffort a r c
  limitedToRecipient : TerminationLimitedToFoundRecipient e r c
  limitedToProgram   : TerminationLimitedToFoundProgram e pa c
  reporting          : CongressionalReportingComplete a rep e c




structure LawfulOtherMeansEnforcement (a : FederalAgency) (r : Recipient)
    (pa : ProgramOrActivity) (u : AgencyRule) (c : ComplaintText) : Prop where
  effectiveRule : EffectiveImplementingRule a u c
  nexus         : CoveredFederalAssistanceNexus r pa c
  proviso       : PriorNoticeAndVoluntaryEffort a r c
  otherMeans    : EffectedByOtherMeansAuthorizedByLaw a r c



inductive Section2000d1Enforcement (a : FederalAgency) (r : Recipient)
    (pa : ProgramOrActivity) (u : AgencyRule) (rep : CongressionalReport)
    (e : EnforcementAction) (c : ComplaintText) : Prop

  | byTermination (h : LawfulFundTermination a r pa u rep e c)

  | byOtherMeans (h : LawfulOtherMeansEnforcement a r pa u c)


def adminTransitions (a : FederalAgency) (r : Recipient) (pa : ProgramOrActivity)
    (u : AgencyRule) (rep : CongressionalReport) (e : EnforcementAction)
    (c : ComplaintText) : List (GuardedTransition AdminEnforcementState) :=
  [ { source := .AssistanceExtended, target := .RuleIssued,
      guard := AgencyEmpoweredToExtendAssistance a c
               ∧ RuleOfGeneralApplicabilityIssued a u c
               ∧ RuleConsistentWithAuthorizingStatuteObjectives u c },
    { source := .RuleIssued, target := .RuleEffective,
      guard := RuleApprovedByPresident u c },
    { source := .RuleEffective, target := .NoncomplianceFound,
      guard := NoncomplianceFindingOnRecord r u c },
    { source := .NoncomplianceFound, target := .VoluntaryComplianceExhausted,
      guard := PriorNoticeAndVoluntaryEffort a r c },
    { source := .VoluntaryComplianceExhausted, target := .ReportFiled,
      guard := FullWrittenReportFiledWithCommittees a rep e c },
    { source := .ReportFiled, target := .ActionEffective,
      guard := ThirtyDayReportPeriodElapsed rep e c
               ∧ TerminationLimitedToFoundRecipient e r c
               ∧ TerminationLimitedToFoundProgram e pa c } ]



inductive AdminReachable (a : FederalAgency) (r : Recipient) (pa : ProgramOrActivity)
    (u : AgencyRule) (rep : CongressionalReport) (e : EnforcementAction)
    (c : ComplaintText) : AdminEnforcementState → Prop
  | assistanceExtended (h : CoveredFederalAssistanceNexus r pa c) :
      AdminReachable a r pa u rep e c .AssistanceExtended
  | ruleIssued (prev : AdminReachable a r pa u rep e c .AssistanceExtended)
      (hEmpowered : AgencyEmpoweredToExtendAssistance a c)
      (hIssued : RuleOfGeneralApplicabilityIssued a u c)
      (hConsistent : RuleConsistentWithAuthorizingStatuteObjectives u c) :
      AdminReachable a r pa u rep e c .RuleIssued
  | ruleEffective (prev : AdminReachable a r pa u rep e c .RuleIssued)
      (hApproved : RuleApprovedByPresident u c) :
      AdminReachable a r pa u rep e c .RuleEffective
  | noncomplianceFound (prev : AdminReachable a r pa u rep e c .RuleEffective)
      (hFinding : NoncomplianceFindingOnRecord r u c) :
      AdminReachable a r pa u rep e c .NoncomplianceFound
  | voluntaryExhausted (prev : AdminReachable a r pa u rep e c .NoncomplianceFound)
      (hProviso : PriorNoticeAndVoluntaryEffort a r c) :
      AdminReachable a r pa u rep e c .VoluntaryComplianceExhausted
  | reportFiled (prev : AdminReachable a r pa u rep e c .VoluntaryComplianceExhausted)
      (hReport : FullWrittenReportFiledWithCommittees a rep e c) :
      AdminReachable a r pa u rep e c .ReportFiled
  | actionEffective (prev : AdminReachable a r pa u rep e c .ReportFiled)
      (hThirtyDays : ThirtyDayReportPeriodElapsed rep e c)
      (hRecipientLimit : TerminationLimitedToFoundRecipient e r c)
      (hProgramLimit : TerminationLimitedToFoundProgram e pa c) :
      AdminReachable a r pa u rep e c .ActionEffective




structure ReasonableCausePredicate (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop where
  reasonableCause   : AttorneyGeneralHasReasonableCause act c
  patternOrPractice : PatternOrPracticeOfResistance act c
  intentToDeny      : PatternIntendedToDenyFullExercise act c




structure ProperlyFiledPatternPracticeComplaint (act : AttorneyGeneralAction)
    (d : DistrictCourt) (c : ComplaintText) : Prop where
  cause            : ReasonableCausePredicate act c
  appropriateCourt : FiledInAppropriateDistrictCourt act d c
  signed           : ComplaintSignedByAttorneyGeneral act c
  factsSetForth    : ComplaintSetsForthPatternFacts act c
  reliefRequested  : ComplaintRequestsPreventiveRelief act c





def ThreeJudgePanelProperlyComposed (t : ThreeJudgeCourt) (c : ComplaintText) : Prop :=
  designatedJudgeCount t c = threeJudgeCourtSize
    ∧ 1 ≤ designatedCircuitJudgeCount t c
    ∧ 1 ≤ designatedDistrictJudgesOfInstitutingCourtCount t c


structure ThreeJudgeCourtConvened (act : AttorneyGeneralAction)
    (t : ThreeJudgeCourt) (c : ComplaintText) : Prop where
  requestFiled   : ThreeJudgeRequestFiledWithClerk act c
  certificate    : CertificateOfGeneralPublicImportanceFiled act c
  clerkFurnished : ClerkFurnishedRequestToChiefCircuitJudge act c
  designated     : ChiefCircuitJudgeDesignatedPanel act t c
  composition    : ThreeJudgePanelProperlyComposed t c



structure SingleJudgeByChiefDistrictJudge (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop where
  noRequest  : NoThreeJudgeRequestFiled act c
  designated : ChiefDistrictJudgeDesignatedJudge act c



structure SingleJudgeByChiefCircuitJudge (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop where
  noRequest     : NoThreeJudgeRequestFiled act c
  noneAvailable : NoDistrictJudgeAvailable act c
  certified     : UnavailabilityCertifiedToChiefCircuitJudge act c
  designated    : ChiefCircuitJudgeDesignatedSingleJudge act c



inductive CourtProperlyConstituted (act : AttorneyGeneralAction)
    (t : ThreeJudgeCourt) (c : ComplaintText) : Prop

  | threeJudge (h : ThreeJudgeCourtConvened act t c)

  | singleJudgeDistrictDesignation (h : SingleJudgeByChiefDistrictJudge act c)


  | singleJudgeCircuitDesignation (h : SingleJudgeByChiefCircuitJudge act c)



structure ExpeditedHearingDuty (act : AttorneyGeneralAction)
    (c : ComplaintText) : Prop where
  earliestPracticable : CaseAssignedAtEarliestPracticableDate act c
  expedited           : CaseExpedited act c



structure DirectSupremeCourtAppeal (act : AttorneyGeneralAction)
    (t : ThreeJudgeCourt) (c : ComplaintText) : Prop where
  threeJudgeCourt : ThreeJudgeCourtConvened act t c
  finalJudgment   : FinalJudgmentEntered act c
  appealTaken     : AppealTakenToSupremeCourt act c



structure Section2000a5Proceeding (act : AttorneyGeneralAction) (d : DistrictCourt)
    (t : ThreeJudgeCourt) (c : ComplaintText) : Prop where
  filed       : ProperlyFiledPatternPracticeComplaint act d c
  constituted : CourtProperlyConstituted act t c
  expedition  : ExpeditedHearingDuty act c


def patternPracticeTransitions (act : AttorneyGeneralAction) (d : DistrictCourt)
    (t : ThreeJudgeCourt) (c : ComplaintText) :
    List (GuardedTransition PatternPracticeState) :=
  [ { source := .ReasonableCauseFormed, target := .ComplaintFiled,
      guard := ProperlyFiledPatternPracticeComplaint act d c },
    { source := .ComplaintFiled, target := .CourtConstituted,
      guard := CourtProperlyConstituted act t c },
    { source := .CourtConstituted, target := .HeardAndDetermined,
      guard := ExpeditedHearingDuty act c },
    { source := .HeardAndDetermined, target := .AppealedToSupremeCourt,
      guard := DirectSupremeCourtAppeal act t c } ]


inductive PatternPracticeReachable (act : AttorneyGeneralAction) (d : DistrictCourt)
    (t : ThreeJudgeCourt) (c : ComplaintText) : PatternPracticeState → Prop
  | reasonableCauseFormed (h : ReasonableCausePredicate act c) :
      PatternPracticeReachable act d t c .ReasonableCauseFormed
  | complaintFiled (prev : PatternPracticeReachable act d t c .ReasonableCauseFormed)
      (h : ProperlyFiledPatternPracticeComplaint act d c) :
      PatternPracticeReachable act d t c .ComplaintFiled
  | courtConstituted (prev : PatternPracticeReachable act d t c .ComplaintFiled)
      (h : CourtProperlyConstituted act t c) :
      PatternPracticeReachable act d t c .CourtConstituted
  | heardAndDetermined (prev : PatternPracticeReachable act d t c .CourtConstituted)
      (h : ExpeditedHearingDuty act c) :
      PatternPracticeReachable act d t c .HeardAndDetermined
  | appealedToSupremeCourt (prev : PatternPracticeReachable act d t c .HeardAndDetermined)
      (h : DirectSupremeCourtAppeal act t c) :
      PatternPracticeReachable act d t c .AppealedToSupremeCourt






def TestimonyReleasePermitted (ref : ServiceReferral) (c : ComplaintText) : Prop :=
  AllPartiesAgreedToRelease ref c ∧ CourtPermittedRelease ref c




def ExecutiveSessionConfidentialityObserved (ref : ServiceReferral)
    (c : ComplaintText) : Prop :=
  ¬ TestimonyReleased ref c ∨ TestimonyReleasePermitted ref c



structure ServiceHearingsPhase (ref : ServiceReferral) (c : ComplaintText) : Prop where
  hearingsHeld     : HearingsHeldOnReferredComplaint ref c
  executiveSession : HearingsConductedInExecutiveSession ref c
  confidentiality  : ExecutiveSessionConfidentialityObserved ref c





structure Section2000a4ServiceProcess (ref : ServiceReferral)
    (c : ComplaintText) : Prop where
  referred             : ComplaintReferredByCourtToService ref c
  investigated         : FullInvestigationMade ref c
  confidentiality      : ExecutiveSessionConfidentialityObserved ref c
  settlementEndeavored : VoluntarySettlementEndeavored ref c


def serviceReferralTransitions (ref : ServiceReferral) (c : ComplaintText) :
    List (GuardedTransition ServiceReferralState) :=
  [ { source := .ReferredByCourt, target := .InvestigationComplete,
      guard := FullInvestigationMade ref c },
    { source := .InvestigationComplete, target := .HearingsHeld,
      guard := ServiceHearingsPhase ref c },
    { source := .HearingsHeld, target := .SettlementEndeavored,
      guard := VoluntarySettlementEndeavored ref c } ]


inductive ServiceReferralReachable (ref : ServiceReferral) (c : ComplaintText) :
    ServiceReferralState → Prop
  | referredByCourt (h : ComplaintReferredByCourtToService ref c) :
      ServiceReferralReachable ref c .ReferredByCourt
  | investigationComplete (prev : ServiceReferralReachable ref c .ReferredByCourt)
      (h : FullInvestigationMade ref c) :
      ServiceReferralReachable ref c .InvestigationComplete
  | hearingsHeld (prev : ServiceReferralReachable ref c .InvestigationComplete)
      (h : ServiceHearingsPhase ref c) :
      ServiceReferralReachable ref c .HearingsHeld
  | settlementEndeavored (prev : ServiceReferralReachable ref c .InvestigationComplete)
      (h : VoluntarySettlementEndeavored ref c)
      (hConfidential : ExecutiveSessionConfidentialityObserved ref c) :
      ServiceReferralReachable ref c .SettlementEndeavored






def ViolationPostdatesEqualizationCutoff (s : StateDefendant) (c : ComplaintText) : Prop :=
  0 < daysFromOctober211986ToLatestViolationConduct s c



structure EleventhAmendmentAbrogation (p : Person) (s : StateDefendant)
    (c : ComplaintText) : Prop where
  federalSuit      : SuitAgainstStateInFederalCourt p s c
  coveredViolation : ViolationOfCoveredFundingStatute s c
  postdatesCutoff  : ViolationPostdatesEqualizationCutoff s c




def RemediesEqualizedAgainstState (p : Person) (s : StateDefendant)
    (c : ComplaintText) : Prop :=
  EleventhAmendmentAbrogation p s c

end Proving.USC.T42.Ch21CivilRights.Recert.Procedure
