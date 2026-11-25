import Proving.USC.T09.Ch1.Deontic.Statute
import Proving.USC.Common.Types

set_option autoImplicit false








namespace Proving.USC.T09.Ch1.Deontic

open Proving.USC.Common





theorem section10Ground_intro {aw : Award} {c : ComplaintText}
    (h : AwardProcuredByCorruptionFraudOrUndueMeans aw c
       ∨ EvidentPartialityOrCorruptionInArbitrators aw c
       ∨ ArbitratorMisconductPrejudicingParty aw c
       ∨ ArbitratorsExceededOrImperfectlyExecutedPowers aw c) :
    Section10Ground aw c :=
  match h with
  | .inl h => .corruptionFraudOrUndueMeans h
  | .inr (.inl h) => .evidentPartiality h
  | .inr (.inr (.inl h)) => .misconduct h
  | .inr (.inr (.inr h)) => .excessOrImperfectExecutionOfPowers h



theorem section11Ground_intro {aw : Award} {c : ComplaintText}
    (h : EvidentMaterialMiscalculationOrMistake aw c
       ∨ (AwardUponMatterNotSubmitted aw c ∧ ¬ MatterNotAffectingMeritsOfDecision aw c)
       ∨ AwardImperfectInFormNotAffectingMerits aw c) :
    Section11Ground aw c :=
  match h with
  | .inl h => .evidentMiscalculationOrMistake h
  | .inr (.inl ⟨h₁, h₂⟩) => .matterNotSubmitted h₁ h₂
  | .inr (.inr h) => .imperfectInForm h


theorem section16aAppealableOrder_intro {o : Order} {c : ComplaintText}
    (h : OrderRefusingStayUnderSection3 o c
       ∨ OrderDenyingPetitionUnderSection4 o c
       ∨ OrderDenyingApplicationUnderSection206 o c
       ∨ OrderConfirmingOrDenyingConfirmationOfAward o c
       ∨ OrderModifyingCorrectingOrVacatingAward o c
       ∨ InterlocutoryOrderOnInjunctionAgainstArbitration o c
       ∨ FinalDecisionWithRespectToArbitration o c) :
    Section16aAppealableOrder o c :=
  match h with
  | .inl h => .refusingStayUnderSection3 h
  | .inr (.inl h) => .denyingPetitionUnderSection4 h
  | .inr (.inr (.inl h)) => .denyingApplicationUnderSection206 h
  | .inr (.inr (.inr (.inl h))) => .confirmingOrDenyingConfirmation h
  | .inr (.inr (.inr (.inr (.inl h)))) => .modifyingCorrectingOrVacating h
  | .inr (.inr (.inr (.inr (.inr (.inl h))))) => .injunctionAgainstArbitration h
  | .inr (.inr (.inr (.inr (.inr (.inr h))))) => .finalDecision h


theorem section16bInterlocutoryOrder_intro {o : Order} {c : ComplaintText}
    (h : InterlocutoryOrderGrantingStayUnderSection3 o c
       ∨ InterlocutoryOrderDirectingArbitrationUnderSection4 o c
       ∨ InterlocutoryOrderCompellingArbitrationUnderSection206 o c
       ∨ InterlocutoryOrderRefusingToEnjoinArbitration o c) :
    Section16bInterlocutoryOrder o c :=
  match h with
  | .inl h => .grantingStayUnderSection3 h
  | .inr (.inl h) => .directingArbitrationUnderSection4 h
  | .inr (.inr (.inl h)) => .compellingArbitrationUnderSection206 h
  | .inr (.inr (.inr h)) => .refusingToEnjoinArbitration h





theorem chapterOneApplies_intro {k : Contract} {c : ComplaintText}
    (h0 : ¬ IsExemptWorkerEmploymentContract k c) (h1 : ¬ ContractMadeBeforeJanuary1926 k c) :
    ChapterOneApplies k c :=
  ⟨h0, h1⟩




theorem coveredContract_intro {k : Contract} {c : ComplaintText}
    (h0 : IsMaritimeTransaction k c ∨ InvolvesCommerce k c) (h1 : ChapterOneApplies k c) :
    CoveredContract k c :=
  ⟨h0, h1⟩




theorem definition1Terms_intro {k : Contract} {c : ComplaintText}
    (h0 : IsMaritimeTransaction k c ∨ InvolvesCommerce k c) :
    Definition1Terms k c :=
  ⟨h0⟩




