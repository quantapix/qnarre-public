import Proving.USC.T18.Ch77.Part5.Scienter.Statute

set_option autoImplicit false









namespace Proving.USC.T18.Ch77.Part5.Scienter

open Proving.USC.Common




theorem demandMet_of_proven {d : Person} {el : ScienterElement1591} {c : ComplaintText}
    {required proven : MentalState}
    (hReach : proven.atLeast required) (hProv : MentalStateProvenAsTo d el proven c) :
    DemandMet (.atLeastRung required) d el c := by
  cases required with
  | StrictLiability => exact trivial
  | Negligence => exact ⟨proven, hReach, hProv⟩
  | Recklessness => exact ⟨proven, hReach, hProv⟩
  | Knowledge => exact ⟨proven, hReach, hProv⟩
  | Specific => exact ⟨proven, hReach, hProv⟩




theorem demandMet_strictLiability {d : Person} {el : ScienterElement1591}
    {c : ComplaintText} : DemandMet (.atLeastRung .StrictLiability) d el c := trivial






theorem ageScienter_relieved_by1591c {d v : Person} {c : ComplaintText}
    (hA1 : chargedUnderParagraph1 d c = true)
    (hObs : hadReasonableOpportunityToObserve d v c = true) :
    DemandMet (RequiredAgeScienter1591 (actIsAdvertising d c)
      (chargedUnderParagraph1 d c) (hadReasonableOpportunityToObserve d v c))
      d .ageCircumstance c := by
  have h : RequiredAgeScienter1591 (actIsAdvertising d c)
      (chargedUnderParagraph1 d c) (hadReasonableOpportunityToObserve d v c)
      = .atLeastRung .StrictLiability := by
    simp [RequiredAgeScienter1591, hA1, hObs]
  rw [h]
  exact trivial



theorem meansScienter_advertising_requiresKnowledge {d : Person} {c : ComplaintText}
    (hAd : actIsAdvertising d c = true) :
    RequiredMeansScienter1591a (actIsAdvertising d c) = .atLeastRung .Knowledge := by
  simp [RequiredMeansScienter1591a, hAd]


theorem circumstanceScienter1591_byMeans_intro {d v : Person} {c : ComplaintText}
    (h : DemandMet (RequiredMeansScienter1591a (actIsAdvertising d c))
      d .meansCircumstance c) : CircumstanceScienter1591 d v c :=
  .byMeans h


theorem circumstanceScienter1591_byAge_intro {d v : Person} {c : ComplaintText}
    (h : DemandMet (RequiredAgeScienter1591 (actIsAdvertising d c)
      (chargedUnderParagraph1 d c) (hadReasonableOpportunityToObserve d v c))
      d .ageCircumstance c) : CircumstanceScienter1591 d v c :=
  .byAge h


theorem scienter1591a1_intro {d v : Person} {c : ComplaintText}
    (hConduct : DemandMet RequiredConductScienter1591a d .traffickingActA1 c)
    (hCirc : CircumstanceScienter1591 d v c) : Scienter1591a1 d v c :=
  ⟨hConduct, hCirc⟩


theorem scienter1591a2_intro {d v : Person} {c : ComplaintText}
    (hBenefit : DemandMet RequiredConductScienter1591a d .benefitFromVentureA2 c)
    (hPart : DemandMet RequiredParticipationScienter1591e4 d .participationInVenture c)
    (hCirc : CircumstanceScienter1591 d v c) : Scienter1591a2 d v c :=
  ⟨hBenefit, hPart, hCirc⟩


theorem culpable1591a_intro {d v : Person} {c : ComplaintText}
    (h : Scienter1591a1 d v c ∨ Scienter1591a2 d v c) : Culpable1591a d v c :=
  h.elim .viaParagraph1 .viaParagraph2


theorem scienter1591d_intro {d : Person} {c : ComplaintText}
    (h : UnspecifiedScienterSatisfied d .obstructionD c) : Scienter1591d d c := h

end Proving.USC.T18.Ch77.Part5.Scienter
