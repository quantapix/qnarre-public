import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch21CivilRights.Recert.Procedure.Types
import Proving.USC.T42.Ch21CivilRights.Recert.Procedure.Predicates
import Proving.USC.T42.Ch21CivilRights.Recert.Procedure.Statute

set_option autoImplicit false










namespace Proving.USC.T42.Ch21CivilRights.Recert.Procedure

open Proving.USC.Common (Person ComplaintText)



theorem coveredFederalAssistanceNexus_intro
    (r : Recipient) (pa : ProgramOrActivity) (c : ComplaintText)
    (hAssistance : ReceivesFederalFinancialAssistance r c)
    (hProgram : IsCoveredProgramOrActivity pa r c) :
    CoveredFederalAssistanceNexus r pa c :=
  ⟨hAssistance, hProgram⟩



theorem effectiveImplementingRule_intro
    (a : FederalAgency) (u : AgencyRule) (c : ComplaintText)
    (hEmpowered : AgencyEmpoweredToExtendAssistance a c)
    (hIssued : RuleOfGeneralApplicabilityIssued a u c)
    (hConsistent : RuleConsistentWithAuthorizingStatuteObjectives u c)
    (hApproved : RuleApprovedByPresident u c) :
    EffectiveImplementingRule a u c :=
  ⟨hEmpowered, hIssued, hConsistent, hApproved⟩

theorem noncomplianceFindingOnRecord_intro
    (r : Recipient) (u : AgencyRule) (c : ComplaintText)
    (hHearing : OpportunityForHearingAfforded r c)
    (hFinding : ExpressFindingOnRecordOfNoncompliance r u c) :
    NoncomplianceFindingOnRecord r u c :=
  ⟨hHearing, hFinding⟩

theorem priorNoticeAndVoluntaryEffort_intro
    (a : FederalAgency) (r : Recipient) (c : ComplaintText)
    (hAdvised : RecipientAdvisedOfFailureToComply a r c)
    (hVoluntary : VoluntaryComplianceDeterminedUnobtainable a r c) :
    PriorNoticeAndVoluntaryEffort a r c :=
  ⟨hAdvised, hVoluntary⟩



theorem thirtyDayReportPeriodElapsed_of_days
    (rep : CongressionalReport) (e : EnforcementAction) (c : ComplaintText) (n : Nat)
    (hDays : daysFromReportFilingToActionEffective rep e c = n)
    (hElapsed : 30 ≤ n) :
    ThirtyDayReportPeriodElapsed rep e c := by
  unfold ThirtyDayReportPeriodElapsed reportWaitingPeriodDays
  omega

theorem congressionalReportingComplete_intro
    (a : FederalAgency) (rep : CongressionalReport) (e : EnforcementAction)
    (c : ComplaintText)
    (hReport : FullWrittenReportFiledWithCommittees a rep e c)
    (hThirty : ThirtyDayReportPeriodElapsed rep e c) :
    CongressionalReportingComplete a rep e c :=
  ⟨hReport, hThirty⟩

theorem lawfulFundTermination_intro
    (a : FederalAgency) (r : Recipient) (pa : ProgramOrActivity) (u : AgencyRule)
    (rep : CongressionalReport) (e : EnforcementAction) (c : ComplaintText)
    (hRule : EffectiveImplementingRule a u c)
    (hNexus : CoveredFederalAssistanceNexus r pa c)
    (hFinding : NoncomplianceFindingOnRecord r u c)
    (hProviso : PriorNoticeAndVoluntaryEffort a r c)
    (hRecipientLimit : TerminationLimitedToFoundRecipient e r c)
    (hProgramLimit : TerminationLimitedToFoundProgram e pa c)
    (hReporting : CongressionalReportingComplete a rep e c) :
    LawfulFundTermination a r pa u rep e c :=
  ⟨hRule, hNexus, hFinding, hProviso, hRecipientLimit, hProgramLimit, hReporting⟩

theorem lawfulOtherMeansEnforcement_intro
    (a : FederalAgency) (r : Recipient) (pa : ProgramOrActivity) (u : AgencyRule)
    (c : ComplaintText)
    (hRule : EffectiveImplementingRule a u c)
    (hNexus : CoveredFederalAssistanceNexus r pa c)
    (hProviso : PriorNoticeAndVoluntaryEffort a r c)
    (hOther : EffectedByOtherMeansAuthorizedByLaw a r c) :
    LawfulOtherMeansEnforcement a r pa u c :=
  ⟨hRule, hNexus, hProviso, hOther⟩