theorem definition14PriorContracts_intro {k : Contract} {c : ComplaintText}
    (h0 : ContractMadeBeforeJanuary1926 k c) :
    Definition14PriorContracts k c :=
  ⟨h0⟩




theorem obligation2Enforce_intro {ct : Court} {ag : ArbitrationAgreement} {k : Contract} {c : ComplaintText}
    (h0 : IsUnitedStatesCourt ct c) (h1 : CoveredContract k c) (h2 : WrittenArbitrationProvisionExists k ag c) (h3 : ¬ RevocationGroundExists ag c) (h4 : ¬ Chapter4RendersUnenforceable ag c) :
    Obligation2Enforce ct ag k c :=
  ⟨h0, h1, h2, h3, h4⟩


theorem obligation2EnforceComplied_intro {ct : Court} {ag : ArbitrationAgreement} {k : Contract} {c : ComplaintText}
    (hNorm : Obligation2Enforce ct ag k c) (hAct : CourtTreatedAgreementAsEnforceable ct ag c) :
    Obligation2EnforceComplied ct ag k c :=
  ⟨hNorm, hAct⟩


theorem obligation2EnforceBreached_intro {ct : Court} {ag : ArbitrationAgreement} {k : Contract} {c : ComplaintText}
    (hNorm : Obligation2Enforce ct ag k c) (hAct : ¬ (CourtTreatedAgreementAsEnforceable ct ag c)) :
    Obligation2EnforceBreached ct ag k c :=
  ⟨hNorm, hAct⟩




theorem obligation3Stay_intro {ct : Court} {pr : Proceeding} {ag : ArbitrationAgreement} {p : Person} {k : Contract} {c : ComplaintText}
    (h0 : IsUnitedStatesCourt ct c) (h1 : CoveredContract k c) (h2 : SuitPendingOnReferableIssue pr ag c) (h3 : CourtSatisfiedIssueReferable ct pr ag c) (h4 : PartyAppliedForStay p pr c) (h5 : ¬ ApplicantInDefaultInArbitration p ag c) :
    Obligation3Stay ct pr ag p k c :=
  ⟨h0, h1, h2, h3, h4, h5⟩


theorem obligation3StayComplied_intro {ct : Court} {pr : Proceeding} {ag : ArbitrationAgreement} {p : Person} {k : Contract} {c : ComplaintText}
    (hNorm : Obligation3Stay ct pr ag p k c) (hAct : CourtStayedTrial ct pr c) :
    Obligation3StayComplied ct pr ag p k c :=
  ⟨hNorm, hAct⟩


theorem obligation3StayBreached_intro {ct : Court} {pr : Proceeding} {ag : ArbitrationAgreement} {p : Person} {k : Contract} {c : ComplaintText}
    (hNorm : Obligation3Stay ct pr ag p k c) (hAct : ¬ (CourtStayedTrial ct pr c)) :
    Obligation3StayBreached ct pr ag p k c :=
  ⟨hNorm, hAct⟩




theorem permission4Petition_intro {p : Person} {ct : Court} {ag : ArbitrationAgreement} {k : Contract} {c : ComplaintText}
    (h0 : IsAggrievedByFailureToArbitrate p ag c) (h1 : CoveredContract k c) (h2 : CourtWouldHaveJurisdictionSaveForAgreement ct c) :
    Permission4Petition p ct ag k c :=
  ⟨h0, h1, h2⟩


theorem permission4PetitionExercised_intro {p : Person} {ct : Court} {ag : ArbitrationAgreement} {k : Contract} {c : ComplaintText}
    (hNorm : Permission4Petition p ct ag k c) (hAct : PetitionToCompelArbitrationFiled p ct ag c) :
    Permission4PetitionExercised p ct ag k c :=
  ⟨hNorm, hAct⟩


theorem obligation4Notice_intro {p : Person} {ct : Court} {ag : ArbitrationAgreement} {c : ComplaintText}
    (h0 : PetitionToCompelArbitrationFiled p ct ag c) :
    Obligation4Notice p ct ag c :=
  ⟨h0⟩


theorem obligation4NoticeComplied_intro {p : Person} {ct : Court} {ag : ArbitrationAgreement} {c : ComplaintText}
    (hNorm : Obligation4Notice p ct ag c) (hAct : (FiveDaysWrittenNoticeServedOnPartyInDefault p c ∧ ServiceMadeUnderFederalRulesOfCivilProcedure p c)) :
    Obligation4NoticeComplied p ct ag c :=
  ⟨hNorm, hAct⟩


