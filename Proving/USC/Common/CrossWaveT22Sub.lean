





































import Proving.USC.T22.Deontic.Sub.Predicates
import Proving.USC.T22.Structure.Sub.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.Common.CrossWaveT22Sub

open Proving.USC.Common














axiom corr_t22sub_ag_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T22.Deontic.Sub.AddresseeIsAttorneyGeneral p c
      ↔ IsAttorneyGeneral p c



theorem collapse_t22sub_ag {p : Person} {c : ComplaintText}
    (h : Proving.USC.T22.Deontic.Sub.AddresseeIsAttorneyGeneral p c) :
    IsAttorneyGeneral p c :=
  corr_t22sub_ag_iff.mp h














def kindTag_t22sub : Proving.USC.T22.Structure.Sub.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def mapRef_t22sub (r : Proving.USC.T22.Structure.Sub.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag_t22sub r.kind }


axiom guard_targetResolves_t22sub
    (r : Proving.USC.T22.Structure.Sub.Ref) (c : ComplaintText) : Prop


axiom corr_t22sub_referencedExists_to_common
    {r : Proving.USC.T22.Structure.Sub.Ref} {c : ComplaintText} :
    Proving.USC.T22.Structure.Sub.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_t22sub r) c



axiom corr_t22sub_incorporationHonored_to_common
    {r : Proving.USC.T22.Structure.Sub.Ref} {c : ComplaintText} :
    guard_targetResolves_t22sub r c →
    Proving.USC.T22.Structure.Sub.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_t22sub r) c



theorem collapse_t22sub_referencedExists
    {r : Proving.USC.T22.Structure.Sub.Ref} {c : ComplaintText}
    (h : Proving.USC.T22.Structure.Sub.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_t22sub r) c :=
  corr_t22sub_referencedExists_to_common h



theorem collapse_t22sub_incorporationHonored_modulo_guard
    {r : Proving.USC.T22.Structure.Sub.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_t22sub r c)
    (h : Proving.USC.T22.Structure.Sub.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_t22sub r) c :=
  corr_t22sub_incorporationHonored_to_common hg h

end Proving.USC.Common.CrossWaveT22Sub
