































































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T05.Rulemaking.Structure.Predicates

namespace Proving.USC.Common.CrossWaveT05Rulemaking

open Proving.USC.Common













axiom mapRef_T05Rulemaking : Proving.USC.T05.Rulemaking.Structure.Ref → StructRef



axiom guard_targetResolves {R : Type} (r : R) (c : ComplaintText) : Prop

axiom bridge_t05r_refExists_to_common
    {r : Proving.USC.T05.Rulemaking.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T05.Rulemaking.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T05Rulemaking r) c
axiom bridge_t05r_incorpHonored_to_common
    {r : Proving.USC.T05.Rulemaking.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T05.Rulemaking.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T05Rulemaking r) c
axiom bridge_t05r_exceptionApplies_to_common
    {r : Proving.USC.T05.Rulemaking.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T05.Rulemaking.Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef_T05Rulemaking r) c
axiom bridge_t05r_overrideTriggered_to_common
    {r : Proving.USC.T05.Rulemaking.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T05.Rulemaking.Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRef_T05Rulemaking r) c



theorem collapse_struct_t05r_refExists_clean
    {r : Proving.USC.T05.Rulemaking.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T05.Rulemaking.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T05Rulemaking r) c :=
  bridge_t05r_refExists_to_common h



theorem collapse_struct_t05r_incorp_modulo_guard
    {r : Proving.USC.T05.Rulemaking.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T05.Rulemaking.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T05Rulemaking r) c :=
  bridge_t05r_incorpHonored_to_common guard h



theorem collapse_struct_t05r_exception_modulo_guard
    {r : Proving.USC.T05.Rulemaking.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T05.Rulemaking.Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef_T05Rulemaking r) c :=
  bridge_t05r_exceptionApplies_to_common guard h



theorem collapse_struct_t05r_override_modulo_guard
    {r : Proving.USC.T05.Rulemaking.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T05.Rulemaking.Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef_T05Rulemaking r) c :=
  bridge_t05r_overrideTriggered_to_common guard h




















axiom corr_t05r_s553c_target_is_t05_s556_557
    (r : Proving.USC.T05.Rulemaking.Structure.Ref) (c : ComplaintText) : Prop






theorem resolve_t05r_s553c_to_t05_s556_557
    {r : Proving.USC.T05.Rulemaking.Structure.Ref} {c : ComplaintText}
    (_corr : corr_t05r_s553c_target_is_t05_s556_557 r c)
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T05.Rulemaking.Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef_T05Rulemaking r) c :=
  bridge_t05r_overrideTriggered_to_common guard h

end Proving.USC.Common.CrossWaveT05Rulemaking
