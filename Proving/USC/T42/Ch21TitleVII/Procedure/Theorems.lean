import Proving.USC.T42.Ch21TitleVII.Procedure.Statute













set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Procedure

open Proving.USC.Common



theorem chargeFiledWithinBaseWindow_intro {c : ComplaintText}
    (hNotBefore : PracticeOccurrenceDay c ≤ ChargeFilingDay c)
    (hWithin : ChargeFilingDay c ≤ PracticeOccurrenceDay c + 180) :
    ChargeFiledWithinBaseWindow c :=
  ⟨hNotBefore, hWithin⟩

theorem chargeFiledWithinDeferralDeadline_intro {c : ComplaintText}
    (hNotBefore : PracticeOccurrenceDay c ≤ ChargeFilingDay c)
    (hWithin : ChargeFilingDay c ≤ DeferralFilingDeadlineDay c) :
    ChargeFiledWithinDeferralDeadline c :=
  ⟨hNotBefore, hWithin⟩

theorem noticeOfChargeServedTimely_intro {c : ComplaintText}
    (hNotBefore : ChargeFilingDay c ≤ ChargeServiceDay c)
    (hWithin : ChargeServiceDay c ≤ ChargeFilingDay c + 10) :
    NoticeOfChargeServedTimely c :=
  ⟨hNotBefore, hWithin⟩

theorem sixtyDayDeferralElapsed_intro {c : ComplaintText}
    (h : StateProceedingCommencementDay c + 60 ≤ ChargeFilingDay c) :
    SixtyDayDeferralElapsed c :=
  h

theorem stateDeferralSatisfied_ofElapsed {c : ComplaintText}
    (h : SixtyDayDeferralElapsed c) : StateDeferralSatisfied c :=
  Or.inl h

theorem stateDeferralSatisfied_ofTermination {c : ComplaintText}
    (h : StateProceedingTerminated c) : StateDeferralSatisfied c :=
  Or.inr h

theorem suitFiledWithinNinetyDays_intro {c : ComplaintText}
    (hNotBefore : RightToSueNoticeDay c ≤ CivilActionFilingDay c)
    (hWithin : CivilActionFilingDay c ≤ RightToSueNoticeDay c + 90) :
    SuitFiledWithinNinetyDays c :=
  ⟨hNotBefore, hWithin⟩

theorem commissionInactionPeriodElapsed_intro {c : ComplaintText}
    (h : max (ChargeFilingDay c) (PeriodOfReferenceExpiryDay c) + 180
      ≤ RightToSueNoticeDay c) :
    CommissionInactionPeriodElapsed c :=
  h

theorem commissionSuitAfterThirtyDays_intro {c : ComplaintText}
    (h : max (ChargeFilingDay c) (PeriodOfReferenceExpiryDay c) + 30
      ≤ CommissionCivilActionFilingDay c) :
    CommissionSuitAfterThirtyDays c :=
  h

theorem backPayClaimWithinTwoYears_intro {c : ComplaintText}
    (h : BackPayAccrualFloorDay c ≤ BackPayClaimEarliestDay c) :
    BackPayClaimWithinTwoYears c :=
  h

theorem federalSuitWithinNinetyDaysOfFinalAction_intro {c : ComplaintText}
    (hNotBefore : FinalAgencyActionNoticeDay c ≤ CivilActionFilingDay c)
    (hWithin : CivilActionFilingDay c ≤ FinalAgencyActionNoticeDay c + 90) :
    FederalSuitWithinNinetyDaysOfFinalAction c :=
  ⟨hNotBefore, hWithin⟩

theorem federalOneHundredEightyDaysElapsed_intro {c : ComplaintText}
    (h : InitialAgencyComplaintFilingDay c + 180 ≤ CivilActionFilingDay c) :
    FederalOneHundredEightyDaysElapsed c :=
  h

theorem geraComplaintWithinOneHundredEightyDays_intro {c : ComplaintText}
    (hNotBefore : GeraViolationDay c ≤ GeraComplaintFilingDay c)
    (hWithin : GeraComplaintFilingDay c ≤ GeraViolationDay c + 180) :
    GeraComplaintWithinOneHundredEightyDays c :=
  ⟨hNotBefore, hWithin⟩

