








import Proving.USC.T09.Ch1.Procedure.Types
import Proving.USC.T09.Ch1.Procedure.Predicates
import Proving.USC.T09.Ch1.Procedure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T09.Ch1.Procedure

open Proving.USC.Common



theorem coveredTransaction_maritime_intro
    (ag : ArbitrationAgreement) (c : ComplaintText)
    (h : IsMaritimeTransaction ag c) : CoveredTransaction ag c :=
  CoveredTransaction.maritime h

theorem coveredTransaction_commerce_intro
    (ag : ArbitrationAgreement) (c : ComplaintText)
    (h : InvolvesCommerce ag c) : CoveredTransaction ag c :=
  CoveredTransaction.commerce h

theorem writtenArbitrationUndertaking_provision_intro
    (ag : ArbitrationAgreement) (c : ComplaintText)
    (h : WrittenArbitrationProvisionInContract ag c) : WrittenArbitrationUndertaking ag c :=
  WrittenArbitrationUndertaking.provision h

theorem writtenArbitrationUndertaking_submission_intro
    (ag : ArbitrationAgreement) (c : ComplaintText)
    (h : AgreementToSubmitExistingControversy ag c) : WrittenArbitrationUndertaking ag c :=
  WrittenArbitrationUndertaking.submission h


theorem contractWithinTemporalScope_intro
    (ag : ArbitrationAgreement) (c : ComplaintText)
    (h : 1926 ≤ yearContractMade ag c) : ContractWithinTemporalScope ag c := h



theorem contractOutsideTemporalScope_of_pre1926
    (ag : ArbitrationAgreement) (c : ComplaintText)
    (h : yearContractMade ag c < 1926) : ¬ ContractWithinTemporalScope ag c := by
  intro hle
  have : 1926 ≤ yearContractMade ag c := hle
  omega

theorem enforceableArbitrationAgreement_intro
    (ag : ArbitrationAgreement) (c : ComplaintText)
    (hCov : CoveredTransaction ag c)
    (hWri : WrittenArbitrationUndertaking ag c)
    (hNotExempt : ¬ IsExemptTransportationWorkerContract ag c)
    (hNoRev : ¬ GroundsForRevocationExist ag c)
    (hNoCh4 : ¬ Chapter4RendersAgreementUnenforceable ag c)
    (hTemp : ContractWithinTemporalScope ag c) :
    EnforceableArbitrationAgreement ag c :=
  ⟨hCov, hWri, hNotExempt, hNoRev, hNoCh4, hTemp⟩



theorem stayOfProceedings_intro
    (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText)
    (hSuit : SuitPendingInUnitedStatesCourt p c)
    (hRef : IssueReferableToArbitration p c)
    (hAgr : EnforceableArbitrationAgreement ag c)
    (hSat : CourtSatisfiedIssueReferable p c)
    (hApp : StayApplicationMadeByParty p c)
    (hNotDef : ¬ ApplicantInDefaultInProceedingWithArbitration p c) :
    StayOfProceedings p ag c :=
  ⟨hSuit, hRef, hAgr, hSat, hApp, hNotDef⟩




theorem noticeOfCompelApplicationTimely_intro
    (p : Person) (c : ComplaintText)
    (h : 5 ≤ daysNoticeBeforeReturnDay p c) : NoticeOfCompelApplicationTimely p c := h



theorem noticeOfCompelApplicationUntimely_of_fewerThanFive
    (p : Person) (c : ComplaintText)
    (h : daysNoticeBeforeReturnDay p c < 5) : ¬ NoticeOfCompelApplicationTimely p c := by
  intro hle
  have : 5 ≤ daysNoticeBeforeReturnDay p c := hle
  omega