theorem obligation4NoticeBreached_intro {p : Person} {ct : Court} {ag : ArbitrationAgreement} {c : ComplaintText}
    (hNorm : Obligation4Notice p ct ag c) (hAct : ¬ ((FiveDaysWrittenNoticeServedOnPartyInDefault p c ∧ ServiceMadeUnderFederalRulesOfCivilProcedure p c))) :
    Obligation4NoticeBreached p ct ag c :=
  ⟨hNorm, hAct⟩


theorem obligation4Order_intro {ct : Court} {p : Person} {ag : ArbitrationAgreement} {c : ComplaintText}
    (h0 : IsUnitedStatesCourt ct c) (h1 : PetitionToCompelArbitrationFiled p ct ag c) (h2 : ¬ MakingOfAgreementOrFailureToComplyInIssue ag c) :
    Obligation4Order ct p ag c :=
  ⟨h0, h1, h2⟩


theorem obligation4OrderComplied_intro {ct : Court} {p : Person} {ag : ArbitrationAgreement} {c : ComplaintText}
    (hNorm : Obligation4Order ct p ag c) (hAct : CourtHeardPartiesAndOrderedArbitration ct ag c) :
    Obligation4OrderComplied ct p ag c :=
  ⟨hNorm, hAct⟩


theorem obligation4OrderBreached_intro {ct : Court} {p : Person} {ag : ArbitrationAgreement} {c : ComplaintText}
    (hNorm : Obligation4Order ct p ag c) (hAct : ¬ (CourtHeardPartiesAndOrderedArbitration ct ag c)) :
    Obligation4OrderBreached ct p ag c :=
  ⟨hNorm, hAct⟩


theorem obligation4SummaryTrial_intro {ct : Court} {p : Person} {ag : ArbitrationAgreement} {c : ComplaintText}
    (h0 : IsUnitedStatesCourt ct c) (h1 : PetitionToCompelArbitrationFiled p ct ag c) (h2 : MakingOfAgreementOrFailureToComplyInIssue ag c) :
    Obligation4SummaryTrial ct p ag c :=
  ⟨h0, h1, h2⟩


theorem obligation4SummaryTrialComplied_intro {ct : Court} {p : Person} {ag : ArbitrationAgreement} {c : ComplaintText}
    (hNorm : Obligation4SummaryTrial ct p ag c) (hAct : CourtProceededSummarilyToTrial ct c) :
    Obligation4SummaryTrialComplied ct p ag c :=
  ⟨hNorm, hAct⟩


theorem obligation4SummaryTrialBreached_intro {ct : Court} {p : Person} {ag : ArbitrationAgreement} {c : ComplaintText}
    (hNorm : Obligation4SummaryTrial ct p ag c) (hAct : ¬ (CourtProceededSummarilyToTrial ct c)) :
    Obligation4SummaryTrialBreached ct p ag c :=
  ⟨hNorm, hAct⟩


theorem permission4JuryDemand_intro {p : Person} {ag : ArbitrationAgreement} {c : ComplaintText}
    (h0 : MakingOfAgreementOrFailureToComplyInIssue ag c) (h1 : ¬ WithinAdmiraltyJurisdiction c) :
    Permission4JuryDemand p ag c :=
  ⟨h0, h1⟩


theorem permission4JuryDemandExercised_intro {p : Person} {ag : ArbitrationAgreement} {c : ComplaintText}
    (hNorm : Permission4JuryDemand p ag c) (hAct : JuryTrialDemandedOnOrBeforeReturnDay p c) :
    Permission4JuryDemandExercised p ag c :=
  ⟨hNorm, hAct⟩


theorem obligation4Dismissal_intro {ct : Court} {pr : Proceeding} {c : ComplaintText}
    (h0 : IsUnitedStatesCourt ct c) (h1 : JuryFoundNoAgreementOrNoDefault c) :
    Obligation4Dismissal ct pr c :=
  ⟨h0, h1⟩


theorem obligation4DismissalComplied_intro {ct : Court} {pr : Proceeding} {c : ComplaintText}
    (hNorm : Obligation4Dismissal ct pr c) (hAct : ProceedingDismissed ct pr c) :
    Obligation4DismissalComplied ct pr c :=
  ⟨hNorm, hAct⟩


