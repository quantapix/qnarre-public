



























import Proving.USC.T18.Ch3.Elements.Statute
import Proving.USC.T18.Ch3.Deontic.Statute
import Proving.USC.T18.Ch3.Ontology.Statute
import Proving.USC.T18.Ch3.Procedure.Statute

namespace Proving.USC.T18.Ch3.Bridge

open Proving.USC.Common
open Proving.USC.T18.Ch3










axiom corrAddressee {p c} :
    Elements.IsCulpablePerson p c → Deontic.IsAddresseeAnyPerson p c


axiom corrCondition41 {c} :
    Elements.OnProtectedRefugeLand c → ¬ Elements.InComplianceWithRegulations c →
    Deontic.ConditionMet41 c
axiom corrAct41 {p c} :
    Elements.Section41Act c → Deontic.RegulatedActOccurred41 p c


axiom corrCondition42Import {c} :
    Elements.IsInjuriousSpecies c → ¬ Elements.ImportationExempt c →
    Deontic.ConditionMet42Import c
axiom corrAct42Import {p c} :
    Elements.ImportsOrShipsInjuriousSpecies c → Deontic.RegulatedActOccurred42Import p c


axiom corrCondition42Transport {c} :
    Elements.TransportsUnderInhumaneConditions c → Deontic.ConditionMet42Transport c
axiom corrAct42Transport {p c} :
    Elements.TransportsUnderInhumaneConditions c → Deontic.RegulatedActOccurred42Transport p c


axiom corrCommerce43 {p c} :
    Elements.TravelsOrUsesInterstateCommerceFacility p c →
    Deontic.InterstateOrForeignCommerceNexus c






axiom corrDeonticEnterpriseWitness {p : Person} {e : Entity} {c} :
    Elements.IsAnimalEnterprise e c → Elements.PurposeToDamageAnimalEnterprise p c →
    Elements.Section43PredicateAct c →
    ∃ e' : Deontic.AnimalEnterprise,
      Deontic.ConditionMet43 p e' c ∧ Deontic.RegulatedActOccurred43 p e' c


axiom corrCondition47a {p c} :
    Elements.PurposeToTakeProtectedEquine p c → Elements.IsProtectedWildEquine c →
    Elements.OnPublicLandOrRange c → Deontic.ConditionMet47a c
axiom corrAct47a {p c} :
    Elements.UsesAircraftOrVehicleToHunt c → Deontic.RegulatedActOccurred47a p c
axiom corrCondition47b {p c} :
    Elements.PurposeToTakeProtectedEquine p c → Elements.OnPublicLandOrRange c →
    Deontic.ConditionMet47b c
axiom corrAct47b {p c} :
    Elements.PollutesWateringHole c → Deontic.RegulatedActOccurred47b p c


axiom corrAct48Crush {p c} :
    Elements.EngagesInAnimalCrushing c → Deontic.RegulatedActOccurred48Crush p c
axiom corrAct48Video {p c} {v : Elements.CrushVideo} :
    Elements.CreatesAnimalCrushVideo v c → Deontic.RegulatedActOccurred48Video p c
axiom corrAct48Distribute {p c} {v : Elements.CrushVideo} :
    Elements.TrafficksAnimalCrushVideo v c → Deontic.RegulatedActOccurred48Distribute p c


axiom corrCondition49 {c} :
    Elements.ViolatedAnimalWelfareActFightingProhibition c → Deontic.ConditionMet49 c
axiom corrAct49 {p c} :
    Elements.ViolatedAnimalWelfareActFightingProhibition c → Deontic.RegulatedActOccurred49 p c


axiom corrAeCommercial {e c} :
    Elements.IsCommercialOrAcademicAnimalEnterprise e c →
    Ontology.IsCommercialOrAcademicEnterprise e c
axiom corrAeVenue {e c} :
    Elements.IsAnimalVenueEnterprise e c → Ontology.IsAnimalDisplayEnterprise e c
axiom corrAeFair {e c} :
    Elements.IsAgriculturalFairEvent e c → Ontology.IsAgriculturalFairEvent e c





axiom corrCrushVideoWitness {v : Elements.CrushVideo} {c} :
    Elements.DepictsAnimalCrushing v c → Elements.VideoIsObscene v c →
    ∃ w : Ontology.CrushVideo,
      Ontology.VideoDepictsAnimalCrushing w c ∧ Ontology.VideoIsObscene w c


axiom corrViolation41 {p c} : Elements.Section41Act c → Procedure.ViolationOccurred p c
axiom corrViolation42 {p c} :
    Elements.ImportsOrShipsInjuriousSpecies c → Procedure.ViolationOccurred p c
axiom corrViolation43 {p c} : Elements.Section43PredicateAct c → Procedure.ViolationOccurred p c
axiom corrViolation47 {p c} : Elements.Section47Act c → Procedure.ViolationOccurred p c
axiom corrViolation48 {p c} : Elements.Section48Act c → Procedure.ViolationOccurred p c
axiom corrViolation49 {p c} :
    Elements.ViolatedAnimalWelfareActFightingProhibition c → Procedure.ViolationOccurred p c




