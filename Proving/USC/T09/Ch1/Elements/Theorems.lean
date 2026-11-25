import Proving.USC.T09.Ch1.Elements.Types
import Proving.USC.T09.Ch1.Elements.Predicates
import Proving.USC.T09.Ch1.Elements.Statute
import Proving.USC.Common.Types

set_option autoImplicit false












namespace Proving.USC.T09.Ch1.Elements

open Proving.USC.Common



theorem excludedWorkerContract_intro {ag : ArbitrationAgreement} {c : ComplaintText}
    (hWork : IsContractOfEmploymentOrWork ag c)
    (hClass : WorkerClassEngagedInInterstateTransportation ag c) :
    ExcludedWorkerContract ag c :=
  ⟨hWork, hClass⟩

theorem isExcludedTransportationWorkerContract_intro {ag : ArbitrationAgreement}
    {c : ComplaintText} (hWork : IsContractOfEmploymentOrWork ag c)
    (hClass : WorkerClassEngagedInInterstateTransportation ag c) :
    IsExcludedTransportationWorkerContract ag c :=
  ⟨hWork, hClass⟩



theorem coveredArbitrationAgreement_maritime_intro {ag : ArbitrationAgreement}
    {tx : Transaction} {c : ComplaintText} (hTx : IsMaritimeTransaction tx c)
    (hIn : ProvisionContainedInTransaction ag tx c) :
    CoveredArbitrationAgreement ag tx c :=
  .maritime hTx hIn

theorem coveredArbitrationAgreement_commerce_intro {ag : ArbitrationAgreement}
    {tx : Transaction} {c : ComplaintText}
    (hTx : TransactionEngagedInInterstateCommerce tx c)
    (hEv : ContractEvidencesTransaction ag tx c) :
    CoveredArbitrationAgreement ag tx c :=
  .commerce hTx hEv

theorem arbitrableControversy_thereafter_intro {d : Controversy}
    {ag : ArbitrationAgreement} {c : ComplaintText}
    (hTime : ControversyArisingAfterAgreement d ag c)
    (hScope : ControversyArisesOutOfContractOrRefusal d ag c) :
    ArbitrableControversy d ag c :=
  .thereafter hTime hScope

theorem arbitrableControversy_existing_intro {d : Controversy}
    {ag : ArbitrationAgreement} {c : ComplaintText}
    (hSubmit : ExistingControversySubmittedInWriting d ag c)
    (hScope : ControversyArisesOutOfContractOrRefusal d ag c) :
    ArbitrableControversy d ag c :=
  .existing hSubmit hScope

theorem section2_intro {ag : ArbitrationAgreement} {tx : Transaction} {d : Controversy}
    {c : ComplaintText}
    (hWritten : IsWrittenArbitrationProvision ag c)
    (hCovered : CoveredArbitrationAgreement ag tx c)
    (hArb : ArbitrableControversy d ag c)
    (hNotExcluded : ¬ IsExcludedTransportationWorkerContract ag c)
    (hNoRevocation : ¬ GroundsForRevocationOfAnyContract ag c)
    (hNoChapter4 : ¬ ChapterFourInvalidationElected ag c) :
    Section2 ag tx d c :=
  ⟨hWritten, hCovered, hArb, hNotExcluded, hNoRevocation, hNoChapter4⟩



theorem section3_intro {s : Suit} {ag : ArbitrationAgreement} {app : CourtApplication}
    {c : ComplaintText}
    (hPending : SuitPendingInUnitedStatesCourt s c)
    (hReferable : IssueInSuitReferableToArbitration s ag c)
    (hApplication : StayApplicationMadeByParty app s c)
    (hNoDefault : ¬ ApplicantInDefaultInProceedingWithArbitration app c) :
    Section3 s ag app c :=
  ⟨hPending, hReferable, hApplication, hNoDefault⟩



theorem fiveDaysWrittenNoticeGiven_intro {app : CourtApplication} {c : ComplaintText}
    (h : 5 ≤ daysOfWrittenNoticeServedOnDefaultingParty app c) :
    FiveDaysWrittenNoticeGiven app c := h


example {app : CourtApplication} {c : ComplaintText}
    (h : daysOfWrittenNoticeServedOnDefaultingParty app c = 7) :
    FiveDaysWrittenNoticeGiven app c := by
  unfold FiveDaysWrittenNoticeGiven; omega