theorem section2000d1Enforcement_byTermination_intro
    (a : FederalAgency) (r : Recipient) (pa : ProgramOrActivity) (u : AgencyRule)
    (rep : CongressionalReport) (e : EnforcementAction) (c : ComplaintText)
    (h : LawfulFundTermination a r pa u rep e c) :
    Section2000d1Enforcement a r pa u rep e c :=
  .byTermination h

theorem section2000d1Enforcement_byOtherMeans_intro
    (a : FederalAgency) (r : Recipient) (pa : ProgramOrActivity) (u : AgencyRule)
    (rep : CongressionalReport) (e : EnforcementAction) (c : ComplaintText)
    (h : LawfulOtherMeansEnforcement a r pa u c) :
    Section2000d1Enforcement a r pa u rep e c :=
  .byOtherMeans h



theorem adminReachable_actionEffective_intro
    (a : FederalAgency) (r : Recipient) (pa : ProgramOrActivity) (u : AgencyRule)
    (rep : CongressionalReport) (e : EnforcementAction) (c : ComplaintText)
    (hNexus : CoveredFederalAssistanceNexus r pa c)
    (hEmpowered : AgencyEmpoweredToExtendAssistance a c)
    (hIssued : RuleOfGeneralApplicabilityIssued a u c)
    (hConsistent : RuleConsistentWithAuthorizingStatuteObjectives u c)
    (hApproved : RuleApprovedByPresident u c)
    (hFinding : NoncomplianceFindingOnRecord r u c)
    (hProviso : PriorNoticeAndVoluntaryEffort a r c)
    (hReport : FullWrittenReportFiledWithCommittees a rep e c)
    (hThirty : ThirtyDayReportPeriodElapsed rep e c)
    (hRecipientLimit : TerminationLimitedToFoundRecipient e r c)
    (hProgramLimit : TerminationLimitedToFoundProgram e pa c) :
    AdminReachable a r pa u rep e c .ActionEffective :=
  .actionEffective
    (.reportFiled
      (.voluntaryExhausted
        (.noncomplianceFound
          (.ruleEffective
            (.ruleIssued (.assistanceExtended hNexus) hEmpowered hIssued hConsistent)
            hApproved)
          hFinding)
        hProviso)
      hReport)
    hThirty hRecipientLimit hProgramLimit



theorem reasonableCausePredicate_intro
    (act : AttorneyGeneralAction) (c : ComplaintText)
    (hCause : AttorneyGeneralHasReasonableCause act c)
    (hPattern : PatternOrPracticeOfResistance act c)
    (hIntent : PatternIntendedToDenyFullExercise act c) :
    ReasonableCausePredicate act c :=
  ⟨hCause, hPattern, hIntent⟩

theorem properlyFiledPatternPracticeComplaint_intro
    (act : AttorneyGeneralAction) (d : DistrictCourt) (c : ComplaintText)
    (hCause : ReasonableCausePredicate act c)
    (hCourt : FiledInAppropriateDistrictCourt act d c)
    (hSigned : ComplaintSignedByAttorneyGeneral act c)
    (hFacts : ComplaintSetsForthPatternFacts act c)
    (hRelief : ComplaintRequestsPreventiveRelief act c) :
    ProperlyFiledPatternPracticeComplaint act d c :=
  ⟨hCause, hCourt, hSigned, hFacts, hRelief⟩



theorem threeJudgePanelProperlyComposed_of_counts
    (t : ThreeJudgeCourt) (c : ComplaintText)
    (hTotal : designatedJudgeCount t c = 3)
    (hCircuit : 0 < designatedCircuitJudgeCount t c)
    (hDistrict : 0 < designatedDistrictJudgesOfInstitutingCourtCount t c) :
    ThreeJudgePanelProperlyComposed t c := by
  unfold ThreeJudgePanelProperlyComposed threeJudgeCourtSize
  omega

