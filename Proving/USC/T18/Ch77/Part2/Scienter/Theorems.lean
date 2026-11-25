







import Proving.USC.T18.Ch77.Part2.Scienter.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part2.Scienter

open Proving.USC.Common




theorem mentalState_atLeast_refl (a : MentalState) : MentalState.atLeast a a :=
  Nat.le_refl _


theorem mentalState_atLeast_trans {a b d : MentalState}
    (hab : MentalState.atLeast a b) (hbd : MentalState.atLeast b d) :
    MentalState.atLeast a d :=
  Nat.le_trans hbd hab



theorem specific_atLeast (req : MentalState) :
    MentalState.atLeast MentalState.Specific req := by
  show MentalState.rank req ≤ MentalState.rank MentalState.Specific
  cases req <;> decide



theorem atLeast_strictLiability (rung : MentalState) :
    MentalState.atLeast rung MentalState.StrictLiability := by
  show MentalState.rank MentalState.StrictLiability ≤ MentalState.rank rung
  cases rung <;> decide




theorem scienterAtLeast_mono {p : Person} {t : ScienterTarget}
    {req req' : MentalState} {c : ComplaintText}
    (hOrd : MentalState.atLeast req' req) (h : ScienterAtLeast p t req' c) :
    ScienterAtLeast p t req c :=
  match h with
  | ⟨rung, hr, hp⟩ => ⟨rung, Nat.le_trans hOrd hr, hp⟩





theorem scienterAtLeast_intro {p : Person} {t : ScienterTarget}
    {req : MentalState} {c : ComplaintText} (rung : MentalState)
    (hReach : MentalState.atLeast rung req)
    (hProv : MentalStateProven p t rung c) : ScienterAtLeast p t req c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1591a1_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : MentalState.atLeast rung RequiredMentalState1591a1)
    (hProv : MentalStateProven p .traffickingAct rung c) : Scienter1591a1 p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1591a2_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : MentalState.atLeast rung RequiredMentalState1591a2)
    (hProv : MentalStateProven p .benefitFromVenture rung c) : Scienter1591a2 p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1591e4_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : MentalState.atLeast rung RequiredMentalState1591e4)
    (hProv : MentalStateProven p .participationInVenture rung c) :
    Scienter1591e4 p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1591aMeans_intro {p : Person} {posture : ChargingPosture}
    {c : ComplaintText} (rung : MentalState)
    (hReach : MentalState.atLeast rung (RequiredMentalState1591aMeans posture))
    (hProv : MentalStateProven p .meansOfCompulsion rung c) :
    Scienter1591aMeans p posture c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1591aAge_intro {p : Person} {posture : ChargingPosture}
    {c : ComplaintText} (rung : MentalState)
    (hReach : MentalState.atLeast rung (RequiredMentalState1591aAge posture))
    (hProv : MentalStateProven p .victimMinority rung c) :
    Scienter1591aAge p posture c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1591e2B_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : MentalState.atLeast rung RequiredMentalState1591e2B)
    (hProv : MentalStateProven p .coercionScheme rung c) : Scienter1591e2B p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1591e1_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : MentalState.atLeast rung RequiredMentalState1591e1)
    (hProv : MentalStateProven p .abuseOfLegalProcess rung c) : Scienter1591e1 p c :=
  ⟨rung, hReach, hProv⟩



theorem scienter1591d_intro {p : Person} {c : ComplaintText} {req : MentalState}
    (rung : MentalState) (hReach : MentalState.atLeast rung req)
    (hProv : MentalStateProven p .obstruction rung c) : Scienter1591d p req c :=
  ⟨rung, hReach, hProv⟩


theorem scienter1591aCircumstance_intro {p : Person} {posture : ChargingPosture}
    {c : ComplaintText}
    (h : Scienter1591aMeans p posture c ∨ Scienter1591aAge p posture c) :
    Scienter1591aCircumstance p posture c :=
  h.elim Scienter1591aCircumstance.byMeansOfCompulsion
         Scienter1591aCircumstance.byVictimMinority