theorem obligation4DismissalBreached_intro {ct : Court} {pr : Proceeding} {c : ComplaintText}
    (hNorm : Obligation4Dismissal ct pr c) (hAct : ¬ (ProceedingDismissed ct pr c)) :
    Obligation4DismissalBreached ct pr c :=
  ⟨hNorm, hAct⟩




theorem obligation5FollowMethod_intro {ag : ArbitrationAgreement} {c : ComplaintText}
    (h0 : AgreementProvidesAppointmentMethod ag c) :
    Obligation5FollowMethod ag c :=
  ⟨h0⟩


theorem obligation5FollowMethodComplied_intro {ag : ArbitrationAgreement} {c : ComplaintText}
    (hNorm : Obligation5FollowMethod ag c) (hAct : AppointmentMethodFollowed ag c) :
    Obligation5FollowMethodComplied ag c :=
  ⟨hNorm, hAct⟩


theorem obligation5FollowMethodBreached_intro {ag : ArbitrationAgreement} {c : ComplaintText}
    (hNorm : Obligation5FollowMethod ag c) (hAct : ¬ (AppointmentMethodFollowed ag c)) :
    Obligation5FollowMethodBreached ag c :=
  ⟨hNorm, hAct⟩


theorem obligation5CourtAppoint_intro {ct : Court} {p : Person} {ag : ArbitrationAgreement} {c : ComplaintText}
    (h0 : IsUnitedStatesCourt ct c) (h1 : LapseInNamingArbitratorOrFillingVacancy ag c) (h2 : PartyAppliedForAppointment p ag c) :
    Obligation5CourtAppoint ct p ag c :=
  ⟨h0, h1, h2⟩


theorem obligation5CourtAppointComplied_intro {ct : Court} {p : Person} {ag : ArbitrationAgreement} {c : ComplaintText}
    (hNorm : Obligation5CourtAppoint ct p ag c) (hAct : CourtAppointedArbitratorOrUmpire ct ag c) :
    Obligation5CourtAppointComplied ct p ag c :=
  ⟨hNorm, hAct⟩


theorem obligation5CourtAppointBreached_intro {ct : Court} {p : Person} {ag : ArbitrationAgreement} {c : ComplaintText}
    (hNorm : Obligation5CourtAppoint ct p ag c) (hAct : ¬ (CourtAppointedArbitratorOrUmpire ct ag c)) :
    Obligation5CourtAppointBreached ct p ag c :=
  ⟨hNorm, hAct⟩


theorem obligation5SingleArbitrator_intro {ag : ArbitrationAgreement} {c : ComplaintText}
    (h0 : ¬ AgreementProvidesOtherwiseOnNumberOfArbitrators ag c) :
    Obligation5SingleArbitrator ag c :=
  ⟨h0⟩


theorem obligation5SingleArbitratorComplied_intro {ag : ArbitrationAgreement} {c : ComplaintText}
    (hNorm : Obligation5SingleArbitrator ag c) (hAct : ArbitrationConductedBySingleArbitrator ag c) :
    Obligation5SingleArbitratorComplied ag c :=
  ⟨hNorm, hAct⟩


theorem obligation5SingleArbitratorBreached_intro {ag : ArbitrationAgreement} {c : ComplaintText}
    (hNorm : Obligation5SingleArbitrator ag c) (hAct : ¬ (ArbitrationConductedBySingleArbitrator ag c)) :
    Obligation5SingleArbitratorBreached ag c :=
  ⟨hNorm, hAct⟩




theorem obligation6MotionForm_intro {p : Person} {ct : Court} {c : ComplaintText}
    (h0 : ApplicationMadeToCourtUnderThisTitle p ct c) (h1 : ¬ TitleExpresslyProvidesOtherwiseForApplication c) :
    Obligation6MotionForm p ct c :=
  ⟨h0, h1⟩


theorem obligation6MotionFormComplied_intro {p : Person} {ct : Court} {c : ComplaintText}
    (hNorm : Obligation6MotionForm p ct c) (hAct : ApplicationMadeAndHeardAsMotion ct c) :
    Obligation6MotionFormComplied p ct c :=
  ⟨hNorm, hAct⟩


theorem obligation6MotionFormBreached_intro {p : Person} {ct : Court} {c : ComplaintText}
    (hNorm : Obligation6MotionForm p ct c) (hAct : ¬ (ApplicationMadeAndHeardAsMotion ct c)) :
    Obligation6MotionFormBreached p ct c :=
  ⟨hNorm, hAct⟩




