







import Proving.USC.T18.Ch77.Part4.Scienter.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.Scienter

open Proving.USC.Common



theorem mentalState_atLeast_refl (m : MentalState) : MentalState.atLeast m m :=
  Nat.le_refl _

theorem mentalState_atLeast_trans {a b d : MentalState}
    (hab : MentalState.atLeast a b) (hbd : MentalState.atLeast b d) :
    MentalState.atLeast a d :=
  Nat.le_trans hbd hab



theorem provenAtLeast_intro {p : Person} {el : ScienterElement} {m : MentalState}
    {c : ComplaintText} (rung : MentalState)
    (hReach : MentalState.atLeast rung m) (hProv : MentalStateProven p el rung c) :
    ProvenAtLeast p el m c :=
  ⟨rung, hReach, hProv⟩


theorem provenAtLeast_mono {p : Person} {el : ScienterElement} {m m' : MentalState}
    {c : ComplaintText} (hOrd : MentalState.atLeast m m') (h : ProvenAtLeast p el m c) :
    ProvenAtLeast p el m' c :=
  match h with
  | ⟨rung, hReach, hProv⟩ => ⟨rung, mentalState_atLeast_trans hReach hOrd, hProv⟩





theorem demandMet_strictLiability (p : Person) (el : ScienterElement) (c : ComplaintText) :
    DemandMet (ScienterDemand.atLeast MentalState.StrictLiability) p el c :=
  trivial

theorem demandMet_of_provenAtLeast {p : Person} {el : ScienterElement} {c : ComplaintText}
    {m : MentalState} (h : ProvenAtLeast p el m c) :
    DemandMet (ScienterDemand.atLeast m) p el c := by
  cases m with
  | StrictLiability => exact trivial
  | Negligence => exact h
  | Recklessness => exact h
  | Knowledge => exact h
  | Specific => exact h

theorem provenAtLeast_of_demandMet {p : Person} {el : ScienterElement} {c : ComplaintText}
    {m : MentalState} (hm : m ≠ MentalState.StrictLiability)
    (h : DemandMet (ScienterDemand.atLeast m) p el c) : ProvenAtLeast p el m c := by
  cases m with
  | StrictLiability => exact absurd rfl hm
  | Negligence => exact h
  | Recklessness => exact h
  | Knowledge => exact h
  | Specific => exact h




theorem demandMet_mono {p : Person} {el : ScienterElement} {c : ComplaintText}
    {m m' : MentalState} (hOrd : MentalState.atLeast m m')
    (h : DemandMet (ScienterDemand.atLeast m) p el c) :
    DemandMet (ScienterDemand.atLeast m') p el c := by
  cases m' with
  | StrictLiability => exact trivial
  | Negligence =>
      cases m with
      | StrictLiability => exact absurd hOrd (by decide)
      | Negligence => exact provenAtLeast_mono hOrd h
      | Recklessness => exact provenAtLeast_mono hOrd h
      | Knowledge => exact provenAtLeast_mono hOrd h
      | Specific => exact provenAtLeast_mono hOrd h
  | Recklessness =>
      cases m with
      | StrictLiability => exact absurd hOrd (by decide)
      | Negligence => exact absurd hOrd (by decide)
      | Recklessness => exact provenAtLeast_mono hOrd h
      | Knowledge => exact provenAtLeast_mono hOrd h
      | Specific => exact provenAtLeast_mono hOrd h
  | Knowledge =>
      cases m with
      | StrictLiability => exact absurd hOrd (by decide)
      | Negligence => exact absurd hOrd (by decide)
      | Recklessness => exact absurd hOrd (by decide)
      | Knowledge => exact provenAtLeast_mono hOrd h
      | Specific => exact provenAtLeast_mono hOrd h
  | Specific =>
      cases m with
      | StrictLiability => exact absurd hOrd (by decide)
      | Negligence => exact absurd hOrd (by decide)
      | Recklessness => exact absurd hOrd (by decide)
      | Knowledge => exact absurd hOrd (by decide)
      | Specific => exact provenAtLeast_mono hOrd h


theorem demandMet_unspecified_intro {p : Person} {el : ScienterElement} {c : ComplaintText}
    (rung : MentalState) (hProv : MentalStateProven p el rung c)
    (hSuff : SufficesForUnspecifiedDemand rung c) :
    DemandMet ScienterDemand.unspecified p el c :=
  ⟨rung, hProv, hSuff⟩



theorem circumstanceScienterMet_intro {p : Person} {el : ScienterElement} {c : ComplaintText}
    (hAdv : ActConstitutingViolationIsAdvertising p c →
      DemandMet RequiredMentalState1591CircumstanceAdvertising p el c)
    (hOther : ¬ ActConstitutingViolationIsAdvertising p c →
      DemandMet RequiredMentalState1591Circumstance p el c) :
    CircumstanceScienterMet p el c :=
  ⟨hAdv, hOther⟩



theorem circumstanceScienterMet_of_knowledge {p : Person} {el : ScienterElement}
    {c : ComplaintText} (h : ProvenAtLeast p el MentalState.Knowledge c) :
    CircumstanceScienterMet p el c :=
  ⟨fun _ => demandMet_of_provenAtLeast h,
   fun _ => demandMet_mono (by decide) (demandMet_of_provenAtLeast h)⟩



theorem circumstanceScienterMet_of_recklessness {p : Person} {el : ScienterElement}
    {c : ComplaintText}
    (hAdv : ActConstitutingViolationIsAdvertising p c →
      DemandMet RequiredMentalState1591CircumstanceAdvertising p el c)
    (h : ProvenAtLeast p el MentalState.Recklessness c) :
    CircumstanceScienterMet p el c :=
  ⟨hAdv, fun _ => demandMet_of_provenAtLeast h⟩



theorem ageScienterRelief_intro {defendant subject : Person} {c : ComplaintText}
    (hPara1 : ProsecutionUnderParagraphOne c)
    (hObserve : ReasonableOpportunityToObserve defendant subject c) :
    AgeScienterRelief defendant subject c :=
  ⟨hPara1, hObserve⟩


theorem ageCircumstanceScienterMet_of_relief {defendant subject : Person} {c : ComplaintText}
    (h : AgeScienterRelief defendant subject c) :
    AgeCircumstanceScienterMet defendant subject c :=
  Or.inl h

theorem ageCircumstanceScienterMet_of_scienter {defendant subject : Person} {c : ComplaintText}
    (h : CircumstanceScienterMet defendant ScienterElement.ageCircumstance c) :
    AgeCircumstanceScienterMet defendant subject c :=
  Or.inr h

theorem circumstanceScienter1591_intro {defendant subject : Person} {c : ComplaintText}
    (h : CircumstanceScienterMet defendant ScienterElement.meansCircumstance c
       ∨ AgeCircumstanceScienterMet defendant subject c) :
    CircumstanceScienter1591 defendant subject c :=
  match h with
  | Or.inl hm => .byMeans hm
  | Or.inr ha => .byAge ha



theorem scienter1591a1_intro {defendant subject : Person} {c : ComplaintText}
    (hConduct :
      DemandMet RequiredMentalState1591aConduct defendant ScienterElement.traffickingAct c)
    (hCircumstance : CircumstanceScienter1591 defendant subject c) :
    Scienter1591a1 defendant subject c :=
  ⟨hConduct, hCircumstance⟩

theorem scienter1591a2_intro {defendant subject : Person} {c : ComplaintText}
    (hBenefit :
      DemandMet RequiredMentalState1591aConduct defendant ScienterElement.benefitFromVenture c)
    (hVenture :
      DemandMet RequiredMentalState1591e4 defendant ScienterElement.ventureAssistance c)
    (hCircumstance : CircumstanceScienter1591 defendant subject c) :
    Scienter1591a2 defendant subject c :=
  ⟨hBenefit, hVenture, hCircumstance⟩

theorem scienter1591Culpable_intro {defendant subject : Person} {c : ComplaintText}
    (h : Scienter1591a1 defendant subject c ∨ Scienter1591a2 defendant subject c) :
    Scienter1591Culpable defendant subject c :=
  match h with
  | Or.inl h1 => .viaParagraphOne h1
  | Or.inr h2 => .viaParagraphTwo h2

theorem scienter1591dCulpable_intro {p : Person} {c : ComplaintText}
    (rung : MentalState)
    (hProv : MentalStateProven p ScienterElement.obstruction rung c)
    (hSuff : SufficesForUnspecifiedDemand rung c) :
    Scienter1591dCulpable p c :=
  demandMet_unspecified_intro rung hProv hSuff

theorem scienter1591e2bCulpable_intro {p : Person} {c : ComplaintText}
    (rung : MentalState) (hReach : MentalState.atLeast rung MentalState.Specific)
    (hProv : MentalStateProven p ScienterElement.coercionScheme rung c) :
    Scienter1591e2bCulpable p c :=
  demandMet_of_provenAtLeast (provenAtLeast_intro rung hReach hProv)

end Proving.USC.T18.Ch77.Part4.Scienter
