






import Proving.USC.T18.Ch77.Reslice.Scienter.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Reslice.Scienter

open Proving.USC.Common (Person ComplaintText)



theorem MentalState.atLeast_refl (a : MentalState) : a.atLeast a := Nat.le_refl _

theorem MentalState.atLeast_trans {a b c : MentalState}
    (hab : a.atLeast b) (hbc : b.atLeast c) : a.atLeast c :=
  Nat.le_trans hbc hab




theorem demandMet_mono {r₁ r₂ : MentalState} {d : Demand}
    (hmono : r₂.atLeast r₁) (h : DemandMet r₁ d) : DemandMet r₂ d := by
  cases d with
  | none => exact trivial
  | some req =>
      have h' : req.rank ≤ r₁.rank := h
      have hm : r₁.rank ≤ r₂.rank := hmono
      exact Nat.le_trans h' hm





theorem mentalStateProven_of_rung {p : Person} {elem : ScienterElement}
    {c : ComplaintText} {r : MentalState}
    (h : (provenRung p elem c).atLeast r) : MentalStateProven p elem r c := h



theorem elementScienterMet_of_rung {p : Person} {elem : ScienterElement}
    {c : ComplaintText} {r : MentalState}
    (hEq : provenRung p elem c = r)
    (hDem : DemandMet r (RequiredMentalState elem)) : ElementScienterMet p elem c := by
  unfold ElementScienterMet
  rw [hEq]
  exact hDem



theorem elementScienterMet_of_mentalStateProven {p : Person} {elem : ScienterElement}
    {c : ComplaintText} {req : MentalState}
    (hreq : RequiredMentalState elem = some req)
    (h : MentalStateProven p elem req c) : ElementScienterMet p elem c := by
  unfold ElementScienterMet
  rw [hreq]
  exact h



theorem chapterViolationCircumstance1590a_rung_unspecified :
    RequiredMentalState .chapterViolationCircumstance1590a = none := rfl

theorem obstruction1590b_rung_unspecified :
    RequiredMentalState .obstruction1590b = none := rfl

theorem obstruction1591d_rung_unspecified :
    RequiredMentalState .obstruction1591d = none := rfl

theorem inCourseOfViolation1592a1_rung_unspecified :
    RequiredMentalState .inCourseOfViolation1592a1 = none := rfl

theorem obstruction1592c_rung_unspecified :
    RequiredMentalState .obstruction1592c = none := rfl



theorem advertising_demands_knowledge :
    circumstanceRung1591 .advertising = MentalState.Knowledge := rfl

theorem otherConduct_demands_recklessness :
    circumstanceRung1591 .otherConduct = MentalState.Recklessness := rfl



theorem advertising_rung_above_otherConduct :
    (circumstanceRung1591 .advertising).atLeast (circumstanceRung1591 .otherConduct) := by
  decide

theorem otherConduct_rung_below_advertising :
    ¬ (circumstanceRung1591 .otherConduct).atLeast (circumstanceRung1591 .advertising) := by
  decide



theorem scienter1590a_intro {p : Person} {c : ComplaintText}
    (hConduct : ElementScienterMet p .conduct1590a c)
    (hChapter : ElementScienterMet p .chapterViolationCircumstance1590a c) :
    Scienter1590a p c :=
  ⟨hConduct, hChapter⟩

theorem aggravator1590a_intro {p : Person} {c : ComplaintText}
    (h : ElementScienterMet p .deathOrKidnapResult1590a c) : Aggravator1590a p c :=
  .resultBranch h

theorem aggravator1590a_intro_attempt {p : Person} {c : ComplaintText}
    (h : ElementScienterMet p .attemptAggravator1590a c) : Aggravator1590a p c :=
  .attemptBranch h



theorem obstructionScienter_intro {p : Person} {completed attempted : ScienterElement}
    {c : ComplaintText} (h : ElementScienterMet p completed c) :
    ObstructionScienter p completed attempted c :=
  .completedBranch h