theorem permission7Summon_intro {a : Arbitrator} {ag : ArbitrationAgreement} {w : Person} {c : ComplaintText}
    (h0 : ArbitratorsSelectedUnderTitleOrOtherwise a ag c) :
    Permission7Summon a ag w c :=
  ⟨h0⟩


theorem permission7SummonExercised_intro {a : Arbitrator} {ag : ArbitrationAgreement} {w : Person} {c : ComplaintText}
    (hNorm : Permission7Summon a ag w c) (hAct : WitnessSummonedInWritingByArbitrators a w c) :
    Permission7SummonExercised a ag w c :=
  ⟨hNorm, hAct⟩


theorem obligation7SummonsForm_intro {a : Arbitrator} {ag : ArbitrationAgreement} {w : Person} {c : ComplaintText}
    (h0 : ArbitratorsSelectedUnderTitleOrOtherwise a ag c) (h1 : WitnessSummonedInWritingByArbitrators a w c) :
    Obligation7SummonsForm a ag w c :=
  ⟨h0, h1⟩


theorem obligation7SummonsFormComplied_intro {a : Arbitrator} {ag : ArbitrationAgreement} {w : Person} {c : ComplaintText}
    (hNorm : Obligation7SummonsForm a ag w c) (hAct : SummonsIssuedSignedDirectedAndServedAsPrescribed a w c) :
    Obligation7SummonsFormComplied a ag w c :=
  ⟨hNorm, hAct⟩


theorem obligation7SummonsFormBreached_intro {a : Arbitrator} {ag : ArbitrationAgreement} {w : Person} {c : ComplaintText}
    (hNorm : Obligation7SummonsForm a ag w c) (hAct : ¬ (SummonsIssuedSignedDirectedAndServedAsPrescribed a w c)) :
    Obligation7SummonsFormBreached a ag w c :=
  ⟨hNorm, hAct⟩


theorem obligation7ObeySummons_intro {a : Arbitrator} {w : Person} {c : ComplaintText}
    (h0 : WitnessSummonedInWritingByArbitrators a w c) :
    Obligation7ObeySummons a w c :=
  ⟨h0⟩


theorem obligation7ObeySummonsBreached_intro {a : Arbitrator} {w : Person} {c : ComplaintText}
    (hNorm : Obligation7ObeySummons a w c) (hAct : SummonedPersonRefusedOrNeglectedToObey w c) :
    Obligation7ObeySummonsBreached a w c :=
  ⟨hNorm, hAct⟩


theorem obligation7ObeySummonsComplied_intro {a : Arbitrator} {w : Person} {c : ComplaintText}
    (hNorm : Obligation7ObeySummons a w c) (hAct : ¬ (SummonedPersonRefusedOrNeglectedToObey w c)) :
    Obligation7ObeySummonsComplied a w c :=
  ⟨hNorm, hAct⟩


theorem power7Compel_intro {ct : Court} {p : Person} {w : Person} {c : ComplaintText}
    (h0 : IsUnitedStatesCourt ct c) (h1 : SummonedPersonRefusedOrNeglectedToObey w c) (h2 : PetitionToCompelWitnessFiled p ct c) :
    Power7Compel ct p w c :=
  ⟨h0, h1, h2⟩


theorem power7CompelExercised_intro {ct : Court} {p : Person} {w : Person} {c : ComplaintText}
    (hNorm : Power7Compel ct p w c) (hAct : CourtCompelledAttendanceOrPunishedForContempt ct w c) :
    Power7CompelExercised ct p w c :=
  ⟨hNorm, hAct⟩


theorem definition7Fees_intro {c : ComplaintText}
    (h0 : WitnessFeesEqualMastersCourtFees c) :
    Definition7Fees c :=
  ⟨h0⟩




theorem permission8Libel_intro {p : Person} {c : ComplaintText}
    (h0 : AdmiraltyJusticiableCauseOfAction c) :
    Permission8Libel p c :=
  ⟨h0⟩


theorem permission8LibelExercised_intro {p : Person} {c : ComplaintText}
    (hNorm : Permission8Libel p c) (hAct : ProceedingBegunByLibelAndSeizure p c) :
    Permission8LibelExercised p c :=
  ⟨hNorm, hAct⟩


theorem power8Jurisdiction_intro {ct : Court} {p : Person} {c : ComplaintText}
    (h0 : IsUnitedStatesCourt ct c) (h1 : AdmiraltyJusticiableCauseOfAction c) (h2 : ProceedingBegunByLibelAndSeizure p c) :
    Power8Jurisdiction ct p c :=
  ⟨h0, h1, h2⟩


