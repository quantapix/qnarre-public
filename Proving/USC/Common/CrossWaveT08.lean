



























import Proving.USC.T08.Elements.Predicates
import Proving.USC.T08.Ontology.Predicates
import Proving.USC.T08.Procedure.Predicates
import Proving.USC.T08.Structure.Predicates
import Proving.USC.T18.Ch77TailCompletion.Ontology.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.Common.CrossWaveT08

open Proving.USC.Common
open Proving.USC.T08












axiom corr_t08_national_iff {p : Person} {c : ComplaintText} :
    T08.Ontology.IsNationalOfUS p c ↔ IsNationalOfUS p c

axiom corr_ch77_national_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch77TailCompletion.Ontology.IsNationalOfUS p c ↔ IsNationalOfUS p c


theorem collapse_t08_national {p : Person} {c : ComplaintText}
    (h : T08.Ontology.IsNationalOfUS p c) : IsNationalOfUS p c :=
  corr_t08_national_iff.mp h

theorem collapse_ch77_national {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Ch77TailCompletion.Ontology.IsNationalOfUS p c) :
    IsNationalOfUS p c :=
  corr_ch77_national_iff.mp h

theorem agree_national_witnesses {p : Person} {c : ComplaintText} :
    T08.Ontology.IsNationalOfUS p c ↔
    Proving.USC.T18.Ch77TailCompletion.Ontology.IsNationalOfUS p c :=
  Iff.trans corr_t08_national_iff corr_ch77_national_iff.symm







axiom corr_t08_lpr_iff {p : Person} {c : ComplaintText} :
    T08.Ontology.IsLawfulPermanentResident p c ↔ IsLawfulPermanentResident p c

axiom corr_ch77_lpr_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Ch77TailCompletion.Ontology.IsLawfulPermanentResident p c ↔
    IsLawfulPermanentResident p c


theorem collapse_t08_lpr {p : Person} {c : ComplaintText}
    (h : T08.Ontology.IsLawfulPermanentResident p c) : IsLawfulPermanentResident p c :=
  corr_t08_lpr_iff.mp h

theorem collapse_ch77_lpr {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Ch77TailCompletion.Ontology.IsLawfulPermanentResident p c) :
    IsLawfulPermanentResident p c :=
  corr_ch77_lpr_iff.mp h

theorem agree_lpr_witnesses {p : Person} {c : ComplaintText} :
    T08.Ontology.IsLawfulPermanentResident p c ↔
    Proving.USC.T18.Ch77TailCompletion.Ontology.IsLawfulPermanentResident p c :=
  Iff.trans corr_t08_lpr_iff corr_ch77_lpr_iff.symm










axiom corr_t08_person_iff {p : Person} {c : ComplaintText} :
    T08.Ontology.IsPerson p c ↔ IsPersonInUS p c


theorem collapse_t08_person {p : Person} {c : ComplaintText}
    (h : T08.Ontology.IsPerson p c) : IsPersonInUS p c :=
  corr_t08_person_iff.mp h













axiom corr_t08_citizen_refines {p : Person} {c : ComplaintText} :
    T08.Ontology.IsCitizenOfUS p c → IsCitizenOrResidentOfUS p c


theorem collapse_t08_citizen {p : Person} {c : ComplaintText}
    (h : T08.Ontology.IsCitizenOfUS p c) : IsCitizenOrResidentOfUS p c :=
  corr_t08_citizen_refines h






axiom corr_t08_venue_iff {p : Person} {c : ComplaintText} :
    T08.Procedure.VenueDistrictQualifies p c ↔ VenueNexus p c


theorem collapse_t08_venue {p : Person} {c : ComplaintText}
    (h : T08.Procedure.VenueDistrictQualifies p c) : VenueNexus p c :=
  corr_t08_venue_iff.mp h












axiom corr_knowsAlien_to_scienter {p : Person} {c : ComplaintText} :
    Elements.KnowsPersonIsAlien p c → ActedWithScienter p c
axiom corr_knowsUnlawfulPresence_to_scienter {p : Person} {c : ComplaintText} :
    Elements.KnowsOrRecklessUnlawfulPresence p c → ActedWithScienter p c
axiom corr_knowsEntryUnlawful_to_scienter {p : Person} {c : ComplaintText} :
    Elements.KnowsOrRecklessEntryUnlawful p c → ActedWithScienter p c
