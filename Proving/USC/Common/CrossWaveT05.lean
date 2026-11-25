














































































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T05.Elements.Predicates
import Proving.USC.T05.Deontic.Predicates
import Proving.USC.T05.Ontology.Predicates
import Proving.USC.T05.Procedure.Predicates
import Proving.USC.T05.Structure.Predicates

namespace Proving.USC.Common.CrossWaveT05

open Proving.USC.Common








axiom bridge_ontology_person_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T05.Ontology.IsPerson p c ↔ IsPersonInUS p c

theorem collapse_person_ontology_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T05.Ontology.IsPerson p c ↔ IsPersonInUS p c :=
  bridge_ontology_person_iff














axiom mapRef_T05 : Proving.USC.T05.Structure.Ref → StructRef
axiom guard_targetResolves {R : Type} (r : R) (c : ComplaintText) : Prop

axiom bridge_t05_refExists_to_common
    {r : Proving.USC.T05.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T05.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T05 r) c
axiom bridge_t05_incorpHonored_to_common
    {r : Proving.USC.T05.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T05.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T05 r) c
axiom bridge_t05_exceptionApplies_to_common
    {r : Proving.USC.T05.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T05.Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef_T05 r) c
axiom bridge_t05_overrideTriggered_to_common
    {r : Proving.USC.T05.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T05.Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRef_T05 r) c

theorem collapse_struct_t05_refExists_clean
    {r : Proving.USC.T05.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T05.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T05 r) c :=
  bridge_t05_refExists_to_common h

theorem collapse_struct_t05_incorp_modulo_guard
    {r : Proving.USC.T05.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T05.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T05 r) c :=
  bridge_t05_incorpHonored_to_common guard h

theorem collapse_struct_t05_exception_modulo_guard
    {r : Proving.USC.T05.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T05.Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef_T05 r) c :=
  bridge_t05_exceptionApplies_to_common guard h

theorem collapse_struct_t05_override_modulo_guard
    {r : Proving.USC.T05.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T05.Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef_T05 r) c :=
  bridge_t05_overrideTriggered_to_common guard h





















axiom bridge_proc_aggrieved_to_common
    {p : Person} {act : Proving.USC.T05.Procedure.AgencyAction} {c : ComplaintText} :
    Proving.USC.T05.Procedure.PersonAggrieved p act c →
    AggrievedByAgencyAction p c
axiom bridge_elem_aggrieved_to_common
    {p : Person} {act : Proving.USC.T05.Elements.AgencyAction} {c : ComplaintText} :
    Proving.USC.T05.Elements.AdverselyAffectedWithinZoneOfInterests p act c →
    AggrievedByAgencyAction p c

theorem collapse_aggrieved_proc_clean
    {p : Person} {act : Proving.USC.T05.Procedure.AgencyAction} {c : ComplaintText}
    (h : Proving.USC.T05.Procedure.PersonAggrieved p act c) :
    AggrievedByAgencyAction p c :=
  bridge_proc_aggrieved_to_common h

theorem collapse_aggrieved_elem_clean
    {p : Person} {act : Proving.USC.T05.Elements.AgencyAction} {c : ComplaintText}
    (h : Proving.USC.T05.Elements.AdverselyAffectedWithinZoneOfInterests p act c) :
    AggrievedByAgencyAction p c :=
  bridge_elem_aggrieved_to_common h

















axiom mapActionParty : Proving.USC.T05.Procedure.AgencyAction → Person
axiom mapElemActionParty : Proving.USC.T05.Elements.AgencyAction → Person

axiom bridge_proc_finalNoRemedy_to_common
    {act : Proving.USC.T05.Procedure.AgencyAction} {c : ComplaintText} :
    Proving.USC.T05.Procedure.FinalAndNoAdequateRemedy act c →
    FinalAgencyActionReviewable (mapActionParty act) c
axiom bridge_elem_reviewable_to_common
    {act : Proving.USC.T05.Elements.AgencyAction} {c : ComplaintText} :
    Proving.USC.T05.Elements.IsReviewableFinalAction act c →
    Proving.USC.T05.Elements.NoOtherAdequateRemedy act c →
    FinalAgencyActionReviewable (mapElemActionParty act) c

theorem collapse_finalReviewable_proc_clean
    {act : Proving.USC.T05.Procedure.AgencyAction} {c : ComplaintText}
    (h : Proving.USC.T05.Procedure.FinalAndNoAdequateRemedy act c) :
    FinalAgencyActionReviewable (mapActionParty act) c :=
  bridge_proc_finalNoRemedy_to_common h

theorem collapse_finalReviewable_elem_clean
    {act : Proving.USC.T05.Elements.AgencyAction} {c : ComplaintText}
    (hRev : Proving.USC.T05.Elements.IsReviewableFinalAction act c)
    (hNo : Proving.USC.T05.Elements.NoOtherAdequateRemedy act c) :
    FinalAgencyActionReviewable (mapElemActionParty act) c :=
  bridge_elem_reviewable_to_common hRev hNo






















axiom corr_t29s164c_target_is_t05s554 (r : Proving.USC.T05.Structure.Ref)
    (c : ComplaintText) : Prop






theorem resolve_t29s164c_to_t05s554
    {r : Proving.USC.T05.Structure.Ref} {c : ComplaintText}
    (_corr : corr_t29s164c_target_is_t05s554 r c)
    (h : Proving.USC.T05.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T05 r) c :=
  bridge_t05_refExists_to_common h

end Proving.USC.Common.CrossWaveT05
