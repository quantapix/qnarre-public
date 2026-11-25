import Proving.USC.T18.Ch11.Procedure.Statute
import Proving.USC.Common.Types










namespace Proving.USC.T18.Ch11.Procedure
open Proving.USC.Common



theorem permanentRepresentationBar_intro {p : Person} {c : ComplaintText}
    (hPos : PersonHeldCoveredPosition p c) (hAct : RestrictedContactMade p c)
    (hInt : IntentToInfluencePresent p c)
    (hPart : ParticipatedPersonallyAndSubstantially p c) :
    PermanentRepresentationBar p c :=
  ⟨hPos, hAct, hInt, hPart⟩

theorem twoYearRepresentationBar_intro {p : Person} {c : ComplaintText}
    (hPos : PersonHeldCoveredPosition p c) (hAct : RestrictedContactMade p c)
    (hInt : IntentToInfluencePresent p c) (hPend : MatterPendingUnderResponsibility p c)
    (hWin : WithinTwoYearBar p c) :
    TwoYearRepresentationBar p c :=
  ⟨hPos, hAct, hInt, hPend, hWin⟩

theorem oneYearContactBar_intro {p : Person} {c : ComplaintText}
    (hPos : PersonHeldCoveredPosition p c) (hAct : RestrictedContactMade p c)
    (hInt : IntentToInfluencePresent p c) (hWin : WithinOneYearBar p c) :
    OneYearContactBar p c :=
  ⟨hPos, hAct, hInt, hWin⟩

theorem foreignEntityRepresentationBar_intro {p : Person} {c : ComplaintText}
    (hPos : PersonHeldCoveredPosition p c) (hFor : RepresentsForeignEntity p c)
    (hInt : IntentToInfluencePresent p c) (hWin : WithinOneYearBar p c) :
    ForeignEntityRepresentationBar p c :=
  ⟨hPos, hFor, hInt, hWin⟩



theorem misdemeanorPenaltyTrigger_intro {p : Person} {c : ComplaintText}
    (hOff : ConductConstitutesEnumeratedOffense p c) :
    MisdemeanorPenaltyTrigger p c :=
  ⟨hOff⟩

theorem felonyPenaltyTrigger_intro {p : Person} {c : ComplaintText}
    (hOff : ConductConstitutesEnumeratedOffense p c) (hWil : WillfulViolation p c) :
    FelonyPenaltyTrigger p c :=
  ⟨hOff, hWil⟩

theorem civilPenaltyLiability_intro {p : Person} {c : ComplaintText}
    (hOff : ConductConstitutesEnumeratedOffense p c)
    (hAct : AttorneyGeneralCivilActionFiled p c) (hPre : ProvedByPreponderance p c) :
    CivilPenaltyLiability p c :=
  ⟨hOff, hAct, hPre⟩

theorem injunctionIssuable_intro {p : Person} {c : ComplaintText}
    (hPet : AttorneyGeneralInjunctionPetitionFiled p c)
    (hFind : CourtFindsOffenseConduct p c) :
    InjunctionIssuable p c :=
  ⟨hPet, hFind⟩



theorem recoveryByUnitedStates_intro {p : Person} {c : ComplaintText}
    (hConv : FinalConvictionForChapterViolation p c)
    (hTaint : TransactionTaintedByViolation p c) (hVoid : VoidingDeclaredByExecutive p c) :
    RecoveryByUnitedStates p c :=
  ⟨hConv, hTaint, hVoid⟩

theorem conflictOfInterestViolation_intro {p : Person} {c : ComplaintText}
    (hPart : ParticipatedPersonallyAndSubstantially p c)
    (hInt : FinancialInterestPresent p c) (hNoEx : ¬ ConflictExemptionSatisfied p c) :
    ConflictOfInterestViolation p c :=
  ⟨hPart, hInt, hNoEx⟩

theorem continuingFinancialCrimesEnterprise_intro {p : Person} {c : ComplaintText}
    (hSer : SeriesOfPredicateViolations p c) (hRec : MeetsReceiptsThreshold p c)
    (hCon : MeetsConcertedCountThreshold p c) :
    ContinuingFinancialCrimesEnterprise p c :=
  ⟨hSer, hRec, hCon⟩







theorem withinTwoYearBar_of_days {p : Person} {c : ComplaintText} (n : Nat)
    (h : DaysSinceServiceTermination p c = n) (hle : n ≤ 730) :
    WithinTwoYearBar p c := by
  unfold WithinTwoYearBar; omega

theorem withinOneYearBar_of_days {p : Person} {c : ComplaintText} (n : Nat)
    (h : DaysSinceServiceTermination p c = n) (hle : n ≤ 365) :
    WithinOneYearBar p c := by
  unfold WithinOneYearBar; omega

theorem meetsReceiptsThreshold_of_amount {p : Person} {c : ComplaintText} (n : Nat)
    (h : GrossReceiptsInTwentyFourMonths p c = n) (hge : n ≥ 5000000) :
    MeetsReceiptsThreshold p c := by
  unfold MeetsReceiptsThreshold; omega

theorem meetsConcertedCountThreshold_of_count {p : Person} {c : ComplaintText} (n : Nat)
    (h : PersonsActingInConcert p c = n) (hge : n ≥ 4) :
    MeetsConcertedCountThreshold p c := by
  unfold MeetsConcertedCountThreshold; omega

theorem isSpecialGovernmentEmployee_of_days {p : Person} {c : ComplaintText} (n : Nat)
    (h : DaysServedInThreeSixtyFive p c = n) (hle : n ≤ 130) :
    IsSpecialGovernmentEmployee p c := by
  unfold IsSpecialGovernmentEmployee; omega

theorem exceedsSixtyDayThreshold_of_days {p : Person} {c : ComplaintText} (n : Nat)
    (h : AggregateDaysServedPreceding p c = n) (hgt : n > 60) :
    ExceedsSixtyDayThreshold p c := by
  unfold ExceedsSixtyDayThreshold; omega



theorem section207_of_permanent {p : Person} {c : ComplaintText} (h : PermanentRepresentationBar p c) :
    Section207CoolingOffViolation p c :=
  .permanent h

theorem section216_of_felony {p : Person} {c : ComplaintText} (h : FelonyPenaltyTrigger p c) :
    Section216EnforcementDisposition p c :=
  .felony h

end Proving.USC.T18.Ch11.Procedure