theorem validCompelNotice_intro
    (p : Person) (c : ComplaintText)
    (hServed : NoticeOfCompelApplicationServedOnPartyInDefault p c)
    (hManner : ServiceMadeUnderFederalRulesOfCivilProcedure p c)
    (hTimely : NoticeOfCompelApplicationTimely p c) : ValidCompelNotice p c :=
  ⟨hServed, hManner, hTimely⟩

theorem orderCompellingArbitration_intro
    (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText)
    (hAgg : PartyAggrievedByFailureNeglectOrRefusalToArbitrate p c)
    (hPet : PetitionToCompelArbitrationFiled p c)
    (hJur : CourtHasSubjectMatterJurisdictionUnderTitle28 p c)
    (hAgr : EnforceableArbitrationAgreement ag c)
    (hNot : ValidCompelNotice p c)
    (hNotInIssue : ¬ MakingOfAgreementOrFailureToComplyInIssue p c)
    (hVenue : HearingAndProceedingsWithinDistrictOfPetition p c)
    (hOrd : CourtOrderedPartiesToProceedToArbitration p c) :
    OrderCompellingArbitration p ag c :=
  ⟨hAgg, hPet, hJur, hAgr, hNot, hNotInIssue, hVenue, hOrd⟩

theorem summaryTrialByCourt_noJuryDemand_intro
    (p : Person) (c : ComplaintText)
    (h : ¬ JuryTrialDemandedOnOrBeforeReturnDay p c) : SummaryTrialByCourt p c :=
  SummaryTrialByCourt.noJuryDemand h

theorem summaryTrialByCourt_admiralty_intro
    (p : Person) (c : ComplaintText)
    (h : MatterWithinAdmiraltyJurisdiction p c) : SummaryTrialByCourt p c :=
  SummaryTrialByCourt.admiralty h

theorem courtDeterminedCompelIssue_intro
    (p : Person) (c : ComplaintText)
    (hIssue : MakingOfAgreementOrFailureToComplyInIssue p c)
    (hNot : ValidCompelNotice p c)
    (hTrier : SummaryTrialByCourt p c) : CourtDeterminedCompelIssue p c :=
  ⟨hIssue, hNot, hTrier⟩

theorem juryDeterminedCompelOrder_intro
    (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText)
    (hAgg : PartyAggrievedByFailureNeglectOrRefusalToArbitrate p c)
    (hPet : PetitionToCompelArbitrationFiled p c)
    (hJur : CourtHasSubjectMatterJurisdictionUnderTitle28 p c)
    (hAgr : EnforceableArbitrationAgreement ag c)
    (hNot : ValidCompelNotice p c)
    (hIssue : MakingOfAgreementOrFailureToComplyInIssue p c)
    (hNotAdm : ¬ MatterWithinAdmiraltyJurisdiction p c)
    (hDemand : JuryTrialDemandedOnOrBeforeReturnDay p c)
    (hVerdict : JuryFoundAgreementInWritingAndDefault p c)
    (hOrd : CourtOrderedPartiesToProceedToArbitration p c) :
    JuryDeterminedCompelOrder p ag c :=
  ⟨hAgg, hPet, hJur, hAgr, hNot, hIssue, hNotAdm, hDemand, hVerdict, hOrd⟩

theorem compelProceedingDismissed_intro
    (p : Person) (c : ComplaintText)
    (hIssue : MakingOfAgreementOrFailureToComplyInIssue p c)
    (hDemand : JuryTrialDemandedOnOrBeforeReturnDay p c)
    (hAgainst : ¬ JuryFoundAgreementInWritingAndDefault p c) :
    CompelProceedingDismissed p c :=
  ⟨hIssue, hDemand, hAgainst⟩



theorem contractualAppointmentGoverns_intro
    (ag : ArbitrationAgreement) (c : ComplaintText)
    (hMethod : AgreementProvidesMethodOfAppointingArbitrator ag c)
    (hFollowed : AppointmentMethodFollowed ag c) : ContractualAppointmentGoverns ag c :=
  ⟨hMethod, hFollowed⟩