theorem planAcceptedWithinTwelveMonths_intro {c : ComplaintText}
    (hNotBefore : ComplianceAgencyAcceptanceDay c ≤ ContractActionDay c)
    (hWithin : ContractActionDay c ≤ ComplianceAgencyAcceptanceDay c + 365) :
    PlanAcceptedWithinTwelveMonths c :=
  ⟨hNotBefore, hWithin⟩

theorem planDeemedAccepted_intro {a : AffirmativeActionPlan} {c : ComplaintText}
    (h : ¬ (OfccpDisapprovedPlan a c ∧
      OfccpDisapprovalDay c ≤ ComplianceAgencyAcceptanceDay c + 45)) :
    PlanDeemedAccepted a c :=
  h

theorem meetsEmployerWeekThreshold_intro {c : ComplaintText}
    (h : 20 ≤ EmployerQualifyingWeeks c) : MeetsEmployerWeekThreshold c :=
  h



theorem coveredRespondent_intro {r : Respondent} {c : ComplaintText}
    (hCommerce : EmployerEngagedInIndustryAffectingCommerce r c)
    (hWeeks : MeetsEmployerWeekThreshold c)
    (hNotExempt : ¬ SubchapterExemptionApplies r c) :
    CoveredRespondent r c :=
  ⟨hCommerce, hWeeks, hNotExempt⟩

theorem venueProper_ofCommission {p : Person} {r : Respondent}
    {d : JudicialDistrict} {c : ComplaintText}
    (h : PracticeCommittedInDistrict d c) : VenueProper p r d c :=
  Or.inl h

theorem venueProper_ofRecords {p : Person} {r : Respondent}
    {d : JudicialDistrict} {c : ComplaintText}
    (h : EmploymentRecordsMaintainedInDistrict d c) : VenueProper p r d c :=
  Or.inr (Or.inl h)

theorem venueProper_ofCounterfactualWorkplace {p : Person} {r : Respondent}
    {d : JudicialDistrict} {c : ComplaintText}
    (h : AggrievedWouldHaveWorkedInDistrict p d c) : VenueProper p r d c :=
  Or.inr (Or.inr (Or.inl h))

theorem venueProper_ofPrincipalOffice {p : Person} {r : Respondent}
    {d : JudicialDistrict} {c : ComplaintText}
    (hNotFound : RespondentNotFoundInStatutoryDistrict r c)
    (hOffice : RespondentPrincipalOfficeInDistrict r d c) : VenueProper p r d c :=
  Or.inr (Or.inr (Or.inr ⟨hNotFound, hOffice⟩))



theorem validChargeForm_intro {p : Person} {c : ComplaintText}
    (hWriting : ChargeInWritingUnderOath c)
    (hFiler : ChargeFiledByAggrievedOrCommissioner p c) :
    ValidChargeForm p c :=
  ⟨hWriting, hFiler⟩

theorem timelyChargeNonDeferral_intro {p : Person} {c : ComplaintText}
    (hForm : ValidChargeForm p c)
    (hNotDeferral : ¬ DeferralJurisdiction c)
    (hWindow : ChargeFiledWithinBaseWindow c) :
    TimelyChargeNonDeferral p c :=
  ⟨hForm, hNotDeferral, hWindow⟩

theorem timelyChargeDeferral_intro {p : Person} {c : ComplaintText}
    (hForm : ValidChargeForm p c)
    (hDeferral : DeferralJurisdiction c)
    (hCommenced : StateProceedingCommenced c)
    (hSatisfied : StateDeferralSatisfied c)
    (hWindow : ChargeFiledWithinDeferralDeadline c) :
    TimelyChargeDeferral p c :=
  ⟨hForm, hDeferral, hCommenced, hSatisfied, hWindow⟩

theorem timelyCharge_intro_nonDeferral {p : Person} {c : ComplaintText}
    (h : TimelyChargeNonDeferral p c) : TimelyCharge p c :=
  TimelyCharge.nonDeferral h

