























import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.GoldenAdjacent.Elements.Predicates
import Proving.USC.T42.GoldenAdjacent.Deontic.Predicates
import Proving.USC.T42.GoldenAdjacent.Ontology.Predicates
import Proving.USC.T42.GoldenAdjacent.Procedure.Predicates
import Proving.USC.T42.GoldenAdjacent.Structure.Predicates
import Proving.USC.T18.Enf.Elements.Predicates
import Proving.USC.T18.Enf.Deontic.Predicates
import Proving.USC.T18.Enf.Ontology.Predicates
import Proving.USC.T18.Enf.Procedure.Predicates
import Proving.USC.T18.Enf.Structure.Predicates

namespace Proving.USC.Common.CrossWaveT42gaT18enf

open Proving.USC.Common










axiom mapRef_T42ga  : Proving.USC.T42.GoldenAdjacent.Structure.Ref → StructRef
axiom mapRef_T18enf : Proving.USC.T18.Enf.Structure.Ref → StructRef
axiom guard_targetResolves {R : Type} (r : R) (c : ComplaintText) : Prop

axiom bridge_t42ga_refExists_to_common
    {r : Proving.USC.T42.GoldenAdjacent.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T42.GoldenAdjacent.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T42ga r) c
axiom bridge_t42ga_incorpHonored_to_common
    {r : Proving.USC.T42.GoldenAdjacent.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.GoldenAdjacent.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T42ga r) c
axiom bridge_t18enf_refExists_to_common
    {r : Proving.USC.T18.Enf.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T18.Enf.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T18enf r) c
axiom bridge_t18enf_incorpHonored_to_common
    {r : Proving.USC.T18.Enf.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T18.Enf.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T18enf r) c
axiom bridge_t18enf_exceptionApplies_to_common
    {r : Proving.USC.T18.Enf.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T18.Enf.Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef_T18enf r) c
axiom bridge_t18enf_overrideTriggered_to_common
    {r : Proving.USC.T18.Enf.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T18.Enf.Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRef_T18enf r) c

theorem collapse_struct_t42ga_refExists_clean
    {r : Proving.USC.T42.GoldenAdjacent.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T42.GoldenAdjacent.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T42ga r) c :=
  bridge_t42ga_refExists_to_common h
theorem collapse_struct_t42ga_incorp_modulo_guard
    {r : Proving.USC.T42.GoldenAdjacent.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T42.GoldenAdjacent.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T42ga r) c :=
  bridge_t42ga_incorpHonored_to_common guard h
theorem collapse_struct_t18enf_refExists_clean
    {r : Proving.USC.T18.Enf.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T18.Enf.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T18enf r) c :=
  bridge_t18enf_refExists_to_common h
theorem collapse_struct_t18enf_incorp_modulo_guard
    {r : Proving.USC.T18.Enf.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T18.Enf.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T18enf r) c :=
  bridge_t18enf_incorpHonored_to_common guard h
theorem collapse_struct_t18enf_exception_modulo_guard
    {r : Proving.USC.T18.Enf.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T18.Enf.Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef_T18enf r) c :=
  bridge_t18enf_exceptionApplies_to_common guard h
theorem collapse_struct_t18enf_override_modulo_guard
    {r : Proving.USC.T18.Enf.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T18.Enf.Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef_T18enf r) c :=
  bridge_t18enf_overrideTriggered_to_common guard h








axiom bridge_onBasisOfRace_to_common
    {p : Person} {r : Proving.USC.T42.GoldenAdjacent.Elements.PropertyRight} {c : ComplaintText} :
    Proving.USC.T42.GoldenAdjacent.Elements.OnBasisOfRace p r c → IntentToDiscriminate p c
axiom bridge_denialOnRacialBasis_to_common
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.GoldenAdjacent.Deontic.DenialOnRacialBasis p c → IntentToDiscriminate p c

theorem collapse_race_onBasis_clean
    {p : Person} {r : Proving.USC.T42.GoldenAdjacent.Elements.PropertyRight} {c : ComplaintText}
    (h : Proving.USC.T42.GoldenAdjacent.Elements.OnBasisOfRace p r c) : IntentToDiscriminate p c :=
  bridge_onBasisOfRace_to_common h
theorem collapse_race_denial_clean
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T42.GoldenAdjacent.Deontic.DenialOnRacialBasis p c) : IntentToDiscriminate p c :=
  bridge_denialOnRacialBasis_to_common h