theorem courtAppointmentTrigger_noMethod_intro
    (ag : ArbitrationAgreement) (c : ComplaintText)
    (h : ¬ AgreementProvidesMethodOfAppointingArbitrator ag c) :
    CourtAppointmentTrigger ag c :=
  CourtAppointmentTrigger.noMethod h

theorem courtAppointmentTrigger_failedToAvail_intro
    (ag : ArbitrationAgreement) (c : ComplaintText)
    (hMethod : AgreementProvidesMethodOfAppointingArbitrator ag c)
    (hFailed : PartyFailedToAvailOfAppointmentMethod ag c) :
    CourtAppointmentTrigger ag c :=
  CourtAppointmentTrigger.failedToAvail hMethod hFailed

theorem courtAppointmentTrigger_lapse_intro
    (ag : ArbitrationAgreement) (c : ComplaintText)
    (h : LapseInNamingArbitratorOrFillingVacancy ag c) : CourtAppointmentTrigger ag c :=
  CourtAppointmentTrigger.lapse h

theorem courtAppointmentOfArbitrator_intro
    (p : Person) (ar : Arbitrator) (ag : ArbitrationAgreement) (c : ComplaintText)
    (hTrig : CourtAppointmentTrigger ag c)
    (hApp : ApplicationForCourtAppointmentMade p c)
    (hAppointed : CourtDesignatedAndAppointedArbitrator ar c) :
    CourtAppointmentOfArbitrator p ar ag c :=
  ⟨hTrig, hApp, hAppointed⟩

theorem singleArbitratorDefault_intro
    (ag : ArbitrationAgreement) (c : ComplaintText)
    (h : ¬ AgreementProvidesForMultipleArbitrators ag c) : SingleArbitratorDefault ag c := h



theorem applicationHeardAsMotion_intro
    (p : Person) (c : ComplaintText)
    (hMotion : ApplicationMadeAndHeardAsMotion p c)
    (hNoExc : ¬ ChapterExpresslyProvidesOtherManner p c) : ApplicationHeardAsMotion p c :=
  ⟨hMotion, hNoExc⟩



theorem arbitralSummons_intro
    (w : Person) (c : ComplaintText)
    (hSummoned : ArbitratorsSummonedWitnessInWriting w c)
    (hSigned : SummonsSignedByArbitratorsOrMajority w c)
    (hServed : SummonsDirectedToPersonAndServedAsSubpoena w c) : ArbitralSummons w c :=
  ⟨hSummoned, hSigned, hServed⟩

theorem orderCompellingWitnessAttendance_intro
    (w : Person) (c : ComplaintText)
    (hSummons : ArbitralSummons w c)
    (hRefusal : SummonedPersonRefusedOrNeglectedToObey w c)
    (hPetition : PetitionToCompelWitnessAttendanceFiled w c)
    (hVenue : ArbitratorsSittingInDistrictOfCourt w c) :
    OrderCompellingWitnessAttendance w c :=
  ⟨hSummons, hRefusal, hPetition, hVenue⟩



theorem admiraltyCommencement_intro
    (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText)
    (hJust : CauseOfActionJusticiableInAdmiralty p c)
    (hLibel : ProceedingBegunByLibelAndSeizure p c)
    (hAgr : EnforceableArbitrationAgreement ag c)
    (hDirected : CourtOrderedPartiesToProceedToArbitration p c)
    (hRetained : CourtRetainedJurisdictionToEnterDecreeUponAward p c) :
    AdmiraltyCommencement p ag c :=
  ⟨hJust, hLibel, hAgr, hDirected, hRetained⟩





theorem confirmationApplicationWithinOneYear_intro
    (a : Award) (c : ComplaintText)
    (h : daysFromAwardMadeToConfirmationApplication a c ≤ daysInStatutoryOneYearAfterAward a c) :
    ConfirmationApplicationWithinOneYear a c := h



