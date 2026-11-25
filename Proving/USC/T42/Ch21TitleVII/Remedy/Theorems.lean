import Proving.USC.T42.Ch21TitleVII.Remedy.Statute













set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Remedy

open Proving.USC.Common



theorem exhaustion2000e5_intro {p : Person} {ch : Charge} {c : ComplaintText}
    (hFiled : ChargeFiledWithCommission ch c)
    (hBy : ChargeFiledByOrOnBehalfOfAggrieved p ch c)
    (hTimely : ChargeTimelyFiled ch c)
    (hDeferral : DeferralRequirementSatisfied ch c)
    (hNotice : RightToSueNoticeGiven p c)
    (hSuit : CivilActionFiledWithinNinetyDays p c) :
    Exhaustion2000e5 p ch c :=
  ⟨hFiled, hBy, hTimely, hDeferral, hNotice, hSuit⟩

theorem standing2000e5_intro {p : Person} {ch : Charge} {c : ComplaintText}
    (hParty : IsComplainingParty p c)
    (hRight : HasPrivateRightOfAction p c)
    (hInjury : InjuryCognizable p c)
    (hCause : CausedByViolation p c)
    (hExhaust : Exhaustion2000e5 p ch c) :
    Standing2000e5 p ch c :=
  ⟨hParty, hRight, hInjury, hCause, hExhaust⟩

theorem privateAction2000e5_intro {p : Person} {ch : Charge} {c : ComplaintText}
    (hStanding : Standing2000e5 p ch c)
    (hJur : DistrictCourtHasJurisdiction c)
    (hVenue : VenueProper c) :
    PrivateAction2000e5 p ch c :=
  ⟨hStanding, hJur, hVenue⟩



theorem makeWholeRelief2000e5g_intro {p r : Person} {ch : Charge}
    {c : ComplaintText}
    (hAction : PrivateAction2000e5 p ch c)
    (hViolation : UnlawfulEmploymentPracticeCharged r c)
    (hIntent : IntentionalViolationFound r c)
    (hNoBar : ¬ RefusedOrDischargedForNondiscriminatoryReason p c)
    (hCap : BackPayWithinTwoYearCap p c)
    (hMitigation : InterimEarningsOffsetApplied p c) :
    MakeWholeRelief2000e5g p r ch c :=
  ⟨hAction, hViolation, hIntent, hNoBar, hCap, hMitigation⟩

theorem limitedRelief2000e5g2B_intro {p r : Person} {ch : Charge}
    {c : ComplaintText}
    (hAction : PrivateAction2000e5 p ch c)
    (hMotivating : MotivatingFactorEstablished r c)
    (hSameDecision : SameDecisionDemonstrated r c) :
    LimitedRelief2000e5g2B p r ch c :=
  ⟨hAction, hMotivating, hSameDecision⟩

theorem feeAward2000e5k_intro {p : Person} {c : ComplaintText}
    (hPrevailing : PrevailingPartyNotGovernment p c) :
    FeeAward2000e5k p c :=
  ⟨hPrevailing⟩



theorem relianceDefense2000e12b_intro {r : Person} {c : ComplaintText}
    (hReliance : GoodFaithRelianceOnCommissionInterpretation r c) :
    RelianceDefense2000e12b r c :=
  ⟨hReliance⟩

theorem preclusionBar2000e2n_intro {p : Person} {j : ConsentJudgment}
    {c : ComplaintText}
    (hPrecluded : PrecludedByPriorConsentJudgment p j c) :
    PreclusionBar2000e2n p j c :=
  ⟨hPrecluded⟩

theorem stateRemedyUnaffected2000e7_intro {r : Person} {c : ComplaintText}
    (hPreserved : StateLawLiabilityPreserved r c) :
    StateRemedyUnaffected2000e7 r c :=
  ⟨hPreserved⟩



