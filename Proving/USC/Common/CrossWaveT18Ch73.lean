

























































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

import Proving.USC.T18.PredicateDefs.Ontology.Predicates

import Proving.USC.T18.Obstruction.Ontology.Predicates
import Proving.USC.T18.Obstruction.Deontic.Predicates
import Proving.USC.T18.Obstruction.Procedure.Predicates
import Proving.USC.T18.Obstruction.Structure.Predicates

namespace Proving.USC.Common.CrossWaveT18Ch73

open Proving.USC.Common

















axiom mapPredDefsOpToEntity : Proving.USC.T18.PredicateDefs.Ontology.OfficialProceeding → Entity

axiom mapCh73OpToEntity : Proving.USC.T18.Obstruction.Ontology.OfficialProceeding → Entity


axiom corr_predDefs_op_to_common
    {x : Proving.USC.T18.PredicateDefs.Ontology.OfficialProceeding} {c : ComplaintText} :
    Proving.USC.T18.PredicateDefs.Ontology.IsOfficialProceeding x c →
    IsOfficialProceeding (mapPredDefsOpToEntity x) c


axiom corr_common_to_predDefs_op
    {x : Proving.USC.T18.PredicateDefs.Ontology.OfficialProceeding} {c : ComplaintText} :
    IsOfficialProceeding (mapPredDefsOpToEntity x) c →
    Proving.USC.T18.PredicateDefs.Ontology.IsOfficialProceeding x c

axiom corr_ch73_op_to_common
    {op : Proving.USC.T18.Obstruction.Ontology.OfficialProceeding} {c : ComplaintText} :
    Proving.USC.T18.Obstruction.Ontology.IsOfficialProceeding op c →
    IsOfficialProceeding (mapCh73OpToEntity op) c

axiom corr_common_to_ch73_op
    {op : Proving.USC.T18.Obstruction.Ontology.OfficialProceeding} {c : ComplaintText} :
    IsOfficialProceeding (mapCh73OpToEntity op) c →
    Proving.USC.T18.Obstruction.Ontology.IsOfficialProceeding op c




theorem mint_predDefs_officialProceeding_iff
    {x : Proving.USC.T18.PredicateDefs.Ontology.OfficialProceeding} {c : ComplaintText} :
    Proving.USC.T18.PredicateDefs.Ontology.IsOfficialProceeding x c ↔
      IsOfficialProceeding (mapPredDefsOpToEntity x) c :=
  Iff.intro corr_predDefs_op_to_common corr_common_to_predDefs_op





theorem mint_ch73_officialProceeding_iff
    {op : Proving.USC.T18.Obstruction.Ontology.OfficialProceeding} {c : ComplaintText} :
    Proving.USC.T18.Obstruction.Ontology.IsOfficialProceeding op c ↔
      IsOfficialProceeding (mapCh73OpToEntity op) c :=
  Iff.intro corr_ch73_op_to_common corr_common_to_ch73_op
















axiom mapPredDefsLeoToEntity : Proving.USC.T18.PredicateDefs.Ontology.LawEnforcementOfficer → Entity

axiom mapCh73LeoToEntity : Proving.USC.T18.Obstruction.Ontology.LawEnforcementOfficer → Entity

axiom corr_predDefs_leo_to_common
    {x : Proving.USC.T18.PredicateDefs.Ontology.LawEnforcementOfficer} {c : ComplaintText} :
    Proving.USC.T18.PredicateDefs.Ontology.IsLawEnforcementOfficer x c →
    IsLawEnforcementOfficer (mapPredDefsLeoToEntity x) c
axiom corr_common_to_predDefs_leo
    {x : Proving.USC.T18.PredicateDefs.Ontology.LawEnforcementOfficer} {c : ComplaintText} :
    IsLawEnforcementOfficer (mapPredDefsLeoToEntity x) c →
    Proving.USC.T18.PredicateDefs.Ontology.IsLawEnforcementOfficer x c
axiom corr_ch73_leo_to_common
    {o : Proving.USC.T18.Obstruction.Ontology.LawEnforcementOfficer} {c : ComplaintText} :
    Proving.USC.T18.Obstruction.Ontology.IsLawEnforcementOfficer o c →
    IsLawEnforcementOfficer (mapCh73LeoToEntity o) c
axiom corr_common_to_ch73_leo
    {o : Proving.USC.T18.Obstruction.Ontology.LawEnforcementOfficer} {c : ComplaintText} :
    IsLawEnforcementOfficer (mapCh73LeoToEntity o) c →
    Proving.USC.T18.Obstruction.Ontology.IsLawEnforcementOfficer o c