axiom bridge_properVenue_iff_common
    {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Enf.Elements.ProperVenue p c ↔ VenueNexus p c
axiom bridge_venueProperD_iff_elements
    {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Enf.Deontic.VenueProper p c ↔ Proving.USC.T18.Enf.Elements.ProperVenue p c
axiom bridge_hasVenueNexus_iff_elements
    {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Enf.Ontology.HasVenueNexus p c ↔ Proving.USC.T18.Enf.Elements.ProperVenue p c
axiom bridge_venueProperP_iff_elements
    {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Enf.Procedure.VenueProper p c ↔ Proving.USC.T18.Enf.Elements.ProperVenue p c

theorem collapse_venue_elements_iff
    {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Enf.Elements.ProperVenue p c ↔ VenueNexus p c :=
  bridge_properVenue_iff_common
theorem collapse_venue_deontic_iff
    {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Enf.Deontic.VenueProper p c ↔ VenueNexus p c :=
  bridge_venueProperD_iff_elements.trans bridge_properVenue_iff_common
theorem collapse_venue_ontology_iff
    {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Enf.Ontology.HasVenueNexus p c ↔ VenueNexus p c :=
  bridge_hasVenueNexus_iff_elements.trans bridge_properVenue_iff_common
theorem collapse_venue_procedure_iff
    {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Enf.Procedure.VenueProper p c ↔ VenueNexus p c :=
  bridge_venueProperP_iff_elements.trans bridge_properVenue_iff_common







axiom guard_withinWindow (p : Person) (c : ComplaintText) : Prop
axiom bridge_civilClaimAccrued_to_common
    {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Enf.Procedure.CivilClaimAccrued p c → WithinLimitations p c
axiom bridge_withinLimitationsWindow_to_common
    {p : Person} {c : ComplaintText} :
    guard_withinWindow p c →
    Proving.USC.T18.Enf.Procedure.WithinLimitationsWindow p c → WithinLimitations p c

theorem collapse_lim_accrued_clean
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Enf.Procedure.CivilClaimAccrued p c) : WithinLimitations p c :=
  bridge_civilClaimAccrued_to_common h
theorem collapse_lim_window_modulo_guard
    {p : Person} {c : ComplaintText}
    (guard : guard_withinWindow p c)
    (h : Proving.USC.T18.Enf.Procedure.WithinLimitationsWindow p c) : WithinLimitations p c :=
  bridge_withinLimitationsWindow_to_common guard h












axiom mapPP : Proving.USC.T42.GoldenAdjacent.Ontology.PrevailingParty → Person
axiom bridge_prevailing_deontic_to_common
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.GoldenAdjacent.Deontic.IsPrevailingParty p c → IsPrevailingParty p c
axiom bridge_prevailing_ontology_to_common
    {x : Proving.USC.T42.GoldenAdjacent.Ontology.PrevailingParty} {c : ComplaintText} :
    Proving.USC.T42.GoldenAdjacent.Ontology.IsPrevailingParty x c → IsPrevailingParty (mapPP x) c
axiom bridge_prevailing_procedure_to_common
    {p : Person} {pr : Proving.USC.T42.GoldenAdjacent.Procedure.Proceeding} {c : ComplaintText} :
    Proving.USC.T42.GoldenAdjacent.Procedure.IsPrevailingParty p pr c → IsPrevailingParty p c

theorem collapse_fee_deontic_clean
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T42.GoldenAdjacent.Deontic.IsPrevailingParty p c) : IsPrevailingParty p c :=
  bridge_prevailing_deontic_to_common h
theorem collapse_fee_ontology_mapped
    {x : Proving.USC.T42.GoldenAdjacent.Ontology.PrevailingParty} {c : ComplaintText}
    (h : Proving.USC.T42.GoldenAdjacent.Ontology.IsPrevailingParty x c) : IsPrevailingParty (mapPP x) c :=
  bridge_prevailing_ontology_to_common h
theorem collapse_fee_procedure_arity_reconciled
    {p : Person} {pr : Proving.USC.T42.GoldenAdjacent.Procedure.Proceeding} {c : ComplaintText}
    (h : Proving.USC.T42.GoldenAdjacent.Procedure.IsPrevailingParty p pr c) : IsPrevailingParty p c :=
  bridge_prevailing_procedure_to_common h

end Proving.USC.Common.CrossWaveT42gaT18enf