theorem power8JurisdictionExercised_intro {ct : Court} {p : Person} {c : ComplaintText}
    (hNorm : Power8Jurisdiction ct p c) (hAct : CourtDirectedArbitrationAndRetainedJurisdiction ct c) :
    Power8JurisdictionExercised ct p c :=
  ⟨hNorm, hAct⟩




theorem permission9Apply_intro {p : Person} {ag : ArbitrationAgreement} {aw : Award} {c : ComplaintText}
    (h0 : IsPartyToArbitration p c) (h1 : AgreementProvidesForJudgmentOnAward ag c) :
    Permission9Apply p ag aw c :=
  ⟨h0, h1⟩


theorem permission9ApplyExercised_intro {p : Person} {ag : ArbitrationAgreement} {aw : Award} {c : ComplaintText}
    (hNorm : Permission9Apply p ag aw c) (hAct : ApplicationForConfirmationWithinOneYear p aw c) :
    Permission9ApplyExercised p ag aw c :=
  ⟨hNorm, hAct⟩


theorem obligation9Confirm_intro {ct : Court} {p : Person} {ag : ArbitrationAgreement} {aw : Award} {c : ComplaintText}
    (h0 : IsUnitedStatesCourt ct c) (h1 : CourtIsForDistrictWhereAwardMade ct aw c) (h2 : AgreementProvidesForJudgmentOnAward ag c) (h3 : ApplicationForConfirmationWithinOneYear p aw c) (h4 : ¬ AwardVacatedModifiedOrCorrected aw c) :
    Obligation9Confirm ct p ag aw c :=
  ⟨h0, h1, h2, h3, h4⟩


theorem obligation9ConfirmComplied_intro {ct : Court} {p : Person} {ag : ArbitrationAgreement} {aw : Award} {c : ComplaintText}
    (hNorm : Obligation9Confirm ct p ag aw c) (hAct : CourtGrantedConfirmationOrder ct aw c) :
    Obligation9ConfirmComplied ct p ag aw c :=
  ⟨hNorm, hAct⟩


theorem obligation9ConfirmBreached_intro {ct : Court} {p : Person} {ag : ArbitrationAgreement} {aw : Award} {c : ComplaintText}
    (hNorm : Obligation9Confirm ct p ag aw c) (hAct : ¬ (CourtGrantedConfirmationOrder ct aw c)) :
    Obligation9ConfirmBreached ct p ag aw c :=
  ⟨hNorm, hAct⟩


theorem obligation9Notice_intro {p : Person} {aw : Award} {c : ComplaintText}
    (h0 : ApplicationForConfirmationWithinOneYear p aw c) :
    Obligation9Notice p aw c :=
  ⟨h0⟩


theorem obligation9NoticeComplied_intro {p : Person} {aw : Award} {c : ComplaintText}
    (hNorm : Obligation9Notice p aw c) (hAct : NoticeOfApplicationServedOnAdverseParty p c) :
    Obligation9NoticeComplied p aw c :=
  ⟨hNorm, hAct⟩


theorem obligation9NoticeBreached_intro {p : Person} {aw : Award} {c : ComplaintText}
    (hNorm : Obligation9Notice p aw c) (hAct : ¬ (NoticeOfApplicationServedOnAdverseParty p c)) :
    Obligation9NoticeBreached p aw c :=
  ⟨hNorm, hAct⟩




theorem power10Vacate_intro {ct : Court} {p : Person} {aw : Award} {c : ComplaintText}
    (h0 : IsUnitedStatesCourt ct c) (h1 : CourtIsForDistrictWhereAwardMade ct aw c) (h2 : IsPartyToArbitration p c) (h3 : ApplicationToVacateByParty p aw c) (h4 : Section10Ground aw c) :
    Power10Vacate ct p aw c :=
  ⟨h0, h1, h2, h3, h4⟩


theorem power10VacateExercised_intro {ct : Court} {p : Person} {aw : Award} {c : ComplaintText}
    (hNorm : Power10Vacate ct p aw c) (hAct : CourtVacatedAward ct aw c) :
    Power10VacateExercised ct p aw c :=
  ⟨hNorm, hAct⟩


theorem permission10Rehearing_intro {ct : Court} {aw : Award} {c : ComplaintText}
    (h0 : IsUnitedStatesCourt ct c) (h1 : CourtVacatedAward ct aw c) (h2 : TimeForMakingAwardNotExpired aw c) :
    Permission10Rehearing ct aw c :=
  ⟨h0, h1, h2⟩


