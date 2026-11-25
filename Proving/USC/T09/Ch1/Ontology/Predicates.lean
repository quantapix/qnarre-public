








import Proving.USC.Common.Types
import Proving.USC.T09.Ch1.Ontology.Types

set_option autoImplicit false

namespace Proving.USC.T09.Ch1.Ontology

open Proving.USC.Common (Person ComplaintText Time)





axiom IsMaritimeTransaction (t : Transaction) (c : ComplaintText) : Prop



axiom IsCharterParty (t : Transaction) (c : ComplaintText) : Prop



axiom IsBillOfLadingOfWaterCarrier (t : Transaction) (c : ComplaintText) : Prop



axiom IsWharfageAgreement (t : Transaction) (c : ComplaintText) : Prop




axiom IsSuppliesOrRepairsToVessels (t : Transaction) (c : ComplaintText) : Prop



axiom IsCollisionMatter (t : Transaction) (c : ComplaintText) : Prop





axiom IsOtherForeignCommerceMatterWithinAdmiraltyJurisdiction
    (t : Transaction) (c : ComplaintText) : Prop





axiom IsCommerce (m : Commerce) (c : ComplaintText) : Prop



axiom IsCommerceAmongTheSeveralStates (m : Commerce) (c : ComplaintText) : Prop



axiom IsCommerceWithForeignNations (m : Commerce) (c : ComplaintText) : Prop




axiom IsCommerceWithinTerritoryOrDistrictOfColumbia
    (m : Commerce) (c : ComplaintText) : Prop



axiom IsCommerceBetweenTerritories (m : Commerce) (c : ComplaintText) : Prop




axiom IsCommerceBetweenTerritoryAndStateOrForeignNation
    (m : Commerce) (c : ComplaintText) : Prop




axiom IsCommerceBetweenDistrictOfColumbiaAndStateTerritoryOrForeignNation
    (m : Commerce) (c : ComplaintText) : Prop







axiom IsExemptEmploymentContract (k : EmploymentContract) (c : ComplaintText) : Prop



axiom IsSeamanEmploymentContract (k : EmploymentContract) (c : ComplaintText) : Prop




axiom IsRailroadEmployeeEmploymentContract
    (k : EmploymentContract) (c : ComplaintText) : Prop




axiom IsOtherClassOfWorkersEngagedInForeignOrInterstateCommerce
    (k : EmploymentContract) (c : ComplaintText) : Prop