theorem compelArbitrationBasis_uncontested_intro {ag : ArbitrationAgreement}
    {c : ComplaintText} (h : ¬ MakingOfAgreementOrFailureToComplyInIssue ag c) :
    CompelArbitrationBasis ag c :=
  .uncontested h

theorem compelArbitrationBasis_tried_intro {ag : ArbitrationAgreement} {c : ComplaintText}
    (hMade : TrierFoundWrittenArbitrationAgreementMade ag c)
    (hDefault : TrierFoundDefaultInProceedingUnderAgreement ag c) :
    CompelArbitrationBasis ag c :=
  .tried hMade hDefault

theorem section4_intro {p : Person} {ag : ArbitrationAgreement} {d : Controversy}
    {app : CourtApplication} {c : ComplaintText}
    (hAggrieved : AggrievedByFailureNeglectOrRefusalToArbitrate p ag c)
    (hWritten : IsWrittenArbitrationProvision ag c)
    (hJurisdiction : FederalJurisdictionalNexusSaveForAgreement d c)
    (hNotice : FiveDaysWrittenNoticeGiven app c)
    (hService : NoticeServedUnderFederalRules app c)
    (hBasis : CompelArbitrationBasis ag c)
    (hVenue : HearingWithinDistrictOfPetition app c) :
    Section4 p ag d app c :=
  ⟨hAggrieved, hWritten, hJurisdiction, hNotice, hService, hBasis, hVenue⟩



theorem arbitratorAppointmentTrigger_noMethod_intro {ag : ArbitrationAgreement}
    {c : ComplaintText} (h : ¬ AgreementProvidesArbitratorAppointmentMethod ag c) :
    ArbitratorAppointmentTrigger ag c :=
  .noMethodProvided h

theorem arbitratorAppointmentTrigger_failedToAvail_intro {ag : ArbitrationAgreement}
    {c : ComplaintText} (h : PartyFailedToAvailOfAppointmentMethod ag c) :
    ArbitratorAppointmentTrigger ag c :=
  .partyFailedToAvail h

theorem arbitratorAppointmentTrigger_lapse_intro {ag : ArbitrationAgreement}
    {c : ComplaintText} (h : LapseInNamingArbitratorOrFillingVacancy ag c) :
    ArbitratorAppointmentTrigger ag c :=
  .lapse h

theorem section5_intro {ag : ArbitrationAgreement} {app : CourtApplication}
    {c : ComplaintText}
    (hWritten : IsWrittenArbitrationProvision ag c)
    (hTrigger : ArbitratorAppointmentTrigger ag c)
    (hApplication : ApplicationByPartyToControversy app c) :
    Section5 ag app c :=
  ⟨hWritten, hTrigger, hApplication⟩

theorem singleArbitratorDefaultApplies_intro {ag : ArbitrationAgreement}
    {c : ComplaintText} (h : ¬ AgreementProvidesNumberOfArbitrators ag c) :
    SingleArbitratorDefaultApplies ag c := h



theorem section6_intro {app : CourtApplication} {c : ComplaintText}
    (hMotion : ApplicationMadeAndHeardAsMotion app c)
    (hNoException : ¬ TitleExpresslyProvidesOtherwiseForApplication app c) :
    Section6 app c :=
  ⟨hMotion, hNoException⟩



theorem section7_intro {sm : ArbitralSummons} {p : Person} {app : CourtApplication}
    {c : ComplaintText}
    (hIssued : SummonsIssuedInWritingByArbitratorMajority sm c)
    (hSigned : SummonsSignedByArbitratorMajority sm c)
    (hServed : SummonsDirectedAndServedAsSubpoena sm c)
    (hMaterial : EvidenceSoughtMaterialToTheCase sm c)
    (hDisobey : SummonedPersonRefusedOrNeglectedToObey sm p c)
    (hVenue : PetitionInDistrictWhereArbitratorsSitting app c) :
    Section7 sm p app c :=
  ⟨hIssued, hSigned, hServed, hMaterial, hDisobey, hVenue⟩



theorem section8_intro {p : Person} {s : Suit} {c : ComplaintText}
    (hAdmiralty : CauseOtherwiseJusticiableInAdmiralty s c)
    (hAggrieved : PartyClaimingToBeAggrieved p s c)
    (hLibel : ProceedingBegunByLibelAndSeizure s c) :
    Section8 p s c :=
  ⟨hAdmiralty, hAggrieved, hLibel⟩



