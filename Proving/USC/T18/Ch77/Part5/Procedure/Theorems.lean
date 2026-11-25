






import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part5.Procedure.Types
import Proving.USC.T18.Ch77.Part5.Procedure.Predicates
import Proving.USC.T18.Ch77.Part5.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part5.Procedure

open Proving.USC.Common




theorem governmentProofUnderSubsectionA_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hCommenced : ProsecutionCommencedUnderSection1591 d pr c)
    (hJurisdiction : FederalJurisdictionalNexusProved d pr c)
    (hConduct : ChargedConductProved d pr c)
    (hScienter : SubsectionAScienterSatisfied d pr c) :
    GovernmentProofUnderSubsectionA d pr c :=
  ⟨hCommenced, hJurisdiction, hConduct, hScienter⟩


theorem convictionUnderSubsectionA_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hProof : GovernmentProofUnderSubsectionA d pr c)
    (hGuilt : AdjudicationOfGuiltEntered d pr c) :
    ConvictionUnderSubsectionA d pr c :=
  ⟨hProof, hGuilt⟩


theorem tierOneSentencing_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hConviction : ConvictionUnderSubsectionA d pr c)
    (hTrigger : TierOneTrigger d pr c)
    (hLawful : TierOneSentenceLawful d pr c) :
    TierOneSentencing d pr c :=
  ⟨hConviction, hTrigger, hLawful⟩


theorem tierTwoSentencing_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hConviction : ConvictionUnderSubsectionA d pr c)
    (hTrigger : TierTwoTrigger d pr c)
    (hLawful : TierTwoSentenceLawful d pr c) :
    TierTwoSentencing d pr c :=
  ⟨hConviction, hTrigger, hLawful⟩


theorem obstructionConviction_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hCommenced : ProsecutionCommencedUnderSection1591 d pr c)
    (hCharged : ChargedUnderSubsectionD d pr c)
    (hObstruction : EnforcementObstructionProved d pr c)
    (hGuilt : AdjudicationOfGuiltEntered d pr c) :
    ObstructionConviction d pr c :=
  ⟨hCommenced, hCharged, hObstruction, hGuilt⟩


theorem obstructionSentencing_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hConviction : ObstructionConviction d pr c)
    (hLawful : ObstructionSentenceLawful d pr c) :
    ObstructionSentencing d pr c :=
  ⟨hConviction, hLawful⟩




theorem section1591Disposition_tierOne_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (h : TierOneSentencing d pr c) : Section1591Disposition d pr c :=
  Section1591Disposition.tierOne h


theorem section1591Disposition_tierTwo_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (h : TierTwoSentencing d pr c) : Section1591Disposition d pr c :=
  Section1591Disposition.tierTwo h


theorem section1591Disposition_obstruction_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (h : ObstructionSentencing d pr c) : Section1591Disposition d pr c :=
  Section1591Disposition.obstruction h





theorem meansScienterProved_ofKnowledge
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (h : KnowledgeOfMeansProved d pr c) : MeansScienterProved d pr c :=
  Or.inl h



theorem meansScienterProved_ofRecklessDisregard
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hNotAd : ¬ ChargedConductIsAdvertising d pr c)
    (h : RecklessDisregardOfMeansProved d pr c) : MeansScienterProved d pr c :=
  Or.inr ⟨hNotAd, h⟩





theorem minorityScienterProofSatisfied_ofSubsectionC
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hA1 : ChargedUnderSubsectionA1 d pr c)
    (hObserve : ReasonableOpportunityToObserveProved d pr c) :
    MinorityScienterProofSatisfied d pr c :=
  Or.inr ⟨hA1, hObserve⟩



theorem minorityScienterProofSatisfied_ofProof
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (h : MinorityScienterProved d pr c) : MinorityScienterProofSatisfied d pr c :=
  Or.inl h





theorem reachesSentenced_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hCommenced : ProsecutionCommencedUnderSection1591 d pr c)
    (hProof : GovernmentProofUnderSubsectionA d pr c)
    (hGuilt : AdjudicationOfGuiltEntered d pr c)
    (hDisposition : TierOneDisposition d pr c ∨ TierTwoDisposition d pr c) :
    Reaches d pr c Stage.sentenced :=
  Reaches.sentenced
    (Reaches.convicted (Reaches.proofCarried (Reaches.charged hCommenced) hProof) hGuilt)
    hDisposition


theorem reachesSentencedForObstruction_intro
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hCommenced : ProsecutionCommencedUnderSection1591 d pr c)
    (hConviction : ObstructionConviction d pr c)
    (hLawful : ObstructionSentenceLawful d pr c) :
    Reaches d pr c Stage.sentenced :=
  Reaches.sentencedForObstruction
    (Reaches.convictedOfObstruction (Reaches.charged hCommenced) hConviction)
    hLawful








theorem tierTriggers_disjoint
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (h1 : TierOneTrigger d pr c) (h2 : TierTwoTrigger d pr c) : False := by
  have h2' : ¬ OffenseEffectedByForceFraudOrCoercion d pr c ∧
      (14 ≤ victimAgeYearsAtOffense pr c ∧ victimAgeYearsAtOffense pr c < 18) := h2
  have h1' : OffenseEffectedByForceFraudOrCoercion d pr c ∨
      victimAgeYearsAtOffense pr c < 14 := h1
  cases h1' with
  | inl hForce => exact h2'.1 hForce
  | inr hUnder14 =>
      have h14 : 14 ≤ victimAgeYearsAtOffense pr c := h2'.2.1
      omega




theorem tierTriggers_total
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (hMinor : VictimMinorAtOffense pr c) :
    TierOneTrigger d pr c ∨ TierTwoTrigger d pr c := by
  have hMinor' : victimAgeYearsAtOffense pr c < 18 := hMinor
  cases Classical.em (OffenseEffectedByForceFraudOrCoercion d pr c) with
  | inl hForce => exact Or.inl (Or.inl hForce)
  | inr hNoForce =>
      cases Nat.lt_or_ge (victimAgeYearsAtOffense pr c) 14 with
      | inl hUnder14 => exact Or.inl (Or.inr hUnder14)
      | inr hAtLeast14 => exact Or.inr ⟨hNoForce, hAtLeast14, hMinor'⟩




theorem tierOneSentenceLawful_implies_tierTwoRange
    {d : Person} {pr : Prosecution} {c : ComplaintText}
    (h : TierOneSentenceLawful d pr c) : TierTwoSentenceLawful d pr c := by
  have hFine : FineImposedUnderThisTitle d pr c := h.1
  have hTerm : LifeSentenceImposed d pr c ∨ 15 ≤ imprisonmentTermYearsImposed pr c := h.2
  refine ⟨hFine, ?_⟩
  cases hTerm with
  | inl hLife => exact Or.inl hLife
  | inr hYears => exact Or.inr (by omega)

end Proving.USC.T18.Ch77.Part5.Procedure