axiom IsWrittenProvisionToSettleByArbitration
    (a : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom IsContractEvidencingTransactionInvolvingCommerce
    (k : Contract) (c : ComplaintText) : Prop




axiom IsControversyThereafterArising
    (v : Controversy) (a : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom IsRefusalToPerformWholeOrPart (v : Controversy) (c : ComplaintText) : Prop




axiom IsAgreementInWritingToSubmitExistingControversy
    (a : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom IsGroundAtLawOrEquityForRevocationOfAnyContract
    (a : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom IsCourtOfTheUnitedStates (ct : Court) (c : ComplaintText) : Prop




axiom IsSuitOrProceedingPendingInCourt
    (pr : Proceeding) (ct : Court) (c : ComplaintText) : Prop




axiom IsIssueReferableToArbitration
    (i : Issue) (a : ArbitrationAgreement) (c : ComplaintText) : Prop



axiom IsApplicationOfOneOfTheParties (ap : Application) (c : ComplaintText) : Prop



axiom IsInDefaultInProceedingWithArbitration (p : Person) (c : ComplaintText) : Prop






axiom IsPartyAggrievedByFailureToArbitrate (p : Person) (c : ComplaintText) : Prop





axiom IsUnitedStatesDistrictCourtWithSubjectMatterJurisdiction
    (ct : Court) (c : ComplaintText) : Prop




axiom IsPetitionForOrderDirectingArbitration
    (ap : Application) (c : ComplaintText) : Prop




axiom IsFiveDaysWrittenNoticeServedOnPartyInDefault
    (n : Notice) (c : ComplaintText) : Prop




axiom IsMakingOfAgreementOrFailureToComplyInIssue
    (a : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom IsJuryTrialDemandedByPartyAllegedInDefault
    (ap : Application) (c : ComplaintText) : Prop





axiom IsArbitrator (r : Arbitrator) (c : ComplaintText) : Prop



axiom IsUmpire (r : Arbitrator) (c : ComplaintText) : Prop




axiom IsMethodOfNamingArbitratorProvidedInAgreement
    (a : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom IsLapseInNamingArbitratorOrFillingVacancy
    (a : ArbitrationAgreement) (c : ComplaintText) : Prop





axiom IsCourtDesignatedArbitrator (r : Arbitrator) (c : ComplaintText) : Prop





axiom IsApplicationToTheCourtUnderThisTitle
    (ap : Application) (c : ComplaintText) : Prop




axiom IsHeardInMannerProvidedForMotions (ap : Application) (c : ComplaintText) : Prop






axiom IsSummonsIssuedByArbitrators (s : Summons) (c : ComplaintText) : Prop



axiom IsWitnessSummonedToAttend (p : Person) (c : ComplaintText) : Prop




axiom IsMaterialEvidentiaryItem (it : EvidentiaryItem) (c : ComplaintText) : Prop




axiom IsRefusalOrNeglectToObeySummons (p : Person) (c : ComplaintText) : Prop





axiom IsCauseOfActionJusticiableInAdmiralty
    (pr : Proceeding) (c : ComplaintText) : Prop




axiom IsProceedingBegunByLibelAndSeizure (pr : Proceeding) (c : ComplaintText) : Prop



axiom IsVesselOrOtherProperty (pty : Property) (c : ComplaintText) : Prop





axiom IsAward (w : Award) (c : ComplaintText) : Prop




axiom IsAgreementForEntryOfJudgmentUponAward
    (a : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom IsCourtSpecifiedInAgreement
    (ct : Court) (a : ArbitrationAgreement) (c : ComplaintText) : Prop



axiom IsApplicationForOrderConfirmingAward
    (ap : Application) (c : ComplaintText) : Prop



axiom IsOrderConfirmingAward (o : CourtOrder) (c : ComplaintText) : Prop



axiom IsAdverseParty (p : Person) (c : ComplaintText) : Prop




axiom IsResidentOfDistrictWhereAwardWasMade (p : Person) (c : ComplaintText) : Prop





axiom daysFromAwardMadeToApplicationForConfirmation
    (w : Award) (ap : Application) (c : ComplaintText) : Nat




axiom IsWithinOneYearAfterAwardMade
    (ap : Application) (w : Award) (c : ComplaintText) : Prop






axiom IsAwardProcuredByCorruptionFraudOrUndueMeans
    (w : Award) (c : ComplaintText) : Prop




axiom IsEvidentPartialityOrCorruptionInArbitrators
    (r : Arbitrator) (w : Award) (c : ComplaintText) : Prop





axiom IsArbitratorMisconductInRefusingPostponementOrEvidence
    (r : Arbitrator) (w : Award) (c : ComplaintText) : Prop




axiom IsOtherMisbehaviorPrejudicingRightsOfParty
    (r : Arbitrator) (w : Award) (c : ComplaintText) : Prop





axiom IsArbitratorExceededOrImperfectlyExecutedPowers
    (r : Arbitrator) (w : Award) (c : ComplaintText) : Prop



axiom IsOrderVacatingAward (o : CourtOrder) (c : ComplaintText) : Prop




axiom IsTimeForMakingAwardNotExpired
    (a : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom IsAwardIssuedPursuantToSection580OfTitle5
    (w : Award) (c : ComplaintText) : Prop




axiom IsPersonAdverselyAffectedNotPartyToArbitration
    (p : Person) (w : Award) (c : ComplaintText) : Prop




axiom IsClearlyInconsistentWithSection572Factors
    (w : Award) (c : ComplaintText) : Prop







axiom IsEvidentMaterialMiscalculationOrMistakeInDescription
    (w : Award) (c : ComplaintText) : Prop



axiom IsAwardUponMatterNotSubmitted (w : Award) (c : ComplaintText) : Prop




axiom IsMatterAffectingTheMeritsOfTheDecision (w : Award) (c : ComplaintText) : Prop




axiom IsAwardImperfectInMatterOfForm (w : Award) (c : ComplaintText) : Prop



axiom IsOrderModifyingOrCorrectingAward (o : CourtOrder) (c : ComplaintText) : Prop






axiom IsNoticeOfMotionToVacateModifyOrCorrect (n : Notice) (c : ComplaintText) : Prop





axiom daysFromAwardFiledOrDeliveredToServiceOfNotice
    (w : Award) (n : Notice) (c : ComplaintText) : Nat





axiom IsWithinThreeMonthsAfterAwardFiledOrDelivered
    (n : Notice) (w : Award) (c : ComplaintText) : Prop




axiom IsOrderStayingProceedingsToEnforceAward
    (o : CourtOrder) (c : ComplaintText) : Prop







axiom IsAgreementOrAppointmentOrExtensionPaper
    (pp : Paper) (c : ComplaintText) : Prop



axiom IsAwardPaper (pp : Paper) (c : ComplaintText) : Prop





axiom IsApplicationPaperOrCourtOrderCopy (pp : Paper) (c : ComplaintText) : Prop





axiom IsJudgmentDocketedAsInAnAction (j : Judgment) (c : ComplaintText) : Prop






axiom IsContractMadePriorToJanuary1_1926 (k : Contract) (c : ComplaintText) : Prop





axiom IsArbitralAgreement (a : ArbitrationAgreement) (c : ComplaintText) : Prop



axiom IsArbitralAward (w : Award) (c : ComplaintText) : Prop




axiom IsExecutionUponJudgmentBasedOnOrderConfirmingAward
    (j : Judgment) (c : ComplaintText) : Prop




axiom IsActOfStateDoctrineGroundAsserted (pr : Proceeding) (c : ComplaintText) : Prop





axiom IsArbitrationSubjectToThisTitle (pr : Proceeding) (c : ComplaintText) : Prop




axiom IsOrderRefusingStayUnderSection3 (o : CourtOrder) (c : ComplaintText) : Prop




axiom IsOrderDenyingPetitionUnderSection4 (o : CourtOrder) (c : ComplaintText) : Prop




axiom IsOrderDenyingApplicationUnderSection206
    (o : CourtOrder) (c : ComplaintText) : Prop




axiom IsOrderConfirmingOrDenyingConfirmationOfAward
    (o : CourtOrder) (c : ComplaintText) : Prop




axiom IsOrderModifyingCorrectingOrVacatingAward
    (o : CourtOrder) (c : ComplaintText) : Prop





axiom IsInterlocutoryOrderEnjoiningArbitration
    (o : CourtOrder) (c : ComplaintText) : Prop




axiom IsFinalDecisionWithRespectToArbitration
    (o : CourtOrder) (c : ComplaintText) : Prop




axiom IsOrderGrantingStayUnderSection3 (o : CourtOrder) (c : ComplaintText) : Prop




axiom IsOrderDirectingArbitrationUnderSection4
    (o : CourtOrder) (c : ComplaintText) : Prop




axiom IsOrderCompellingArbitrationUnderSection206
    (o : CourtOrder) (c : ComplaintText) : Prop




axiom IsOrderRefusingToEnjoinArbitration (o : CourtOrder) (c : ComplaintText) : Prop





axiom IsCertifiedUnderSection1292bOfTitle28 (o : CourtOrder) (c : ComplaintText) : Prop



axiom IsAppealTakenFromOrder (ap : Appeal) (o : CourtOrder) (c : ComplaintText) : Prop

end Proving.USC.T09.Ch1.Ontology