theorem commissionCivilAction2000e5f_intro {r : Person} {ch : Charge}
    {c : ComplaintText}
    (hCharge : ChargeFiledWithCommission ch c)
    (hCause : ReasonableCauseDetermined r c)
    (hConciliation : ConciliationUnsuccessful r c)
    (hNotGov : ¬ RespondentIsGovernmentEntity r c) :
    CommissionCivilAction2000e5f r ch c :=
  ⟨hCharge, hCause, hConciliation, hNotGov⟩

theorem attorneyGeneralCivilAction2000e5f_intro {r : Person} {ch : Charge}
    {c : ComplaintText}
    (hCharge : ChargeFiledWithCommission ch c)
    (hConciliation : ConciliationUnsuccessful r c)
    (hGov : RespondentIsGovernmentEntity r c) :
    AttorneyGeneralCivilAction2000e5f r ch c :=
  ⟨hCharge, hConciliation, hGov⟩

theorem preliminaryRelief2000e5f2_intro {r : Person} {ch : Charge}
    {c : ComplaintText}
    (hCharge : ChargeFiledWithCommission ch c)
    (hPrompt : PromptJudicialActionNecessary r c) :
    PreliminaryRelief2000e5f2 r ch c :=
  ⟨hCharge, hPrompt⟩

theorem intervention2000e5f_intro {r : Person} {c : ComplaintText}
    (hCertified : CertifiedGeneralPublicImportance c)
    (hNotGov : ¬ RespondentIsGovernmentEntity r c) :
    Intervention2000e5f r c :=
  ⟨hCertified, hNotGov⟩

theorem complianceProceeding2000e5i_intro {r : Person} {c : ComplaintText}
    (hNoncompliance : CourtOrderNotComplied r c) :
    ComplianceProceeding2000e5i r c :=
  ⟨hNoncompliance⟩

theorem patternOrPracticeAction2000e6_intro {r : Person} {c : ComplaintText}
    (hPattern : PatternOrPracticeOfResistance r c)
    (hCause : ReasonableCauseDetermined r c) :
    PatternOrPracticeAction2000e6 r c :=
  ⟨hPattern, hCause⟩

theorem recordkeepingComplianceOrder2000e8c_intro {r : Person}
    {c : ComplaintText}
    (hViolation : RecordkeepingRequirementViolated r c)
    (hNoHardship : ¬ UndueHardshipFromRecordkeepingOrder r c) :
    RecordkeepingComplianceOrder2000e8c r c :=
  ⟨hViolation, hNoHardship⟩



theorem postingPenalty2000e10_intro {r : Person} {c : ComplaintText}
    (hWillful : WillfulPostingViolation r c) :
    PostingPenalty2000e10 r c :=
  ⟨hWillful⟩

theorem confidentialityOffense2000e8e_intro {p : Person} {c : ComplaintText}
    (hBreach : CommissionConfidentialityBreached p c) :
    ConfidentialityOffense2000e8e p c :=
  ⟨hBreach⟩

theorem personnelProtectionOffense2000e13_intro {p : Person} {c : ComplaintText}
    (hOffense : AssaultOrKillingOfCommissionPersonnel p c) :
    PersonnelProtectionOffense2000e13 p c :=
  ⟨hOffense⟩



theorem federalSectorAction2000e16_intro {p : Person} {c : ComplaintText}
    (hCovered : IsFederalSectorEmployeeOrApplicant p c)
    (hFinal : FinalAgencyActionOrOneHundredEightyDayLapse p c)
    (hTimely : FederalSuitWithinNinetyDaysOfNotice p c)
    (hDefendant : AgencyHeadNamedAsDefendant p c) :
    FederalSectorAction2000e16 p c :=
  ⟨hCovered, hFinal, hTimely, hDefendant⟩

theorem geraAdministrativeRemedy2000e16c_intro {p : Person} {c : ComplaintText}
    (hCovered : IsGeraCoveredEmployee p c)
    (hTimely : GeraComplaintWithinOneHundredEightyDays p c)
    (hOrder : CommissionFinalOrderEntered p c) :
    GeraAdministrativeRemedy2000e16c p c :=
  ⟨hCovered, hTimely, hOrder⟩