theorem permission10RehearingExercised_intro {ct : Court} {aw : Award} {c : ComplaintText}
    (hNorm : Permission10Rehearing ct aw c) (hAct : CourtDirectedRehearing ct aw c) :
    Permission10RehearingExercised ct aw c :=
  ⟨hNorm, hAct⟩


theorem power10cVacateNonParty_intro {ct : Court} {p : Person} {aw : Award} {c : ComplaintText}
    (h0 : IsUnitedStatesCourt ct c) (h1 : CourtIsForDistrictWhereAwardMade ct aw c) (h2 : AwardIssuedUnderSection580OfTitle5 aw c) (h3 : ¬ IsPartyToArbitration p c) (h4 : NonPartyAdverselyAffectedOrAggrieved p aw c) (h5 : ArbitrationClearlyInconsistentWithSection572Factors aw c) :
    Power10cVacateNonParty ct p aw c :=
  ⟨h0, h1, h2, h3, h4, h5⟩


theorem power10cVacateNonPartyExercised_intro {ct : Court} {p : Person} {aw : Award} {c : ComplaintText}
    (hNorm : Power10cVacateNonParty ct p aw c) (hAct : CourtVacatedAward ct aw c) :
    Power10cVacateNonPartyExercised ct p aw c :=
  ⟨hNorm, hAct⟩




theorem power11Modify_intro {ct : Court} {p : Person} {aw : Award} {c : ComplaintText}
    (h0 : IsUnitedStatesCourt ct c) (h1 : CourtIsForDistrictWhereAwardMade ct aw c) (h2 : IsPartyToArbitration p c) (h3 : ApplicationToModifyByParty p aw c) (h4 : Section11Ground aw c) :
    Power11Modify ct p aw c :=
  ⟨h0, h1, h2, h3, h4⟩


theorem power11ModifyExercised_intro {ct : Court} {p : Person} {aw : Award} {c : ComplaintText}
    (hNorm : Power11Modify ct p aw c) (hAct : CourtModifiedOrCorrectedAward ct aw c) :
    Power11ModifyExercised ct p aw c :=
  ⟨hNorm, hAct⟩




theorem obligation12Notice_intro {p : Person} {aw : Award} {c : ComplaintText}
    (h0 : MotionToVacateModifyOrCorrectMade p aw c) :
    Obligation12Notice p aw c :=
  ⟨h0⟩


theorem obligation12NoticeComplied_intro {p : Person} {aw : Award} {c : ComplaintText}
    (hNorm : Obligation12Notice p aw c) (hAct : NoticeOfMotionServedWithinThreeMonths p aw c) :
    Obligation12NoticeComplied p aw c :=
  ⟨hNorm, hAct⟩


theorem obligation12NoticeBreached_intro {p : Person} {aw : Award} {c : ComplaintText}
    (hNorm : Obligation12Notice p aw c) (hAct : ¬ (NoticeOfMotionServedWithinThreeMonths p aw c)) :
    Obligation12NoticeBreached p aw c :=
  ⟨hNorm, hAct⟩


theorem permission12Stay_intro {ct : Court} {p : Person} {aw : Award} {c : ComplaintText}
    (h0 : IsUnitedStatesCourt ct c) (h1 : MotionToVacateModifyOrCorrectMade p aw c) :
    Permission12Stay ct p aw c :=
  ⟨h0, h1⟩


theorem permission12StayExercised_intro {ct : Court} {p : Person} {aw : Award} {c : ComplaintText}
    (hNorm : Permission12Stay ct p aw c) (hAct : JudgeOrderedStayOfEnforcementProceedings ct aw c) :
    Permission12StayExercised ct p aw c :=
  ⟨hNorm, hAct⟩




theorem section13Papers_intro {p : Person} {aw : Award} {c : ComplaintText}
    (h0 : FiledAgreementAppointmentAndExtensionPapers p c) (h1 : FiledAward p aw c) (h2 : FiledApplicationPapersAndCourtOrders p c) :
    Section13Papers p aw c :=
  ⟨h0, h1, h2⟩


theorem obligation13FilePapers_intro {p : Person} {aw : Award} {c : ComplaintText}
    (h0 : IsMovingPartyForAwardOrder p aw c) (h1 : OrderFiledWithClerkForEntryOfJudgment p aw c) :
    Obligation13FilePapers p aw c :=
  ⟨h0, h1⟩