theorem scienter1591CoercionIntent_intro {p : Person} {c : ComplaintText}
    (h : Scienter1591e2B p c ∨ Scienter1591e1 p c) :
    Scienter1591CoercionIntent p c :=
  h.elim Scienter1591CoercionIntent.viaSchemeIntendedToCauseBelief
         Scienter1591CoercionIntent.viaAbuseOfLegalProcess


theorem scienter1591a1Culpable_intro {p : Person} {posture : ChargingPosture}
    {c : ComplaintText} (knowingAct : Scienter1591a1 p c)
    (circumstance : Scienter1591aCircumstance p posture c) :
    Scienter1591a1Culpable p posture c :=
  { knowingAct := knowingAct, circumstance := circumstance }


theorem scienter1591a2Culpable_intro {p : Person} {posture : ChargingPosture}
    {c : ComplaintText} (knowingBenefit : Scienter1591a2 p c)
    (knowingParticipation : Scienter1591e4 p c)
    (circumstance : Scienter1591aCircumstance p posture c) :
    Scienter1591a2Culpable p posture c :=
  { knowingBenefit := knowingBenefit
    knowingParticipation := knowingParticipation
    circumstance := circumstance }


theorem scienter1591Culpable_intro {p : Person} {posture : ChargingPosture}
    {c : ComplaintText}
    (h : Scienter1591a1Culpable p posture c ∨ Scienter1591a2Culpable p posture c) :
    Scienter1591Culpable p posture c :=
  h.elim Scienter1591Culpable.viaSubsectionA1 Scienter1591Culpable.viaSubsectionA2


theorem scienter1591_intro {p : Person} {c : ComplaintText}
    (h : Scienter1591Culpable p (posture1591 p c) c) : Scienter1591 p c :=
  h






theorem required1591aMeans_advertising {posture : ChargingPosture}
    (h : posture.actIsAdvertising = true) :
    RequiredMentalState1591aMeans posture = MentalState.Knowledge := by
  simp [RequiredMentalState1591aMeans, h]


theorem required1591aMeans_nonAdvertising {posture : ChargingPosture}
    (h : posture.actIsAdvertising = false) :
    RequiredMentalState1591aMeans posture = MentalState.Recklessness := by
  simp [RequiredMentalState1591aMeans, h]




theorem required1591aAge_reliefUnderC {posture : ChargingPosture}
    (h1 : posture.underSubsectionA1 = true)
    (h2 : posture.reasonableOpportunityToObserve = true) :
    RequiredMentalState1591aAge posture = MentalState.StrictLiability := by
  simp [RequiredMentalState1591aAge, h1, h2]




theorem scienter1591aAge_underC {p : Person} {posture : ChargingPosture}
    {c : ComplaintText} (h1 : posture.underSubsectionA1 = true)
    (h2 : posture.reasonableOpportunityToObserve = true) (rung : MentalState)
    (hProv : MentalStateProven p .victimMinority rung c) :
    Scienter1591aAge p posture c := by
  have hreq : RequiredMentalState1591aAge posture = MentalState.StrictLiability :=
    required1591aAge_reliefUnderC h1 h2
  have hreach : MentalState.atLeast rung (RequiredMentalState1591aAge posture) := by
    rw [hreq]
    exact atLeast_strictLiability rung
  exact ⟨rung, hreach, hProv⟩


theorem required1591d_unspecified : RequiredMentalState1591d = none := rfl







theorem scienter1591_reachable {p : Person} {c : ComplaintText}
    (hAct : MentalStateProven p .traffickingAct MentalState.Specific c)
    (hMeans : MentalStateProven p .meansOfCompulsion MentalState.Specific c) :
    Scienter1591 p c :=
  Scienter1591Culpable.viaSubsectionA1
    { knowingAct := ⟨MentalState.Specific, specific_atLeast _, hAct⟩
      circumstance := Scienter1591aCircumstance.byMeansOfCompulsion
        ⟨MentalState.Specific, specific_atLeast _, hMeans⟩ }

end Proving.USC.T18.Ch77.Part2.Scienter