theorem geraJudicialReview2000e16c_intro {p : Person} {c : ComplaintText}
    (hAdmin : GeraAdministrativeRemedy2000e16c p c)
    (hGround : FinalOrderSetAsideGroundShown p c) :
    GeraJudicialReview2000e16c p c :=
  ⟨hAdmin, hGround⟩

theorem geraFeeAward2000e16c_intro {p : Person} {c : ComplaintText}
    (hPrevailing : GeraPrevailingParty p c) :
    GeraFeeAward2000e16c p c :=
  ⟨hPrevailing⟩



theorem contractSanctionPermitted2000e17_intro {k : GovernmentContract}
    {c : ComplaintText}
    (h : ¬ AcceptedAffirmativeActionPlanInForce k c ∨
         SubstantialDeviationFromPlan k c ∨
         FullHearingAndAdjudicationAccorded k c) :
    ContractSanctionPermitted2000e17 k c :=
  match h with
  | .inl hNoPlan => .noAcceptedPlan hNoPlan
  | .inr (.inl hDeviation) => .substantialDeviation hDeviation
  | .inr (.inr hHearing) => .afterFullHearing hHearing

theorem title7EnforcementRoute_intro {p r : Person} {ch : Charge}
    {c : ComplaintText}
    (h : PrivateAction2000e5 p ch c ∨
         CommissionCivilAction2000e5f r ch c ∨
         AttorneyGeneralCivilAction2000e5f r ch c ∨
         PatternOrPracticeAction2000e6 r c ∨
         FederalSectorAction2000e16 p c ∨
         GeraAdministrativeRemedy2000e16c p c) :
    Title7EnforcementRoute p r ch c :=
  match h with
  | .inl hPrivate => .privateSuit hPrivate
  | .inr (.inl hComm) => .commissionSuit hComm
  | .inr (.inr (.inl hAG)) => .attorneyGeneralSuit hAG
  | .inr (.inr (.inr (.inl hPattern))) => .patternOrPractice hPattern
  | .inr (.inr (.inr (.inr (.inl hFed)))) => .federalSector hFed
  | .inr (.inr (.inr (.inr (.inr hGera)))) => .geraAdministrative hGera





theorem privateAction2000e5_timely {p : Person} {ch : Charge} {c : ComplaintText}
    (h : PrivateAction2000e5 p ch c) : ChargeTimelyFiled ch c :=
  h.standing.exhaustion.timely


theorem makeWholeRelief2000e5g_intentional {p r : Person} {ch : Charge}
    {c : ComplaintText} (h : MakeWholeRelief2000e5g p r ch c) :
    IntentionalViolationFound r c :=
  h.intentional



theorem geraJudicialReview2000e16c_finalOrder {p : Person} {c : ComplaintText}
    (h : GeraJudicialReview2000e16c p c) : CommissionFinalOrderEntered p c :=
  h.administrative.finalOrder




theorem gera2000e16b_excludes_punitive :
    Relief.punitiveDamages ∉ s2000e16bRelief := by decide



theorem gera2000e16b_includes_compensatory :
    Relief.compensatoryDamages ∈ s2000e16bRelief := by decide





theorem s2000e5_excludes_compensatory :
    Relief.compensatoryDamages ∉ s2000e5Relief := by decide




theorem s2000e5g2B_excludes_reinstatement :
    Relief.reinstatement ∉ s2000e5g2BRelief := by decide



theorem s2000e5g2B_includes_declaratory :
    Relief.declaratory ∈ s2000e5g2BRelief := by decide





theorem s2000e6_is_agency_only : s2000e6Enforcer = some Enforcer.agencyOnly := by
  decide



theorem gera_no_district_court : Forum.federalDistrictCourt ∉ geraForums := by
  decide







theorem nonEnforcementSections_have_no_enforcer :
    s2000eEnforcer = none ∧ s2000e1Enforcer = none ∧ s2000e7Enforcer = none ∧
    s2000e11Enforcer = none ∧ s2000e14Enforcer = none ∧
    s2000e15Enforcer = none ∧ s2000e16aEnforcer = none := by
  decide

end Proving.USC.T42.Ch21TitleVII.Remedy