theorem timelyCharge_intro_deferral {p : Person} {c : ComplaintText}
    (h : TimelyChargeDeferral p c) : TimelyCharge p c :=
  TimelyCharge.deferral h

theorem commissionProcessing_intro {c : ComplaintText}
    (hServed : CommissionServedNoticeOfCharge c)
    (hTimely : NoticeOfChargeServedTimely c)
    (hInvestigated : CommissionInvestigatedCharge c) :
    CommissionProcessing c :=
  ⟨hServed, hTimely, hInvestigated⟩

theorem conciliationExhausted_intro {c : ComplaintText}
    (hCause : ReasonableCauseDetermined c)
    (hEndeavored : ConciliationEndeavored c)
    (hNoAgreement : ¬ ConciliationAgreementSecured c) :
    ConciliationExhausted c :=
  ⟨hCause, hEndeavored, hNoAgreement⟩

theorem administrativeExhaustion_intro {p : Person} {c : ComplaintText}
    (hCharge : TimelyCharge p c)
    (hProcessing : CommissionProcessing c)
    (hTerminated : ChargeDismissedForNoReasonableCause c ∨ ConciliationExhausted c)
    (hRightToSue : RightToSueNoticeGiven c) :
    AdministrativeExhaustion p c :=
  ⟨hCharge, hProcessing, hTerminated, hRightToSue⟩

theorem timelyPrivateCivilAction_intro {p : Person} {r : Respondent}
    {d : JudicialDistrict} {c : ComplaintText}
    (hCovered : CoveredRespondent r c)
    (hExhausted : AdministrativeExhaustion p c)
    (hPlaintiff : PlaintiffIsAggrievedOrChargingParty p c)
    (hNamed : CivilActionAgainstNamedRespondent c)
    (hNinety : SuitFiledWithinNinetyDays c)
    (hVenue : VenueProper p r d c) :
    TimelyPrivateCivilAction p r d c :=
  ⟨hCovered, hExhausted, hPlaintiff, hNamed, hNinety, hVenue⟩

theorem commissionCivilAction_intro {c : ComplaintText}
    (hCharge : ConciliationExhausted c)
    (hRipe : CommissionSuitAfterThirtyDays c) :
    CommissionCivilAction c :=
  ⟨hCharge, hRipe⟩

theorem attorneyGeneralReferral_intro {r : Respondent} {c : ComplaintText}
    (hGovernmental : RespondentIsGovernmentEntity r c)
    (hNoAgreement : ¬ ConciliationAgreementSecured c)
    (hReferred : AttorneyGeneralReferralMade c) :
    AttorneyGeneralReferral r c :=
  ⟨hGovernmental, hNoAgreement, hReferred⟩

theorem preliminaryReliefProceeding_intro {c : ComplaintText}
    (hNecessary : PromptJudicialActionNecessary c)
    (hBrought : PreliminaryReliefActionBrought c) :
    PreliminaryReliefProceeding c :=
  ⟨hNecessary, hBrought⟩



theorem timelyFederalSectorCivilAction_intro {p : Person} {r : Respondent}
    {d : JudicialDistrict} {c : ComplaintText}
    (hCovered : CoveredFederalPersonnelAction c)
    (hAggrieved : AggrievedByFinalDisposition p c)
    (hDefendant : AgencyHeadNamedAsDefendant c)
    (hRipe : (FederalAgencyFinalActionTaken c ∧
        FederalSuitWithinNinetyDaysOfFinalAction c)
      ∨ FederalOneHundredEightyDaysElapsed c)
    (hVenue : VenueProper p r d c) :
    TimelyFederalSectorCivilAction p r d c :=
  ⟨hCovered, hAggrieved, hDefendant, hRipe, hVenue⟩



theorem timelyGeraComplaint_intro {p : Person} {c : ComplaintText}
    (hCovered : GeraCoveredEmployee p c)
    (hFiled : GeraComplaintFiledWithCommission c)
    (hWindow : GeraComplaintWithinOneHundredEightyDays c) :
    TimelyGeraComplaint p c :=
  ⟨hCovered, hFiled, hWindow⟩

