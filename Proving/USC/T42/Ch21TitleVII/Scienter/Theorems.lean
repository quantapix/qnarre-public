



import Proving.USC.T42.Ch21TitleVII.Scienter.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Scienter

open Proving.USC.Common



theorem attributedMentalState_direct {actor : Person} {elem : ScienterElement}
    {rung : MentalState} {c : ComplaintText}
    (h : ProvenMentalState actor elem rung c) :
    AttributedMentalState actor elem rung c := Or.inl h



theorem attributedMentalState_viaControlledCorp {employer corp : Person}
    {elem : ScienterElement} {rung : MentalState} {c : ComplaintText}
    (hctrl : ControlsForeignCorporation employer corp c)
    (h : ProvenMentalState corp elem rung c) :
    AttributedMentalState employer elem rung c :=
  Or.inr (Or.inl ⟨corp, hctrl, h⟩)



theorem attributedMentalState_viaAgent {principal agent : Person}
    {elem : ScienterElement} {rung : MentalState} {c : ComplaintText}
    (hag : ActsAsAgentOf agent principal c)
    (h : ProvenMentalState agent elem rung c) :
    AttributedMentalState principal elem rung c :=
  Or.inr (Or.inr ⟨agent, hag, h⟩)




theorem culpable_intro {actor : Person} {elem : ScienterElement} {c : ComplaintText}
    {req rung : MentalState}
    (hreq : RequiredMentalState elem = some req)
    (hreach : rung.atLeast req)
    (hproven : AttributedMentalState actor elem rung c) :
    Culpable actor elem c := by
  refine ⟨?_, ?_⟩
  · show (RequiredMentalState elem).isSome = true
    rw [hreq]
    rfl
  · intro req' hr
    rw [hreq] at hr
    have hEq : req = req' := Option.some.inj hr
    subst hEq
    exact ⟨rung, hreach, hproven⟩


theorem culpable_of_specific {actor : Person} {elem : ScienterElement}
    {c : ComplaintText} {req : MentalState}
    (hreq : RequiredMentalState elem = some req)
    (hproven : AttributedMentalState actor elem MentalState.specific c) :
    Culpable actor elem c :=
  culpable_intro hreq (MentalState.specific_top req) hproven


theorem culpable_of_strictFloor {actor : Person} {elem : ScienterElement}
    {c : ComplaintText} {rung : MentalState}
    (hreq : RequiredMentalState elem = some MentalState.strictLiability)
    (hproven : AttributedMentalState actor elem rung c) :
    Culpable actor elem c :=
  culpable_intro hreq (MentalState.strictLiability_bot rung) hproven