theorem threeJudgeCourtConvened_intro
    (act : AttorneyGeneralAction) (t : ThreeJudgeCourt) (c : ComplaintText)
    (hRequest : ThreeJudgeRequestFiledWithClerk act c)
    (hCertificate : CertificateOfGeneralPublicImportanceFiled act c)
    (hClerk : ClerkFurnishedRequestToChiefCircuitJudge act c)
    (hDesignated : ChiefCircuitJudgeDesignatedPanel act t c)
    (hComposition : ThreeJudgePanelProperlyComposed t c) :
    ThreeJudgeCourtConvened act t c :=
  ⟨hRequest, hCertificate, hClerk, hDesignated, hComposition⟩

theorem singleJudgeByChiefDistrictJudge_intro
    (act : AttorneyGeneralAction) (c : ComplaintText)
    (hNoRequest : NoThreeJudgeRequestFiled act c)
    (hDesignated : ChiefDistrictJudgeDesignatedJudge act c) :
    SingleJudgeByChiefDistrictJudge act c :=
  ⟨hNoRequest, hDesignated⟩

theorem singleJudgeByChiefCircuitJudge_intro
    (act : AttorneyGeneralAction) (c : ComplaintText)
    (hNoRequest : NoThreeJudgeRequestFiled act c)
    (hNoneAvailable : NoDistrictJudgeAvailable act c)
    (hCertified : UnavailabilityCertifiedToChiefCircuitJudge act c)
    (hDesignated : ChiefCircuitJudgeDesignatedSingleJudge act c) :
    SingleJudgeByChiefCircuitJudge act c :=
  ⟨hNoRequest, hNoneAvailable, hCertified, hDesignated⟩

theorem courtProperlyConstituted_threeJudge_intro
    (act : AttorneyGeneralAction) (t : ThreeJudgeCourt) (c : ComplaintText)
    (h : ThreeJudgeCourtConvened act t c) :
    CourtProperlyConstituted act t c :=
  .threeJudge h

theorem courtProperlyConstituted_districtDesignation_intro
    (act : AttorneyGeneralAction) (t : ThreeJudgeCourt) (c : ComplaintText)
    (h : SingleJudgeByChiefDistrictJudge act c) :
    CourtProperlyConstituted act t c :=
  .singleJudgeDistrictDesignation h

theorem courtProperlyConstituted_circuitDesignation_intro
    (act : AttorneyGeneralAction) (t : ThreeJudgeCourt) (c : ComplaintText)
    (h : SingleJudgeByChiefCircuitJudge act c) :
    CourtProperlyConstituted act t c :=
  .singleJudgeCircuitDesignation h

theorem expeditedHearingDuty_intro
    (act : AttorneyGeneralAction) (c : ComplaintText)
    (hEarliest : CaseAssignedAtEarliestPracticableDate act c)
    (hExpedited : CaseExpedited act c) :
    ExpeditedHearingDuty act c :=
  ⟨hEarliest, hExpedited⟩

theorem directSupremeCourtAppeal_intro
    (act : AttorneyGeneralAction) (t : ThreeJudgeCourt) (c : ComplaintText)
    (hPanel : ThreeJudgeCourtConvened act t c)
    (hJudgment : FinalJudgmentEntered act c)
    (hAppeal : AppealTakenToSupremeCourt act c) :
    DirectSupremeCourtAppeal act t c :=
  ⟨hPanel, hJudgment, hAppeal⟩

theorem section2000a5Proceeding_intro
    (act : AttorneyGeneralAction) (d : DistrictCourt) (t : ThreeJudgeCourt)
    (c : ComplaintText)
    (hFiled : ProperlyFiledPatternPracticeComplaint act d c)
    (hConstituted : CourtProperlyConstituted act t c)
    (hExpedition : ExpeditedHearingDuty act c) :
    Section2000a5Proceeding act d t c :=
  ⟨hFiled, hConstituted, hExpedition⟩

theorem patternPracticeReachable_heardAndDetermined_intro
    (act : AttorneyGeneralAction) (d : DistrictCourt) (t : ThreeJudgeCourt)
    (c : ComplaintText)
    (hCause : ReasonableCausePredicate act c)
    (hFiled : ProperlyFiledPatternPracticeComplaint act d c)
    (hConstituted : CourtProperlyConstituted act t c)
    (hExpedition : ExpeditedHearingDuty act c) :
    PatternPracticeReachable act d t c .HeardAndDetermined :=
  .heardAndDetermined
    (.courtConstituted (.complaintFiled (.reasonableCauseFormed hCause) hFiled) hConstituted)
    hExpedition

