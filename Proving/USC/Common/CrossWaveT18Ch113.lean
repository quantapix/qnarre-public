







































































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.Common.CrossWaveT18Ch113

open Proving.USC.Common







namespace Ch113Structure


inductive EdgeKind
  | Incorporates
  | SubjectTo
  | Notwithstanding
  | ExceptAsProvided
  | Savings
  | LexSpecialis
  deriving DecidableEq, Repr


structure Ref where
  source : String
  target : String
  kind   : EdgeKind


axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop

axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop

end Ch113Structure

















def kindTag_ch113 : Ch113Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def mapRef_T18Ch113 (r : Ch113Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag_ch113 r.kind }


axiom guard_targetResolves_ch113 (r : Ch113Structure.Ref) (c : ComplaintText) : Prop

axiom corr_ch113_referencedExists_to_common
    {r : Ch113Structure.Ref} {c : ComplaintText} :
    Ch113Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T18Ch113 r) c
axiom corr_ch113_incorporationHonored_to_common
    {r : Ch113Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch113 r c →
    Ch113Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T18Ch113 r) c


theorem collapse_ch113_referencedExists
    {r : Ch113Structure.Ref} {c : ComplaintText}
    (h : Ch113Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T18Ch113 r) c :=
  corr_ch113_referencedExists_to_common h


theorem collapse_ch113_incorporationHonored_modulo_guard
    {r : Ch113Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch113 r c)
    (h : Ch113Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T18Ch113 r) c :=
  corr_ch113_incorporationHonored_to_common hg h

end Proving.USC.Common.CrossWaveT18Ch113
