import Proving.USC.Common.Types
import Proving.USC.T18.Ch75.Reslice.Procedure.Types
import Proving.USC.T18.Ch75.Reslice.Procedure.Predicates
import Proving.USC.T18.Ch75.Reslice.Procedure.Statute

set_option autoImplicit false









namespace Proving.USC.T18.Ch75.Reslice.Procedure

open Proving.USC.Common




theorem useAfterVoidance_intro {tl : DocumentTimeline}
    (h : tl.voidanceDay ≤ tl.useDay) : UseAfterVoidance tl := h


theorem isFirstOrSecondSuchOffense_intro {sf : SentencingFacts}
    (h : sf.suchOffenseOrdinal ≤ 2) : IsFirstOrSecondSuchOffense sf := h


theorem sentenceWithinStatutoryMaximum_intro {sf : SentencingFacts}
    (h : sf.imposedImprisonmentYears ≤ statutoryMaximumYears sf) :
    SentenceWithinStatutoryMaximum sf := h


theorem sentenceWithinSection1546bMaximum_intro {sf : SentencingFacts}
    (h : sf.imposedImprisonmentYears ≤ 5) :
    SentenceWithinSection1546bMaximum sf := h



theorem statutoryMaximumYears_terrorism (sf : SentencingFacts)
    (h : sf.facilitatesInternationalTerrorism = true) :
    statutoryMaximumYears sf = 25 := by
  simp [statutoryMaximumYears, h]



theorem statutoryMaximumYears_drugTrafficking (sf : SentencingFacts)
    (h1 : sf.facilitatesInternationalTerrorism = false)
    (h2 : sf.facilitatesDrugTraffickingCrime = true) :
    statutoryMaximumYears sf = 20 := by
  simp [statutoryMaximumYears, h1, h2]



theorem statutoryMaximumYears_firstOrSecond (sf : SentencingFacts)
    (h1 : sf.facilitatesInternationalTerrorism = false)
    (h2 : sf.facilitatesDrugTraffickingCrime = false)
    (h3 : sf.suchOffenseOrdinal ≤ 2) :
    statutoryMaximumYears sf = 10 := by
  simp [statutoryMaximumYears, h1, h2, h3]


theorem statutoryMaximumYears_other (sf : SentencingFacts)
    (h1 : sf.facilitatesInternationalTerrorism = false)
    (h2 : sf.facilitatesDrugTraffickingCrime = false)
    (h3 : ¬ sf.suchOffenseOrdinal ≤ 2) :
    statutoryMaximumYears sf = 15 := by
  simp [statutoryMaximumYears, h1, h2, h3]


theorem statutoryMaximumYears_le_twentyFive (sf : SentencingFacts) :
    statutoryMaximumYears sf ≤ 25 := by
  unfold statutoryMaximumYears
  repeat' split
  all_goals omega




theorem documentReachedApplied_intro {d : TravelDocument} {c : ComplaintText}
    (h : ApplicationForPassportSubmitted d c) :
    DocumentReached d c DocumentStage.applied :=
  DocumentReached.applied h


theorem documentReachedIssued_intro {d : TravelDocument} {c : ComplaintText}
    (hApplied : ApplicationForPassportSubmitted d c)
    (hIssued : PassportIssuedUnderUSAuthority d c) :
    DocumentReached d c DocumentStage.issued :=
  DocumentReached.issued (DocumentReached.applied hApplied) hIssued


theorem documentReachedVoid_intro {d : TravelDocument} {c : ComplaintText}
    (hIssued : PassportIssuedUnderUSAuthority d c)
    (hVoid : PassportVoidedByPrescribedCondition d c) :
    DocumentReached d c DocumentStage.void :=
  DocumentReached.void (DocumentReached.issuedOnRecord hIssued) hVoid




theorem section1542Track_intro {d : TravelDocument} {c : ComplaintText}
    (hApplied : DocumentReached d c DocumentStage.applied)
    (hRules : ContraryToPassportIssuanceRules d c)
    (hFalse : IssuanceSecuredByFalseStatement d c) :
    Section1542Track d c :=
  Section1542Track.falseApplication hApplied hRules hFalse