theorem confirmationApplicationUntimely_of_afterWindow
    (a : Award) (c : ComplaintText)
    (h : daysInStatutoryOneYearAfterAward a c < daysFromAwardMadeToConfirmationApplication a c) :
    ¬ ConfirmationApplicationWithinOneYear a c := by
  intro hle
  have : daysFromAwardMadeToConfirmationApplication a c ≤ daysInStatutoryOneYearAfterAward a c :=
    hle
  omega

theorem confirmationVenue_specified_intro
    (a : Award) (ag : ArbitrationAgreement) (c : ComplaintText)
    (h : AgreementSpecifiesCourt ag c) : ConfirmationVenue a ag c :=
  ConfirmationVenue.specified h

theorem confirmationVenue_districtOfAward_intro
    (a : Award) (ag : ArbitrationAgreement) (c : ComplaintText)
    (hNoCourt : ¬ AgreementSpecifiesCourt ag c)
    (hDistrict : AwardMadeWithinDistrictOfCourt a c) : ConfirmationVenue a ag c :=
  ConfirmationVenue.districtOfAward hNoCourt hDistrict

theorem adversePartyNoticeService_resident_intro
    (p : Person) (c : ComplaintText)
    (hRes : AdversePartyIsResidentOfDistrict p c)
    (hSrv : ServiceAsNoticeOfMotionInSameCourt p c) : AdversePartyNoticeService p c :=
  AdversePartyNoticeService.resident hRes hSrv

theorem adversePartyNoticeService_nonresident_intro
    (p : Person) (c : ComplaintText)
    (hNonRes : ¬ AdversePartyIsResidentOfDistrict p c)
    (hMarshal : NoticeServedByMarshalOnNonresident p c) : AdversePartyNoticeService p c :=
  AdversePartyNoticeService.nonresident hNonRes hMarshal

theorem confirmationOfAward_intro
    (p : Person) (a : Award) (ag : ArbitrationAgreement) (c : ComplaintText)
    (hConsent : PartiesAgreedJudgmentShallBeEnteredUponAward ag c)
    (hAward : AwardMade a c)
    (hApp : ApplicationForOrderConfirmingAwardFiled a c)
    (hTimely : ConfirmationApplicationWithinOneYear a c)
    (hVenue : ConfirmationVenue a ag c)
    (hNotice : NoticeOfConfirmationApplicationServedOnAdverseParty a c)
    (hService : AdversePartyNoticeService p c)
    (hNotDisturbed : ¬ AwardVacatedModifiedOrCorrected a c) :
    ConfirmationOfAward p a ag c :=
  ⟨hConsent, hAward, hApp, hTimely, hVenue, hNotice, hService, hNotDisturbed⟩



theorem vacaturGround_corruption_intro
    (a : Award) (c : ComplaintText)
    (h : AwardProcuredByCorruptionFraudOrUndueMeans a c) : VacaturGround a c :=
  VacaturGround.corruption h

theorem vacaturGround_partiality_intro
    (a : Award) (c : ComplaintText)
    (h : EvidentPartialityOrCorruptionInArbitrators a c) : VacaturGround a c :=
  VacaturGround.partiality h

theorem vacaturGround_misconduct_intro
    (a : Award) (c : ComplaintText)
    (h : ArbitratorMisconductRefusingPostponementOrEvidence a c) : VacaturGround a c :=
  VacaturGround.misconduct h

theorem vacaturGround_excessOfPowers_intro
    (a : Award) (c : ComplaintText)
    (h : ArbitratorsExceededOrImperfectlyExecutedPowers a c) : VacaturGround a c :=
  VacaturGround.excessOfPowers h

theorem orderVacatingAward_intro
    (a : Award) (c : ComplaintText)
    (hAward : AwardMade a c)
    (hVenue : AwardMadeWithinDistrictOfCourt a c)
    (hApp : ApplicationToVacateAwardMade a c)
    (hGround : VacaturGround a c) : OrderVacatingAward a c :=
  ⟨hAward, hVenue, hApp, hGround⟩

