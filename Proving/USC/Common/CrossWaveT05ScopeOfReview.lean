








































































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T05.ScopeOfReview.Ontology.Predicates
import Proving.USC.T05.ScopeOfReview.Structure.Predicates

namespace Proving.USC.Common.CrossWaveT05ScopeOfReview

open Proving.USC.Common

















axiom bridge_ontology_aggrieved_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T05.ScopeOfReview.Ontology.IsAggrievedByAgencyAction p c ↔
    AggrievedByAgencyAction p c



theorem collapse_aggrieved_ontology_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T05.ScopeOfReview.Ontology.IsAggrievedByAgencyAction p c ↔
    AggrievedByAgencyAction p c :=
  bridge_ontology_aggrieved_iff















axiom mapRef_T05ScopeOfReview : Proving.USC.T05.ScopeOfReview.Structure.Ref → StructRef



axiom guard_targetResolves {R : Type} (r : R) (c : ComplaintText) : Prop

axiom bridge_t05sor_refExists_to_common
    {r : Proving.USC.T05.ScopeOfReview.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T05.ScopeOfReview.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T05ScopeOfReview r) c
axiom bridge_t05sor_incorpHonored_to_common
    {r : Proving.USC.T05.ScopeOfReview.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T05.ScopeOfReview.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T05ScopeOfReview r) c



theorem collapse_struct_t05sor_refExists_clean
    {r : Proving.USC.T05.ScopeOfReview.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T05.ScopeOfReview.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T05ScopeOfReview r) c :=
  bridge_t05sor_refExists_to_common h



theorem collapse_struct_t05sor_incorp_modulo_guard
    {r : Proving.USC.T05.ScopeOfReview.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T05.ScopeOfReview.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T05ScopeOfReview r) c :=
  bridge_t05sor_incorpHonored_to_common guard h


















axiom corr_t05sor_s706_2E_target_is_t05_s556_557
    (r : Proving.USC.T05.ScopeOfReview.Structure.Ref) (c : ComplaintText) : Prop







theorem resolve_t05sor_s706_2E_to_t05_s556_557
    {r : Proving.USC.T05.ScopeOfReview.Structure.Ref} {c : ComplaintText}
    (_corr : corr_t05sor_s706_2E_target_is_t05_s556_557 r c)
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T05.ScopeOfReview.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T05ScopeOfReview r) c :=
  bridge_t05sor_incorpHonored_to_common guard h

end Proving.USC.Common.CrossWaveT05ScopeOfReview
