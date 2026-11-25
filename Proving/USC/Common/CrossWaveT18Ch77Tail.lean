














































import Proving.USC.T18.Ch77Tail.Elements.Predicates
import Proving.USC.T18.Ch77Tail.Ontology.Predicates
import Proving.USC.T18.Ch77Tail.Structure.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.Common.CrossWaveT18Ch77Tail

open Proving.USC.Common
open Proving.USC.T18.Ch77Tail












axiom corr_elements_citizenResident_iff {p : Person} {c : ComplaintText} :
    Elements.IsUSCitizenOrResident p c ↔ IsCitizenOrResidentOfUS p c



axiom corr_ontology_citizenResident_iff {p : Person} {c : ComplaintText} :
    Ontology.IsCitizenOrResidentOfUS p c ↔ IsCitizenOrResidentOfUS p c



theorem collapse_elements_citizenResident {p : Person} {c : ComplaintText}
    (h : Elements.IsUSCitizenOrResident p c) : IsCitizenOrResidentOfUS p c :=
  corr_elements_citizenResident_iff.mp h



theorem collapse_ontology_citizenResident {p : Person} {c : ComplaintText}
    (h : Ontology.IsCitizenOrResidentOfUS p c) : IsCitizenOrResidentOfUS p c :=
  corr_ontology_citizenResident_iff.mp h




theorem agree_citizenResident_witnesses {p : Person} {c : ComplaintText} :
    Elements.IsUSCitizenOrResident p c ↔ Ontology.IsCitizenOrResidentOfUS p c :=
  Iff.trans corr_elements_citizenResident_iff corr_ontology_citizenResident_iff.symm












def kindTag_ch77tail : Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def mapRef_T18Ch77Tail (r : Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag_ch77tail r.kind }


axiom guard_targetResolves_ch77tail (r : Structure.Ref) (c : ComplaintText) : Prop

axiom corr_ch77tail_referencedExists_to_common
    {r : Structure.Ref} {c : ComplaintText} :
    Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T18Ch77Tail r) c
axiom corr_ch77tail_incorporationHonored_to_common
    {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch77tail r c →
    Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T18Ch77Tail r) c
axiom corr_ch77tail_exceptionApplies_to_common
    {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch77tail r c →
    Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef_T18Ch77Tail r) c


theorem collapse_ch77tail_referencedExists
    {r : Structure.Ref} {c : ComplaintText}
    (h : Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T18Ch77Tail r) c :=
  corr_ch77tail_referencedExists_to_common h



theorem collapse_ch77tail_incorporationHonored_modulo_guard
    {r : Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch77tail r c)
    (h : Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T18Ch77Tail r) c :=
  corr_ch77tail_incorporationHonored_to_common hg h



theorem collapse_ch77tail_exceptionApplies_modulo_guard
    {r : Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch77tail r c)
    (h : Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef_T18Ch77Tail r) c :=
  corr_ch77tail_exceptionApplies_to_common hg h

end Proving.USC.Common.CrossWaveT18Ch77Tail
