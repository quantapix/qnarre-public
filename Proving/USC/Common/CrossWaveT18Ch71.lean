












































































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.Common.CrossWaveT18Ch71

open Proving.USC.Common










namespace Ch71Elements



axiom KnewCharacterOfMatter (p : Person) (c : ComplaintText) : Prop

end Ch71Elements

namespace Ch71Deontic



axiom AffectsInterstateOrForeignCommerce (p : Person) (c : ComplaintText) : Prop

end Ch71Deontic

namespace Ch71Ontology



opaque Matter : Type



axiom IsInInterstateOrForeignCommerce (m : Matter) (c : ComplaintText) : Prop

end Ch71Ontology

namespace Ch71Structure



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

end Ch71Structure














axiom corr_ch71_knewCharacter_to_common {p : Person} {c : ComplaintText} :
    Ch71Elements.KnewCharacterOfMatter p c → ActedWithScienter p c



theorem collapse_ch71_knewCharacter {p : Person} {c : ComplaintText}
    (h : Ch71Elements.KnewCharacterOfMatter p c) : ActedWithScienter p c :=
  corr_ch71_knewCharacter_to_common h
















axiom corr_ch71_deonticCommerce_to_common {p : Person} {c : ComplaintText} :
    Ch71Deontic.AffectsInterstateOrForeignCommerce p c → FederalJurisdictionalNexus c
axiom corr_ch71_ontologyCommerce_to_common {m : Ch71Ontology.Matter} {c : ComplaintText} :
    Ch71Ontology.IsInInterstateOrForeignCommerce m c → FederalJurisdictionalNexus c



theorem collapse_ch71_deonticCommerce {p : Person} {c : ComplaintText}
    (h : Ch71Deontic.AffectsInterstateOrForeignCommerce p c) : FederalJurisdictionalNexus c :=
  corr_ch71_deonticCommerce_to_common h

theorem collapse_ch71_ontologyCommerce {m : Ch71Ontology.Matter} {c : ComplaintText}
    (h : Ch71Ontology.IsInInterstateOrForeignCommerce m c) : FederalJurisdictionalNexus c :=
  corr_ch71_ontologyCommerce_to_common h

















def kindTag_ch71 : Ch71Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def mapRef_T18Ch71 (r : Ch71Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag_ch71 r.kind }



axiom guard_targetResolves_ch71 (r : Ch71Structure.Ref) (c : ComplaintText) : Prop

axiom corr_ch71_referencedExists_to_common
    {r : Ch71Structure.Ref} {c : ComplaintText} :
    Ch71Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T18Ch71 r) c
axiom corr_ch71_incorporationHonored_to_common
    {r : Ch71Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch71 r c →
    Ch71Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T18Ch71 r) c


theorem collapse_ch71_referencedExists
    {r : Ch71Structure.Ref} {c : ComplaintText}
    (h : Ch71Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T18Ch71 r) c :=
  corr_ch71_referencedExists_to_common h

theorem collapse_ch71_incorporationHonored_modulo_guard
    {r : Ch71Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch71 r c)
    (h : Ch71Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T18Ch71 r) c :=
  corr_ch71_incorporationHonored_to_common hg h

end Proving.USC.Common.CrossWaveT18Ch71