theorem rehearingDirection_intro
    (a : Award) (c : ComplaintText)
    (hVac : OrderVacatingAward a c)
    (hTime : ¬ TimeForMakingAwardUnderAgreementExpired a c)
    (hDir : CourtDirectedRehearingByArbitrators a c) : RehearingDirection a c :=
  ⟨hVac, hTime, hDir⟩

theorem thirdPartyVacaturUnderSection580_intro
    (p : Person) (a : Award) (c : ComplaintText)
    (h580 : AwardIssuedPursuantToSection580OfTitle5 a c)
    (hVenue : AwardMadeWithinDistrictOfCourt a c)
    (hNonParty : ApplicantNonPartyAdverselyAffectedOrAggrieved p c)
    (hInconsistent : ArbitrationClearlyInconsistentWithSection572Factors a c) :
    ThirdPartyVacaturUnderSection580 p a c :=
  ⟨h580, hVenue, hNonParty, hInconsistent⟩



theorem modificationGround_miscalculation_intro
    (a : Award) (c : ComplaintText)
    (h : EvidentMaterialMiscalculationOrMistakeInDescription a c) : ModificationGround a c :=
  ModificationGround.miscalculation h

theorem modificationGround_matterNotSubmitted_intro
    (a : Award) (c : ComplaintText)
    (hNotSubmitted : AwardUponMatterNotSubmitted a c)
    (hAffectsMerits : ¬ MatterNotAffectingMeritsOfDecision a c) : ModificationGround a c :=
  ModificationGround.matterNotSubmitted hNotSubmitted hAffectsMerits

theorem modificationGround_imperfectForm_intro
    (a : Award) (c : ComplaintText)
    (h : AwardImperfectInFormNotAffectingMerits a c) : ModificationGround a c :=
  ModificationGround.imperfectForm h

theorem orderModifyingAward_intro
    (a : Award) (c : ComplaintText)
    (hAward : AwardMade a c)
    (hVenue : AwardMadeWithinDistrictOfCourt a c)
    (hApp : ApplicationToModifyOrCorrectAwardMade a c)
    (hGround : ModificationGround a c) : OrderModifyingAward a c :=
  ⟨hAward, hVenue, hApp, hGround⟩





theorem vacaturNoticeWithinThreeMonths_intro
    (a : Award) (c : ComplaintText)
    (h : daysFromAwardFilingToVacaturNoticeService a c ≤
          daysInStatutoryThreeMonthsAfterAwardFiling a c) :
    VacaturNoticeWithinThreeMonths a c := h



theorem vacaturNoticeUntimely_of_afterWindow
    (a : Award) (c : ComplaintText)
    (h : daysInStatutoryThreeMonthsAfterAwardFiling a c <
          daysFromAwardFilingToVacaturNoticeService a c) :
    ¬ VacaturNoticeWithinThreeMonths a c := by
  intro hle
  have : daysFromAwardFilingToVacaturNoticeService a c ≤
      daysInStatutoryThreeMonthsAfterAwardFiling a c := hle
  omega

theorem timelyVacaturNotice_intro
    (p : Person) (a : Award) (c : ComplaintText)
    (hFiled : AwardFiledOrDelivered a c)
    (hServed : NoticeOfVacaturMotionServedOnAdverseParty a c)
    (hService : AdversePartyNoticeService p c)
    (hTimely : VacaturNoticeWithinThreeMonths a c) : TimelyVacaturNotice p a c :=
  ⟨hFiled, hServed, hService, hTimely⟩

theorem stayOfAwardEnforcementPendingMotion_intro
    (p : Person) (a : Award) (c : ComplaintText)
    (hNotice : TimelyVacaturNotice p a c)
    (hOrder : OrderStayingProceedingsToEnforceAwardServedWithNotice a c) :
    StayOfAwardEnforcementPendingMotion p a c :=
  ⟨hNotice, hOrder⟩