theorem mint_predDefs_lawEnforcementOfficer_iff
    {x : Proving.USC.T18.PredicateDefs.Ontology.LawEnforcementOfficer} {c : ComplaintText} :
    Proving.USC.T18.PredicateDefs.Ontology.IsLawEnforcementOfficer x c ↔
      IsLawEnforcementOfficer (mapPredDefsLeoToEntity x) c :=
  Iff.intro corr_predDefs_leo_to_common corr_common_to_predDefs_leo



theorem mint_ch73_lawEnforcementOfficer_iff
    {o : Proving.USC.T18.Obstruction.Ontology.LawEnforcementOfficer} {c : ComplaintText} :
    Proving.USC.T18.Obstruction.Ontology.IsLawEnforcementOfficer o c ↔
      IsLawEnforcementOfficer (mapCh73LeoToEntity o) c :=
  Iff.intro corr_ch73_leo_to_common corr_common_to_ch73_leo





















axiom mapCh73DeonticOpToEntity : Proving.USC.T18.Obstruction.Deontic.OfficialProceeding → Entity




axiom corr_conditionMet1503_to_common
    {op : Proving.USC.T18.Obstruction.Deontic.OfficialProceeding} {c : ComplaintText} :
    Proving.USC.T18.Obstruction.Deontic.ConditionMet1503 op c →
    OfficialProceedingNexusMet (mapCh73DeonticOpToEntity op) c



axiom corr_conditionMet1512_to_common
    {op : Proving.USC.T18.Obstruction.Deontic.OfficialProceeding} {c : ComplaintText} :
    Proving.USC.T18.Obstruction.Deontic.ConditionMet1512 op c →
    OfficialProceedingNexusMet (mapCh73DeonticOpToEntity op) c



axiom corr_conditionMet1513_to_common
    {op : Proving.USC.T18.Obstruction.Deontic.OfficialProceeding} {c : ComplaintText} :
    Proving.USC.T18.Obstruction.Deontic.ConditionMet1513 op c →
    OfficialProceedingNexusMet (mapCh73DeonticOpToEntity op) c




theorem collapse_conditionMet1503
    {op : Proving.USC.T18.Obstruction.Deontic.OfficialProceeding} {c : ComplaintText}
    (h : Proving.USC.T18.Obstruction.Deontic.ConditionMet1503 op c) :
    OfficialProceedingNexusMet (mapCh73DeonticOpToEntity op) c :=
  corr_conditionMet1503_to_common h


theorem collapse_conditionMet1512
    {op : Proving.USC.T18.Obstruction.Deontic.OfficialProceeding} {c : ComplaintText}
    (h : Proving.USC.T18.Obstruction.Deontic.ConditionMet1512 op c) :
    OfficialProceedingNexusMet (mapCh73DeonticOpToEntity op) c :=
  corr_conditionMet1512_to_common h


theorem collapse_conditionMet1513
    {op : Proving.USC.T18.Obstruction.Deontic.OfficialProceeding} {c : ComplaintText}
    (h : Proving.USC.T18.Obstruction.Deontic.ConditionMet1513 op c) :
    OfficialProceedingNexusMet (mapCh73DeonticOpToEntity op) c :=
  corr_conditionMet1513_to_common h













axiom corr_federalJurisdictionReaches_to_common {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Obstruction.Procedure.FederalJurisdictionReaches p c → FederalJurisdictionalNexus c



theorem collapse_federalJurisdictionReaches {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Obstruction.Procedure.FederalJurisdictionReaches p c) :
    FederalJurisdictionalNexus c :=
  corr_federalJurisdictionReaches_to_common h













def kindTag_ch73 : Proving.USC.T18.Obstruction.Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def mapRef_T18Ch73 (r : Proving.USC.T18.Obstruction.Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag_ch73 r.kind }


axiom guard_targetResolves_ch73 (r : Proving.USC.T18.Obstruction.Structure.Ref) (c : ComplaintText) : Prop

axiom corr_ch73_referencedExists_to_common
    {r : Proving.USC.T18.Obstruction.Structure.Ref} {c : ComplaintText} :
    Proving.USC.T18.Obstruction.Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T18Ch73 r) c
axiom corr_ch73_incorporationHonored_to_common
    {r : Proving.USC.T18.Obstruction.Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch73 r c →
    Proving.USC.T18.Obstruction.Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T18Ch73 r) c


theorem collapse_ch73_referencedExists
    {r : Proving.USC.T18.Obstruction.Structure.Ref} {c : ComplaintText}
    (h : Proving.USC.T18.Obstruction.Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T18Ch73 r) c :=
  corr_ch73_referencedExists_to_common h


theorem collapse_ch73_incorporationHonored_modulo_guard
    {r : Proving.USC.T18.Obstruction.Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch73 r c)
    (h : Proving.USC.T18.Obstruction.Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T18Ch73 r) c :=
  corr_ch73_incorporationHonored_to_common hg h

end Proving.USC.Common.CrossWaveT18Ch73