theorem culpable_escalate {actor : Person} {elem : ScienterElement}
    {c : ComplaintText} {req rung rung' : MentalState}
    (hreq : RequiredMentalState elem = some req)
    (hreach : rung.atLeast req)
    (hup : rung'.atLeast rung)
    (hproven : AttributedMentalState actor elem rung' c) :
    Culpable actor elem c :=
  culpable_intro hreq (MentalState.atLeast_trans hup hreach) hproven



theorem scienterEstablished_byRungProof_intro {actor : Person}
    {elem : ScienterElement} {c : ComplaintText} {req rung : MentalState}
    (hreq : RequiredMentalState elem = some req)
    (hreach : rung.atLeast req)
    (hproven : AttributedMentalState actor elem rung c) :
    ScienterEstablished actor elem c :=
  .byRungProof rung req hreq hreach hproven




theorem scienterEstablished_byMotivatingFactor_intro {actor : Person}
    {elem : ScienterElement} {c : ComplaintText}
    (hsilent : RequiredMentalState elem = none)
    (hgov : MotivatingFactorGoverns elem = true)
    (hmf : ProtectedTraitMotivatingFactor actor c) :
    ScienterEstablished actor elem c :=
  .byMotivatingFactor hsilent hgov hmf


theorem scienterEstablished_of_culpable {actor : Person} {elem : ScienterElement}
    {c : ComplaintText} (h : Culpable actor elem c) :
    ScienterEstablished actor elem c := by
  have hstated : (RequiredMentalState elem).isSome = true := h.1
  have hsat : ∀ req : MentalState, RequiredMentalState elem = some req →
      ∃ rung : MentalState, rung.atLeast req
        ∧ AttributedMentalState actor elem rung c := h.2
  cases hEq : RequiredMentalState elem with
  | none =>
    rw [hEq] at hstated
    exact absurd hstated (by decide)
  | some req =>
    exact Exists.elim (hsat req hEq)
      (fun rung hr => .byRungProof rung req hEq hr.1 hr.2)





theorem culpable2000e5g1_intro {actor : Person} {c : ComplaintText}
    {rung : MentalState}
    (hreach : rung.atLeast MentalState.specific)
    (hproven : AttributedMentalState actor
      ScienterElement.remedialIntentionalPractice2000e5g1 rung c) :
    Culpable2000e5g1 actor c :=
  culpable_intro rfl hreach hproven


theorem culpable2000e10b_intro {actor : Person} {c : ComplaintText}
    {rung : MentalState}
    (hreach : rung.atLeast MentalState.specific)
    (hproven : AttributedMentalState actor
      ScienterElement.noticePosting2000e10 rung c) :
    Culpable2000e10b actor c :=
  culpable_intro rfl hreach hproven



theorem culpable2000e6a_intro {actor : Person} {c : ComplaintText}
    {rung : MentalState}
    (hreach : rung.atLeast MentalState.specific)
    (hproven : AttributedMentalState actor
      ScienterElement.patternOrPractice2000e6a rung c) :
    Culpable2000e6a actor c :=
  culpable_intro rfl hreach hproven



theorem culpable2000e2k3_intro {actor : Person} {c : ComplaintText}
    {rung : MentalState}
    (hreach : rung.atLeast MentalState.specific)
    (hproven : AttributedMentalState actor
      ScienterElement.controlledSubstanceRule2000e2k3 rung c) :
    Culpable2000e2k3 actor c :=
  culpable_intro rfl hreach hproven



theorem culpable2000e2h_intro {actor : Person} {c : ComplaintText}
    {rung : MentalState}
    (hreach : rung.atLeast MentalState.specific)
    (hproven : AttributedMentalState actor
      ScienterElement.seniorityOrMeritDifferential2000e2h rung c) :
    Culpable2000e2h actor c :=
  culpable_intro rfl hreach hproven






theorem culpable2000e5e2_intro {actor : Person} {c : ComplaintText}
    {rung : MentalState}
    (hreach : rung.atLeast MentalState.specific)
    (hproven : AttributedMentalState actor
      ScienterElement.seniorityAdoption2000e5e2 rung c) :
    Culpable2000e5e2 actor c :=
  culpable_intro rfl hreach hproven


theorem culpable2000e2k1_intro {actor : Person} {c : ComplaintText}
    {rung : MentalState}
    (hproven : AttributedMentalState actor
      ScienterElement.disparateImpact2000e2k1 rung c) :
    Culpable2000e2k1 actor c :=
  culpable_of_strictFloor rfl hproven



theorem culpable2000e2l_intro {actor : Person} {c : ComplaintText}
    {rung : MentalState}
    (hproven : AttributedMentalState actor
      ScienterElement.scoreAdjustment2000e2l rung c) :
    Culpable2000e2l actor c :=
  culpable_of_strictFloor rfl hproven


theorem culpable2000e3b_intro {actor : Person} {c : ComplaintText}
    {rung : MentalState}
    (hproven : AttributedMentalState actor
      ScienterElement.discriminatoryAdvertisement2000e3b rung c) :
    Culpable2000e3b actor c :=
  culpable_of_strictFloor rfl hproven



theorem culpable2000e5b_intro {actor : Person} {c : ComplaintText}
    {rung : MentalState}
    (hproven : AttributedMentalState actor
      ScienterElement.commissionDisclosure2000e5b rung c) :
    Culpable2000e5b actor c :=
  culpable_of_strictFloor rfl hproven



theorem culpable2000e8e_intro {actor : Person} {c : ComplaintText}
    {rung : MentalState}
    (hproven : AttributedMentalState actor
      ScienterElement.commissionOfficerDisclosure2000e8e rung c) :
    Culpable2000e8e actor c :=
  culpable_of_strictFloor rfl hproven



theorem motivatingFactorEstablished2000e2m_intro {actor : Person}
    {c : ComplaintText} (h : ProtectedTraitMotivatingFactor actor c) :
    MotivatingFactorEstablished2000e2m actor c := h

theorem mixedMotiveReliefLimited2000e5g2B_intro {actor : Person}
    {c : ComplaintText}
    (hmf : ProtectedTraitMotivatingFactor actor c)
    (hsame : SameDecisionAbsentImpermissibleFactor actor c) :
    MixedMotiveReliefLimited2000e5g2B actor c := ⟨hmf, hsame⟩

theorem goodFaithBar2000e12b_viaInterpretation {actor : Person}
    {c : ComplaintText}
    (h : GoodFaithRelianceOnCommissionInterpretation actor c) :
    GoodFaithBar2000e12b actor c := Or.inl h

theorem goodFaithBar2000e12b_viaFilingInstructions {actor : Person}
    {c : ComplaintText}
    (h : GoodFaithRelianceOnCommissionFilingInstructions actor c) :
    GoodFaithBar2000e12b actor c := Or.inr h

theorem enforcerReasonableCause_intro {enforcer : Entity} {c : ComplaintText}
    (h : ReasonableCauseToBelieve enforcer c) :
    EnforcerReasonableCause enforcer c := h








theorem s2000e2a_floor_unspecified :
    RequiredMentalState ScienterElement.disparateTreatment2000e2a = none := rfl


theorem s2000e3a_floor_unspecified :
    RequiredMentalState ScienterElement.retaliation2000e3a = none := rfl


theorem s2000e16a_floor_unspecified :
    RequiredMentalState ScienterElement.federalPersonnelAction2000e16a = none := rfl


theorem s2000e16b_floor_unspecified :
    RequiredMentalState
      ScienterElement.governmentEmployeePersonnelAction2000e16b = none := rfl




theorem s2000e13_floor_delegated :
    RequiredMentalState ScienterElement.killingCommissionPersonnel2000e13 = none := rfl

theorem s2000e13_motivatingFactor_inapplicable :
    MotivatingFactorGoverns ScienterElement.killingCommissionPersonnel2000e13
      = false := rfl



theorem s2000e2k1_strict :
    RequiredMentalState ScienterElement.disparateImpact2000e2k1
      = some MentalState.strictLiability := rfl


theorem s2000e5g1_specific :
    RequiredMentalState ScienterElement.remedialIntentionalPractice2000e5g1
      = some MentalState.specific := rfl


theorem s2000e10b_specific :
    RequiredMentalState ScienterElement.noticePosting2000e10
      = some MentalState.specific := rfl





theorem s2000e2k2_impact_and_intent_are_distinct :
    RequiredMentalState ScienterElement.disparateImpact2000e2k1
      ≠ RequiredMentalState
          ScienterElement.remedialIntentionalPractice2000e5g1 := by decide

end Proving.USC.T42.Ch21TitleVII.Scienter