axiom corr_knowsNoAuth_to_scienter {p : Person} {c : ComplaintText} :
    Elements.KnowsNoPriorAuthorization p c → ActedWithScienter p c
axiom corr_actualKnowledge_to_scienter {p : Person} {c : ComplaintText} :
    Elements.ActualKnowledgeIndividualsAreUnauthorizedAliens p c → ActedWithScienter p c

theorem collapse_knowsAlien {p : Person} {c : ComplaintText}
    (h : Elements.KnowsPersonIsAlien p c) : ActedWithScienter p c :=
  corr_knowsAlien_to_scienter h
theorem collapse_knowsUnlawfulPresence {p : Person} {c : ComplaintText}
    (h : Elements.KnowsOrRecklessUnlawfulPresence p c) : ActedWithScienter p c :=
  corr_knowsUnlawfulPresence_to_scienter h
theorem collapse_knowsEntryUnlawful {p : Person} {c : ComplaintText}
    (h : Elements.KnowsOrRecklessEntryUnlawful p c) : ActedWithScienter p c :=
  corr_knowsEntryUnlawful_to_scienter h
theorem collapse_knowsNoAuth {p : Person} {c : ComplaintText}
    (h : Elements.KnowsNoPriorAuthorization p c) : ActedWithScienter p c :=
  corr_knowsNoAuth_to_scienter h
theorem collapse_actualKnowledge {p : Person} {c : ComplaintText}
    (h : Elements.ActualKnowledgeIndividualsAreUnauthorizedAliens p c) : ActedWithScienter p c :=
  corr_actualKnowledge_to_scienter h













def kindTag_t08 : Structure.EdgeKind → String
  | .Incorporates     => "Incorporates"
  | .SubjectTo        => "SubjectTo"
  | .Notwithstanding  => "Notwithstanding"
  | .ExceptAsProvided => "ExceptAsProvided"
  | .Savings          => "Savings"
  | .LexSpecialis     => "LexSpecialis"


def mapRef_t08 (r : Structure.Ref) : StructRef :=
  { source := r.source, target := r.target, kind := kindTag_t08 r.kind }


axiom guard_targetResolves_t08 (r : Structure.Ref) (c : ComplaintText) : Prop

axiom corr_t08_referencedExists_to_common {r : Structure.Ref} {c : ComplaintText} :
    Structure.ReferencedSectionExists r c →
    StructuralReferenceCoheres (mapRef_t08 r) c
axiom corr_t08_incorporationHonored_to_common {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_t08 r c →
    Structure.IncorporationHonored r c →
    StructuralReferenceCoheres (mapRef_t08 r) c
axiom corr_t08_exceptionApplies_to_common {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_t08 r c →
    Structure.ExceptionApplies r c →
    StructuralReferenceCoheres (mapRef_t08 r) c
axiom corr_t08_overrideTriggered_to_common {r : Structure.Ref} {c : ComplaintText} :
    guard_targetResolves_t08 r c →
    Structure.OverrideTriggered r c →
    StructuralReferenceCoheres (mapRef_t08 r) c


theorem collapse_t08_referencedExists {r : Structure.Ref} {c : ComplaintText}
    (h : Structure.ReferencedSectionExists r c) :
    StructuralReferenceCoheres (mapRef_t08 r) c :=
  corr_t08_referencedExists_to_common h

theorem collapse_t08_incorporationHonored_modulo_guard {r : Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_t08 r c) (h : Structure.IncorporationHonored r c) :
    StructuralReferenceCoheres (mapRef_t08 r) c :=
  corr_t08_incorporationHonored_to_common hg h

theorem collapse_t08_exceptionApplies_modulo_guard {r : Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_t08 r c) (h : Structure.ExceptionApplies r c) :
    StructuralReferenceCoheres (mapRef_t08 r) c :=
  corr_t08_exceptionApplies_to_common hg h

theorem collapse_t08_overrideTriggered_modulo_guard {r : Structure.Ref} {c : ComplaintText}
    (hg : guard_targetResolves_t08 r c) (h : Structure.OverrideTriggered r c) :
    StructuralReferenceCoheres (mapRef_t08 r) c :=
  corr_t08_overrideTriggered_to_common hg h

end Proving.USC.Common.CrossWaveT08