theorem geraJudicialReview_intro {p : Person} {c : ComplaintText}
    (hComplaint : TimelyGeraComplaint p c)
    (hApa : GeraApaProceduresFollowed c)
    (hOrder : GeraFinalOrderIssued c)
    (hPetition : GeraPetitionForReviewFiled c) :
    GeraJudicialReview p c :=
  ⟨hComplaint, hApa, hOrder, hPetition⟩

theorem geraSetAsideGround_intro_arbitrary {c : ComplaintText}
    (h : GeraOrderArbitraryOrCapricious c) : GeraSetAsideGround c :=
  GeraSetAsideGround.arbitrary h

theorem geraSetAsideGround_intro_procedural {c : ComplaintText}
    (h : GeraOrderProcedurallyDefective c) : GeraSetAsideGround c :=
  GeraSetAsideGround.procedural h

theorem geraSetAsideGround_intro_unsupported {c : ComplaintText}
    (h : GeraOrderUnsupportedBySubstantialEvidence c) : GeraSetAsideGround c :=
  GeraSetAsideGround.unsupported h



theorem patternOrPracticeAction_intro {c : ComplaintText}
    (hCause : AttorneyGeneralReasonableCauseBelief c)
    (hSigned : PatternOrPracticeComplaintSigned c)
    (hFacts : PatternOrPracticeFactsSetForth c)
    (hRelief : PatternOrPracticeReliefRequested c) :
    PatternOrPracticeAction c :=
  ⟨hCause, hSigned, hFacts, hRelief⟩

theorem threeJudgeCourtConvened_intro {c : ComplaintText}
    (hAction : PatternOrPracticeAction c)
    (hRequested : ThreeJudgeCourtRequested c)
    (hCertified : GeneralPublicImportanceCertified c) :
    ThreeJudgeCourtConvened c :=
  ⟨hAction, hRequested, hCertified⟩



theorem challengePrecludedByNotice_intro {p : Person} {j : Judgment}
    {c : ComplaintText}
    (hScope : PracticeImplementsConsentJudgment j c)
    (hNotice : ActualNoticeOfProposedJudgment p j c)
    (hOpportunity : ReasonableOpportunityToObject p j c)
    (hNotCarvedOut : ¬ PartyOrClassMemberInPriorAction p j c) :
    ChallengePrecludedByNotice p j c :=
  ⟨hScope, hNotice, hOpportunity, hNotCarvedOut⟩

theorem challengePrecludedByRepresentation_intro {p : Person} {j : Judgment}
    {c : ComplaintText}
    (hScope : PracticeImplementsConsentJudgment j c)
    (hRepresented : InterestsAdequatelyRepresented p j c)
    (hNoIntervening : ¬ InterveningChangeInLawOrFact j c)
    (hNotCarvedOut : ¬ PartyOrClassMemberInPriorAction p j c) :
    ChallengePrecludedByRepresentation p j c :=
  ⟨hScope, hRepresented, hNoIntervening, hNotCarvedOut⟩

theorem challengePrecluded_intro_byNotice {p : Person} {j : Judgment}
    {c : ComplaintText} (h : ChallengePrecludedByNotice p j c) :
    ChallengePrecluded p j c :=
  ChallengePrecluded.byNotice h

theorem challengePrecluded_intro_byRepresentation {p : Person} {j : Judgment}
    {c : ComplaintText} (h : ChallengePrecludedByRepresentation p j c) :
    ChallengePrecluded p j c :=
  ChallengePrecluded.byRepresentation h



theorem goodFaithRelianceDefense_intro {c : ComplaintText}
    (hWritten : WrittenCommissionInterpretationRelied c)
    (hGoodFaith : GoodFaithConformity c)
    (hPleaded : PleadedAndProvedReliance c) :
    GoodFaithRelianceDefense c :=
  ⟨hWritten, hGoodFaith, hPleaded⟩

theorem recordkeepingCompliance_intro {c : ComplaintText}
    (hMade : RecordsMadeAndKept c)
    (hPreserved : RecordsPreservedForPrescribedPeriod c)
    (hReported : ReportsFurnishedAsPrescribed c) :
    RecordkeepingCompliance c :=
  ⟨hMade, hPreserved, hReported⟩