theorem withinLimitationsOneYearOfAward_intro {app : CourtApplication} {c : ComplaintText}
    (h : daysFromAwardMadeToConfirmationApplication app c ≤ 365) :
    WithinLimitationsOneYearOfAward app c := h


example {app : CourtApplication} {c : ComplaintText}
    (h : daysFromAwardMadeToConfirmationApplication app c = 200) :
    WithinLimitationsOneYearOfAward app c := by
  unfold WithinLimitationsOneYearOfAward; omega

theorem confirmationForum_specified_intro {app : CourtApplication}
    {ag : ArbitrationAgreement} {aw : Award} {c : ComplaintText}
    (h : AppliedToCourtSpecifiedInAgreement app ag c) :
    ConfirmationForum app ag aw c :=
  .specified h

theorem confirmationForum_awardDistrict_intro {app : CourtApplication}
    {ag : ArbitrationAgreement} {aw : Award} {c : ComplaintText}
    (hNone : ¬ AgreementSpecifiesConfirmingCourt ag c)
    (h : AppliedToDistrictWhereAwardMade app aw c) :
    ConfirmationForum app ag aw c :=
  .awardDistrict hNone h

theorem section9_intro {p : Person} {ag : ArbitrationAgreement} {aw : Award}
    {app : CourtApplication} {c : ComplaintText}
    (hClause : AgreementProvidesForJudgmentUponAward ag c)
    (hParty : ApplicantIsPartyToTheArbitration p c)
    (hTimely : WithinLimitationsOneYearOfAward app c)
    (hForum : ConfirmationForum app ag aw c)
    (hNotice : NoticeOfApplicationServedOnAdverseParty app c)
    (hUnsettled : ¬ AwardVacatedModifiedOrCorrected aw c) :
    Section9 p ag aw app c :=
  ⟨hClause, hParty, hTimely, hForum, hNotice, hUnsettled⟩



theorem refusalToPostponeGround_intro {aw : Award} {c : ComplaintText}
    (hRefused : ArbitratorsRefusedToPostponeHearing aw c)
    (hCause : SufficientCauseForPostponementShown aw c) :
    RefusalToPostponeGround aw c :=
  ⟨hRefused, hCause⟩

theorem otherMisbehaviorGround_intro {aw : Award} {c : ComplaintText}
    (hMisbehavior : OtherMisbehaviorByArbitrators aw c)
    (hPrejudice : PartyRightsPrejudicedByMisbehavior aw c) :
    OtherMisbehaviorGround aw c :=
  ⟨hMisbehavior, hPrejudice⟩

theorem imperfectExecutionGround_intro {aw : Award} {c : ComplaintText}
    (hImperfect : ArbitratorsImperfectlyExecutedTheirPowers aw c)
    (hNoAward : NoMutualFinalDefiniteAwardMade aw c) :
    ImperfectExecutionGround aw c :=
  ⟨hImperfect, hNoAward⟩

theorem vacaturGround10a_procurement_intro {aw : Award} {c : ComplaintText}
    (h : AwardProcuredByCorruptionFraudOrUndueMeans aw c) : VacaturGround10a aw c :=
  .procurement h

theorem vacaturGround10a_partiality_intro {aw : Award} {c : ComplaintText}
    (h : EvidentPartialityOrCorruptionInArbitrators aw c) : VacaturGround10a aw c :=
  .partiality h

theorem vacaturGround10a_refusalToPostpone_intro {aw : Award} {c : ComplaintText}
    (h : RefusalToPostponeGround aw c) : VacaturGround10a aw c :=
  .refusalToPostpone h

theorem vacaturGround10a_refusalToHearEvidence_intro {aw : Award} {c : ComplaintText}
    (h : ArbitratorsRefusedToHearMaterialEvidence aw c) : VacaturGround10a aw c :=
  .refusalToHearEvidence h

theorem vacaturGround10a_otherMisbehavior_intro {aw : Award} {c : ComplaintText}
    (h : OtherMisbehaviorGround aw c) : VacaturGround10a aw c :=
  .otherMisbehavior h

theorem vacaturGround10a_exceededPowers_intro {aw : Award} {c : ComplaintText}
    (h : ArbitratorsExceededTheirPowers aw c) : VacaturGround10a aw c :=
  .exceededPowers h

theorem vacaturGround10a_imperfectExecution_intro {aw : Award} {c : ComplaintText}
    (h : ImperfectExecutionGround aw c) : VacaturGround10a aw c :=
  .imperfectExecution h