theorem papersFiledOnMotion_intro
    (a : Award) (c : ComplaintText)
    (hAgr : MovingPartyFiledAgreementAppointmentAndExtensions a c)
    (hAward : MovingPartyFiledAward a c)
    (hNotices : MovingPartyFiledNoticesAffidavitsAndOrders a c)
    (hAtTime : PapersFiledAtTimeOrderFiledForEntryOfJudgment a c) :
    PapersFiledOnMotion a c :=
  ⟨hAgr, hAward, hNotices, hAtTime⟩

theorem orderOnAward_confirming_intro
    (p : Person) (a : Award) (ag : ArbitrationAgreement) (c : ComplaintText)
    (h : ConfirmationOfAward p a ag c) : OrderOnAward p a ag c :=
  OrderOnAward.confirming h

theorem orderOnAward_modifying_intro
    (p : Person) (a : Award) (ag : ArbitrationAgreement) (c : ComplaintText)
    (h : OrderModifyingAward a c) : OrderOnAward p a ag c :=
  OrderOnAward.modifying h

theorem judgmentOnAward_intro
    (p : Person) (a : Award) (ag : ArbitrationAgreement) (c : ComplaintText)
    (hOrder : OrderOnAward p a ag c)
    (hPapers : PapersFiledOnMotion a c)
    (hDocketed : JudgmentDocketedAsIfRenderedInAnAction a c) : JudgmentOnAward p a ag c :=
  ⟨hOrder, hPapers, hDocketed⟩



theorem actOfStateNotAGroundForRefusal_intro
    (p : Person) (c : ComplaintText)
    (h : ¬ RefusalRestedOnActOfStateDoctrine p c) : ActOfStateNotAGroundForRefusal p c :=
  fun _ => h



theorem appealableOrder_refusingStay_intro
    (o : CourtOrder) (c : ComplaintText)
    (h : OrderRefusingStayUnderSection3 o c) : AppealableOrder o c :=
  AppealableOrder.refusingStay h

theorem appealableOrder_denyingCompelPetition_intro
    (o : CourtOrder) (c : ComplaintText)
    (h : OrderDenyingPetitionUnderSection4 o c) : AppealableOrder o c :=
  AppealableOrder.denyingCompelPetition h

theorem appealableOrder_denyingSection206_intro
    (o : CourtOrder) (c : ComplaintText)
    (h : OrderDenyingApplicationUnderSection206 o c) : AppealableOrder o c :=
  AppealableOrder.denyingSection206 h

theorem appealableOrder_confirmationRuling_intro
    (o : CourtOrder) (c : ComplaintText)
    (h : OrderConfirmingOrDenyingConfirmationOfAward o c) : AppealableOrder o c :=
  AppealableOrder.confirmationRuling h

theorem appealableOrder_vacaturOrModification_intro
    (o : CourtOrder) (c : ComplaintText)
    (h : OrderModifyingCorrectingOrVacatingAward o c) : AppealableOrder o c :=
  AppealableOrder.vacaturOrModification h

theorem appealableOrder_injunctionAgainstArbitration_intro
    (o : CourtOrder) (c : ComplaintText)
    (h : InterlocutoryOrderEnjoiningArbitration o c) : AppealableOrder o c :=
  AppealableOrder.injunctionAgainstArbitration h

theorem appealableOrder_finalDecision_intro
    (o : CourtOrder) (c : ComplaintText)
    (h : FinalDecisionWithRespectToArbitration o c) : AppealableOrder o c :=
  AppealableOrder.finalDecision h

theorem nonAppealableInterlocutoryOrder_grantingStay_intro
    (o : CourtOrder) (c : ComplaintText)
    (h : InterlocutoryOrderGrantingStayUnderSection3 o c) :
    NonAppealableInterlocutoryOrder o c :=
  NonAppealableInterlocutoryOrder.grantingStay h

