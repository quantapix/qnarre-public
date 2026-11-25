import Proving.USC.T09.Ch1.Elements.Types
import Proving.USC.T09.Ch1.Elements.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false













namespace Proving.USC.T09.Ch1.Elements

open Proving.USC.Common





structure ExcludedWorkerContract (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  employmentOrWork : IsContractOfEmploymentOrWork ag c
  transportationClass : WorkerClassEngagedInInterstateTransportation ag c


abbrev IsExcludedTransportationWorkerContract (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop := ExcludedWorkerContract ag c





inductive CoveredArbitrationAgreement (ag : ArbitrationAgreement) (tx : Transaction)
    (c : ComplaintText) : Prop where
  | maritime (hTx : IsMaritimeTransaction tx c)
             (hIn : ProvisionContainedInTransaction ag tx c)
  | commerce (hTx : TransactionEngagedInInterstateCommerce tx c)
             (hEv : ContractEvidencesTransaction ag tx c)



inductive ArbitrableControversy (d : Controversy) (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop where
  | thereafter (hTime : ControversyArisingAfterAgreement d ag c)
               (hScope : ControversyArisesOutOfContractOrRefusal d ag c)
  | existing (hSubmit : ExistingControversySubmittedInWriting d ag c)
             (hScope : ControversyArisesOutOfContractOrRefusal d ag c)


structure Section2 (ag : ArbitrationAgreement) (tx : Transaction) (d : Controversy)
    (c : ComplaintText) : Prop where
  written : IsWrittenArbitrationProvision ag c
  covered : CoveredArbitrationAgreement ag tx c
  arbitrable : ArbitrableControversy d ag c
  notExcludedWorker : ¬ IsExcludedTransportationWorkerContract ag c
  noRevocationGrounds : ¬ GroundsForRevocationOfAnyContract ag c
  noChapterFourInvalidation : ¬ ChapterFourInvalidationElected ag c




structure Section3 (s : Suit) (ag : ArbitrationAgreement) (app : CourtApplication)
    (c : ComplaintText) : Prop where
  pending : SuitPendingInUnitedStatesCourt s c
  referable : IssueInSuitReferableToArbitration s ag c
  onApplication : StayApplicationMadeByParty app s c
  applicantNotInDefault : ¬ ApplicantInDefaultInProceedingWithArbitration app c





def FiveDaysWrittenNoticeGiven (app : CourtApplication) (c : ComplaintText) : Prop :=
  5 ≤ daysOfWrittenNoticeServedOnDefaultingParty app c




inductive CompelArbitrationBasis (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  | uncontested (h : ¬ MakingOfAgreementOrFailureToComplyInIssue ag c)
  | tried (hMade : TrierFoundWrittenArbitrationAgreementMade ag c)
          (hDefault : TrierFoundDefaultInProceedingUnderAgreement ag c)


structure Section4 (p : Person) (ag : ArbitrationAgreement) (d : Controversy)
    (app : CourtApplication) (c : ComplaintText) : Prop where
  aggrieved : AggrievedByFailureNeglectOrRefusalToArbitrate p ag c
  written : IsWrittenArbitrationProvision ag c
  jurisdiction : FederalJurisdictionalNexusSaveForAgreement d c
  fiveDaysNotice : FiveDaysWrittenNoticeGiven app c
  serviceManner : NoticeServedUnderFederalRules app c
  basis : CompelArbitrationBasis ag c
  venue : HearingWithinDistrictOfPetition app c




inductive ArbitratorAppointmentTrigger (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop where
  | noMethodProvided (h : ¬ AgreementProvidesArbitratorAppointmentMethod ag c)
  | partyFailedToAvail (h : PartyFailedToAvailOfAppointmentMethod ag c)
  | lapse (h : LapseInNamingArbitratorOrFillingVacancy ag c)


structure Section5 (ag : ArbitrationAgreement) (app : CourtApplication)
    (c : ComplaintText) : Prop where
  written : IsWrittenArbitrationProvision ag c
  trigger : ArbitratorAppointmentTrigger ag c
  onApplication : ApplicationByPartyToControversy app c



def SingleArbitratorDefaultApplies (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  ¬ AgreementProvidesNumberOfArbitrators ag c




structure Section6 (app : CourtApplication) (c : ComplaintText) : Prop where
  asMotion : ApplicationMadeAndHeardAsMotion app c
  noExpressException : ¬ TitleExpresslyProvidesOtherwiseForApplication app c




structure Section7 (sm : ArbitralSummons) (p : Person) (app : CourtApplication)
    (c : ComplaintText) : Prop where
  issuedInWriting : SummonsIssuedInWritingByArbitratorMajority sm c
  signed : SummonsSignedByArbitratorMajority sm c
  servedAsSubpoena : SummonsDirectedAndServedAsSubpoena sm c
  material : EvidenceSoughtMaterialToTheCase sm c
  disobedience : SummonedPersonRefusedOrNeglectedToObey sm p c
  venue : PetitionInDistrictWhereArbitratorsSitting app c





structure Section8 (p : Person) (s : Suit) (c : ComplaintText) : Prop where
  admiralty : CauseOtherwiseJusticiableInAdmiralty s c
  aggrieved : PartyClaimingToBeAggrieved p s c
  libelAndSeizure : ProceedingBegunByLibelAndSeizure s c





def WithinLimitationsOneYearOfAward (app : CourtApplication) (c : ComplaintText) : Prop :=
  daysFromAwardMadeToConfirmationApplication app c ≤ 365



inductive ConfirmationForum (app : CourtApplication) (ag : ArbitrationAgreement)
    (aw : Award) (c : ComplaintText) : Prop where
  | specified (h : AppliedToCourtSpecifiedInAgreement app ag c)
  | awardDistrict (hNone : ¬ AgreementSpecifiesConfirmingCourt ag c)
                  (h : AppliedToDistrictWhereAwardMade app aw c)


structure Section9 (p : Person) (ag : ArbitrationAgreement) (aw : Award)
    (app : CourtApplication) (c : ComplaintText) : Prop where
  judgmentClause : AgreementProvidesForJudgmentUponAward ag c
  byParty : ApplicantIsPartyToTheArbitration p c
  timely : WithinLimitationsOneYearOfAward app c
  forum : ConfirmationForum app ag aw c
  noticeServed : NoticeOfApplicationServedOnAdverseParty app c
  notUnsettled : ¬ AwardVacatedModifiedOrCorrected aw c




structure RefusalToPostponeGround (aw : Award) (c : ComplaintText) : Prop where
  refused : ArbitratorsRefusedToPostponeHearing aw c
  sufficientCause : SufficientCauseForPostponementShown aw c


structure OtherMisbehaviorGround (aw : Award) (c : ComplaintText) : Prop where
  misbehavior : OtherMisbehaviorByArbitrators aw c
  prejudice : PartyRightsPrejudicedByMisbehavior aw c



structure ImperfectExecutionGround (aw : Award) (c : ComplaintText) : Prop where
  imperfect : ArbitratorsImperfectlyExecutedTheirPowers aw c
  noProperAward : NoMutualFinalDefiniteAwardMade aw c


inductive VacaturGround10a (aw : Award) (c : ComplaintText) : Prop where
  | procurement (h : AwardProcuredByCorruptionFraudOrUndueMeans aw c)
  | partiality (h : EvidentPartialityOrCorruptionInArbitrators aw c)
  | refusalToPostpone (h : RefusalToPostponeGround aw c)
  | refusalToHearEvidence (h : ArbitratorsRefusedToHearMaterialEvidence aw c)
  | otherMisbehavior (h : OtherMisbehaviorGround aw c)
  | exceededPowers (h : ArbitratorsExceededTheirPowers aw c)
  | imperfectExecution (h : ImperfectExecutionGround aw c)


structure Section10a (p : Person) (aw : Award) (app : CourtApplication)
    (c : ComplaintText) : Prop where
  ground : VacaturGround10a aw c
  byParty : ApplicantIsPartyToTheArbitration p c
  venue : ApplicationInDistrictWhereAwardMade app aw c


structure Section10b (aw : Award) (c : ComplaintText) : Prop where
  vacated : AwardVacatedByCourt aw c
  timeNotExpired : ¬ TimeForMakingAwardUnderAgreementExpired aw c



structure Section10c (p : Person) (aw : Award) (app : CourtApplication)
    (c : ComplaintText) : Prop where
  agencyAward : AwardIssuedPursuantToSection580OfTitle5 aw c
  notAParty : ¬ ApplicantIsPartyToTheArbitration p c
  aggrieved : AdverselyAffectedOrAggrievedByAward p aw c
  inconsistent : ClearlyInconsistentWithSection572Factors aw c
  venue : ApplicationInDistrictWhereAwardMade app aw c





structure UnsubmittedMatterGround (aw : Award) (c : ComplaintText) : Prop where
  unsubmitted : AwardedUponMatterNotSubmitted aw c
  exceptionInapplicable : ¬ UnsubmittedMatterDoesNotAffectMerits aw c



structure FormImperfectionGround (aw : Award) (c : ComplaintText) : Prop where
  imperfectForm : AwardImperfectInMatterOfForm aw c
  meritsUnaffected : ¬ FormImperfectionAffectsMerits aw c


inductive ModificationGround11 (aw : Award) (c : ComplaintText) : Prop where
  | miscalculation (h : EvidentMaterialMiscalculationOfFigures aw c)
  | mistakenDescription (h : EvidentMaterialMistakeInDescription aw c)
  | unsubmittedMatter (h : UnsubmittedMatterGround aw c)
  | formImperfection (h : FormImperfectionGround aw c)


structure Section11 (p : Person) (aw : Award) (app : CourtApplication)
    (c : ComplaintText) : Prop where
  ground : ModificationGround11 aw c
  byParty : ApplicantIsPartyToTheArbitration p c
  venue : ApplicationInDistrictWhereAwardMade app aw c





def WithinLimitationsThreeMonthsOfAward (app : CourtApplication) (c : ComplaintText) : Prop :=
  daysFromAwardFiledToNoticeService app c ≤ 90



inductive Section12ServiceManner (app : CourtApplication) (c : ComplaintText) : Prop where
  | resident (hRes : AdversePartyResidesInDistrictWhereAwardMade app c)
             (h : ServedAsNoticeOfMotionInSameCourt app c)
  | nonresident (hNonRes : ¬ AdversePartyResidesInDistrictWhereAwardMade app c)
                (h : ServedByMarshalOfDistrictWhereFound app c)


structure Section12 (app : CourtApplication) (c : ComplaintText) : Prop where
  noticed : NoticeOfMotionToVacateModifyOrCorrectServed app c
  timely : WithinLimitationsThreeMonthsOfAward app c
  serviceManner : Section12ServiceManner app c



structure Section12StayOrder (app : CourtApplication) (c : ComplaintText) : Prop where
  motionNoticed : Section12 app c
  competentJudge : JudgeCompetentToStayProceedingsInSameCourt app c
  servedWithNotice : StayOrderServedWithNoticeOfMotion app c




structure Section13 (app : CourtApplication) (c : ComplaintText) : Prop where
  moving : MovingForOrderConfirmingModifyingOrCorrecting app c
  atEntryOfJudgment : PapersFiledWhenOrderFiledForEntryOfJudgment app c
  agreementPapers : FiledAgreementAppointmentAndExtensions app c
  award : FiledTheAward app c
  applicationPapers : FiledApplicationPapersAndCourtOrders app c



structure Section13Judgment (app : CourtApplication) (c : ComplaintText) : Prop where
  filings : Section13 app c
  docketed : JudgmentDocketedAsIfRenderedInAnAction app c






def Section14TitleApplies (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  1926 ≤ yearOfContractFormation ag c




inductive Section15Relief (r : ReliefRequest) (c : ComplaintText) : Prop where
  | enforcement (h : SeeksEnforcementOfArbitralAgreement r c)
  | confirmation (h : SeeksConfirmationOfArbitralAward r c)
  | execution (h : SeeksExecutionUponJudgmentConfirmingAward r c)



structure Section15 (r : ReliefRequest) (c : ComplaintText) : Prop where
  relief : Section15Relief r c
  actOfStateGround : RefusalRestsOnActOfStateDoctrine r c




inductive AppealableOrder16a (o : CourtOrder) (c : ComplaintText) : Prop where
  | refusingStay (h : OrderRefusingStayUnderSection3 o c)
  | denyingSection4Petition (h : OrderDenyingPetitionUnderSection4 o c)
  | denyingSection206Application (h : OrderDenyingApplicationUnderSection206 o c)
  | confirmationRuling (h : OrderConfirmingOrDenyingConfirmationOfAward o c)
  | modifyingOrVacating (h : OrderModifyingCorrectingOrVacatingAward o c)
  | injunctionAgainstArbitration
      (h : OrderGrantingContinuingOrModifyingInjunctionAgainstArbitration o c)
      (hSubject : ArbitrationSubjectToThisTitle o c)
  | finalDecision (h : FinalDecisionWithRespectToArbitration o c)
                  (hSubject : ArbitrationSubjectToThisTitle o c)


inductive BarredInterlocutoryOrder16b (o : CourtOrder) (c : ComplaintText) : Prop where
  | grantingStay (hInt : OrderIsInterlocutory o c) (h : OrderGrantingStayUnderSection3 o c)
  | directingArbitration (hInt : OrderIsInterlocutory o c)
                         (h : OrderDirectingArbitrationUnderSection4 o c)
  | compellingSection206 (hInt : OrderIsInterlocutory o c)
                         (h : OrderCompellingArbitrationUnderSection206 o c)
  | refusingToEnjoin (hInt : OrderIsInterlocutory o c)
                     (h : OrderRefusingToEnjoinArbitration o c)
                     (hSubject : ArbitrationSubjectToThisTitle o c)





inductive AppealAvailable16 (o : CourtOrder) (c : ComplaintText) : Prop where
  | underSubsectionA (h : AppealableOrder16a o c)
                     (hNotBarred : ¬ BarredInterlocutoryOrder16b o c)
  | certified (hBarred : BarredInterlocutoryOrder16b o c)
              (hCert : CertifiedUnderSection1292bOfTitle28 o c)





structure ValidMotionToCompelArbitration (p : Person) (ag : ArbitrationAgreement)
    (tx : Transaction) (d : Controversy) (app : CourtApplication)
    (c : ComplaintText) : Prop where
  enforceable : Section2 ag tx d c
  titleApplies : Section14TitleApplies ag c
  petition : Section4 p ag d app c


structure ValidMotionToStayLitigation (ag : ArbitrationAgreement) (tx : Transaction)
    (d : Controversy) (s : Suit) (app : CourtApplication) (c : ComplaintText) : Prop where
  enforceable : Section2 ag tx d c
  titleApplies : Section14TitleApplies ag c
  stay : Section3 s ag app c


structure ValidApplicationToConfirmAward (p : Person) (ag : ArbitrationAgreement)
    (aw : Award) (app : CourtApplication) (c : ComplaintText) : Prop where
  confirmation : Section9 p ag aw app c
  filings : Section13 app c


structure ValidMotionToVacateAward (p : Person) (aw : Award) (app : CourtApplication)
    (c : ComplaintText) : Prop where
  grounds : Section10a p aw app c
  timelyNotice : Section12 app c



structure ValidMotionToModifyAward (p : Person) (aw : Award) (app : CourtApplication)
    (c : ComplaintText) : Prop where
  grounds : Section11 p aw app c
  timelyNotice : Section12 app c
  filings : Section13 app c

end Proving.USC.T09.Ch1.Elements