theorem section10a_intro {p : Person} {aw : Award} {app : CourtApplication}
    {c : ComplaintText}
    (hGround : VacaturGround10a aw c)
    (hParty : ApplicantIsPartyToTheArbitration p c)
    (hVenue : ApplicationInDistrictWhereAwardMade app aw c) :
    Section10a p aw app c :=
  ⟨hGround, hParty, hVenue⟩

theorem section10b_intro {aw : Award} {c : ComplaintText}
    (hVacated : AwardVacatedByCourt aw c)
    (hNotExpired : ¬ TimeForMakingAwardUnderAgreementExpired aw c) :
    Section10b aw c :=
  ⟨hVacated, hNotExpired⟩

theorem section10c_intro {p : Person} {aw : Award} {app : CourtApplication}
    {c : ComplaintText}
    (hAgency : AwardIssuedPursuantToSection580OfTitle5 aw c)
    (hNotParty : ¬ ApplicantIsPartyToTheArbitration p c)
    (hAggrieved : AdverselyAffectedOrAggrievedByAward p aw c)
    (hInconsistent : ClearlyInconsistentWithSection572Factors aw c)
    (hVenue : ApplicationInDistrictWhereAwardMade app aw c) :
    Section10c p aw app c :=
  ⟨hAgency, hNotParty, hAggrieved, hInconsistent, hVenue⟩



theorem unsubmittedMatterGround_intro {aw : Award} {c : ComplaintText}
    (hUnsubmitted : AwardedUponMatterNotSubmitted aw c)
    (hException : ¬ UnsubmittedMatterDoesNotAffectMerits aw c) :
    UnsubmittedMatterGround aw c :=
  ⟨hUnsubmitted, hException⟩

theorem formImperfectionGround_intro {aw : Award} {c : ComplaintText}
    (hImperfect : AwardImperfectInMatterOfForm aw c)
    (hMerits : ¬ FormImperfectionAffectsMerits aw c) :
    FormImperfectionGround aw c :=
  ⟨hImperfect, hMerits⟩

theorem modificationGround11_miscalculation_intro {aw : Award} {c : ComplaintText}
    (h : EvidentMaterialMiscalculationOfFigures aw c) : ModificationGround11 aw c :=
  .miscalculation h

theorem modificationGround11_mistakenDescription_intro {aw : Award} {c : ComplaintText}
    (h : EvidentMaterialMistakeInDescription aw c) : ModificationGround11 aw c :=
  .mistakenDescription h

theorem modificationGround11_unsubmittedMatter_intro {aw : Award} {c : ComplaintText}
    (h : UnsubmittedMatterGround aw c) : ModificationGround11 aw c :=
  .unsubmittedMatter h

theorem modificationGround11_formImperfection_intro {aw : Award} {c : ComplaintText}
    (h : FormImperfectionGround aw c) : ModificationGround11 aw c :=
  .formImperfection h

theorem section11_intro {p : Person} {aw : Award} {app : CourtApplication}
    {c : ComplaintText}
    (hGround : ModificationGround11 aw c)
    (hParty : ApplicantIsPartyToTheArbitration p c)
    (hVenue : ApplicationInDistrictWhereAwardMade app aw c) :
    Section11 p aw app c :=
  ⟨hGround, hParty, hVenue⟩



theorem withinLimitationsThreeMonthsOfAward_intro {app : CourtApplication}
    {c : ComplaintText} (h : daysFromAwardFiledToNoticeService app c ≤ 90) :
    WithinLimitationsThreeMonthsOfAward app c := h


example {app : CourtApplication} {c : ComplaintText}
    (h : daysFromAwardFiledToNoticeService app c = 120) :
    ¬ WithinLimitationsThreeMonthsOfAward app c := by
  unfold WithinLimitationsThreeMonthsOfAward; omega

theorem section12ServiceManner_resident_intro {app : CourtApplication} {c : ComplaintText}
    (hRes : AdversePartyResidesInDistrictWhereAwardMade app c)
    (h : ServedAsNoticeOfMotionInSameCourt app c) :
    Section12ServiceManner app c :=
  .resident hRes h

theorem section12ServiceManner_nonresident_intro {app : CourtApplication}
    {c : ComplaintText}
    (hNonRes : ¬ AdversePartyResidesInDistrictWhereAwardMade app c)
    (h : ServedByMarshalOfDistrictWhereFound app c) :
    Section12ServiceManner app c :=
  .nonresident hNonRes h

