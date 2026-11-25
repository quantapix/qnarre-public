import Proving.USC.T09.Ch1.Deontic.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

















namespace Proving.USC.T09.Ch1.Deontic

open Proving.USC.Common





inductive Section10Ground (aw : Award) (c : ComplaintText) : Prop where

  | corruptionFraudOrUndueMeans :
      AwardProcuredByCorruptionFraudOrUndueMeans aw c → Section10Ground aw c

  | evidentPartiality :
      EvidentPartialityOrCorruptionInArbitrators aw c → Section10Ground aw c

  | misconduct :
      ArbitratorMisconductPrejudicingParty aw c → Section10Ground aw c


  | excessOrImperfectExecutionOfPowers :
      ArbitratorsExceededOrImperfectlyExecutedPowers aw c → Section10Ground aw c





inductive Section11Ground (aw : Award) (c : ComplaintText) : Prop where

  | evidentMiscalculationOrMistake :
      EvidentMaterialMiscalculationOrMistake aw c → Section11Ground aw c


  | matterNotSubmitted :
      AwardUponMatterNotSubmitted aw c →
      ¬ MatterNotAffectingMeritsOfDecision aw c → Section11Ground aw c

  | imperfectInForm :
      AwardImperfectInFormNotAffectingMerits aw c → Section11Ground aw c




inductive Section16aAppealableOrder (o : Order) (c : ComplaintText) : Prop where

  | refusingStayUnderSection3 :
      OrderRefusingStayUnderSection3 o c → Section16aAppealableOrder o c

  | denyingPetitionUnderSection4 :
      OrderDenyingPetitionUnderSection4 o c → Section16aAppealableOrder o c

  | denyingApplicationUnderSection206 :
      OrderDenyingApplicationUnderSection206 o c → Section16aAppealableOrder o c

  | confirmingOrDenyingConfirmation :
      OrderConfirmingOrDenyingConfirmationOfAward o c → Section16aAppealableOrder o c

  | modifyingCorrectingOrVacating :
      OrderModifyingCorrectingOrVacatingAward o c → Section16aAppealableOrder o c

  | injunctionAgainstArbitration :
      InterlocutoryOrderOnInjunctionAgainstArbitration o c → Section16aAppealableOrder o c

  | finalDecision :
      FinalDecisionWithRespectToArbitration o c → Section16aAppealableOrder o c




inductive Section16bInterlocutoryOrder (o : Order) (c : ComplaintText) : Prop where

  | grantingStayUnderSection3 :
      InterlocutoryOrderGrantingStayUnderSection3 o c → Section16bInterlocutoryOrder o c

  | directingArbitrationUnderSection4 :
      InterlocutoryOrderDirectingArbitrationUnderSection4 o c → Section16bInterlocutoryOrder o c

  | compellingArbitrationUnderSection206 :
      InterlocutoryOrderCompellingArbitrationUnderSection206 o c → Section16bInterlocutoryOrder o c

  | refusingToEnjoinArbitration :
      InterlocutoryOrderRefusingToEnjoinArbitration o c → Section16bInterlocutoryOrder o c




structure ChapterOneApplies (k : Contract) (c : ComplaintText) : Prop where
  notExemptWorkerContract : ¬ IsExemptWorkerEmploymentContract k c
  notPreEnactmentContract : ¬ ContractMadeBeforeJanuary1926 k c


def chapterOneAppliesModality : Modality := .definition




structure CoveredContract (k : Contract) (c : ComplaintText) : Prop where
  reach : IsMaritimeTransaction k c ∨ InvolvesCommerce k c
  applies : ChapterOneApplies k c


def coveredContractModality : Modality := .definition




structure Definition1Terms (k : Contract) (c : ComplaintText) : Prop where
  maritimeOrCommerce : IsMaritimeTransaction k c ∨ InvolvesCommerce k c


def definition1TermsModality : Modality := .definition




structure Definition14PriorContracts (k : Contract) (c : ComplaintText) : Prop where
  madeBeforeCutoff : ContractMadeBeforeJanuary1926 k c


def definition14PriorContractsModality : Modality := .definition