theorem noticePostingCompliance_intro {c : ComplaintText}
    (hPosted : StatutoryNoticePosted c)
    (hNoWillful : ¬ WillfulPostingViolation c) :
    NoticePostingCompliance c :=
  ⟨hPosted, hNoWillful⟩

theorem contractActionProcedure_intro {a : AffirmativeActionPlan}
    {k : GovernmentContract} {c : ComplaintText}
    (hAccepted : AffirmativeActionPlanAccepted a k c)
    (hDeemed : PlanDeemedAccepted a c)
    (hTwelve : PlanAcceptedWithinTwelveMonths c)
    (hNoDeviation : ¬ SubstantialDeviationFromPlan a c)
    (hHearing : FullHearingAndAdjudicationAccorded k c) :
    ContractActionProcedure a k c :=
  ⟨hAccepted, hDeemed, hTwelve, hNoDeviation, hHearing⟩



theorem reachable_intro_refl {p : Person} {r : Respondent} {d : JudicialDistrict}
    {c : ComplaintText} (s : Stage) : Reachable p r d c s s :=
  Reachable.refl s

theorem reachable_intro_cons {p : Person} {r : Respondent} {d : JudicialDistrict}
    {c : ComplaintText} {a b e : Stage}
    (hStep : Step p r d c a b) (hRest : Reachable p r d c b e) :
    Reachable p r d c a e :=
  Reachable.cons hStep hRest




theorem privateSectorPipeline_intro {p : Person} {r : Respondent}
    {d : JudicialDistrict} {c : ComplaintText}
    (hCharge : TimelyChargeNonDeferral p c)
    (hServed : CommissionServedNoticeOfCharge c)
    (hServedTimely : NoticeOfChargeServedTimely c)
    (hInvestigated : CommissionInvestigatedCharge c)
    (hCause : ReasonableCauseDetermined c)
    (hEndeavored : ConciliationEndeavored c)
    (hNoAgreement : ¬ ConciliationAgreementSecured c)
    (hNotice : RightToSueNoticeGiven c)
    (hElapsed : CommissionInactionPeriodElapsed c)
    (hNinety : SuitFiledWithinNinetyDays c)
    (hVenue : VenueProper p r d c)
    (hNamed : CivilActionAgainstNamedRespondent c)
    (hCovered : CoveredRespondent r c) :
    Reachable p r d c Stage.practiceOccurred Stage.adjudicated :=
  Reachable.cons (Step.fileChargeDirect hCharge)
    (Reachable.cons (Step.serveNotice hServed hServedTimely)
      (Reachable.cons (Step.investigate hInvestigated)
        (Reachable.cons (Step.findCause hCause)
          (Reachable.cons (Step.conciliationFails hEndeavored hNoAgreement)
            (Reachable.cons (Step.rightToSueAfterConciliation hNotice hElapsed)
              (Reachable.cons (Step.sue hNinety hVenue hNamed)
                (Reachable.cons (Step.adjudicate hCovered)
                  (Reachable.refl Stage.adjudicated))))))))



theorem deferralPipeline_intro {p : Person} {r : Respondent}
    {d : JudicialDistrict} {c : ComplaintText}
    (hDeferral : DeferralJurisdiction c)
    (hCommenced : StateProceedingCommenced c)
    (hCharge : TimelyChargeDeferral p c) :
    Reachable p r d c Stage.practiceOccurred Stage.chargeFiled :=
  Reachable.cons (Step.commenceState hDeferral hCommenced)
    (Reachable.cons (Step.fileChargeAfterDeferral hCharge)
      (Reachable.refl Stage.chargeFiled))



theorem timeBarred_intro {p : Person} {r : Respondent} {d : JudicialDistrict}
    {c : ComplaintText}
    (hNotBase : ¬ ChargeFiledWithinBaseWindow c)
    (hNotDeferral : ¬ ChargeFiledWithinDeferralDeadline c) :
    Reachable p r d c Stage.practiceOccurred Stage.timeBarred :=
  Reachable.cons (Step.untimelyCharge hNotBase hNotDeferral)
    (Reachable.refl Stage.timeBarred)

end Proving.USC.T42.Ch21TitleVII.Procedure