theorem obstructionScienter_intro_attempted {p : Person} {completed attempted : ScienterElement}
    {c : ComplaintText} (h : ElementScienterMet p attempted c) :
    ObstructionScienter p completed attempted c :=
  .attemptedBranch h

theorem obstructionScienter1590b_intro {p : Person} {c : ComplaintText}
    (h : ElementScienterMet p .obstruction1590b c) : ObstructionScienter1590b p c :=
  .completedBranch h

theorem obstructionScienter1591d_intro {p : Person} {c : ComplaintText}
    (h : ElementScienterMet p .obstruction1591d c) : ObstructionScienter1591d p c :=
  .completedBranch h

theorem obstructionScienter1592c_intro {p : Person} {c : ComplaintText}
    (h : ElementScienterMet p .obstruction1592c c) : ObstructionScienter1592c p c :=
  .completedBranch h



theorem circumstanceScienter1591_intro {p : Person} {m : ActModality} {c : ComplaintText}
    (h : ElementScienterMet p (.meansCircumstance1591a m) c) :
    CircumstanceScienter1591 p m c :=
  .coerciveMeans h

theorem circumstanceScienter1591_intro_minority {p : Person} {m : ActModality}
    {c : ComplaintText} (h : ElementScienterMet p (.ageCircumstance1591a m) c) :
    CircumstanceScienter1591 p m c :=
  .minority h

theorem circumstanceScienter1591a1_intro {d v : Person} {m : ActModality} {c : ComplaintText}
    (h : CircumstanceScienter1591 d m c) : CircumstanceScienter1591a1 d v m c :=
  .provedRung h



theorem circumstanceScienter1591a1_intro_observeCarve {d v : Person} {m : ActModality}
    {c : ComplaintText} (h : ReasonableOpportunityToObserve d v c) :
    CircumstanceScienter1591a1 d v m c :=
  .observeCarve h

theorem scienter1591a1_intro {d v : Person} {m : ActModality} {c : ComplaintText}
    (hConduct : ElementScienterMet d .conduct1591a1 c)
    (hModality : ActModalityOfConduct d m c)
    (hCircumstance : CircumstanceScienter1591a1 d v m c) :
    Scienter1591a1 d v m c :=
  ⟨hConduct, hModality, hCircumstance⟩

theorem scienter1591a2_intro {p : Person} {m : ActModality} {c : ComplaintText}
    (hBenefit : ElementScienterMet p .benefit1591a2 c)
    (hParticipation : ElementScienterMet p .ventureParticipation1591e4 c)
    (hModality : ActModalityOfConduct p m c)
    (hCircumstance : CircumstanceScienter1591 p m c) :
    Scienter1591a2 p m c :=
  ⟨hBenefit, hParticipation, hModality, hCircumstance⟩



theorem documentTheory1592a_intro {p : Person} {c : ComplaintText}
    (h : ElementScienterMet p .inCourseOfViolation1592a1 c) : DocumentTheory1592a p c :=
  .inCourseOfViolation h

theorem documentTheory1592a_intro_intentToViolate {p : Person} {c : ComplaintText}
    (h : ElementScienterMet p .intentToViolate1592a2 c) : DocumentTheory1592a p c :=
  .intentToViolate h

theorem documentTheory1592a_intro_libertyRestrictionPurpose {p : Person} {c : ComplaintText}
    (h : ElementScienterMet p .libertyRestrictionPurpose1592a3 c) : DocumentTheory1592a p c :=
  .libertyRestrictionPurpose h

theorem scienter1592a_intro {p : Person} {c : ComplaintText}
    (hConduct : ElementScienterMet p .documentConduct1592a c)
    (hTheory : DocumentTheory1592a p c)
    (hNotException : ¬ VictimStatusConductException1592b p c) :
    Scienter1592a p c :=
  ⟨hConduct, hTheory, hNotException⟩

end Proving.USC.T18.Ch77.Reslice.Scienter
