




































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.PublicAccommodations.Entitlement.Elements.Predicates
import Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.Predicates
import Proving.USC.T42.PublicAccommodations.Entitlement.Structure.Predicates

namespace Proving.USC.Common.CollapseT42PAEntitlement

open Proving.USC.Common
















axiom mapEstablishment_E : Proving.USC.T42.PublicAccommodations.Entitlement.Elements.Establishment → Entity
axiom mapEstablishment_O : Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.Establishment → Entity
axiom mapCommerce_O      : Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.Commerce      → Entity




axiom bridge_elemOperationsAffectCommerce_to_common
    {e : Proving.USC.T42.PublicAccommodations.Entitlement.Elements.Establishment} {c : ComplaintText} :
    Proving.USC.T42.PublicAccommodations.Entitlement.Elements.OperationsAffectCommerce e c →
    EngagedInInterstateCommerce (mapEstablishment_E e) c



axiom bridge_ontOperationsAffectCommerce_to_common
    {est : Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.Establishment} {c : ComplaintText} :
    Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.OperationsAffectCommerce est c →
    EngagedInInterstateCommerce (mapEstablishment_O est) c




axiom bridge_ontIsCommerce_to_common
    {x : Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.Commerce} {c : ComplaintText} :
    Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.IsCommerce x c →
    EngagedInInterstateCommerce (mapCommerce_O x) c

theorem collapse_C1_clean
    {e : Proving.USC.T42.PublicAccommodations.Entitlement.Elements.Establishment} {c : ComplaintText}
    (h : Proving.USC.T42.PublicAccommodations.Entitlement.Elements.OperationsAffectCommerce e c) :
    EngagedInInterstateCommerce (mapEstablishment_E e) c :=
  bridge_elemOperationsAffectCommerce_to_common h

theorem collapse_C2_clean
    {est : Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.Establishment} {c : ComplaintText}
    (h : Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.OperationsAffectCommerce est c) :
    EngagedInInterstateCommerce (mapEstablishment_O est) c :=
  bridge_ontOperationsAffectCommerce_to_common h

theorem collapse_C3_clean
    {x : Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.Commerce} {c : ComplaintText}
    (h : Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.IsCommerce x c) :
    EngagedInInterstateCommerce (mapCommerce_O x) c :=
  bridge_ontIsCommerce_to_common h














axiom mapStateActionSupport_O : Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.StateActionSupport → Person
axiom mapEstablishment_SA     : Proving.USC.T42.PublicAccommodations.Entitlement.Elements.Establishment      → Person




axiom bridge_isSupportedByStateAction_to_common
    {s : Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.StateActionSupport} {c : ComplaintText} :
    Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.IsSupportedByStateAction s c →
    ActsUnderColorOfStateLaw (mapStateActionSupport_O s) c



axiom bridge_discriminationSupportedByStateAction_to_common
    {e : Proving.USC.T42.PublicAccommodations.Entitlement.Elements.Establishment} {c : ComplaintText} :
    Proving.USC.T42.PublicAccommodations.Entitlement.Elements.DiscriminationSupportedByStateAction e c →
    ActsUnderColorOfStateLaw (mapEstablishment_SA e) c

theorem collapse_SA1_clean
    {s : Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.StateActionSupport} {c : ComplaintText}
    (h : Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.IsSupportedByStateAction s c) :
    ActsUnderColorOfStateLaw (mapStateActionSupport_O s) c :=
  bridge_isSupportedByStateAction_to_common h

theorem collapse_SA2_clean
    {e : Proving.USC.T42.PublicAccommodations.Entitlement.Elements.Establishment} {c : ComplaintText}
    (h : Proving.USC.T42.PublicAccommodations.Entitlement.Elements.DiscriminationSupportedByStateAction e c) :
    ActsUnderColorOfStateLaw (mapEstablishment_SA e) c :=
  bridge_discriminationSupportedByStateAction_to_common h























axiom mapRef_S : Proving.USC.T42.PublicAccommodations.Entitlement.Structure.Ref → StructRef
axiom guard_targetResolves (r : Proving.USC.T42.PublicAccommodations.Entitlement.Structure.Ref) (c : ComplaintText) : Prop



axiom bridge_referencedSectionExists_to_common
    {r : Proving.USC.T42.PublicAccommodations.Entitlement.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T42.PublicAccommodations.Entitlement.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_S r) c



axiom bridge_incorporationHonored_to_common
    {r : Proving.USC.T42.PublicAccommodations.Entitlement.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.PublicAccommodations.Entitlement.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_S r) c




axiom bridge_savingsHonored_to_common
    {r : Proving.USC.T42.PublicAccommodations.Entitlement.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.PublicAccommodations.Entitlement.Structure.SavingsHonored r c →
    StructuralReferenceCoheres (mapRef_S r) c

theorem collapse_S5_clean
    {r : Proving.USC.T42.PublicAccommodations.Entitlement.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T42.PublicAccommodations.Entitlement.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_S r) c :=
  bridge_referencedSectionExists_to_common h

theorem collapse_S6_modulo_guard
    {r : Proving.USC.T42.PublicAccommodations.Entitlement.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T42.PublicAccommodations.Entitlement.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_S r) c :=
  bridge_incorporationHonored_to_common guard h

theorem collapse_S7_modulo_guard
    {r : Proving.USC.T42.PublicAccommodations.Entitlement.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T42.PublicAccommodations.Entitlement.Structure.SavingsHonored r c) :
    StructuralReferenceCoheres (mapRef_S r) c :=
  bridge_savingsHonored_to_common guard h

end Proving.USC.Common.CollapseT42PAEntitlement