theorem obligation13FilePapersComplied_intro {p : Person} {aw : Award} {c : ComplaintText}
    (hNorm : Obligation13FilePapers p aw c) (hAct : Section13Papers p aw c) :
    Obligation13FilePapersComplied p aw c :=
  ⟨hNorm, hAct⟩


theorem obligation13FilePapersBreached_intro {p : Person} {aw : Award} {c : ComplaintText}
    (hNorm : Obligation13FilePapers p aw c) (hAct : ¬ (Section13Papers p aw c)) :
    Obligation13FilePapersBreached p aw c :=
  ⟨hNorm, hAct⟩


theorem obligation13Docket_intro {ct : Court} {p : Person} {aw : Award} {c : ComplaintText}
    (h0 : IsUnitedStatesCourt ct c) (h1 : OrderFiledWithClerkForEntryOfJudgment p aw c) :
    Obligation13Docket ct p aw c :=
  ⟨h0, h1⟩


theorem obligation13DocketComplied_intro {ct : Court} {p : Person} {aw : Award} {c : ComplaintText}
    (hNorm : Obligation13Docket ct p aw c) (hAct : JudgmentDocketedAsIfRenderedInAnAction ct aw c) :
    Obligation13DocketComplied ct p aw c :=
  ⟨hNorm, hAct⟩


theorem obligation13DocketBreached_intro {ct : Court} {p : Person} {aw : Award} {c : ComplaintText}
    (hNorm : Obligation13Docket ct p aw c) (hAct : ¬ (JudgmentDocketedAsIfRenderedInAnAction ct aw c)) :
    Obligation13DocketBreached ct p aw c :=
  ⟨hNorm, hAct⟩


theorem definition13JudgmentEffect_intro {aw : Award} {c : ComplaintText}
    (h0 : JudgmentHasSameForceAndEffectAsActionJudgment aw c) :
    Definition13JudgmentEffect aw c :=
  ⟨h0⟩




theorem prohibition15ActOfState_intro {ct : Court} {c : ComplaintText}
    (h0 : IsUnitedStatesCourt ct c) (h1 : MatterIsArbitralEnforcementConfirmationOrExecution c) :
    Prohibition15ActOfState ct c :=
  ⟨h0, h1⟩


theorem prohibition15ActOfStateViolated_intro {ct : Court} {c : ComplaintText}
    (hNorm : Prohibition15ActOfState ct c) (hAct : CourtRefusedOnActOfStateGround ct c) :
    Prohibition15ActOfStateViolated ct c :=
  ⟨hNorm, hAct⟩


theorem prohibition15ActOfStateObserved_intro {ct : Court} {c : ComplaintText}
    (hNorm : Prohibition15ActOfState ct c) (hAct : ¬ (CourtRefusedOnActOfStateGround ct c)) :
    Prohibition15ActOfStateObserved ct c :=
  ⟨hNorm, hAct⟩




theorem permission16Appeal_intro {p : Person} {o : Order} {c : ComplaintText}
    (h0 : Section16aAppealableOrder o c) :
    Permission16Appeal p o c :=
  ⟨h0⟩


theorem permission16AppealExercised_intro {p : Person} {o : Order} {c : ComplaintText}
    (hNorm : Permission16Appeal p o c) (hAct : AppealTaken p o c) :
    Permission16AppealExercised p o c :=
  ⟨hNorm, hAct⟩


theorem prohibition16Interlocutory_intro {p : Person} {o : Order} {c : ComplaintText}
    (h0 : Section16bInterlocutoryOrder o c) (h1 : ¬ Section1292bCertificationObtained o c) :
    Prohibition16Interlocutory p o c :=
  ⟨h0, h1⟩


theorem prohibition16InterlocutoryViolated_intro {p : Person} {o : Order} {c : ComplaintText}
    (hNorm : Prohibition16Interlocutory p o c) (hAct : AppealTaken p o c) :
    Prohibition16InterlocutoryViolated p o c :=
  ⟨hNorm, hAct⟩


theorem prohibition16InterlocutoryObserved_intro {p : Person} {o : Order} {c : ComplaintText}
    (hNorm : Prohibition16Interlocutory p o c) (hAct : ¬ (AppealTaken p o c)) :
    Prohibition16InterlocutoryObserved p o c :=
  ⟨hNorm, hAct⟩

end Proving.USC.T09.Ch1.Deontic
