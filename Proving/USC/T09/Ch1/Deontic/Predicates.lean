import Proving.USC.T09.Ch1.Deontic.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false











namespace Proving.USC.T09.Ch1.Deontic

open Proving.USC.Common






axiom IsMaritimeTransaction (k : Contract) (c : ComplaintText) : Prop




axiom InvolvesCommerce (k : Contract) (c : ComplaintText) : Prop




axiom IsExemptWorkerEmploymentContract (k : Contract) (c : ComplaintText) : Prop






axiom ContractMadeBeforeJanuary1926 (k : Contract) (c : ComplaintText) : Prop






axiom IsUnitedStatesCourt (ct : Court) (c : ComplaintText) : Prop




axiom WrittenArbitrationProvisionExists (k : Contract) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom RevocationGroundExists (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom Chapter4RendersUnenforceable (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom CourtTreatedAgreementAsEnforceable (ct : Court) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop






axiom SuitPendingOnReferableIssue (pr : Proceeding) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom CourtSatisfiedIssueReferable (ct : Court) (pr : Proceeding) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom PartyAppliedForStay (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop




axiom ApplicantInDefaultInArbitration (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom CourtStayedTrial (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop






axiom IsAggrievedByFailureToArbitrate (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom CourtWouldHaveJurisdictionSaveForAgreement (ct : Court) (c : ComplaintText) : Prop




axiom PetitionToCompelArbitrationFiled (p : Person) (ct : Court) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom FiveDaysWrittenNoticeServedOnPartyInDefault (p : Person) (c : ComplaintText) : Prop




axiom ServiceMadeUnderFederalRulesOfCivilProcedure (p : Person) (c : ComplaintText) : Prop




axiom MakingOfAgreementOrFailureToComplyInIssue (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom CourtHeardPartiesAndOrderedArbitration (ct : Court) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom CourtProceededSummarilyToTrial (ct : Court) (c : ComplaintText) : Prop




axiom WithinAdmiraltyJurisdiction (c : ComplaintText) : Prop




axiom JuryTrialDemandedOnOrBeforeReturnDay (p : Person) (c : ComplaintText) : Prop




axiom JuryFoundNoAgreementOrNoDefault (c : ComplaintText) : Prop




axiom ProceedingDismissed (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop






axiom AgreementProvidesAppointmentMethod (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom AppointmentMethodFollowed (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom LapseInNamingArbitratorOrFillingVacancy (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom PartyAppliedForAppointment (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom CourtAppointedArbitratorOrUmpire (ct : Court) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom AgreementProvidesOtherwiseOnNumberOfArbitrators (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom ArbitrationConductedBySingleArbitrator (ag : ArbitrationAgreement) (c : ComplaintText) : Prop






axiom ApplicationMadeToCourtUnderThisTitle (p : Person) (ct : Court) (c : ComplaintText) : Prop




axiom TitleExpresslyProvidesOtherwiseForApplication (c : ComplaintText) : Prop




axiom ApplicationMadeAndHeardAsMotion (ct : Court) (c : ComplaintText) : Prop






axiom ArbitratorsSelectedUnderTitleOrOtherwise (a : Arbitrator) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom WitnessSummonedInWritingByArbitrators (a : Arbitrator) (w : Person) (c : ComplaintText) : Prop




axiom SummonsIssuedSignedDirectedAndServedAsPrescribed (a : Arbitrator) (w : Person) (c : ComplaintText) : Prop




axiom SummonedPersonRefusedOrNeglectedToObey (w : Person) (c : ComplaintText) : Prop




axiom PetitionToCompelWitnessFiled (p : Person) (ct : Court) (c : ComplaintText) : Prop




axiom CourtCompelledAttendanceOrPunishedForContempt (ct : Court) (w : Person) (c : ComplaintText) : Prop




axiom WitnessFeesEqualMastersCourtFees (c : ComplaintText) : Prop






axiom AdmiraltyJusticiableCauseOfAction (c : ComplaintText) : Prop




axiom ProceedingBegunByLibelAndSeizure (p : Person) (c : ComplaintText) : Prop




axiom CourtDirectedArbitrationAndRetainedJurisdiction (ct : Court) (c : ComplaintText) : Prop






axiom IsPartyToArbitration (p : Person) (c : ComplaintText) : Prop




axiom AgreementProvidesForJudgmentOnAward (ag : ArbitrationAgreement) (c : ComplaintText) : Prop




axiom ApplicationForConfirmationWithinOneYear (p : Person) (aw : Award) (c : ComplaintText) : Prop




axiom CourtIsForDistrictWhereAwardMade (ct : Court) (aw : Award) (c : ComplaintText) : Prop




axiom AwardVacatedModifiedOrCorrected (aw : Award) (c : ComplaintText) : Prop




axiom CourtGrantedConfirmationOrder (ct : Court) (aw : Award) (c : ComplaintText) : Prop




axiom NoticeOfApplicationServedOnAdverseParty (p : Person) (c : ComplaintText) : Prop






axiom AwardProcuredByCorruptionFraudOrUndueMeans (aw : Award) (c : ComplaintText) : Prop




axiom EvidentPartialityOrCorruptionInArbitrators (aw : Award) (c : ComplaintText) : Prop




axiom ArbitratorMisconductPrejudicingParty (aw : Award) (c : ComplaintText) : Prop




axiom ArbitratorsExceededOrImperfectlyExecutedPowers (aw : Award) (c : ComplaintText) : Prop




axiom ApplicationToVacateByParty (p : Person) (aw : Award) (c : ComplaintText) : Prop




axiom CourtVacatedAward (ct : Court) (aw : Award) (c : ComplaintText) : Prop




axiom TimeForMakingAwardNotExpired (aw : Award) (c : ComplaintText) : Prop




axiom CourtDirectedRehearing (ct : Court) (aw : Award) (c : ComplaintText) : Prop




axiom AwardIssuedUnderSection580OfTitle5 (aw : Award) (c : ComplaintText) : Prop




axiom NonPartyAdverselyAffectedOrAggrieved (p : Person) (aw : Award) (c : ComplaintText) : Prop




axiom ArbitrationClearlyInconsistentWithSection572Factors (aw : Award) (c : ComplaintText) : Prop






axiom EvidentMaterialMiscalculationOrMistake (aw : Award) (c : ComplaintText) : Prop




axiom AwardUponMatterNotSubmitted (aw : Award) (c : ComplaintText) : Prop




axiom MatterNotAffectingMeritsOfDecision (aw : Award) (c : ComplaintText) : Prop




axiom AwardImperfectInFormNotAffectingMerits (aw : Award) (c : ComplaintText) : Prop




axiom ApplicationToModifyByParty (p : Person) (aw : Award) (c : ComplaintText) : Prop




axiom CourtModifiedOrCorrectedAward (ct : Court) (aw : Award) (c : ComplaintText) : Prop






axiom MotionToVacateModifyOrCorrectMade (p : Person) (aw : Award) (c : ComplaintText) : Prop




axiom NoticeOfMotionServedWithinThreeMonths (p : Person) (aw : Award) (c : ComplaintText) : Prop




axiom JudgeOrderedStayOfEnforcementProceedings (ct : Court) (aw : Award) (c : ComplaintText) : Prop






axiom IsMovingPartyForAwardOrder (p : Person) (aw : Award) (c : ComplaintText) : Prop




axiom OrderFiledWithClerkForEntryOfJudgment (p : Person) (aw : Award) (c : ComplaintText) : Prop




axiom FiledAgreementAppointmentAndExtensionPapers (p : Person) (c : ComplaintText) : Prop




axiom FiledAward (p : Person) (aw : Award) (c : ComplaintText) : Prop




axiom FiledApplicationPapersAndCourtOrders (p : Person) (c : ComplaintText) : Prop




axiom JudgmentDocketedAsIfRenderedInAnAction (ct : Court) (aw : Award) (c : ComplaintText) : Prop




axiom JudgmentHasSameForceAndEffectAsActionJudgment (aw : Award) (c : ComplaintText) : Prop






axiom MatterIsArbitralEnforcementConfirmationOrExecution (c : ComplaintText) : Prop




axiom CourtRefusedOnActOfStateGround (ct : Court) (c : ComplaintText) : Prop






axiom OrderRefusingStayUnderSection3 (o : Order) (c : ComplaintText) : Prop




axiom OrderDenyingPetitionUnderSection4 (o : Order) (c : ComplaintText) : Prop




axiom OrderDenyingApplicationUnderSection206 (o : Order) (c : ComplaintText) : Prop




axiom OrderConfirmingOrDenyingConfirmationOfAward (o : Order) (c : ComplaintText) : Prop




axiom OrderModifyingCorrectingOrVacatingAward (o : Order) (c : ComplaintText) : Prop




axiom InterlocutoryOrderOnInjunctionAgainstArbitration (o : Order) (c : ComplaintText) : Prop




axiom FinalDecisionWithRespectToArbitration (o : Order) (c : ComplaintText) : Prop




axiom AppealTaken (p : Person) (o : Order) (c : ComplaintText) : Prop




axiom InterlocutoryOrderGrantingStayUnderSection3 (o : Order) (c : ComplaintText) : Prop




axiom InterlocutoryOrderDirectingArbitrationUnderSection4 (o : Order) (c : ComplaintText) : Prop




axiom InterlocutoryOrderCompellingArbitrationUnderSection206 (o : Order) (c : ComplaintText) : Prop




axiom InterlocutoryOrderRefusingToEnjoinArbitration (o : Order) (c : ComplaintText) : Prop




axiom Section1292bCertificationObtained (o : Order) (c : ComplaintText) : Prop

end Proving.USC.T09.Ch1.Deontic
