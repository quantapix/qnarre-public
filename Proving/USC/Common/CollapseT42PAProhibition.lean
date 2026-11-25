
































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.PublicAccommodations.Prohibition.Ontology.Predicates
import Proving.USC.T42.PublicAccommodations.Prohibition.Procedure.Predicates
import Proving.USC.T42.PublicAccommodations.Prohibition.Structure.Predicates

namespace Proving.USC.Common.CollapseT42PAProhibition

open Proving.USC.Common



















axiom recoverParty_OPG :
    Proving.USC.T42.PublicAccommodations.Prohibition.Ontology.DiscriminatoryTreatment → Proving.USC.T42.PublicAccommodations.Prohibition.Ontology.ProtectedGround → Person





axiom bridge_isOnProtectedGround_to_common
    {x : Proving.USC.T42.PublicAccommodations.Prohibition.Ontology.DiscriminatoryTreatment}
    {g : Proving.USC.T42.PublicAccommodations.Prohibition.Ontology.ProtectedGround} {c : ComplaintText} :
    Proving.USC.T42.PublicAccommodations.Prohibition.Ontology.IsOnProtectedGround x g c →
    OnProtectedGround (recoverParty_OPG x g) c

theorem collapse_OPG_clean
    {x : Proving.USC.T42.PublicAccommodations.Prohibition.Ontology.DiscriminatoryTreatment}
    {g : Proving.USC.T42.PublicAccommodations.Prohibition.Ontology.ProtectedGround} {c : ComplaintText}
    (h : Proving.USC.T42.PublicAccommodations.Prohibition.Ontology.IsOnProtectedGround x g c) :
    OnProtectedGround (recoverParty_OPG x g) c :=
  bridge_isOnProtectedGround_to_common h





















axiom bridge_common_to_isAffectedPerson
    {p : Person} {c : ComplaintText} :
    IsPersonInUS p c → Proving.USC.T42.PublicAccommodations.Prohibition.Ontology.IsAffectedPerson p c

theorem collapse_AP_oneway
    {p : Person} {c : ComplaintText}
    (h : IsPersonInUS p c) :
    Proving.USC.T42.PublicAccommodations.Prohibition.Ontology.IsAffectedPerson p c :=
  bridge_common_to_isAffectedPerson h

















axiom bridge_withinEnforcementWindow_to_common
    {p : Person} {c : ComplaintText} :
    Proving.USC.T42.PublicAccommodations.Prohibition.Procedure.WithinEnforcementWindow p c →
    WithinLimitations p c

theorem collapse_WW_clean
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T42.PublicAccommodations.Prohibition.Procedure.WithinEnforcementWindow p c) :
    WithinLimitations p c :=
  bridge_withinEnforcementWindow_to_common h
























axiom mapRef_S : Proving.USC.T42.PublicAccommodations.Prohibition.Structure.Ref → StructRef
axiom guard_targetResolves (r : Proving.USC.T42.PublicAccommodations.Prohibition.Structure.Ref) (c : ComplaintText) : Prop



axiom bridge_referencedSectionExists_to_common
    {r : Proving.USC.T42.PublicAccommodations.Prohibition.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T42.PublicAccommodations.Prohibition.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_S r) c





axiom bridge_incorporationHonored_to_common
    {r : Proving.USC.T42.PublicAccommodations.Prohibition.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T42.PublicAccommodations.Prohibition.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_S r) c

theorem collapse_S5_clean
    {r : Proving.USC.T42.PublicAccommodations.Prohibition.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T42.PublicAccommodations.Prohibition.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_S r) c :=
  bridge_referencedSectionExists_to_common h

theorem collapse_S6_modulo_guard
    {r : Proving.USC.T42.PublicAccommodations.Prohibition.Structure.Ref} {c : ComplaintText}
    (guard : guard_targetResolves r c)
    (h : Proving.USC.T42.PublicAccommodations.Prohibition.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_S r) c :=
  bridge_incorporationHonored_to_common guard h

end Proving.USC.Common.CollapseT42PAProhibition