theorem section1543Track_intro {d : TravelDocument} {c : ComplaintText}
    {tl : DocumentTimeline}
    (hVoid : DocumentReached d c DocumentStage.void)
    (hUsed : DocumentUsedOrPresented d c)
    (hTimeline : DocumentTimelineFound d tl c)
    (hOrder : tl.voidanceDay ≤ tl.useDay) :
    Section1543Track d c :=
  Section1543Track.useOfVoidedPassport hVoid hUsed tl hTimeline
    (useAfterVoidance_intro hOrder)


theorem section1544Track_intro {d : TravelDocument} {c : ComplaintText}
    (hIssued : DocumentReached d c DocumentStage.issued)
    (hAnother : DocumentDesignatedForUseOfAnother d c)
    (hUsed : DocumentUsedOrPresented d c) :
    Section1544Track d c :=
  Section1544Track.useOfAnothersPassport hIssued hAnother hUsed


theorem section1546aTrack_intro {pr : Prosecution} {p : Person}
    {d : TravelDocument} {f : ImmigrationFiling} {c : ComplaintText}
    (hRequired : FilingRequiredByImmigrationLaws f c)
    (hSworn : SwornOrSubscribedUnderPenaltyOfPerjury f c)
    (hPresented : FilingPresentedToAuthority f c) :
    Section1546aTrack pr p d f c :=
  Section1546aTrack.falseSwornFiling hRequired hSworn hPresented




theorem section1546aTrackApparatus_intro {pr : Prosecution} {p : Person}
    {d : TravelDocument} {f : ImmigrationFiling} {c : ComplaintText}
    (hNotDirected : ¬ UnderDirectionOfProperOfficer pr c)
    (hControls : ControlsBlankPermitOrPrintingPlate d c) :
    Section1546aTrack pr p d f c :=
  Section1546aTrack.issuanceApparatusWithoutAuthority hNotDirected hControls


theorem section1546bTrack_intro {pr : Prosecution} {d : TravelDocument}
    {f : ImmigrationFiling} {c : ComplaintText}
    (hNotLawful : DocumentNotLawfullyIssuedForPossessor d c)
    (hUsed : DocumentUsedOrPresented d c)
    (hVerification : UsedToSatisfySection274ABRequirement pr c) :
    Section1546bTrack pr d f c :=
  Section1546bTrack.unlawfulIdentificationDocument hNotLawful hUsed hVerification



theorem chapter75ChargingTheory_intro {pr : Prosecution} {p : Person}
    {d : TravelDocument} {f : ImmigrationFiling} {c : ComplaintText}
    (h : Section1542Track d c) : Chapter75ChargingTheory pr p d f c :=
  Chapter75ChargingTheory.s1542 h




theorem lawfulImprisonment_intro {pr : Prosecution} {sf : SentencingFacts}
    {c : ComplaintText}
    (hFacts : SentencingFactsFound pr sf c)
    (hImprisoned : ImprisonmentImposed pr c)
    (hWithin : sf.imposedImprisonmentYears ≤ statutoryMaximumYears sf) :
    LawfulImprisonment pr sf c :=
  ⟨hFacts, hImprisoned, sentenceWithinStatutoryMaximum_intro hWithin⟩


theorem lawfulSection1546bImprisonment_intro {pr : Prosecution}
    {sf : SentencingFacts} {c : ComplaintText}
    (hFacts : SentencingFactsFound pr sf c)
    (hImprisoned : ImprisonmentImposed pr c)
    (hWithin : sf.imposedImprisonmentYears ≤ 5) :
    LawfulSection1546bImprisonment pr sf c :=
  ⟨hFacts, hImprisoned, sentenceWithinSection1546bMaximum_intro hWithin⟩


