






















































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T29.MiscProvisions.Structure.Predicates

namespace Proving.USC.Common.CrossWaveT29MiscProvisions

open Proving.USC.Common
open Proving.USC.T29.MiscProvisions.Structure (Ref)




































axiom mapRef_T29Misc : Ref → StructRef





axiom guard_targetResolves (r : Ref) (c : ComplaintText) : Prop


axiom bridge_t29misc_refExists_to_common {r : Ref} {c : ComplaintText} :
    Proving.USC.T29.MiscProvisions.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T29Misc r) c




axiom bridge_t29misc_incorpHonored_to_common {r : Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T29.MiscProvisions.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T29Misc r) c



axiom bridge_t29misc_savingsRespected_to_common {r : Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T29.MiscProvisions.Structure.SavingsClauseRespected r c →
    StructuralReferenceCoheres (mapRef_T29Misc r) c



axiom bridge_t29misc_overrideTriggered_to_common {r : Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T29.MiscProvisions.Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRef_T29Misc r) c



axiom bridge_t29misc_exceptionApplies_to_common {r : Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T29.MiscProvisions.Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef_T29Misc r) c

theorem collapse_struct_t29misc_refExists_clean {r : Ref} {c : ComplaintText}
    (h : Proving.USC.T29.MiscProvisions.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T29Misc r) c :=
  bridge_t29misc_refExists_to_common h

theorem collapse_struct_t29misc_incorp_modulo_guard {r : Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T29.MiscProvisions.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T29Misc r) c :=
  bridge_t29misc_incorpHonored_to_common guard h

theorem collapse_struct_t29misc_savings_modulo_guard {r : Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T29.MiscProvisions.Structure.SavingsClauseRespected r c) :
    StructuralReferenceCoheres (mapRef_T29Misc r) c :=
  bridge_t29misc_savingsRespected_to_common guard h

theorem collapse_struct_t29misc_override_modulo_guard {r : Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T29.MiscProvisions.Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef_T29Misc r) c :=
  bridge_t29misc_overrideTriggered_to_common guard h

theorem collapse_struct_t29misc_exception_modulo_guard {r : Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T29.MiscProvisions.Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef_T29Misc r) c :=
  bridge_t29misc_exceptionApplies_to_common guard h


























axiom corr_edge_target_in_promoted_t29 (r : Ref) (c : ComplaintText) : Prop






theorem resolve_t29misc_edge_in_corpus {r : Ref} {c : ComplaintText}
    (_corr : corr_edge_target_in_promoted_t29 r c)
    (h : Proving.USC.T29.MiscProvisions.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T29Misc r) c :=
  bridge_t29misc_refExists_to_common h

end Proving.USC.Common.CrossWaveT29MiscProvisions
