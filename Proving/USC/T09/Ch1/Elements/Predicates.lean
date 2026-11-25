import Proving.USC.T09.Ch1.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false












namespace Proving.USC.T09.Ch1.Elements

open Proving.USC.Common








axiom IsMaritimeTransaction (tx : Transaction) (c : ComplaintText) : Prop





axiom TransactionEngagedInInterstateCommerce (tx : Transaction) (c : ComplaintText) : Prop




axiom IsContractOfEmploymentOrWork (ag : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom WorkerClassEngagedInInterstateTransportation (ag : ArbitrationAgreement) (c : ComplaintText) : Prop






axiom IsWrittenArbitrationProvision (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom ProvisionContainedInTransaction (ag : ArbitrationAgreement) (tx : Transaction)
    (c : ComplaintText) : Prop




axiom ContractEvidencesTransaction (ag : ArbitrationAgreement) (tx : Transaction)
    (c : ComplaintText) : Prop




axiom ControversyArisingAfterAgreement (d : Controversy) (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop




axiom ExistingControversySubmittedInWriting (d : Controversy) (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop




axiom ControversyArisesOutOfContractOrRefusal (d : Controversy) (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop






axiom GroundsForRevocationOfAnyContract (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom ChapterFourInvalidationElected (ag : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom SuitPendingInUnitedStatesCourt (s : Suit) (c : ComplaintText) : Prop




axiom IssueInSuitReferableToArbitration (s : Suit) (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop



axiom StayApplicationMadeByParty (app : CourtApplication) (s : Suit) (c : ComplaintText) : Prop




axiom ApplicantInDefaultInProceedingWithArbitration (app : CourtApplication)
    (c : ComplaintText) : Prop






axiom AggrievedByFailureNeglectOrRefusalToArbitrate (p : Person) (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop





axiom FederalJurisdictionalNexusSaveForAgreement (d : Controversy) (c : ComplaintText) : Prop





axiom daysOfWrittenNoticeServedOnDefaultingParty (app : CourtApplication)
    (c : ComplaintText) : Nat




axiom NoticeServedUnderFederalRules (app : CourtApplication) (c : ComplaintText) : Prop




axiom MakingOfAgreementOrFailureToComplyInIssue (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop




axiom TrierFoundWrittenArbitrationAgreementMade (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop




axiom TrierFoundDefaultInProceedingUnderAgreement (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop




axiom HearingWithinDistrictOfPetition (app : CourtApplication) (c : ComplaintText) : Prop







axiom AgreementProvidesArbitratorAppointmentMethod (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop




axiom PartyFailedToAvailOfAppointmentMethod (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop




axiom LapseInNamingArbitratorOrFillingVacancy (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop




axiom ApplicationByPartyToControversy (app : CourtApplication) (c : ComplaintText) : Prop




axiom AgreementProvidesNumberOfArbitrators (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop






axiom ApplicationMadeAndHeardAsMotion (app : CourtApplication) (c : ComplaintText) : Prop





axiom TitleExpresslyProvidesOtherwiseForApplication (app : CourtApplication)
    (c : ComplaintText) : Prop






axiom SummonsIssuedInWritingByArbitratorMajority (sm : ArbitralSummons)
    (c : ComplaintText) : Prop



axiom SummonsSignedByArbitratorMajority (sm : ArbitralSummons) (c : ComplaintText) : Prop




axiom SummonsDirectedAndServedAsSubpoena (sm : ArbitralSummons) (c : ComplaintText) : Prop




axiom EvidenceSoughtMaterialToTheCase (sm : ArbitralSummons) (c : ComplaintText) : Prop



axiom SummonedPersonRefusedOrNeglectedToObey (sm : ArbitralSummons) (p : Person)
    (c : ComplaintText) : Prop





axiom PetitionInDistrictWhereArbitratorsSitting (app : CourtApplication)
    (c : ComplaintText) : Prop






axiom CauseOtherwiseJusticiableInAdmiralty (s : Suit) (c : ComplaintText) : Prop



axiom PartyClaimingToBeAggrieved (p : Person) (s : Suit) (c : ComplaintText) : Prop





axiom ProceedingBegunByLibelAndSeizure (s : Suit) (c : ComplaintText) : Prop






axiom AgreementProvidesForJudgmentUponAward (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop




axiom ApplicantIsPartyToTheArbitration (p : Person) (c : ComplaintText) : Prop





axiom daysFromAwardMadeToConfirmationApplication (app : CourtApplication)
    (c : ComplaintText) : Nat




axiom AgreementSpecifiesConfirmingCourt (ag : ArbitrationAgreement) (c : ComplaintText) : Prop



axiom AppliedToCourtSpecifiedInAgreement (app : CourtApplication) (ag : ArbitrationAgreement)
    (c : ComplaintText) : Prop




axiom AppliedToDistrictWhereAwardMade (app : CourtApplication) (aw : Award)
    (c : ComplaintText) : Prop




axiom NoticeOfApplicationServedOnAdverseParty (app : CourtApplication)
    (c : ComplaintText) : Prop





axiom AwardVacatedModifiedOrCorrected (aw : Award) (c : ComplaintText) : Prop





axiom AwardProcuredByCorruptionFraudOrUndueMeans (aw : Award) (c : ComplaintText) : Prop




axiom EvidentPartialityOrCorruptionInArbitrators (aw : Award) (c : ComplaintText) : Prop




axiom ArbitratorsRefusedToPostponeHearing (aw : Award) (c : ComplaintText) : Prop




axiom SufficientCauseForPostponementShown (aw : Award) (c : ComplaintText) : Prop




axiom ArbitratorsRefusedToHearMaterialEvidence (aw : Award) (c : ComplaintText) : Prop




axiom OtherMisbehaviorByArbitrators (aw : Award) (c : ComplaintText) : Prop




axiom PartyRightsPrejudicedByMisbehavior (aw : Award) (c : ComplaintText) : Prop



axiom ArbitratorsExceededTheirPowers (aw : Award) (c : ComplaintText) : Prop




axiom ArbitratorsImperfectlyExecutedTheirPowers (aw : Award) (c : ComplaintText) : Prop




axiom NoMutualFinalDefiniteAwardMade (aw : Award) (c : ComplaintText) : Prop




axiom ApplicationInDistrictWhereAwardMade (app : CourtApplication) (aw : Award)
    (c : ComplaintText) : Prop



axiom AwardVacatedByCourt (aw : Award) (c : ComplaintText) : Prop




axiom TimeForMakingAwardUnderAgreementExpired (aw : Award) (c : ComplaintText) : Prop




axiom AwardIssuedPursuantToSection580OfTitle5 (aw : Award) (c : ComplaintText) : Prop



axiom AdverselyAffectedOrAggrievedByAward (p : Person) (aw : Award) (c : ComplaintText) : Prop




axiom ClearlyInconsistentWithSection572Factors (aw : Award) (c : ComplaintText) : Prop






axiom EvidentMaterialMiscalculationOfFigures (aw : Award) (c : ComplaintText) : Prop




axiom EvidentMaterialMistakeInDescription (aw : Award) (c : ComplaintText) : Prop



axiom AwardedUponMatterNotSubmitted (aw : Award) (c : ComplaintText) : Prop





axiom UnsubmittedMatterDoesNotAffectMerits (aw : Award) (c : ComplaintText) : Prop



axiom AwardImperfectInMatterOfForm (aw : Award) (c : ComplaintText) : Prop




axiom FormImperfectionAffectsMerits (aw : Award) (c : ComplaintText) : Prop






axiom NoticeOfMotionToVacateModifyOrCorrectServed (app : CourtApplication)
    (c : ComplaintText) : Prop





axiom daysFromAwardFiledToNoticeService (app : CourtApplication) (c : ComplaintText) : Nat




axiom AdversePartyResidesInDistrictWhereAwardMade (app : CourtApplication)
    (c : ComplaintText) : Prop




axiom ServedAsNoticeOfMotionInSameCourt (app : CourtApplication) (c : ComplaintText) : Prop




axiom ServedByMarshalOfDistrictWhereFound (app : CourtApplication) (c : ComplaintText) : Prop




axiom JudgeCompetentToStayProceedingsInSameCourt (app : CourtApplication)
    (c : ComplaintText) : Prop




axiom StayOrderServedWithNoticeOfMotion (app : CourtApplication) (c : ComplaintText) : Prop






axiom MovingForOrderConfirmingModifyingOrCorrecting (app : CourtApplication)
    (c : ComplaintText) : Prop




axiom PapersFiledWhenOrderFiledForEntryOfJudgment (app : CourtApplication)
    (c : ComplaintText) : Prop





axiom FiledAgreementAppointmentAndExtensions (app : CourtApplication)
    (c : ComplaintText) : Prop



axiom FiledTheAward (app : CourtApplication) (c : ComplaintText) : Prop





axiom FiledApplicationPapersAndCourtOrders (app : CourtApplication) (c : ComplaintText) : Prop




axiom JudgmentDocketedAsIfRenderedInAnAction (app : CourtApplication)
    (c : ComplaintText) : Prop







axiom yearOfContractFormation (ag : ArbitrationAgreement) (c : ComplaintText) : Nat





axiom SeeksEnforcementOfArbitralAgreement (r : ReliefRequest) (c : ComplaintText) : Prop



axiom SeeksConfirmationOfArbitralAward (r : ReliefRequest) (c : ComplaintText) : Prop




axiom SeeksExecutionUponJudgmentConfirmingAward (r : ReliefRequest) (c : ComplaintText) : Prop



axiom RefusalRestsOnActOfStateDoctrine (r : ReliefRequest) (c : ComplaintText) : Prop





axiom OrderRefusingStayUnderSection3 (o : CourtOrder) (c : ComplaintText) : Prop




axiom OrderDenyingPetitionUnderSection4 (o : CourtOrder) (c : ComplaintText) : Prop




axiom OrderDenyingApplicationUnderSection206 (o : CourtOrder) (c : ComplaintText) : Prop




axiom OrderConfirmingOrDenyingConfirmationOfAward (o : CourtOrder) (c : ComplaintText) : Prop



axiom OrderModifyingCorrectingOrVacatingAward (o : CourtOrder) (c : ComplaintText) : Prop




axiom OrderGrantingContinuingOrModifyingInjunctionAgainstArbitration (o : CourtOrder)
    (c : ComplaintText) : Prop



axiom FinalDecisionWithRespectToArbitration (o : CourtOrder) (c : ComplaintText) : Prop




axiom ArbitrationSubjectToThisTitle (o : CourtOrder) (c : ComplaintText) : Prop



axiom OrderIsInterlocutory (o : CourtOrder) (c : ComplaintText) : Prop




axiom OrderGrantingStayUnderSection3 (o : CourtOrder) (c : ComplaintText) : Prop




axiom OrderDirectingArbitrationUnderSection4 (o : CourtOrder) (c : ComplaintText) : Prop




axiom OrderCompellingArbitrationUnderSection206 (o : CourtOrder) (c : ComplaintText) : Prop



axiom OrderRefusingToEnjoinArbitration (o : CourtOrder) (c : ComplaintText) : Prop





axiom CertifiedUnderSection1292bOfTitle28 (o : CourtOrder) (c : ComplaintText) : Prop

end Proving.USC.T09.Ch1.Elements