theorem patternPracticeReachable_appealedToSupremeCourt_intro
    (act : AttorneyGeneralAction) (d : DistrictCourt) (t : ThreeJudgeCourt)
    (c : ComplaintText)
    (hHeard : PatternPracticeReachable act d t c .HeardAndDetermined)
    (hAppeal : DirectSupremeCourtAppeal act t c) :
    PatternPracticeReachable act d t c .AppealedToSupremeCourt :=
  .appealedToSupremeCourt hHeard hAppeal



theorem testimonyReleasePermitted_intro
    (ref : ServiceReferral) (c : ComplaintText)
    (hAgreed : AllPartiesAgreedToRelease ref c)
    (hCourt : CourtPermittedRelease ref c) :
    TestimonyReleasePermitted ref c :=
  ⟨hAgreed, hCourt⟩



theorem executiveSessionConfidentialityObserved_ofNoRelease
    (ref : ServiceReferral) (c : ComplaintText)
    (hNoRelease : ¬ TestimonyReleased ref c) :
    ExecutiveSessionConfidentialityObserved ref c :=
  Or.inl hNoRelease



theorem executiveSessionConfidentialityObserved_ofPermittedRelease
    (ref : ServiceReferral) (c : ComplaintText)
    (hPermitted : TestimonyReleasePermitted ref c) :
    ExecutiveSessionConfidentialityObserved ref c :=
  Or.inr hPermitted

theorem serviceHearingsPhase_intro
    (ref : ServiceReferral) (c : ComplaintText)
    (hHeld : HearingsHeldOnReferredComplaint ref c)
    (hExecutive : HearingsConductedInExecutiveSession ref c)
    (hConfidential : ExecutiveSessionConfidentialityObserved ref c) :
    ServiceHearingsPhase ref c :=
  ⟨hHeld, hExecutive, hConfidential⟩

theorem section2000a4ServiceProcess_intro
    (ref : ServiceReferral) (c : ComplaintText)
    (hReferred : ComplaintReferredByCourtToService ref c)
    (hInvestigated : FullInvestigationMade ref c)
    (hConfidential : ExecutiveSessionConfidentialityObserved ref c)
    (hSettlement : VoluntarySettlementEndeavored ref c) :
    Section2000a4ServiceProcess ref c :=
  ⟨hReferred, hInvestigated, hConfidential, hSettlement⟩

theorem serviceReferralReachable_settlementEndeavored_intro
    (ref : ServiceReferral) (c : ComplaintText)
    (hReferred : ComplaintReferredByCourtToService ref c)
    (hInvestigated : FullInvestigationMade ref c)
    (hSettlement : VoluntarySettlementEndeavored ref c)
    (hConfidential : ExecutiveSessionConfidentialityObserved ref c) :
    ServiceReferralReachable ref c .SettlementEndeavored :=
  .settlementEndeavored
    (.investigationComplete (.referredByCourt hReferred) hInvestigated)
    hSettlement hConfidential





theorem violationPostdatesEqualizationCutoff_of_days
    (s : StateDefendant) (c : ComplaintText) (d : Int)
    (hDays : daysFromOctober211986ToLatestViolationConduct s c = d)
    (hAfter : 0 < d) :
    ViolationPostdatesEqualizationCutoff s c := by
  unfold ViolationPostdatesEqualizationCutoff
  omega

theorem eleventhAmendmentAbrogation_intro
    (p : Person) (s : StateDefendant) (c : ComplaintText)
    (hSuit : SuitAgainstStateInFederalCourt p s c)
    (hViolation : ViolationOfCoveredFundingStatute s c)
    (hCutoff : ViolationPostdatesEqualizationCutoff s c) :
    EleventhAmendmentAbrogation p s c :=
  ⟨hSuit, hViolation, hCutoff⟩

theorem remediesEqualizedAgainstState_intro
    (p : Person) (s : StateDefendant) (c : ComplaintText)
    (h : EleventhAmendmentAbrogation p s c) :
    RemediesEqualizedAgainstState p s c :=
  h

end Proving.USC.T42.Ch21CivilRights.Recert.Procedure
