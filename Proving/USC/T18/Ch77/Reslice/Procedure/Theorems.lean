









import Proving.USC.T18.Ch77.Reslice.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Reslice.Procedure

open Proving.USC.Common




theorem transitionTaken_intro {t : Transition} (h : t.guard) : TransitionTaken t :=
  ⟨h⟩



theorem section1590ProsecutionMadeOut_intro
    {d v : Person} {c : ComplaintText}
    (hConduct : RecruitedOrObtainedForLaborOrServices d v c)
    (hChapter : LaborOrServicesInViolationOfThisChapter d v c) :
    Section1590ProsecutionMadeOut d v c :=
  ⟨hConduct, hChapter⟩



theorem section1591ProsecutionMadeOut_intro
    {pr : Prosecution} {d v : Person} {c : ComplaintText}
    (hRoute : ChargingRoute1591 d v c)
    (hMensRea : MensReaProofObligationDischarged1591 pr d v c)
    (hAgeProof : AgeKnowledgeProofObligationDischarged1591 pr d v c) :
    Section1591ProsecutionMadeOut pr d v c :=
  ⟨hRoute, hMensRea, hAgeProof⟩


theorem section1591TierOne_intro
    {pr : Prosecution} {v : Person} {c : ComplaintText}
    (hTrigger : EffectedByForceThreatsFraudOrCoercion pr c ∨ UnderFourteenAtOffense v pr c) :
    Section1591TierOne pr v c :=
  ⟨hTrigger⟩


theorem section1591TierTwo_intro
    {pr : Prosecution} {v : Person} {c : ComplaintText}
    (hNotEffected : ¬ EffectedByForceThreatsFraudOrCoercion pr c)
    (hBand : FourteenToSeventeenAtOffense v pr c) :
    Section1591TierTwo pr v c :=
  ⟨hNotEffected, hBand⟩




theorem section1592Chargeable_intro
    {d v : Person} {doc : IdentityDocument} {c : ComplaintText}
    (hConduct : KnowinglyHandledIdentityDocument d doc c)
    (hRoute : DocumentOffenseRoute1592 d v c)
    (hNotExempt : ¬ Section1592VictimExemption d c) :
    Section1592Chargeable d v doc c :=
  ⟨hConduct, hRoute, hNotExempt⟩


theorem ch77ObstructionMadeOut_intro
    {sec : Ch77ObstructionSection} {d : Person} {c : ComplaintText}
    (hObstructed : ObstructedEnforcement sec d c) :
    Ch77ObstructionMadeOut sec d c :=
  ⟨hObstructed⟩



theorem section1591Reached_sentenceImposed_intro
    {pr : Prosecution} {d v : Person} {s : SentenceRecord} {c : ComplaintText}
    (hRoute : ChargingRoute1591 d v c)
    (hCommenced : ProsecutionCommencedUnderSection1591a1 pr c)
    (hCase : Section1591ProsecutionMadeOut pr d v c)
    (hTier : Section1591TierOne pr v c ∨ Section1591TierTwo pr v c)
    (hWindow : Section1591TierOneSentenceLawful s c ∨ Section1591TierTwoSentenceLawful s c) :
    Section1591Reached pr d v s c Stage.SentenceImposed :=
  .sentenceImposed
    (.penaltyTierDetermined
      (.elementsProven
        (.prosecutionCommenced (.conductCompleted hRoute) hCommenced)
        hCase)
      hTier)
    hWindow





theorem section1591_age_bands_exhaustive
    {pr : Prosecution} {v : Person} {c : ComplaintText}
    (hMinor : MinorAtOffense v pr c) :
    UnderFourteenAtOffense v pr c ∨ FourteenToSeventeenAtOffense v pr c := by
  unfold MinorAtOffense at hMinor
  unfold UnderFourteenAtOffense FourteenToSeventeenAtOffense
  omega


theorem section1591_age_bands_exclusive
    {pr : Prosecution} {v : Person} {c : ComplaintText} :
    ¬ (UnderFourteenAtOffense v pr c ∧ FourteenToSeventeenAtOffense v pr c) := by
  unfold UnderFourteenAtOffense FourteenToSeventeenAtOffense
  intro h
  omega



theorem section1591TierTwo_implies_minor
    {pr : Prosecution} {v : Person} {c : ComplaintText}
    (h : Section1591TierTwo pr v c) : MinorAtOffense v pr c := by
  have hb := h.ageBand
  unfold FourteenToSeventeenAtOffense at hb
  unfold MinorAtOffense
  omega



theorem section1591_tiers_are_exclusive
    {pr : Prosecution} {v : Person} {c : ComplaintText}
    (h1 : Section1591TierOne pr v c) (h2 : Section1591TierTwo pr v c) : False := by
  cases h1.trigger with
  | inl hEffected => exact h2.notEffected hEffected
  | inr hUnder14 =>
      have hb := h2.ageBand
      unfold UnderFourteenAtOffense at hUnder14
      unfold FourteenToSeventeenAtOffense at hb
      omega





theorem section1592_intent_route_excludes_s1594a :
    intentToViolateEligible Ch77PredicateSection.S1594a = false := by decide


theorem section1592_in_course_route_includes_s1594a :
    inCourseOfEligible Ch77PredicateSection.S1594a = true := by decide




theorem section1592_intent_list_subsumed_by_in_course_list
    (sec : Ch77PredicateSection) :
    intentToViolateEligible sec = true → inCourseOfEligible sec = true := by
  cases sec <;> decide



theorem obstruction_base_ceiling_bounded_by_25 (sec : Ch77ObstructionSection) :
    obstructionBasePenaltyCeilingYears sec ≤ 25 := by
  cases sec <;> decide



theorem section1590_base_sentence_satisfies_obstruction_window
    {s : SentenceRecord} {c : ComplaintText}
    (h : Section1590BaseSentenceLawful s c) :
    Ch77ObstructionBaseSentenceLawful Ch77ObstructionSection.S1590 s c :=
  ⟨h.1, h.2.2⟩



theorem section1592_sentence_satisfies_obstruction_window
    {s : SentenceRecord} {c : ComplaintText}
    (h : Section1592SentenceLawful s c) :
    Ch77ObstructionBaseSentenceLawful Ch77ObstructionSection.S1592 s c :=
  ⟨h.1, h.2.2⟩

end Proving.USC.T18.Ch77.Reslice.Procedure