theorem nonAppealableInterlocutoryOrder_directingArbitration_intro
    (o : CourtOrder) (c : ComplaintText)
    (h : InterlocutoryOrderDirectingArbitrationUnderSection4 o c) :
    NonAppealableInterlocutoryOrder o c :=
  NonAppealableInterlocutoryOrder.directingArbitration h

theorem nonAppealableInterlocutoryOrder_compellingUnder206_intro
    (o : CourtOrder) (c : ComplaintText)
    (h : InterlocutoryOrderCompellingArbitrationUnderSection206 o c) :
    NonAppealableInterlocutoryOrder o c :=
  NonAppealableInterlocutoryOrder.compellingUnder206 h

theorem nonAppealableInterlocutoryOrder_refusingToEnjoin_intro
    (o : CourtOrder) (c : ComplaintText)
    (h : InterlocutoryOrderRefusingToEnjoinArbitration o c) :
    NonAppealableInterlocutoryOrder o c :=
  NonAppealableInterlocutoryOrder.refusingToEnjoin h

theorem permittedAppeal_intro
    (o : CourtOrder) (c : ComplaintText)
    (hAppealable : AppealableOrder o c)
    (hNotice : NoticeOfAppealFiled o c) : PermittedAppeal o c :=
  ⟨hAppealable, hNotice⟩

theorem interlocutoryAppealBarred_intro
    (o : CourtOrder) (c : ComplaintText)
    (hKind : NonAppealableInterlocutoryOrder o c)
    (hNoCert : ¬ Section1292bCertificationObtained o c) : InterlocutoryAppealBarred o c :=
  ⟨hKind, hNoCert⟩

theorem permittedInterlocutoryAppealByCertification_intro
    (o : CourtOrder) (c : ComplaintText)
    (hKind : NonAppealableInterlocutoryOrder o c)
    (hCert : Section1292bCertificationObtained o c)
    (hNotice : NoticeOfAppealFiled o c) :
    PermittedInterlocutoryAppealByCertification o c :=
  ⟨hKind, hCert, hNotice⟩




theorem interlocutoryAppealBarred_excludes_certifiedAppeal
    (o : CourtOrder) (c : ComplaintText)
    (hBar : InterlocutoryAppealBarred o c) :
    ¬ PermittedInterlocutoryAppealByCertification o c := by
  intro hCert
  exact hBar.noCertification hCert.certification



theorem reachable_initial_intro
    (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText)
    (h : EnforceableArbitrationAgreement ag c) : Reachable p c State.AgreementFormed :=
  Reachable.initial ag h

theorem reachable_step_intro
    (p : Person) (c : ComplaintText) (s t : State) (tr : Transition)
    (hReach : Reachable p c s) (hFrom : tr.fromState = s) (hTo : tr.toState = t)
    (hGuard : tr.guard) : Reachable p c t :=
  Reachable.step s t tr hReach hFrom hTo hGuard


theorem reachable_stayGranted_of_stay
    (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText)
    (hReach : Reachable p c State.SuitPending)
    (hStay : StayOfProceedings p ag c) : Reachable p c State.StayGranted :=
  Reachable.step State.SuitPending State.StayGranted (stayTransition p ag c) hReach rfl rfl hStay


theorem reachable_awardConfirmed_of_confirmation
    (p : Person) (a : Award) (ag : ArbitrationAgreement) (c : ComplaintText)
    (hReach : Reachable p c State.AwardMade)
    (hConf : ConfirmationOfAward p a ag c) : Reachable p c State.AwardConfirmed :=
  Reachable.step State.AwardMade State.AwardConfirmed (confirmationTransition p a ag c)
    hReach rfl rfl hConf

end Proving.USC.T09.Ch1.Procedure
