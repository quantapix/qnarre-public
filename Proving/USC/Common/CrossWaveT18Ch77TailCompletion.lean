









































































import Proving.USC.T18.Ch77TailCompletion.Elements.Predicates
import Proving.USC.T18.Ch77TailCompletion.Ontology.Predicates
import Proving.USC.T18.Ch77TailCompletion.Structure.Predicates
import Proving.USC.T42.CRIPA.Deontic.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.Common.CrossWaveT18Ch77TailCompletion

open Proving.USC.Common
open Proving.USC.T18.Ch77TailCompletion












axiom corr_elements_ag_iff {p : Person} {c : ComplaintText} :
    Elements.IsAttorneyGeneral p c ↔ IsAttorneyGeneral p c



axiom corr_cripa_ag_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T42.CRIPA.Deontic.IsAttorneyGeneral p c ↔ IsAttorneyGeneral p c



theorem collapse_elements_ag {p : Person} {c : ComplaintText}
    (h : Elements.IsAttorneyGeneral p c) : IsAttorneyGeneral p c :=
  corr_elements_ag_iff.mp h



theorem collapse_cripa_ag {p : Person} {c : ComplaintText}
    (h : Proving.USC.T42.CRIPA.Deontic.IsAttorneyGeneral p c) : IsAttorneyGeneral p c :=
  corr_cripa_ag_iff.mp h



theorem agree_ag_witnesses {p : Person} {c : ComplaintText} :
    Elements.IsAttorneyGeneral p c ↔ Proving.USC.T42.CRIPA.Deontic.IsAttorneyGeneral p c :=
  Iff.trans corr_elements_ag_iff corr_cripa_ag_iff.symm












def kindTag_ch77tailcompletion : Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def mapRef_T18Ch77TailCompletion (r : Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag_ch77tailcompletion r.kind }


axiom guard_targetResolves_ch77tailcompletion (r : Structure.Ref) (c : ComplaintText) : Prop

axiom corr_ch77tc_referencedExists_to_common
    {r : Structure.Ref} {c : ComplaintText} :
    Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_T18Ch77TailCompletion r) c
axiom corr_ch77tc_incorporationHonored_to_common
    {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch77tailcompletion r c →
    Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_T18Ch77TailCompletion r) c
axiom corr_ch77tc_exceptionApplies_to_common
    {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch77tailcompletion r c →
    Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef_T18Ch77TailCompletion r) c
axiom corr_ch77tc_overrideTriggered_to_common
    {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch77tailcompletion r c →
    Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRef_T18Ch77TailCompletion r) c
axiom corr_ch77tc_savingsClausePreserved_to_common
    {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_ch77tailcompletion r c →
    Structure.SavingsClausePreserved r c →
    StructuralReferenceCoheres (mapRef_T18Ch77TailCompletion r) c


theorem collapse_ch77tc_referencedExists
    {r : Structure.Ref} {c : ComplaintText}
    (h : Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_T18Ch77TailCompletion r) c :=
  corr_ch77tc_referencedExists_to_common h



theorem collapse_ch77tc_incorporationHonored_modulo_guard
    {r : Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch77tailcompletion r c)
    (h : Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_T18Ch77TailCompletion r) c :=
  corr_ch77tc_incorporationHonored_to_common hg h



theorem collapse_ch77tc_exceptionApplies_modulo_guard
    {r : Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch77tailcompletion r c)
    (h : Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef_T18Ch77TailCompletion r) c :=
  corr_ch77tc_exceptionApplies_to_common hg h



theorem collapse_ch77tc_overrideTriggered_modulo_guard
    {r : Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch77tailcompletion r c)
    (h : Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef_T18Ch77TailCompletion r) c :=
  corr_ch77tc_overrideTriggered_to_common hg h



theorem collapse_ch77tc_savingsClausePreserved_modulo_guard
    {r : Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_ch77tailcompletion r c)
    (h : Structure.SavingsClausePreserved r c) :
    StructuralReferenceCoheres (mapRef_T18Ch77TailCompletion r) c :=
  corr_ch77tc_savingsClausePreserved_to_common hg h







axiom corr_limitations1595_iff {v : Person} {c : ComplaintText} :
    Elements.WithinLimitationsPeriod1595 v c ↔ WithinLimitations v c



theorem collapse_limitations1595 {v : Person} {c : ComplaintText}
    (h : Elements.WithinLimitationsPeriod1595 v c) : WithinLimitations v c :=
  corr_limitations1595_iff.mp h








axiom corr_presentInUS_iff {p : Person} {c : ComplaintText} :
    Ontology.IsPresentInUS p c ↔ IsPersonInUS p c



theorem collapse_presentInUS {p : Person} {c : ComplaintText}
    (h : Ontology.IsPresentInUS p c) : IsPersonInUS p c :=
  corr_presentInUS_iff.mp h

end Proving.USC.Common.CrossWaveT18Ch77TailCompletion