structure Obligation2Enforce (ct : Court) (ag : ArbitrationAgreement) (k : Contract) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCourt ct c
  covered : CoveredContract k c
  writtenProvision : WrittenArbitrationProvisionExists k ag c
  noRevocationGround : ¬ RevocationGroundExists ag c
  noChapterFourException : ¬ Chapter4RendersUnenforceable ag c


def obligation2EnforceModality : Modality := .obligation


def Obligation2EnforceComplied (ct : Court) (ag : ArbitrationAgreement) (k : Contract) (c : ComplaintText) : Prop :=
  Obligation2Enforce ct ag k c ∧ CourtTreatedAgreementAsEnforceable ct ag c


def Obligation2EnforceBreached (ct : Court) (ag : ArbitrationAgreement) (k : Contract) (c : ComplaintText) : Prop :=
  Obligation2Enforce ct ag k c ∧ ¬ (CourtTreatedAgreementAsEnforceable ct ag c)




structure Obligation3Stay (ct : Court) (pr : Proceeding) (ag : ArbitrationAgreement) (p : Person) (k : Contract) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCourt ct c
  covered : CoveredContract k c
  suitPending : SuitPendingOnReferableIssue pr ag c
  courtSatisfied : CourtSatisfiedIssueReferable ct pr ag c
  applied : PartyAppliedForStay p pr c
  applicantNotInDefault : ¬ ApplicantInDefaultInArbitration p ag c


def obligation3StayModality : Modality := .obligation


def Obligation3StayComplied (ct : Court) (pr : Proceeding) (ag : ArbitrationAgreement) (p : Person) (k : Contract) (c : ComplaintText) : Prop :=
  Obligation3Stay ct pr ag p k c ∧ CourtStayedTrial ct pr c


def Obligation3StayBreached (ct : Court) (pr : Proceeding) (ag : ArbitrationAgreement) (p : Person) (k : Contract) (c : ComplaintText) : Prop :=
  Obligation3Stay ct pr ag p k c ∧ ¬ (CourtStayedTrial ct pr c)




structure Permission4Petition (p : Person) (ct : Court) (ag : ArbitrationAgreement) (k : Contract) (c : ComplaintText) : Prop where
  addressee : IsAggrievedByFailureToArbitrate p ag c
  covered : CoveredContract k c
  jurisdictionSaveForAgreement : CourtWouldHaveJurisdictionSaveForAgreement ct c


def permission4PetitionModality : Modality := .permission


def Permission4PetitionExercised (p : Person) (ct : Court) (ag : ArbitrationAgreement) (k : Contract) (c : ComplaintText) : Prop :=
  Permission4Petition p ct ag k c ∧ PetitionToCompelArbitrationFiled p ct ag c


structure Obligation4Notice (p : Person) (ct : Court) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  petitionFiled : PetitionToCompelArbitrationFiled p ct ag c


def obligation4NoticeModality : Modality := .obligation


def Obligation4NoticeComplied (p : Person) (ct : Court) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  Obligation4Notice p ct ag c ∧ (FiveDaysWrittenNoticeServedOnPartyInDefault p c ∧ ServiceMadeUnderFederalRulesOfCivilProcedure p c)


def Obligation4NoticeBreached (p : Person) (ct : Court) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  Obligation4Notice p ct ag c ∧ ¬ ((FiveDaysWrittenNoticeServedOnPartyInDefault p c ∧ ServiceMadeUnderFederalRulesOfCivilProcedure p c))


