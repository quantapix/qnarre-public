











































































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.PredicateDefs.Elements.Predicates
import Proving.USC.T18.PredicateDefs.Deontic.Predicates
import Proving.USC.T18.PredicateDefs.Ontology.Predicates
import Proving.USC.T18.PredicateDefs.Procedure.Predicates
import Proving.USC.T18.PredicateDefs.Structure.Predicates

namespace Proving.USC.Common.CrossWaveT18PredicateDefs

open Proving.USC.Common





















axiom mapSchemeToPerson : Proving.USC.T18.PredicateDefs.Ontology.Scheme → Person

axiom corr_deontic_devisedScheme_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T18.PredicateDefs.Deontic.DevisedSchemeToDefraud p c →
    SchemeToDefraudDevised p c
axiom corr_procedure_isScheme_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T18.PredicateDefs.Procedure.IsSchemeToDefraud p c →
    SchemeToDefraudDevised p c
axiom corr_ontology_isScheme_to_common
    {s : Proving.USC.T18.PredicateDefs.Ontology.Scheme} {c : ComplaintText} :
    Proving.USC.T18.PredicateDefs.Ontology.IsSchemeToDefraud s c →
    SchemeToDefraudDevised (mapSchemeToPerson s) c
axiom corr_ontology_honestServices_to_common
    {s : Proving.USC.T18.PredicateDefs.Ontology.Scheme} {c : ComplaintText} :
    Proving.USC.T18.PredicateDefs.Ontology.IsHonestServicesDeprivation s c →
    SchemeToDefraudDevised (mapSchemeToPerson s) c


theorem collapse_deontic_devisedScheme {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.PredicateDefs.Deontic.DevisedSchemeToDefraud p c) :
    SchemeToDefraudDevised p c :=
  corr_deontic_devisedScheme_to_common h



theorem collapse_procedure_isScheme {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.PredicateDefs.Procedure.IsSchemeToDefraud p c) :
    SchemeToDefraudDevised p c :=
  corr_procedure_isScheme_to_common h


theorem collapse_ontology_isScheme
    {s : Proving.USC.T18.PredicateDefs.Ontology.Scheme} {c : ComplaintText}
    (h : Proving.USC.T18.PredicateDefs.Ontology.IsSchemeToDefraud s c) :
    SchemeToDefraudDevised (mapSchemeToPerson s) c :=
  corr_ontology_isScheme_to_common h






theorem collapse_ontology_honestServices
    {s : Proving.USC.T18.PredicateDefs.Ontology.Scheme} {c : ComplaintText}
    (h : Proving.USC.T18.PredicateDefs.Ontology.IsHonestServicesDeprivation s c) :
    SchemeToDefraudDevised (mapSchemeToPerson s) c :=
  corr_ontology_honestServices_to_common h


















axiom mapPartyToPerson : Proving.USC.T18.PredicateDefs.Elements.Party → Person

axiom corr_actedCorruptly_to_common
    {pa : Proving.USC.T18.PredicateDefs.Elements.Party} {c : ComplaintText} :
    Proving.USC.T18.PredicateDefs.Elements.ActedCorruptly pa c →
    ActedWithScienter (mapPartyToPerson pa) c




theorem collapse_actedCorruptly
    {pa : Proving.USC.T18.PredicateDefs.Elements.Party} {c : ComplaintText}
    (h : Proving.USC.T18.PredicateDefs.Elements.ActedCorruptly pa c) :
    ActedWithScienter (mapPartyToPerson pa) c :=
  corr_actedCorruptly_to_common h


















def kindTag_predDefs : Proving.USC.T18.PredicateDefs.Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def mapRef_T18PredDefs (r : Proving.USC.T18.PredicateDefs.Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag_predDefs r.kind }


axiom guard_targetResolves_predDefs
    (r : Proving.USC.T18.PredicateDefs.Structure.Ref) (c : ComplaintText) : Prop

axiom corr_predDefs_referencedExists_to_common
    {r : Proving.USC.T18.PredicateDefs.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T18.PredicateDefs.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T18PredDefs r) c
axiom corr_predDefs_incorporationHonored_to_common
    {r : Proving.USC.T18.PredicateDefs.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_predDefs r c →
    Proving.USC.T18.PredicateDefs.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T18PredDefs r) c
axiom corr_predDefs_exceptionApplies_to_common
    {r : Proving.USC.T18.PredicateDefs.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_predDefs r c →
    Proving.USC.T18.PredicateDefs.Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef_T18PredDefs r) c


theorem collapse_predDefs_referencedExists
    {r : Proving.USC.T18.PredicateDefs.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T18.PredicateDefs.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T18PredDefs r) c :=
  corr_predDefs_referencedExists_to_common h


theorem collapse_predDefs_incorporationHonored_modulo_guard
    {r : Proving.USC.T18.PredicateDefs.Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_predDefs r c)
    (h : Proving.USC.T18.PredicateDefs.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T18PredDefs r) c :=
  corr_predDefs_incorporationHonored_to_common hg h


theorem collapse_predDefs_exceptionApplies_modulo_guard
    {r : Proving.USC.T18.PredicateDefs.Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_predDefs r c)
    (h : Proving.USC.T18.PredicateDefs.Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef_T18PredDefs r) c :=
  corr_predDefs_exceptionApplies_to_common hg h

end Proving.USC.Common.CrossWaveT18PredicateDefs
