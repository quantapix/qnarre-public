




































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T29.LMRA.Elements.Predicates
import Proving.USC.T29.LMRA.Ontology.Predicates
import Proving.USC.T29.LMRA.Procedure.Predicates
import Proving.USC.T29.LMRA.Structure.Predicates
import Proving.USC.T18.Enf.Elements.Predicates
import Proving.USC.T18.Wave.Elements.Predicates

namespace Proving.USC.Common.CrossWaveT29LMRA

open Proving.USC.Common







axiom corr_affectsCommerce_to_common {e : Entity} {c : ComplaintText} :
    Proving.USC.T29.LMRA.Ontology.AffectsCommerce e c → EngagedInInterstateCommerce e c
axiom corr_affectsCommerce_of_common {e : Entity} {c : ComplaintText} :
    EngagedInInterstateCommerce e c → Proving.USC.T29.LMRA.Ontology.AffectsCommerce e c



theorem collapse_affectsCommerce_iff {e : Entity} {c : ComplaintText} :
    Proving.USC.T29.LMRA.Ontology.AffectsCommerce e c ↔ EngagedInInterstateCommerce e c :=
  ⟨corr_affectsCommerce_to_common, corr_affectsCommerce_of_common⟩









axiom corr_isEmployerAffectingCommerce_to_common
    {emp : Proving.USC.T29.LMRA.Ontology.Employer} {c : ComplaintText} :
    Proving.USC.T29.LMRA.Ontology.IsEmployerAffectingCommerce emp c →
    EngagedInInterstateCommerce emp c



theorem collapse_isEmployerAffectingCommerce_to
    {emp : Proving.USC.T29.LMRA.Ontology.Employer} {c : ComplaintText}
    (h : Proving.USC.T29.LMRA.Ontology.IsEmployerAffectingCommerce emp c) :
    EngagedInInterstateCommerce emp c :=
  corr_isEmployerAffectingCommerce_to_common h








axiom corr_properVenue_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T29.LMRA.Procedure.ProperVenue p c → VenueNexus p c
axiom corr_properVenue_of_common {p : Person} {c : ComplaintText} :
    VenueNexus p c → Proving.USC.T29.LMRA.Procedure.ProperVenue p c



theorem collapse_properVenue_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T29.LMRA.Procedure.ProperVenue p c ↔ VenueNexus p c :=
  ⟨corr_properVenue_to_common, corr_properVenue_of_common⟩













def kindTag : Proving.USC.T29.LMRA.Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"



def mapRef_T29LMRA (r : Proving.USC.T29.LMRA.Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag r.kind }




axiom guard_targetResolves (r : Proving.USC.T29.LMRA.Structure.Ref) (c : ComplaintText) : Prop

axiom corr_struct_referencedExists_to_common
    {r : Proving.USC.T29.LMRA.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T29.LMRA.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T29LMRA r) c
axiom corr_struct_incorporationHonored_to_common
    {r : Proving.USC.T29.LMRA.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T29.LMRA.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T29LMRA r) c
axiom corr_struct_exceptionApplies_to_common
    {r : Proving.USC.T29.LMRA.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T29.LMRA.Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef_T29LMRA r) c
axiom corr_struct_overrideTriggered_to_common
    {r : Proving.USC.T29.LMRA.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves r c →
    Proving.USC.T29.LMRA.Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRef_T29LMRA r) c



theorem collapse_struct_referencedExists
    {r : Proving.USC.T29.LMRA.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T29.LMRA.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T29LMRA r) c :=
  corr_struct_referencedExists_to_common h



theorem collapse_struct_incorporationHonored_modulo_guard
    {r : Proving.USC.T29.LMRA.Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves r c)
    (h : Proving.USC.T29.LMRA.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T29LMRA r) c :=
  corr_struct_incorporationHonored_to_common hg h



theorem collapse_struct_exceptionApplies_modulo_guard
    {r : Proving.USC.T29.LMRA.Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves r c)
    (h : Proving.USC.T29.LMRA.Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef_T29LMRA r) c :=
  corr_struct_exceptionApplies_to_common hg h



theorem collapse_struct_overrideTriggered_modulo_guard
    {r : Proving.USC.T29.LMRA.Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves r c)
    (h : Proving.USC.T29.LMRA.Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef_T29LMRA r) c :=
  corr_struct_overrideTriggered_to_common hg h












axiom corr_t18enf_injury_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Enf.Elements.InjuredInBusinessOrProperty p c →
    InjuredInBusinessOrProperty p c
axiom corr_t18wave_injury_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Wave.Elements.InjuredInBusinessOrProperty p c →
    InjuredInBusinessOrProperty p c
axiom corr_t29lmra_injury_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T29.LMRA.Elements.InjuredInBusinessOrProperty p c →
    InjuredInBusinessOrProperty p c


theorem collapse_t18enf_injury_to
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Enf.Elements.InjuredInBusinessOrProperty p c) :
    InjuredInBusinessOrProperty p c :=
  corr_t18enf_injury_to_common h



theorem collapse_t18wave_injury_to
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Wave.Elements.InjuredInBusinessOrProperty p c) :
    InjuredInBusinessOrProperty p c :=
  corr_t18wave_injury_to_common h




theorem collapse_t29lmra_injury_to
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T29.LMRA.Elements.InjuredInBusinessOrProperty p c) :
    InjuredInBusinessOrProperty p c :=
  corr_t29lmra_injury_to_common h

end Proving.USC.Common.CrossWaveT29LMRA
