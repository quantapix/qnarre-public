







import Proving.USC.T09.Ch1.Procedure.Types
import Proving.USC.T09.Ch1.Procedure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T09.Ch1.Procedure

open Proving.USC.Common





inductive CoveredTransaction (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  | maritime : IsMaritimeTransaction ag c → CoveredTransaction ag c
  | commerce : InvolvesCommerce ag c → CoveredTransaction ag c




inductive WrittenArbitrationUndertaking (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  | provision  : WrittenArbitrationProvisionInContract ag c → WrittenArbitrationUndertaking ag c
  | submission : AgreementToSubmitExistingControversy ag c → WrittenArbitrationUndertaking ag c





def ContractWithinTemporalScope (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  1926 ≤ yearContractMade ag c






structure EnforceableArbitrationAgreement (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  covered             : CoveredTransaction ag c
  inWriting           : WrittenArbitrationUndertaking ag c
  notExemptWorker     : ¬ IsExemptTransportationWorkerContract ag c
  noRevocationGrounds : ¬ GroundsForRevocationExist ag c
  notBarredByChapter4 : ¬ Chapter4RendersAgreementUnenforceable ag c
  temporalScope       : ContractWithinTemporalScope ag c





structure StayOfProceedings (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  suitPending    : SuitPendingInUnitedStatesCourt p c
  referable      : IssueReferableToArbitration p c
  agreement      : EnforceableArbitrationAgreement ag c
  courtSatisfied : CourtSatisfiedIssueReferable p c
  application    : StayApplicationMadeByParty p c
  notInDefault   : ¬ ApplicantInDefaultInProceedingWithArbitration p c






def NoticeOfCompelApplicationTimely (p : Person) (c : ComplaintText) : Prop :=
  5 ≤ daysNoticeBeforeReturnDay p c



structure ValidCompelNotice (p : Person) (c : ComplaintText) : Prop where
  served : NoticeOfCompelApplicationServedOnPartyInDefault p c
  manner : ServiceMadeUnderFederalRulesOfCivilProcedure p c
  timely : NoticeOfCompelApplicationTimely p c



structure OrderCompellingArbitration
    (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  aggrieved    : PartyAggrievedByFailureNeglectOrRefusalToArbitrate p c
  petition     : PetitionToCompelArbitrationFiled p c
  jurisdiction : CourtHasSubjectMatterJurisdictionUnderTitle28 p c
  agreement    : EnforceableArbitrationAgreement ag c
  notice       : ValidCompelNotice p c
  notInIssue   : ¬ MakingOfAgreementOrFailureToComplyInIssue p c
  venue        : HearingAndProceedingsWithinDistrictOfPetition p c
  ordered      : CourtOrderedPartiesToProceedToArbitration p c



inductive SummaryTrialByCourt (p : Person) (c : ComplaintText) : Prop where
  | noJuryDemand : ¬ JuryTrialDemandedOnOrBeforeReturnDay p c → SummaryTrialByCourt p c
  | admiralty    : MatterWithinAdmiraltyJurisdiction p c → SummaryTrialByCourt p c


structure CourtDeterminedCompelIssue (p : Person) (c : ComplaintText) : Prop where
  inIssue : MakingOfAgreementOrFailureToComplyInIssue p c
  notice  : ValidCompelNotice p c
  trier   : SummaryTrialByCourt p c




structure JuryDeterminedCompelOrder
    (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  aggrieved    : PartyAggrievedByFailureNeglectOrRefusalToArbitrate p c
  petition     : PetitionToCompelArbitrationFiled p c
  jurisdiction : CourtHasSubjectMatterJurisdictionUnderTitle28 p c
  agreement    : EnforceableArbitrationAgreement ag c
  notice       : ValidCompelNotice p c
  inIssue      : MakingOfAgreementOrFailureToComplyInIssue p c
  notAdmiralty : ¬ MatterWithinAdmiraltyJurisdiction p c
  demand       : JuryTrialDemandedOnOrBeforeReturnDay p c
  verdict      : JuryFoundAgreementInWritingAndDefault p c
  ordered      : CourtOrderedPartiesToProceedToArbitration p c



structure CompelProceedingDismissed (p : Person) (c : ComplaintText) : Prop where
  inIssue        : MakingOfAgreementOrFailureToComplyInIssue p c
  demand         : JuryTrialDemandedOnOrBeforeReturnDay p c
  verdictAgainst : ¬ JuryFoundAgreementInWritingAndDefault p c





structure ContractualAppointmentGoverns (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  method   : AgreementProvidesMethodOfAppointingArbitrator ag c
  followed : AppointmentMethodFollowed ag c




inductive CourtAppointmentTrigger (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  | noMethod :
      ¬ AgreementProvidesMethodOfAppointingArbitrator ag c → CourtAppointmentTrigger ag c
  | failedToAvail :
      AgreementProvidesMethodOfAppointingArbitrator ag c →
      PartyFailedToAvailOfAppointmentMethod ag c → CourtAppointmentTrigger ag c
  | lapse :
      LapseInNamingArbitratorOrFillingVacancy ag c → CourtAppointmentTrigger ag c



structure CourtAppointmentOfArbitrator
    (p : Person) (ar : Arbitrator) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  trigger     : CourtAppointmentTrigger ag c
  application : ApplicationForCourtAppointmentMade p c
  appointed   : CourtDesignatedAndAppointedArbitrator ar c



def SingleArbitratorDefault (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  ¬ AgreementProvidesForMultipleArbitrators ag c





structure ApplicationHeardAsMotion (p : Person) (c : ComplaintText) : Prop where
  asMotion           : ApplicationMadeAndHeardAsMotion p c
  noExpressException : ¬ ChapterExpresslyProvidesOtherManner p c





structure ArbitralSummons (w : Person) (c : ComplaintText) : Prop where
  summoned : ArbitratorsSummonedWitnessInWriting w c
  signed   : SummonsSignedByArbitratorsOrMajority w c
  served   : SummonsDirectedToPersonAndServedAsSubpoena w c



structure OrderCompellingWitnessAttendance (w : Person) (c : ComplaintText) : Prop where
  summons  : ArbitralSummons w c
  refusal  : SummonedPersonRefusedOrNeglectedToObey w c
  petition : PetitionToCompelWitnessAttendanceFiled w c
  venue    : ArbitratorsSittingInDistrictOfCourt w c






structure AdmiraltyCommencement
    (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  justiciable     : CauseOfActionJusticiableInAdmiralty p c
  libelAndSeizure : ProceedingBegunByLibelAndSeizure p c
  agreement       : EnforceableArbitrationAgreement ag c
  directed        : CourtOrderedPartiesToProceedToArbitration p c
  retained        : CourtRetainedJurisdictionToEnterDecreeUponAward p c






def ConfirmationApplicationWithinOneYear (a : Award) (c : ComplaintText) : Prop :=
  daysFromAwardMadeToConfirmationApplication a c ≤ daysInStatutoryOneYearAfterAward a c




inductive ConfirmationVenue (a : Award) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  | specified :
      AgreementSpecifiesCourt ag c → ConfirmationVenue a ag c
  | districtOfAward :
      ¬ AgreementSpecifiesCourt ag c → AwardMadeWithinDistrictOfCourt a c →
      ConfirmationVenue a ag c



inductive AdversePartyNoticeService (p : Person) (c : ComplaintText) : Prop where
  | resident :
      AdversePartyIsResidentOfDistrict p c → ServiceAsNoticeOfMotionInSameCourt p c →
      AdversePartyNoticeService p c
  | nonresident :
      ¬ AdversePartyIsResidentOfDistrict p c → NoticeServedByMarshalOnNonresident p c →
      AdversePartyNoticeService p c




structure ConfirmationOfAward
    (p : Person) (a : Award) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  consented    : PartiesAgreedJudgmentShallBeEnteredUponAward ag c
  awardMade    : AwardMade a c
  application  : ApplicationForOrderConfirmingAwardFiled a c
  timely       : ConfirmationApplicationWithinOneYear a c
  venue        : ConfirmationVenue a ag c
  noticeServed : NoticeOfConfirmationApplicationServedOnAdverseParty a c
  service      : AdversePartyNoticeService p c
  notDisturbed : ¬ AwardVacatedModifiedOrCorrected a c




inductive VacaturGround (a : Award) (c : ComplaintText) : Prop where
  | corruption      : AwardProcuredByCorruptionFraudOrUndueMeans a c → VacaturGround a c
  | partiality      : EvidentPartialityOrCorruptionInArbitrators a c → VacaturGround a c
  | misconduct      : ArbitratorMisconductRefusingPostponementOrEvidence a c → VacaturGround a c
  | excessOfPowers  : ArbitratorsExceededOrImperfectlyExecutedPowers a c → VacaturGround a c



structure OrderVacatingAward (a : Award) (c : ComplaintText) : Prop where
  awardMade   : AwardMade a c
  venue       : AwardMadeWithinDistrictOfCourt a c
  application : ApplicationToVacateAwardMade a c
  ground      : VacaturGround a c



structure RehearingDirection (a : Award) (c : ComplaintText) : Prop where
  vacated        : OrderVacatingAward a c
  timeNotExpired : ¬ TimeForMakingAwardUnderAgreementExpired a c
  directed       : CourtDirectedRehearingByArbitrators a c



structure ThirdPartyVacaturUnderSection580
    (p : Person) (a : Award) (c : ComplaintText) : Prop where
  underSection580 : AwardIssuedPursuantToSection580OfTitle5 a c
  venue           : AwardMadeWithinDistrictOfCourt a c
  nonPartyApplicant : ApplicantNonPartyAdverselyAffectedOrAggrieved p c
  inconsistent    : ArbitrationClearlyInconsistentWithSection572Factors a c






inductive ModificationGround (a : Award) (c : ComplaintText) : Prop where
  | miscalculation :
      EvidentMaterialMiscalculationOrMistakeInDescription a c → ModificationGround a c
  | matterNotSubmitted :
      AwardUponMatterNotSubmitted a c → ¬ MatterNotAffectingMeritsOfDecision a c →
      ModificationGround a c
  | imperfectForm :
      AwardImperfectInFormNotAffectingMerits a c → ModificationGround a c


structure OrderModifyingAward (a : Award) (c : ComplaintText) : Prop where
  awardMade   : AwardMade a c
  venue       : AwardMadeWithinDistrictOfCourt a c
  application : ApplicationToModifyOrCorrectAwardMade a c
  ground      : ModificationGround a c






def VacaturNoticeWithinThreeMonths (a : Award) (c : ComplaintText) : Prop :=
  daysFromAwardFilingToVacaturNoticeService a c ≤ daysInStatutoryThreeMonthsAfterAwardFiling a c



structure TimelyVacaturNotice (p : Person) (a : Award) (c : ComplaintText) : Prop where
  awardFiled : AwardFiledOrDelivered a c
  served     : NoticeOfVacaturMotionServedOnAdverseParty a c
  service    : AdversePartyNoticeService p c
  timely     : VacaturNoticeWithinThreeMonths a c



structure StayOfAwardEnforcementPendingMotion
    (p : Person) (a : Award) (c : ComplaintText) : Prop where
  notice : TimelyVacaturNotice p a c
  order  : OrderStayingProceedingsToEnforceAwardServedWithNotice a c





structure PapersFiledOnMotion (a : Award) (c : ComplaintText) : Prop where
  agreementAndAppointments : MovingPartyFiledAgreementAppointmentAndExtensions a c
  award                    : MovingPartyFiledAward a c
  noticesAndOrders         : MovingPartyFiledNoticesAffidavitsAndOrders a c
  atTimeOfFiling           : PapersFiledAtTimeOrderFiledForEntryOfJudgment a c



inductive OrderOnAward
    (p : Person) (a : Award) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  | confirming : ConfirmationOfAward p a ag c → OrderOnAward p a ag c
  | modifying  : OrderModifyingAward a c → OrderOnAward p a ag c



structure JudgmentOnAward
    (p : Person) (a : Award) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  order    : OrderOnAward p a ag c
  papers   : PapersFiledOnMotion a c
  docketed : JudgmentDocketedAsIfRenderedInAnAction a c





def ActOfStateNotAGroundForRefusal (p : Person) (c : ComplaintText) : Prop :=
  EnforcementOrConfirmationOrExecutionSought p c → ¬ RefusalRestedOnActOfStateDoctrine p c





inductive AppealableOrder (o : CourtOrder) (c : ComplaintText) : Prop where
  | refusingStay              : OrderRefusingStayUnderSection3 o c → AppealableOrder o c
  | denyingCompelPetition     : OrderDenyingPetitionUnderSection4 o c → AppealableOrder o c
  | denyingSection206         : OrderDenyingApplicationUnderSection206 o c → AppealableOrder o c
  | confirmationRuling        : OrderConfirmingOrDenyingConfirmationOfAward o c → AppealableOrder o c
  | vacaturOrModification     : OrderModifyingCorrectingOrVacatingAward o c → AppealableOrder o c
  | injunctionAgainstArbitration : InterlocutoryOrderEnjoiningArbitration o c → AppealableOrder o c
  | finalDecision             : FinalDecisionWithRespectToArbitration o c → AppealableOrder o c



inductive NonAppealableInterlocutoryOrder (o : CourtOrder) (c : ComplaintText) : Prop where
  | grantingStay       : InterlocutoryOrderGrantingStayUnderSection3 o c →
                           NonAppealableInterlocutoryOrder o c
  | directingArbitration : InterlocutoryOrderDirectingArbitrationUnderSection4 o c →
                           NonAppealableInterlocutoryOrder o c
  | compellingUnder206 : InterlocutoryOrderCompellingArbitrationUnderSection206 o c →
                           NonAppealableInterlocutoryOrder o c
  | refusingToEnjoin   : InterlocutoryOrderRefusingToEnjoinArbitration o c →
                           NonAppealableInterlocutoryOrder o c


structure PermittedAppeal (o : CourtOrder) (c : ComplaintText) : Prop where
  appealable  : AppealableOrder o c
  noticeFiled : NoticeOfAppealFiled o c




structure InterlocutoryAppealBarred (o : CourtOrder) (c : ComplaintText) : Prop where
  barredKind      : NonAppealableInterlocutoryOrder o c
  noCertification : ¬ Section1292bCertificationObtained o c



structure PermittedInterlocutoryAppealByCertification
    (o : CourtOrder) (c : ComplaintText) : Prop where
  barredKind    : NonAppealableInterlocutoryOrder o c
  certification : Section1292bCertificationObtained o c
  noticeFiled   : NoticeOfAppealFiled o c





structure Transition where
  fromState : State
  toState   : State
  guard     : Prop


def stayTransition (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Transition :=
  { fromState := State.SuitPending, toState := State.StayGranted
    guard := StayOfProceedings p ag c }


def compelTransition (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Transition :=
  { fromState := State.CompelPetitionFiled, toState := State.ArbitrationOrdered
    guard := OrderCompellingArbitration p ag c }


def juryCompelTransition (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Transition :=
  { fromState := State.CompelPetitionFiled, toState := State.ArbitrationOrdered
    guard := JuryDeterminedCompelOrder p ag c }



def dismissalTransition (p : Person) (c : ComplaintText) : Transition :=
  { fromState := State.CompelPetitionFiled, toState := State.ProceedingDismissed
    guard := CompelProceedingDismissed p c }



def courtAppointmentTransition
    (p : Person) (ar : Arbitrator) (ag : ArbitrationAgreement) (c : ComplaintText) : Transition :=
  { fromState := State.ArbitrationOrdered, toState := State.ArbitratorsAppointed
    guard := CourtAppointmentOfArbitrator p ar ag c }



def contractualAppointmentTransition (ag : ArbitrationAgreement) (c : ComplaintText) : Transition :=
  { fromState := State.ArbitrationOrdered, toState := State.ArbitratorsAppointed
    guard := ContractualAppointmentGoverns ag c }


def admiraltyTransition (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Transition :=
  { fromState := State.DisputeArisen, toState := State.ArbitrationOrdered
    guard := AdmiraltyCommencement p ag c }


def confirmationTransition
    (p : Person) (a : Award) (ag : ArbitrationAgreement) (c : ComplaintText) : Transition :=
  { fromState := State.AwardMade, toState := State.AwardConfirmed
    guard := ConfirmationOfAward p a ag c }


def vacaturTransition (a : Award) (c : ComplaintText) : Transition :=
  { fromState := State.AwardMade, toState := State.AwardVacated
    guard := OrderVacatingAward a c }


def rehearingTransition (a : Award) (c : ComplaintText) : Transition :=
  { fromState := State.AwardVacated, toState := State.ArbitrationHeld
    guard := RehearingDirection a c }


def modificationTransition (a : Award) (c : ComplaintText) : Transition :=
  { fromState := State.AwardMade, toState := State.AwardModified
    guard := OrderModifyingAward a c }


def vacaturNoticeTransition (p : Person) (a : Award) (c : ComplaintText) : Transition :=
  { fromState := State.AwardMade, toState := State.VacaturSought
    guard := TimelyVacaturNotice p a c }


def judgmentTransition
    (p : Person) (a : Award) (ag : ArbitrationAgreement) (c : ComplaintText) : Transition :=
  { fromState := State.AwardConfirmed, toState := State.JudgmentEntered
    guard := JudgmentOnAward p a ag c }


def appealTransition (o : CourtOrder) (c : ComplaintText) : Transition :=
  { fromState := State.JudgmentEntered, toState := State.AppealTaken
    guard := PermittedAppeal o c }



inductive Reachable (p : Person) (c : ComplaintText) : State → Prop where
  | initial (ag : ArbitrationAgreement) :
      EnforceableArbitrationAgreement ag c → Reachable p c State.AgreementFormed
  | step (s t : State) (tr : Transition) :
      Reachable p c s → tr.fromState = s → tr.toState = t → tr.guard → Reachable p c t

end Proving.USC.T09.Ch1.Procedure
