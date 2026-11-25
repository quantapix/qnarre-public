
































































import Proving.USC.T18.Trafficking.Ontology.Statute
import Proving.USC.T18.Trafficking.Structure.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.Common.CrossWaveT18Trafficking

open Proving.USC.Common
open Proving.USC.T18.Trafficking















axiom bridge_venture_refines_enterprise {v : Entity} {c : ComplaintText} :
    Ontology.IsVenture v c → IsEnterprise v c



theorem collapse_venture_refines_enterprise {v : Entity} {c : ComplaintText}
    (h : Ontology.IsVenture v c) : IsEnterprise v c :=
  bridge_venture_refines_enterprise h
















def kindTag_trafficking : Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def mapRef_T18Trafficking (r : Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag_trafficking r.kind }


axiom guard_targetResolves_trafficking (r : Structure.Ref) (c : ComplaintText) : Prop

axiom corr_trafficking_referencedExists_to_common
    {r : Structure.Ref} {c : ComplaintText} :
    Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T18Trafficking r) c
axiom corr_trafficking_incorporationHonored_to_common
    {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_trafficking r c →
    Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T18Trafficking r) c
axiom corr_trafficking_exceptionApplies_to_common
    {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_trafficking r c →
    Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef_T18Trafficking r) c
axiom corr_trafficking_overrideTriggered_to_common
    {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_trafficking r c →
    Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRef_T18Trafficking r) c


theorem collapse_trafficking_referencedExists
    {r : Structure.Ref} {c : ComplaintText}
    (h : Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T18Trafficking r) c :=
  corr_trafficking_referencedExists_to_common h



theorem collapse_trafficking_incorporationHonored_modulo_guard
    {r : Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_trafficking r c)
    (h : Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T18Trafficking r) c :=
  corr_trafficking_incorporationHonored_to_common hg h


theorem collapse_trafficking_exceptionApplies_modulo_guard
    {r : Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_trafficking r c)
    (h : Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef_T18Trafficking r) c :=
  corr_trafficking_exceptionApplies_to_common hg h



theorem collapse_trafficking_overrideTriggered_modulo_guard
    {r : Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_trafficking r c)
    (h : Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef_T18Trafficking r) c :=
  corr_trafficking_overrideTriggered_to_common hg h

end Proving.USC.Common.CrossWaveT18Trafficking
