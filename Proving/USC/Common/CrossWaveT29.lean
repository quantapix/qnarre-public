




































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T29.Elements.Predicates
import Proving.USC.T29.Deontic.Predicates
import Proving.USC.T29.Ontology.Predicates
import Proving.USC.T29.Procedure.Predicates
import Proving.USC.T29.Structure.Predicates

namespace Proving.USC.Common.CrossWaveT29

open Proving.USC.Common












axiom mapChargeParty : Proving.USC.T29.Procedure.Charge → Person



axiom bridge_elem_limitations_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T29.Elements.WithinSixMonthLimitations p c ↔ WithinLimitations p c


axiom bridge_proc_window_to_common {ch : Proving.USC.T29.Procedure.Charge}
    {c : ComplaintText} :
    Proving.USC.T29.Procedure.WithinSixMonthWindow ch c →
    WithinLimitations (mapChargeParty ch) c

theorem collapse_limitations_elem_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T29.Elements.WithinSixMonthLimitations p c ↔ WithinLimitations p c :=
  bridge_elem_limitations_iff

theorem collapse_limitations_proc_clean {ch : Proving.USC.T29.Procedure.Charge}
    {c : ComplaintText}
    (h : Proving.USC.T29.Procedure.WithinSixMonthWindow ch c) :
    WithinLimitations (mapChargeParty ch) c :=
  bridge_proc_window_to_common h












axiom mapCommerceEntity : Proving.USC.T29.Ontology.Commerce → Entity


axiom bridge_deontic_commerce_iff {e : Entity} {c : ComplaintText} :
    Proving.USC.T29.Deontic.AffectsCommerce e c ↔ EngagedInInterstateCommerce e c



axiom bridge_ontology_commerce_to_common {k : Proving.USC.T29.Ontology.Commerce}
    {c : ComplaintText} :
    Proving.USC.T29.Ontology.IsCommerce k c →
    EngagedInInterstateCommerce (mapCommerceEntity k) c

theorem collapse_commerce_deontic_iff {e : Entity} {c : ComplaintText} :
    Proving.USC.T29.Deontic.AffectsCommerce e c ↔ EngagedInInterstateCommerce e c :=
  bridge_deontic_commerce_iff

theorem collapse_commerce_ontology_clean {k : Proving.USC.T29.Ontology.Commerce}
    {c : ComplaintText}
    (h : Proving.USC.T29.Ontology.IsCommerce k c) :
    EngagedInInterstateCommerce (mapCommerceEntity k) c :=
  bridge_ontology_commerce_to_common h






axiom bridge_ontology_person_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T29.Ontology.IsPerson p c ↔ IsPersonInUS p c

theorem collapse_person_ontology_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T29.Ontology.IsPerson p c ↔ IsPersonInUS p c :=
  bridge_ontology_person_iff










axiom mapOrderParty : Proving.USC.T29.Procedure.BoardOrder → Person

axiom bridge_proc_venue_to_common {o : Proving.USC.T29.Procedure.BoardOrder}
    {c : ComplaintText} :
    Proving.USC.T29.Procedure.CourtPetitionFiled o c →
    VenueNexus (mapOrderParty o) c

theorem collapse_venue_proc_clean {o : Proving.USC.T29.Procedure.BoardOrder}
    {c : ComplaintText}
    (h : Proving.USC.T29.Procedure.CourtPetitionFiled o c) :
    VenueNexus (mapOrderParty o) c :=
  bridge_proc_venue_to_common h










axiom mapRef_T29 : Proving.USC.T29.Structure.Ref → StructRef
axiom guard_targetResolves {R : Type} (r : R) (c : ComplaintText) : Prop

axiom bridge_t29_refExists_to_common
    {r : Proving.USC.T29.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T29.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T29 r) c
axiom bridge_t29_incorpHonored_to_common
    {r : Proving.USC.T29.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T29.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T29 r) c

theorem collapse_struct_t29_refExists_clean
    {r : Proving.USC.T29.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T29.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T29 r) c :=
  bridge_t29_refExists_to_common h

theorem collapse_struct_t29_incorp_modulo_guard
    {r : Proving.USC.T29.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T29.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T29 r) c :=
  bridge_t29_incorpHonored_to_common guard h



















axiom corr_t42s2000e9_target_is_t29s161 (r : Proving.USC.T29.Structure.Ref)
    (c : ComplaintText) : Prop






theorem resolve_t42s2000e9_to_t29s161
    {r : Proving.USC.T29.Structure.Ref} {c : ComplaintText}
    (_corr : corr_t42s2000e9_target_is_t29s161 r c)
    (h : Proving.USC.T29.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T29 r) c :=
  bridge_t29_refExists_to_common h

end Proving.USC.Common.CrossWaveT29
