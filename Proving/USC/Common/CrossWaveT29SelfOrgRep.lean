




















































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T29.SelfOrgRep.Elements.Predicates
import Proving.USC.T29.SelfOrgRep.Ontology.Predicates
import Proving.USC.T29.SelfOrgRep.Procedure.Predicates
import Proving.USC.T29.SelfOrgRep.Structure.Predicates

namespace Proving.USC.Common.CrossWaveT29SelfOrgRep

open Proving.USC.Common


















axiom mapUnitEntity : Proving.USC.T29.SelfOrgRep.Elements.BargainingUnit → Entity
axiom mapPetitionEntity : Proving.USC.T29.SelfOrgRep.Procedure.RepresentationPetition → Entity


axiom bridge_ontology_commerce_iff {e : Entity} {c : ComplaintText} :
    Proving.USC.T29.SelfOrgRep.Ontology.AffectsCommerce e c ↔ EngagedInInterstateCommerce e c




axiom bridge_elements_commerce_to_common
    {u : Proving.USC.T29.SelfOrgRep.Elements.BargainingUnit} {c : ComplaintText} :
    Proving.USC.T29.SelfOrgRep.Elements.QuestionOfRepresentationAffectingCommerce u c →
    EngagedInInterstateCommerce (mapUnitEntity u) c



axiom bridge_procedure_commerce_to_common
    {pet : Proving.USC.T29.SelfOrgRep.Procedure.RepresentationPetition} {c : ComplaintText} :
    Proving.USC.T29.SelfOrgRep.Procedure.QuestionAffectingCommerce pet c →
    EngagedInInterstateCommerce (mapPetitionEntity pet) c

theorem collapse_commerce_ontology_iff {e : Entity} {c : ComplaintText} :
    Proving.USC.T29.SelfOrgRep.Ontology.AffectsCommerce e c ↔ EngagedInInterstateCommerce e c :=
  bridge_ontology_commerce_iff

theorem collapse_commerce_elements_clean
    {u : Proving.USC.T29.SelfOrgRep.Elements.BargainingUnit} {c : ComplaintText}
    (h : Proving.USC.T29.SelfOrgRep.Elements.QuestionOfRepresentationAffectingCommerce u c) :
    EngagedInInterstateCommerce (mapUnitEntity u) c :=
  bridge_elements_commerce_to_common h

theorem collapse_commerce_procedure_clean
    {pet : Proving.USC.T29.SelfOrgRep.Procedure.RepresentationPetition} {c : ComplaintText}
    (h : Proving.USC.T29.SelfOrgRep.Procedure.QuestionAffectingCommerce pet c) :
    EngagedInInterstateCommerce (mapPetitionEntity pet) c :=
  bridge_procedure_commerce_to_common h


















open Proving.USC.T29.SelfOrgRep.Structure (Ref)

axiom guard_targetResolves (r : Ref) (c : ComplaintText) : Prop


axiom bridge_t29sor_refExists_to_common {r : Ref} {c : ComplaintText} :
    Proving.USC.T29.SelfOrgRep.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (Ref.toCommon r) c


axiom bridge_t29sor_incorpHonored_to_common {r : Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T29.SelfOrgRep.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (Ref.toCommon r) c



axiom bridge_t29sor_exceptionApplies_to_common {r : Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T29.SelfOrgRep.Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (Ref.toCommon r) c

theorem collapse_struct_t29sor_refExists_clean {r : Ref} {c : ComplaintText}
    (h : Proving.USC.T29.SelfOrgRep.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (Ref.toCommon r) c :=
  bridge_t29sor_refExists_to_common h

theorem collapse_struct_t29sor_incorp_modulo_guard {r : Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T29.SelfOrgRep.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (Ref.toCommon r) c :=
  bridge_t29sor_incorpHonored_to_common guard h

theorem collapse_struct_t29sor_exception_modulo_guard {r : Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T29.SelfOrgRep.Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (Ref.toCommon r) c :=
  bridge_t29sor_exceptionApplies_to_common guard h





















axiom corr_edge_endpoint_in_promoted_t29 (r : Ref) (c : ComplaintText) : Prop





theorem resolve_t29sor_edge_in_corpus {r : Ref} {c : ComplaintText}
    (_corr : corr_edge_endpoint_in_promoted_t29 r c)
    (h : Proving.USC.T29.SelfOrgRep.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (Ref.toCommon r) c :=
  bridge_t29sor_refExists_to_common h

end Proving.USC.Common.CrossWaveT29SelfOrgRep