theorem s41_elements_implies_deontic {p c} (h : Elements.Section41 p c) :
    Deontic.ProhibitionViolated41 p c :=
  ⟨⟨corrAddressee h.culpable, corrCondition41 h.onRefuge h.notCompliant⟩, corrAct41 h.act⟩


theorem s42_elements_implies_deontic {p c} (h : Elements.Section42 p c) :
    Deontic.ProhibitionViolated42Import p c :=
  ⟨⟨corrAddressee h.culpable, corrCondition42Import h.injurious h.notExempt⟩,
    corrAct42Import h.act⟩


theorem s42c_elements_implies_deontic {p c} (h : Elements.Section42c p c) :
    Deontic.ProhibitionViolated42Transport p c :=
  ⟨⟨corrAddressee h.culpable, corrCondition42Transport h.act⟩, corrAct42Transport h.act⟩



theorem s43_elements_implies_deontic {p : Person} {e : Entity} {c}
    (h : Elements.Section43 p e c) :
    ∃ e' : Deontic.AnimalEnterprise, Deontic.ProhibitionViolated43 p e' c :=
  match corrDeonticEnterpriseWitness h.enterprise h.purpose h.act with
  | ⟨e', hCond, hAct⟩ =>
      ⟨e', ⟨⟨corrAddressee h.culpable, corrCommerce43 h.interstate, hCond⟩, hAct⟩⟩


theorem s47_elements_implies_deontic {p c} (h : Elements.Section47 p c) :
    Deontic.ProhibitionViolated47a p c ∨ Deontic.ProhibitionViolated47b p c :=
  match h.act with
  | .aircraftHunt hh =>
      Or.inl ⟨⟨corrAddressee h.culpable,
                corrCondition47a h.purpose h.equine h.onPublic⟩, corrAct47a hh⟩
  | .pollute hh =>
      Or.inr ⟨⟨corrAddressee h.culpable,
                corrCondition47b h.purpose h.onPublic⟩, corrAct47b hh⟩







theorem s48_elements_implies_deontic_modulo_gaps {p c}
    (gapCommerceNexus : Deontic.InterstateOrForeignCommerceNexus c)
    (h : Elements.Section48 p c) :
    Deontic.ProhibitionViolated48Crush p c ∨ Deontic.ProhibitionViolated48Video p c ∨
      Deontic.ProhibitionViolated48Distribute p c :=
  match h.act with
  | .crush hh =>
      Or.inl ⟨⟨corrAddressee h.culpable, gapCommerceNexus⟩, corrAct48Crush hh⟩
  | .create _ _ hh =>
      Or.inr (Or.inl ⟨⟨corrAddressee h.culpable, gapCommerceNexus⟩, corrAct48Video hh⟩)
  | .traffic _ _ hh =>
      Or.inr (Or.inr ⟨⟨corrAddressee h.culpable, gapCommerceNexus⟩, corrAct48Distribute hh⟩)


theorem s49_elements_implies_deontic {p c} (h : Elements.Section49 p c) :
    Deontic.ProhibitionViolated49 p c :=
  ⟨⟨corrAddressee h.culpable, corrCondition49 h.violation⟩, corrAct49 h.violation⟩





theorem animalEnterprise_elements_implies_ontology {e : Entity} {c}
    (h : Elements.IsAnimalEnterprise e c) : Ontology.AnimalEnterpriseMembership e c :=
  match h with
  | .commercial hh => .commercialAcademic (corrAeCommercial hh)
  | .venue hh => .display (corrAeVenue hh)
  | .fair hh => .agriculturalFair (corrAeFair hh)



theorem crushVideo_elements_implies_ontology_modulo_gaps {v : Elements.CrushVideo} {c}
    (h : Elements.IsAnimalCrushVideo v c) :
    ∃ w : Ontology.CrushVideo, Ontology.AnimalCrushVideoMembership w c :=
  match corrCrushVideoWitness h.depicts h.obscene with
  | ⟨w, hd, ho⟩ => ⟨w, ⟨hd, ho⟩⟩







theorem s41_elements_implies_procedure_violation {p c} (h : Elements.Section41 p c) :
    Procedure.ViolationOccurred p c := corrViolation41 h.act
theorem s42_elements_implies_procedure_violation {p c} (h : Elements.Section42 p c) :
    Procedure.ViolationOccurred p c := corrViolation42 h.act
theorem s43_elements_implies_procedure_violation {p : Person} {e : Entity} {c}
    (h : Elements.Section43 p e c) : Procedure.ViolationOccurred p c := corrViolation43 h.act
theorem s47_elements_implies_procedure_violation {p c} (h : Elements.Section47 p c) :
    Procedure.ViolationOccurred p c := corrViolation47 h.act
theorem s48_elements_implies_procedure_violation {p c} (h : Elements.Section48 p c) :
    Procedure.ViolationOccurred p c := corrViolation48 h.act
theorem s49_elements_implies_procedure_violation {p c} (h : Elements.Section49 p c) :
    Procedure.ViolationOccurred p c := corrViolation49 h.violation

end Proving.USC.T18.Ch3.Bridge
