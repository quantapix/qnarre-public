







import Proving.USC.T09.Ch1.Procedure.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T09.Ch1.Procedure

open Proving.USC.Common








axiom IsMaritimeTransaction (ag : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom InvolvesCommerce (ag : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom IsExemptTransportationWorkerContract (ag : ArbitrationAgreement) (c : ComplaintText) : Prop








axiom WrittenArbitrationProvisionInContract (ag : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom AgreementToSubmitExistingControversy (ag : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom GroundsForRevocationExist (ag : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom Chapter4RendersAgreementUnenforceable (ag : ArbitrationAgreement) (c : ComplaintText) : Prop






axiom SuitPendingInUnitedStatesCourt (p : Person) (c : ComplaintText) : Prop




axiom IssueReferableToArbitration (p : Person) (c : ComplaintText) : Prop




axiom CourtSatisfiedIssueReferable (p : Person) (c : ComplaintText) : Prop




axiom StayApplicationMadeByParty (p : Person) (c : ComplaintText) : Prop




axiom ApplicantInDefaultInProceedingWithArbitration (p : Person) (c : ComplaintText) : Prop






axiom PartyAggrievedByFailureNeglectOrRefusalToArbitrate (p : Person) (c : ComplaintText) : Prop





axiom PetitionToCompelArbitrationFiled (p : Person) (c : ComplaintText) : Prop





axiom CourtHasSubjectMatterJurisdictionUnderTitle28 (p : Person) (c : ComplaintText) : Prop





axiom NoticeOfCompelApplicationServedOnPartyInDefault (p : Person) (c : ComplaintText) : Prop




axiom ServiceMadeUnderFederalRulesOfCivilProcedure (p : Person) (c : ComplaintText) : Prop





axiom MakingOfAgreementOrFailureToComplyInIssue (p : Person) (c : ComplaintText) : Prop





axiom HearingAndProceedingsWithinDistrictOfPetition (p : Person) (c : ComplaintText) : Prop




axiom JuryTrialDemandedOnOrBeforeReturnDay (p : Person) (c : ComplaintText) : Prop




axiom MatterWithinAdmiraltyJurisdiction (p : Person) (c : ComplaintText) : Prop




axiom JuryFoundAgreementInWritingAndDefault (p : Person) (c : ComplaintText) : Prop




axiom CourtOrderedPartiesToProceedToArbitration (p : Person) (c : ComplaintText) : Prop






axiom AgreementProvidesMethodOfAppointingArbitrator (ag : ArbitrationAgreement) (c : ComplaintText) : Prop



axiom AppointmentMethodFollowed (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom PartyFailedToAvailOfAppointmentMethod (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom LapseInNamingArbitratorOrFillingVacancy (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom ApplicationForCourtAppointmentMade (p : Person) (c : ComplaintText) : Prop




axiom CourtDesignatedAndAppointedArbitrator (ar : Arbitrator) (c : ComplaintText) : Prop





axiom AgreementProvidesForMultipleArbitrators (ag : ArbitrationAgreement) (c : ComplaintText) : Prop






axiom ApplicationMadeAndHeardAsMotion (p : Person) (c : ComplaintText) : Prop




axiom ChapterExpresslyProvidesOtherManner (p : Person) (c : ComplaintText) : Prop






axiom ArbitratorsSummonedWitnessInWriting (w : Person) (c : ComplaintText) : Prop




axiom SummonsSignedByArbitratorsOrMajority (w : Person) (c : ComplaintText) : Prop




axiom SummonsDirectedToPersonAndServedAsSubpoena (w : Person) (c : ComplaintText) : Prop




axiom MaterialEvidenceRequiredWithSummons (w : Person) (c : ComplaintText) : Prop




axiom SummonedPersonRefusedOrNeglectedToObey (w : Person) (c : ComplaintText) : Prop




axiom PetitionToCompelWitnessAttendanceFiled (w : Person) (c : ComplaintText) : Prop




axiom ArbitratorsSittingInDistrictOfCourt (w : Person) (c : ComplaintText) : Prop





axiom WitnessFeesEqualToMastersWitnessFees (w : Person) (c : ComplaintText) : Prop






axiom CauseOfActionJusticiableInAdmiralty (p : Person) (c : ComplaintText) : Prop





axiom ProceedingBegunByLibelAndSeizure (p : Person) (c : ComplaintText) : Prop




axiom CourtRetainedJurisdictionToEnterDecreeUponAward (p : Person) (c : ComplaintText) : Prop






axiom PartiesAgreedJudgmentShallBeEnteredUponAward (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom AgreementSpecifiesCourt (ag : ArbitrationAgreement) (c : ComplaintText) : Prop



axiom AwardMade (a : Award) (c : ComplaintText) : Prop





axiom ApplicationForOrderConfirmingAwardFiled (a : Award) (c : ComplaintText) : Prop




axiom AwardMadeWithinDistrictOfCourt (a : Award) (c : ComplaintText) : Prop




axiom NoticeOfConfirmationApplicationServedOnAdverseParty (a : Award) (c : ComplaintText) : Prop




axiom AdversePartyIsResidentOfDistrict (p : Person) (c : ComplaintText) : Prop





axiom ServiceAsNoticeOfMotionInSameCourt (p : Person) (c : ComplaintText) : Prop





axiom NoticeServedByMarshalOnNonresident (p : Person) (c : ComplaintText) : Prop




axiom AwardVacatedModifiedOrCorrected (a : Award) (c : ComplaintText) : Prop






axiom AwardProcuredByCorruptionFraudOrUndueMeans (a : Award) (c : ComplaintText) : Prop




axiom EvidentPartialityOrCorruptionInArbitrators (a : Award) (c : ComplaintText) : Prop






axiom ArbitratorMisconductRefusingPostponementOrEvidence (a : Award) (c : ComplaintText) : Prop





axiom ArbitratorsExceededOrImperfectlyExecutedPowers (a : Award) (c : ComplaintText) : Prop




axiom ApplicationToVacateAwardMade (a : Award) (c : ComplaintText) : Prop




axiom TimeForMakingAwardUnderAgreementExpired (a : Award) (c : ComplaintText) : Prop




axiom CourtDirectedRehearingByArbitrators (a : Award) (c : ComplaintText) : Prop




axiom AwardIssuedPursuantToSection580OfTitle5 (a : Award) (c : ComplaintText) : Prop




axiom ApplicantNonPartyAdverselyAffectedOrAggrieved (p : Person) (c : ComplaintText) : Prop




axiom ArbitrationClearlyInconsistentWithSection572Factors (a : Award) (c : ComplaintText) : Prop







axiom EvidentMaterialMiscalculationOrMistakeInDescription (a : Award) (c : ComplaintText) : Prop




axiom AwardUponMatterNotSubmitted (a : Award) (c : ComplaintText) : Prop




axiom MatterNotAffectingMeritsOfDecision (a : Award) (c : ComplaintText) : Prop




axiom AwardImperfectInFormNotAffectingMerits (a : Award) (c : ComplaintText) : Prop




axiom ApplicationToModifyOrCorrectAwardMade (a : Award) (c : ComplaintText) : Prop






axiom AwardFiledOrDelivered (a : Award) (c : ComplaintText) : Prop






axiom NoticeOfVacaturMotionServedOnAdverseParty (a : Award) (c : ComplaintText) : Prop





axiom OrderStayingProceedingsToEnforceAwardServedWithNotice (a : Award) (c : ComplaintText) : Prop







axiom MovingPartyFiledAgreementAppointmentAndExtensions (a : Award) (c : ComplaintText) : Prop



axiom MovingPartyFiledAward (a : Award) (c : ComplaintText) : Prop





axiom MovingPartyFiledNoticesAffidavitsAndOrders (a : Award) (c : ComplaintText) : Prop




axiom PapersFiledAtTimeOrderFiledForEntryOfJudgment (a : Award) (c : ComplaintText) : Prop



axiom JudgmentDocketedAsIfRenderedInAnAction (a : Award) (c : ComplaintText) : Prop







axiom EnforcementOrConfirmationOrExecutionSought (p : Person) (c : ComplaintText) : Prop




axiom RefusalRestedOnActOfStateDoctrine (p : Person) (c : ComplaintText) : Prop





axiom OrderRefusingStayUnderSection3 (o : CourtOrder) (c : ComplaintText) : Prop




axiom OrderDenyingPetitionUnderSection4 (o : CourtOrder) (c : ComplaintText) : Prop




axiom OrderDenyingApplicationUnderSection206 (o : CourtOrder) (c : ComplaintText) : Prop




axiom OrderConfirmingOrDenyingConfirmationOfAward (o : CourtOrder) (c : ComplaintText) : Prop



axiom OrderModifyingCorrectingOrVacatingAward (o : CourtOrder) (c : ComplaintText) : Prop





axiom InterlocutoryOrderEnjoiningArbitration (o : CourtOrder) (c : ComplaintText) : Prop




axiom FinalDecisionWithRespectToArbitration (o : CourtOrder) (c : ComplaintText) : Prop




axiom InterlocutoryOrderGrantingStayUnderSection3 (o : CourtOrder) (c : ComplaintText) : Prop




axiom InterlocutoryOrderDirectingArbitrationUnderSection4 (o : CourtOrder) (c : ComplaintText) : Prop




axiom InterlocutoryOrderCompellingArbitrationUnderSection206 (o : CourtOrder) (c : ComplaintText) : Prop




axiom InterlocutoryOrderRefusingToEnjoinArbitration (o : CourtOrder) (c : ComplaintText) : Prop




axiom Section1292bCertificationObtained (o : CourtOrder) (c : ComplaintText) : Prop



axiom NoticeOfAppealFiled (o : CourtOrder) (c : ComplaintText) : Prop










axiom daysNoticeBeforeReturnDay (p : Person) (c : ComplaintText) : Nat




axiom daysFromAwardMadeToConfirmationApplication (a : Award) (c : ComplaintText) : Nat






axiom daysInStatutoryOneYearAfterAward (a : Award) (c : ComplaintText) : Nat





axiom daysFromAwardFilingToVacaturNoticeService (a : Award) (c : ComplaintText) : Nat






axiom daysInStatutoryThreeMonthsAfterAwardFiling (a : Award) (c : ComplaintText) : Nat





axiom yearContractMade (ag : ArbitrationAgreement) (c : ComplaintText) : Nat

end Proving.USC.T09.Ch1.Procedure