theorem lawfulChapter75Sentence_intro {pr : Prosecution} {sf : SentencingFacts}
    {c : ComplaintText}
    (hImposed : SentenceImposed pr c)
    (hFine : FineImposedUnderThisTitle pr c)
    (hTerm : LawfulImprisonment pr sf c) :
    LawfulChapter75Sentence pr sf c :=
  LawfulChapter75Sentence.fineAndImprisonment hImposed hFine hTerm




theorem prosecutionReached_intro {pr : Prosecution} {p : Person}
    {d : TravelDocument} {f : ImmigrationFiling} {sf : SentencingFacts}
    {c : ComplaintText}
    (hTheory : Chapter75ChargingTheory pr p d f c)
    (hCommenced : ProsecutionCommenced pr c)
    (hNotExempt : ¬ LawfullyAuthorizedAgencyActivity pr c)
    (hGuilty : AdjudicatedGuilty pr c)
    (hSentence : LawfulChapter75Sentence pr sf c) :
    ProsecutionReached pr p d f sf c ProsecutionStage.sentenced :=
  ProsecutionReached.sentenced
    (ProsecutionReached.convicted
      (ProsecutionReached.charged (ProsecutionReached.conduct hTheory) hCommenced
        hNotExempt)
      hGuilty)
    hSentence


theorem validChapter75Prosecution_intro {pr : Prosecution} {p : Person}
    {d : TravelDocument} {f : ImmigrationFiling} {sf : SentencingFacts}
    {c : ComplaintText}
    (hTheory : Chapter75ChargingTheory pr p d f c)
    (hCommenced : ProsecutionCommenced pr c)
    (hNotExempt : ¬ LawfullyAuthorizedAgencyActivity pr c)
    (hGuilty : AdjudicatedGuilty pr c)
    (hSentence : LawfulChapter75Sentence pr sf c) :
    ValidChapter75Prosecution pr p d f sf c :=
  ⟨hTheory, hCommenced, hNotExempt, hGuilty, hSentence⟩


theorem prosecutionCompleted_intro {pr : Prosecution} {p : Person}
    {d : TravelDocument} {f : ImmigrationFiling} {sf : SentencingFacts}
    {c : ComplaintText}
    (h : ValidChapter75Prosecution pr p d f sf c) :
    ProsecutionCompleted pr p d f sf c :=
  prosecutionReached_intro h.theory h.commenced h.notExempt h.guilty h.sentence




theorem prosecutionGuardChargeFiled_intro {pr : Prosecution} {p : Person}
    {d : TravelDocument} {f : ImmigrationFiling} {sf : SentencingFacts}
    {c : ComplaintText}
    (hCommenced : ProsecutionCommenced pr c)
    (hTheory : Chapter75ChargingTheory pr p d f c)
    (hNotExempt : ¬ LawfullyAuthorizedAgencyActivity pr c) :
    prosecutionGuard pr p d f sf c stepChargeFiled := by
  exact ⟨hCommenced, hTheory, hNotExempt⟩


theorem prosecutionGuardAdjudication_intro {pr : Prosecution} {p : Person}
    {d : TravelDocument} {f : ImmigrationFiling} {sf : SentencingFacts}
    {c : ComplaintText} (hGuilty : AdjudicatedGuilty pr c) :
    prosecutionGuard pr p d f sf c stepAdjudication := by
  exact hGuilty


theorem prosecutionGuardSentencing_intro {pr : Prosecution} {p : Person}
    {d : TravelDocument} {f : ImmigrationFiling} {sf : SentencingFacts}
    {c : ComplaintText} (hSentence : LawfulChapter75Sentence pr sf c) :
    prosecutionGuard pr p d f sf c stepSentencing := by
  exact hSentence



theorem prosecutionGuard_conductToSentenced_false {pr : Prosecution} {p : Person}
    {d : TravelDocument} {f : ImmigrationFiling} {sf : SentencingFacts}
    {c : ComplaintText} :
    ¬ prosecutionGuard pr p d f sf c
        { source := ProsecutionStage.conduct, target := ProsecutionStage.sentenced } := by
  intro h
  exact h

end Proving.USC.T18.Ch75.Reslice.Procedure