theorem section12_intro {app : CourtApplication} {c : ComplaintText}
    (hNoticed : NoticeOfMotionToVacateModifyOrCorrectServed app c)
    (hTimely : WithinLimitationsThreeMonthsOfAward app c)
    (hManner : Section12ServiceManner app c) :
    Section12 app c :=
  ⟨hNoticed, hTimely, hManner⟩

theorem section12StayOrder_intro {app : CourtApplication} {c : ComplaintText}
    (hMotion : Section12 app c)
    (hJudge : JudgeCompetentToStayProceedingsInSameCourt app c)
    (hServed : StayOrderServedWithNoticeOfMotion app c) :
    Section12StayOrder app c :=
  ⟨hMotion, hJudge, hServed⟩



theorem section13_intro {app : CourtApplication} {c : ComplaintText}
    (hMoving : MovingForOrderConfirmingModifyingOrCorrecting app c)
    (hAtEntry : PapersFiledWhenOrderFiledForEntryOfJudgment app c)
    (hAgreement : FiledAgreementAppointmentAndExtensions app c)
    (hAward : FiledTheAward app c)
    (hPapers : FiledApplicationPapersAndCourtOrders app c) :
    Section13 app c :=
  ⟨hMoving, hAtEntry, hAgreement, hAward, hPapers⟩

theorem section13Judgment_intro {app : CourtApplication} {c : ComplaintText}
    (hFilings : Section13 app c)
    (hDocketed : JudgmentDocketedAsIfRenderedInAnAction app c) :
    Section13Judgment app c :=
  ⟨hFilings, hDocketed⟩



theorem section14TitleApplies_intro {ag : ArbitrationAgreement} {c : ComplaintText}
    (h : 1926 ≤ yearOfContractFormation ag c) : Section14TitleApplies ag c := h


example {ag : ArbitrationAgreement} {c : ComplaintText}
    (h : yearOfContractFormation ag c = 1921) : ¬ Section14TitleApplies ag c := by
  unfold Section14TitleApplies; omega



theorem section15Relief_enforcement_intro {r : ReliefRequest} {c : ComplaintText}
    (h : SeeksEnforcementOfArbitralAgreement r c) : Section15Relief r c :=
  .enforcement h

theorem section15Relief_confirmation_intro {r : ReliefRequest} {c : ComplaintText}
    (h : SeeksConfirmationOfArbitralAward r c) : Section15Relief r c :=
  .confirmation h

theorem section15Relief_execution_intro {r : ReliefRequest} {c : ComplaintText}
    (h : SeeksExecutionUponJudgmentConfirmingAward r c) : Section15Relief r c :=
  .execution h

theorem section15_intro {r : ReliefRequest} {c : ComplaintText}
    (hRelief : Section15Relief r c)
    (hGround : RefusalRestsOnActOfStateDoctrine r c) :
    Section15 r c :=
  ⟨hRelief, hGround⟩



theorem appealableOrder16a_refusingStay_intro {o : CourtOrder} {c : ComplaintText}
    (h : OrderRefusingStayUnderSection3 o c) : AppealableOrder16a o c :=
  .refusingStay h

theorem appealableOrder16a_denyingSection4Petition_intro {o : CourtOrder}
    {c : ComplaintText} (h : OrderDenyingPetitionUnderSection4 o c) :
    AppealableOrder16a o c :=
  .denyingSection4Petition h

theorem appealableOrder16a_denyingSection206Application_intro {o : CourtOrder}
    {c : ComplaintText} (h : OrderDenyingApplicationUnderSection206 o c) :
    AppealableOrder16a o c :=
  .denyingSection206Application h

theorem appealableOrder16a_confirmationRuling_intro {o : CourtOrder} {c : ComplaintText}
    (h : OrderConfirmingOrDenyingConfirmationOfAward o c) : AppealableOrder16a o c :=
  .confirmationRuling h

theorem appealableOrder16a_modifyingOrVacating_intro {o : CourtOrder} {c : ComplaintText}
    (h : OrderModifyingCorrectingOrVacatingAward o c) : AppealableOrder16a o c :=
  .modifyingOrVacating h

theorem appealableOrder16a_injunctionAgainstArbitration_intro {o : CourtOrder}
    {c : ComplaintText}
    (h : OrderGrantingContinuingOrModifyingInjunctionAgainstArbitration o c)
    (hSubject : ArbitrationSubjectToThisTitle o c) : AppealableOrder16a o c :=
  .injunctionAgainstArbitration h hSubject