structure Obligation4Order (ct : Court) (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCourt ct c
  petitionFiled : PetitionToCompelArbitrationFiled p ct ag c
  notInIssue : ¬ MakingOfAgreementOrFailureToComplyInIssue ag c


def obligation4OrderModality : Modality := .obligation


def Obligation4OrderComplied (ct : Court) (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  Obligation4Order ct p ag c ∧ CourtHeardPartiesAndOrderedArbitration ct ag c


def Obligation4OrderBreached (ct : Court) (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  Obligation4Order ct p ag c ∧ ¬ (CourtHeardPartiesAndOrderedArbitration ct ag c)


structure Obligation4SummaryTrial (ct : Court) (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCourt ct c
  petitionFiled : PetitionToCompelArbitrationFiled p ct ag c
  inIssue : MakingOfAgreementOrFailureToComplyInIssue ag c


def obligation4SummaryTrialModality : Modality := .obligation


def Obligation4SummaryTrialComplied (ct : Court) (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  Obligation4SummaryTrial ct p ag c ∧ CourtProceededSummarilyToTrial ct c


def Obligation4SummaryTrialBreached (ct : Court) (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  Obligation4SummaryTrial ct p ag c ∧ ¬ (CourtProceededSummarilyToTrial ct c)


structure Permission4JuryDemand (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  inIssue : MakingOfAgreementOrFailureToComplyInIssue ag c
  notAdmiralty : ¬ WithinAdmiraltyJurisdiction c


def permission4JuryDemandModality : Modality := .permission


def Permission4JuryDemandExercised (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  Permission4JuryDemand p ag c ∧ JuryTrialDemandedOnOrBeforeReturnDay p c


structure Obligation4Dismissal (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCourt ct c
  juryFinding : JuryFoundNoAgreementOrNoDefault c


def obligation4DismissalModality : Modality := .obligation


def Obligation4DismissalComplied (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Obligation4Dismissal ct pr c ∧ ProceedingDismissed ct pr c


def Obligation4DismissalBreached (ct : Court) (pr : Proceeding) (c : ComplaintText) : Prop :=
  Obligation4Dismissal ct pr c ∧ ¬ (ProceedingDismissed ct pr c)




structure Obligation5FollowMethod (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  methodProvided : AgreementProvidesAppointmentMethod ag c


def obligation5FollowMethodModality : Modality := .obligation


def Obligation5FollowMethodComplied (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  Obligation5FollowMethod ag c ∧ AppointmentMethodFollowed ag c


def Obligation5FollowMethodBreached (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  Obligation5FollowMethod ag c ∧ ¬ (AppointmentMethodFollowed ag c)


structure Obligation5CourtAppoint (ct : Court) (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCourt ct c
  lapse : LapseInNamingArbitratorOrFillingVacancy ag c
  applied : PartyAppliedForAppointment p ag c


def obligation5CourtAppointModality : Modality := .obligation


def Obligation5CourtAppointComplied (ct : Court) (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  Obligation5CourtAppoint ct p ag c ∧ CourtAppointedArbitratorOrUmpire ct ag c


def Obligation5CourtAppointBreached (ct : Court) (p : Person) (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  Obligation5CourtAppoint ct p ag c ∧ ¬ (CourtAppointedArbitratorOrUmpire ct ag c)


structure Obligation5SingleArbitrator (ag : ArbitrationAgreement) (c : ComplaintText) : Prop where
  noContraryProvision : ¬ AgreementProvidesOtherwiseOnNumberOfArbitrators ag c


def obligation5SingleArbitratorModality : Modality := .obligation


def Obligation5SingleArbitratorComplied (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  Obligation5SingleArbitrator ag c ∧ ArbitrationConductedBySingleArbitrator ag c


def Obligation5SingleArbitratorBreached (ag : ArbitrationAgreement) (c : ComplaintText) : Prop :=
  Obligation5SingleArbitrator ag c ∧ ¬ (ArbitrationConductedBySingleArbitrator ag c)




structure Obligation6MotionForm (p : Person) (ct : Court) (c : ComplaintText) : Prop where
  application : ApplicationMadeToCourtUnderThisTitle p ct c
  noExpressException : ¬ TitleExpresslyProvidesOtherwiseForApplication c


def obligation6MotionFormModality : Modality := .obligation


def Obligation6MotionFormComplied (p : Person) (ct : Court) (c : ComplaintText) : Prop :=
  Obligation6MotionForm p ct c ∧ ApplicationMadeAndHeardAsMotion ct c


def Obligation6MotionFormBreached (p : Person) (ct : Court) (c : ComplaintText) : Prop :=
  Obligation6MotionForm p ct c ∧ ¬ (ApplicationMadeAndHeardAsMotion ct c)




structure Permission7Summon (a : Arbitrator) (ag : ArbitrationAgreement) (w : Person) (c : ComplaintText) : Prop where
  addressee : ArbitratorsSelectedUnderTitleOrOtherwise a ag c


def permission7SummonModality : Modality := .permission


def Permission7SummonExercised (a : Arbitrator) (ag : ArbitrationAgreement) (w : Person) (c : ComplaintText) : Prop :=
  Permission7Summon a ag w c ∧ WitnessSummonedInWritingByArbitrators a w c


structure Obligation7SummonsForm (a : Arbitrator) (ag : ArbitrationAgreement) (w : Person) (c : ComplaintText) : Prop where
  addressee : ArbitratorsSelectedUnderTitleOrOtherwise a ag c
  summonsIssued : WitnessSummonedInWritingByArbitrators a w c


def obligation7SummonsFormModality : Modality := .obligation


def Obligation7SummonsFormComplied (a : Arbitrator) (ag : ArbitrationAgreement) (w : Person) (c : ComplaintText) : Prop :=
  Obligation7SummonsForm a ag w c ∧ SummonsIssuedSignedDirectedAndServedAsPrescribed a w c


def Obligation7SummonsFormBreached (a : Arbitrator) (ag : ArbitrationAgreement) (w : Person) (c : ComplaintText) : Prop :=
  Obligation7SummonsForm a ag w c ∧ ¬ (SummonsIssuedSignedDirectedAndServedAsPrescribed a w c)


structure Obligation7ObeySummons (a : Arbitrator) (w : Person) (c : ComplaintText) : Prop where
  summonsIssued : WitnessSummonedInWritingByArbitrators a w c


def obligation7ObeySummonsModality : Modality := .obligation


def Obligation7ObeySummonsBreached (a : Arbitrator) (w : Person) (c : ComplaintText) : Prop :=
  Obligation7ObeySummons a w c ∧ SummonedPersonRefusedOrNeglectedToObey w c


def Obligation7ObeySummonsComplied (a : Arbitrator) (w : Person) (c : ComplaintText) : Prop :=
  Obligation7ObeySummons a w c ∧ ¬ (SummonedPersonRefusedOrNeglectedToObey w c)


structure Power7Compel (ct : Court) (p : Person) (w : Person) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCourt ct c
  refusal : SummonedPersonRefusedOrNeglectedToObey w c
  petition : PetitionToCompelWitnessFiled p ct c


def power7CompelModality : Modality := .power


def Power7CompelExercised (ct : Court) (p : Person) (w : Person) (c : ComplaintText) : Prop :=
  Power7Compel ct p w c ∧ CourtCompelledAttendanceOrPunishedForContempt ct w c


structure Definition7Fees (c : ComplaintText) : Prop where
  feeMeasure : WitnessFeesEqualMastersCourtFees c


def definition7FeesModality : Modality := .definition




structure Permission8Libel (p : Person) (c : ComplaintText) : Prop where
  admiraltyBasis : AdmiraltyJusticiableCauseOfAction c


def permission8LibelModality : Modality := .permission


def Permission8LibelExercised (p : Person) (c : ComplaintText) : Prop :=
  Permission8Libel p c ∧ ProceedingBegunByLibelAndSeizure p c


structure Power8Jurisdiction (ct : Court) (p : Person) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCourt ct c
  admiraltyBasis : AdmiraltyJusticiableCauseOfAction c
  begunByLibel : ProceedingBegunByLibelAndSeizure p c


def power8JurisdictionModality : Modality := .power


def Power8JurisdictionExercised (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Power8Jurisdiction ct p c ∧ CourtDirectedArbitrationAndRetainedJurisdiction ct c




structure Permission9Apply (p : Person) (ag : ArbitrationAgreement) (aw : Award) (c : ComplaintText) : Prop where
  addressee : IsPartyToArbitration p c
  entryOfJudgmentClause : AgreementProvidesForJudgmentOnAward ag c


def permission9ApplyModality : Modality := .permission


def Permission9ApplyExercised (p : Person) (ag : ArbitrationAgreement) (aw : Award) (c : ComplaintText) : Prop :=
  Permission9Apply p ag aw c ∧ ApplicationForConfirmationWithinOneYear p aw c


structure Obligation9Confirm (ct : Court) (p : Person) (ag : ArbitrationAgreement) (aw : Award) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCourt ct c
  forum : CourtIsForDistrictWhereAwardMade ct aw c
  entryOfJudgmentClause : AgreementProvidesForJudgmentOnAward ag c
  application : ApplicationForConfirmationWithinOneYear p aw c
  notDisturbed : ¬ AwardVacatedModifiedOrCorrected aw c


def obligation9ConfirmModality : Modality := .obligation


def Obligation9ConfirmComplied (ct : Court) (p : Person) (ag : ArbitrationAgreement) (aw : Award) (c : ComplaintText) : Prop :=
  Obligation9Confirm ct p ag aw c ∧ CourtGrantedConfirmationOrder ct aw c


def Obligation9ConfirmBreached (ct : Court) (p : Person) (ag : ArbitrationAgreement) (aw : Award) (c : ComplaintText) : Prop :=
  Obligation9Confirm ct p ag aw c ∧ ¬ (CourtGrantedConfirmationOrder ct aw c)


structure Obligation9Notice (p : Person) (aw : Award) (c : ComplaintText) : Prop where
  application : ApplicationForConfirmationWithinOneYear p aw c


def obligation9NoticeModality : Modality := .obligation


def Obligation9NoticeComplied (p : Person) (aw : Award) (c : ComplaintText) : Prop :=
  Obligation9Notice p aw c ∧ NoticeOfApplicationServedOnAdverseParty p c


def Obligation9NoticeBreached (p : Person) (aw : Award) (c : ComplaintText) : Prop :=
  Obligation9Notice p aw c ∧ ¬ (NoticeOfApplicationServedOnAdverseParty p c)




structure Power10Vacate (ct : Court) (p : Person) (aw : Award) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCourt ct c
  forum : CourtIsForDistrictWhereAwardMade ct aw c
  applicantIsParty : IsPartyToArbitration p c
  application : ApplicationToVacateByParty p aw c
  ground : Section10Ground aw c


def power10VacateModality : Modality := .power


def Power10VacateExercised (ct : Court) (p : Person) (aw : Award) (c : ComplaintText) : Prop :=
  Power10Vacate ct p aw c ∧ CourtVacatedAward ct aw c


structure Permission10Rehearing (ct : Court) (aw : Award) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCourt ct c
  vacated : CourtVacatedAward ct aw c
  timeNotExpired : TimeForMakingAwardNotExpired aw c


def permission10RehearingModality : Modality := .permission


def Permission10RehearingExercised (ct : Court) (aw : Award) (c : ComplaintText) : Prop :=
  Permission10Rehearing ct aw c ∧ CourtDirectedRehearing ct aw c


structure Power10cVacateNonParty (ct : Court) (p : Person) (aw : Award) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCourt ct c
  forum : CourtIsForDistrictWhereAwardMade ct aw c
  agencyAward : AwardIssuedUnderSection580OfTitle5 aw c
  applicantNotParty : ¬ IsPartyToArbitration p c
  applicantAggrieved : NonPartyAdverselyAffectedOrAggrieved p aw c
  clearInconsistency : ArbitrationClearlyInconsistentWithSection572Factors aw c


def power10cVacateNonPartyModality : Modality := .power


def Power10cVacateNonPartyExercised (ct : Court) (p : Person) (aw : Award) (c : ComplaintText) : Prop :=
  Power10cVacateNonParty ct p aw c ∧ CourtVacatedAward ct aw c




structure Power11Modify (ct : Court) (p : Person) (aw : Award) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCourt ct c
  forum : CourtIsForDistrictWhereAwardMade ct aw c
  applicantIsParty : IsPartyToArbitration p c
  application : ApplicationToModifyByParty p aw c
  ground : Section11Ground aw c


def power11ModifyModality : Modality := .power


def Power11ModifyExercised (ct : Court) (p : Person) (aw : Award) (c : ComplaintText) : Prop :=
  Power11Modify ct p aw c ∧ CourtModifiedOrCorrectedAward ct aw c




structure Obligation12Notice (p : Person) (aw : Award) (c : ComplaintText) : Prop where
  motionMade : MotionToVacateModifyOrCorrectMade p aw c


def obligation12NoticeModality : Modality := .obligation


def Obligation12NoticeComplied (p : Person) (aw : Award) (c : ComplaintText) : Prop :=
  Obligation12Notice p aw c ∧ NoticeOfMotionServedWithinThreeMonths p aw c


def Obligation12NoticeBreached (p : Person) (aw : Award) (c : ComplaintText) : Prop :=
  Obligation12Notice p aw c ∧ ¬ (NoticeOfMotionServedWithinThreeMonths p aw c)


structure Permission12Stay (ct : Court) (p : Person) (aw : Award) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCourt ct c
  motionMade : MotionToVacateModifyOrCorrectMade p aw c


def permission12StayModality : Modality := .permission


def Permission12StayExercised (ct : Court) (p : Person) (aw : Award) (c : ComplaintText) : Prop :=
  Permission12Stay ct p aw c ∧ JudgeOrderedStayOfEnforcementProceedings ct aw c




structure Section13Papers (p : Person) (aw : Award) (c : ComplaintText) : Prop where
  agreementAndAppointments : FiledAgreementAppointmentAndExtensionPapers p c
  award : FiledAward p aw c
  applicationPapers : FiledApplicationPapersAndCourtOrders p c


def section13PapersModality : Modality := .definition


structure Obligation13FilePapers (p : Person) (aw : Award) (c : ComplaintText) : Prop where
  addressee : IsMovingPartyForAwardOrder p aw c
  orderFiled : OrderFiledWithClerkForEntryOfJudgment p aw c


def obligation13FilePapersModality : Modality := .obligation


def Obligation13FilePapersComplied (p : Person) (aw : Award) (c : ComplaintText) : Prop :=
  Obligation13FilePapers p aw c ∧ Section13Papers p aw c


def Obligation13FilePapersBreached (p : Person) (aw : Award) (c : ComplaintText) : Prop :=
  Obligation13FilePapers p aw c ∧ ¬ (Section13Papers p aw c)


structure Obligation13Docket (ct : Court) (p : Person) (aw : Award) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCourt ct c
  orderFiled : OrderFiledWithClerkForEntryOfJudgment p aw c


def obligation13DocketModality : Modality := .obligation


def Obligation13DocketComplied (ct : Court) (p : Person) (aw : Award) (c : ComplaintText) : Prop :=
  Obligation13Docket ct p aw c ∧ JudgmentDocketedAsIfRenderedInAnAction ct aw c


def Obligation13DocketBreached (ct : Court) (p : Person) (aw : Award) (c : ComplaintText) : Prop :=
  Obligation13Docket ct p aw c ∧ ¬ (JudgmentDocketedAsIfRenderedInAnAction ct aw c)


structure Definition13JudgmentEffect (aw : Award) (c : ComplaintText) : Prop where
  sameForceAndEffect : JudgmentHasSameForceAndEffectAsActionJudgment aw c


def definition13JudgmentEffectModality : Modality := .definition




structure Prohibition15ActOfState (ct : Court) (c : ComplaintText) : Prop where
  addressee : IsUnitedStatesCourt ct c
  arbitralMatter : MatterIsArbitralEnforcementConfirmationOrExecution c


def prohibition15ActOfStateModality : Modality := .prohibition


def Prohibition15ActOfStateViolated (ct : Court) (c : ComplaintText) : Prop :=
  Prohibition15ActOfState ct c ∧ CourtRefusedOnActOfStateGround ct c


def Prohibition15ActOfStateObserved (ct : Court) (c : ComplaintText) : Prop :=
  Prohibition15ActOfState ct c ∧ ¬ (CourtRefusedOnActOfStateGround ct c)




structure Permission16Appeal (p : Person) (o : Order) (c : ComplaintText) : Prop where
  appealableOrder : Section16aAppealableOrder o c


def permission16AppealModality : Modality := .permission


def Permission16AppealExercised (p : Person) (o : Order) (c : ComplaintText) : Prop :=
  Permission16Appeal p o c ∧ AppealTaken p o c


structure Prohibition16Interlocutory (p : Person) (o : Order) (c : ComplaintText) : Prop where
  nonAppealableOrder : Section16bInterlocutoryOrder o c
  noCertification : ¬ Section1292bCertificationObtained o c


def prohibition16InterlocutoryModality : Modality := .prohibition


def Prohibition16InterlocutoryViolated (p : Person) (o : Order) (c : ComplaintText) : Prop :=
  Prohibition16Interlocutory p o c ∧ AppealTaken p o c


def Prohibition16InterlocutoryObserved (p : Person) (o : Order) (c : ComplaintText) : Prop :=
  Prohibition16Interlocutory p o c ∧ ¬ (AppealTaken p o c)

end Proving.USC.T09.Ch1.Deontic
