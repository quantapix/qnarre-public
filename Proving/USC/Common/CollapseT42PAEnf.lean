

























import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.PublicAccommodations.Enforcement.Elements.Predicates
import Proving.USC.T42.PublicAccommodations.Enforcement.Ontology.Predicates
import Proving.USC.T42.PublicAccommodations.Enforcement.Procedure.Predicates
import Proving.USC.T42.PublicAccommodations.Enforcement.Structure.Predicates

namespace Proving.USC.Common.CollapseT42PAEnf

open Proving.USC.Common





open Proving.USC.T42.PublicAccommodations.Enforcement
open Proving.USC.T42.PublicAccommodations.Enforcement

axiom mapRespondent_intent : Elements.Respondent → Person




axiom bridge_intendedToDeny_to_intentToDiscriminate
    {r : Elements.Respondent} {c : ComplaintText} :
    Elements.IntendedToDenyFullExercise r c →
    IntentToDiscriminate (mapRespondent_intent r) c

theorem collapse_intent_clean
    {r : Elements.Respondent} {c : ComplaintText}
    (h : Elements.IntendedToDenyFullExercise r c) :
    IntentToDiscriminate (mapRespondent_intent r) c :=
  bridge_intendedToDeny_to_intentToDiscriminate h







axiom mapComplaint_party : Elements.Complaint → Person



axiom bridge_filed_to_venue
    {cpl : Elements.Complaint} {c : ComplaintText} :
    Elements.FiledInAppropriateDistrictCourt cpl c →
    VenueNexus (mapComplaint_party cpl) c



axiom bridge_filed_to_jurisdiction
    {cpl : Elements.Complaint} {c : ComplaintText} :
    Elements.FiledInAppropriateDistrictCourt cpl c →
    FederalJurisdictionalNexus c

theorem collapse_venue_clean
    {cpl : Elements.Complaint} {c : ComplaintText}
    (h : Elements.FiledInAppropriateDistrictCourt cpl c) :
    VenueNexus (mapComplaint_party cpl) c :=
  bridge_filed_to_venue h

theorem collapse_jurisdiction_clean
    {cpl : Elements.Complaint} {c : ComplaintText}
    (h : Elements.FiledInAppropriateDistrictCourt cpl c) :
    FederalJurisdictionalNexus c :=
  bridge_filed_to_jurisdiction h







axiom mapRespondent_pog : Elements.Respondent → Person
axiom mapPersonOrGroup_pog : Ontology.PersonOrGroup → Person


axiom bridge_elemPersonOrGroup_to_common
    {r : Elements.Respondent} {c : ComplaintText} :
    Elements.IsPersonOrGroup r c →
    IsPersonOrGroup (mapRespondent_pog r) c


axiom bridge_ontPersonOrGroup_to_common
    {p : Ontology.PersonOrGroup} {c : ComplaintText} :
    Ontology.IsPersonOrGroup p c →
    IsPersonOrGroup (mapPersonOrGroup_pog p) c

theorem collapse_pog_elem_clean
    {r : Elements.Respondent} {c : ComplaintText}
    (h : Elements.IsPersonOrGroup r c) :
    IsPersonOrGroup (mapRespondent_pog r) c :=
  bridge_elemPersonOrGroup_to_common h

theorem collapse_pog_ont_clean
    {p : Ontology.PersonOrGroup} {c : ComplaintText}
    (h : Ontology.IsPersonOrGroup p c) :
    IsPersonOrGroup (mapPersonOrGroup_pog p) c :=
  bridge_ontPersonOrGroup_to_common h












axiom bridge_agReasonableCause_iff_burdenCarried
    {p : Person} {c : ComplaintText} :
    Procedure.AGReasonableCause p c ↔
    BurdenCarried Bearer.Government Standard.ReasonableCause c

theorem collapse_reasonablecause_fwd
    {p : Person} {c : ComplaintText}
    (h : Procedure.AGReasonableCause p c) :
    BurdenCarried Bearer.Government Standard.ReasonableCause c :=
  (bridge_agReasonableCause_iff_burdenCarried).mp h

theorem collapse_reasonablecause_bwd
    {p : Person} {c : ComplaintText}
    (h : BurdenCarried Bearer.Government Standard.ReasonableCause c) :
    Procedure.AGReasonableCause p c :=
  (bridge_agReasonableCause_iff_burdenCarried).mpr h











axiom mapRef_S : Structure.Ref → StructRef
axiom guard_targetResolves (r : Structure.Ref) (c : ComplaintText) : Prop



axiom bridge_referencedSectionExists_to_common
    {r : Structure.Ref} {c : ComplaintText} :
    Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_S r) c



axiom bridge_incorporationHonored_to_common
    {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_S r) c

theorem collapse_S8_clean
    {r : Structure.Ref} {c : ComplaintText}
    (h : Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_S r) c :=
  bridge_referencedSectionExists_to_common h

theorem collapse_S9_modulo_guard
    {r : Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_S r) c :=
  bridge_incorporationHonored_to_common guard h

end Proving.USC.Common.CollapseT42PAEnf