theorem appealableOrder16a_finalDecision_intro {o : CourtOrder} {c : ComplaintText}
    (h : FinalDecisionWithRespectToArbitration o c)
    (hSubject : ArbitrationSubjectToThisTitle o c) : AppealableOrder16a o c :=
  .finalDecision h hSubject

theorem barredInterlocutoryOrder16b_grantingStay_intro {o : CourtOrder} {c : ComplaintText}
    (hInt : OrderIsInterlocutory o c) (h : OrderGrantingStayUnderSection3 o c) :
    BarredInterlocutoryOrder16b o c :=
  .grantingStay hInt h

theorem barredInterlocutoryOrder16b_directingArbitration_intro {o : CourtOrder}
    {c : ComplaintText} (hInt : OrderIsInterlocutory o c)
    (h : OrderDirectingArbitrationUnderSection4 o c) : BarredInterlocutoryOrder16b o c :=
  .directingArbitration hInt h

theorem barredInterlocutoryOrder16b_compellingSection206_intro {o : CourtOrder}
    {c : ComplaintText} (hInt : OrderIsInterlocutory o c)
    (h : OrderCompellingArbitrationUnderSection206 o c) : BarredInterlocutoryOrder16b o c :=
  .compellingSection206 hInt h

theorem barredInterlocutoryOrder16b_refusingToEnjoin_intro {o : CourtOrder}
    {c : ComplaintText} (hInt : OrderIsInterlocutory o c)
    (h : OrderRefusingToEnjoinArbitration o c)
    (hSubject : ArbitrationSubjectToThisTitle o c) : BarredInterlocutoryOrder16b o c :=
  .refusingToEnjoin hInt h hSubject

theorem appealAvailable16_underSubsectionA_intro {o : CourtOrder} {c : ComplaintText}
    (h : AppealableOrder16a o c) (hNotBarred : ¬ BarredInterlocutoryOrder16b o c) :
    AppealAvailable16 o c :=
  .underSubsectionA h hNotBarred

theorem appealAvailable16_certified_intro {o : CourtOrder} {c : ComplaintText}
    (hBarred : BarredInterlocutoryOrder16b o c)
    (hCert : CertifiedUnderSection1292bOfTitle28 o c) : AppealAvailable16 o c :=
  .certified hBarred hCert



theorem validMotionToCompelArbitration_intro {p : Person} {ag : ArbitrationAgreement}
    {tx : Transaction} {d : Controversy} {app : CourtApplication} {c : ComplaintText}
    (hEnforceable : Section2 ag tx d c)
    (hTitleApplies : Section14TitleApplies ag c)
    (hPetition : Section4 p ag d app c) :
    ValidMotionToCompelArbitration p ag tx d app c :=
  ⟨hEnforceable, hTitleApplies, hPetition⟩

theorem validMotionToStayLitigation_intro {ag : ArbitrationAgreement} {tx : Transaction}
    {d : Controversy} {s : Suit} {app : CourtApplication} {c : ComplaintText}
    (hEnforceable : Section2 ag tx d c)
    (hTitleApplies : Section14TitleApplies ag c)
    (hStay : Section3 s ag app c) :
    ValidMotionToStayLitigation ag tx d s app c :=
  ⟨hEnforceable, hTitleApplies, hStay⟩

theorem validApplicationToConfirmAward_intro {p : Person} {ag : ArbitrationAgreement}
    {aw : Award} {app : CourtApplication} {c : ComplaintText}
    (hConfirmation : Section9 p ag aw app c)
    (hFilings : Section13 app c) :
    ValidApplicationToConfirmAward p ag aw app c :=
  ⟨hConfirmation, hFilings⟩

theorem validMotionToVacateAward_intro {p : Person} {aw : Award} {app : CourtApplication}
    {c : ComplaintText}
    (hGrounds : Section10a p aw app c)
    (hTimely : Section12 app c) :
    ValidMotionToVacateAward p aw app c :=
  ⟨hGrounds, hTimely⟩

theorem validMotionToModifyAward_intro {p : Person} {aw : Award} {app : CourtApplication}
    {c : ComplaintText}
    (hGrounds : Section11 p aw app c)
    (hTimely : Section12 app c)
    (hFilings : Section13 app c) :
    ValidMotionToModifyAward p aw app c :=
  ⟨hGrounds, hTimely, hFilings⟩

end Proving.USC.T09.Ch1.Elements
