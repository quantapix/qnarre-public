




























import Proving.USC.T18.Core.Elements.Statute
import Proving.USC.T18.Core.Ontology.Statute
import Proving.USC.T18.Core.Deontic.Statute
import Proving.Rico.Statute

namespace Proving.USC.T18.CoreBridge

open Proving.USC.Common










axiom mapElemActs_toOntoPattern : List Core.Elements.Act → Core.Ontology.Pattern
axiom mapElemDebt_toOnto        : Core.Elements.UnlawfulDebt → Core.Ontology.UnlawfulDebt
axiom mkOntoViolation           : Core.Ontology.Section1962Violation

















axiom corr_associated_toAddressee {p e c} :
    Core.Elements.EmployedOrAssociated p e c → Core.Deontic.AddresseeInClass1962c p e c
axiom corr_commerce_toCondition {e c} :
    EngagedInInterstateCommerce e c → Core.Deontic.ConditionMet1962c e c
axiom corr_conducts_toRegAct {p e c} :
    Core.Elements.ConductsOrParticipates p e c → Core.Deontic.RegulatedActOccurred1962c p e c




theorem s1962c_elements_implies_deontic
    {p : Person} {e : Entity} {acts : List Core.Elements.Act}
    {d : Core.Elements.UnlawfulDebt} {c : ComplaintText}
    (h : Core.Elements.Section1962c p e acts d c) :
    Core.Deontic.ProhibitionViolated1962c p e c :=
  ⟨⟨corr_associated_toAddressee h.associated,
    corr_commerce_toCondition h.interstateCommerce⟩,
   corr_conducts_toRegAct h.conducts⟩











axiom corr_culpable_toIsPerson {p c} :
    Core.Elements.CulpablePersonCapableOfIntent p c → Core.Ontology.IsPerson p c
axiom corr_elemEnt_toOntoEnt {e c} :
    Core.Elements.IsEnterprise e c → Core.Ontology.IsEnterprise e c
axiom corr_pattern_toOntoPattern {acts c} :
    Core.Elements.PatternOfRacketeering acts c →
    Core.Ontology.IsPatternOfRacketeering (mapElemActs_toOntoPattern acts) c
axiom corr_debt_toOntoDebt {d c} :
    Core.Elements.CollectionOfUnlawfulDebt d c →
    Core.Ontology.IsUnlawfulDebt (mapElemDebt_toOnto d) c
axiom corr_elem1962c_toViolationStatus {p e acts d c} :
    Core.Elements.Section1962c p e acts d c →
    Core.Ontology.IsSection1962Violation mkOntoViolation c



theorem basis_toOntoPredicate {acts : List Core.Elements.Act}
    {d : Core.Elements.UnlawfulDebt} {c : ComplaintText}
    (h : Core.Elements.PredicateBasis acts d c) :
    Core.Ontology.RacketeeringPredicate (mapElemActs_toOntoPattern acts)
        (mapElemDebt_toOnto d) c := by
  cases h with
  | pattern hp      => exact .viaPattern (corr_pattern_toOntoPattern hp)
  | unlawfulDebt hd => exact .viaUnlawfulDebt (corr_debt_toOntoDebt hd)




theorem s1962_elements_implies_ontology
    {p : Person} {e : Entity} {acts : List Core.Elements.Act}
    {d : Core.Elements.UnlawfulDebt} {c : ComplaintText}
    (h : Core.Elements.Section1962c p e acts d c) :
    Core.Ontology.Section1962ViolationMembership mkOntoViolation p e
        (mapElemActs_toOntoPattern acts) (mapElemDebt_toOnto d) c :=
  ⟨corr_culpable_toIsPerson h.culpable,
   corr_elemEnt_toOntoEnt h.enterprise,
   basis_toOntoPredicate h.basis,
   corr_elem1962c_toViolationStatus h⟩













axiom corr_deonViolated_toOntoStatus {p e c} :
    Core.Deontic.ProhibitionViolated1962c p e c →
    Core.Ontology.IsSection1962Violation mkOntoViolation c




theorem s1962_deontic_implies_ontology_status
    {p : Person} {e : Entity} {c : ComplaintText}
    (h : Core.Deontic.ProhibitionViolated1962c p e c) :
    Core.Ontology.IsSection1962Violation mkOntoViolation c :=
  corr_deonViolated_toOntoStatus h











axiom mapPerson    : Person                → Proving.Rico.Person
axiom mapEntity    : Entity                → Proving.Rico.Entity
axiom mapComplaint : ComplaintText         → Proving.Rico.ComplaintText
axiom mapGoldActs  : List Core.Elements.Act     → List Proving.Rico.Act

axiom corr_gold_culpable {p c} : Core.Elements.CulpablePersonCapableOfIntent p c →
    Proving.Rico.CulpablePersonCapableOfIntent (mapPerson p) (mapComplaint c)
axiom corr_gold_enterprise {e c} : Core.Elements.IsEnterprise e c →
    Proving.Rico.IsEnterprise (mapEntity e) (mapComplaint c)
axiom corr_gold_commerce {e c} : EngagedInInterstateCommerce e c →
    Proving.Rico.EngagedInInterstateCommerce (mapEntity e) (mapComplaint c)
axiom corr_gold_distinct {p e c} : Core.Elements.PersonEnterpriseDistinct p e c →
    Proving.Rico.PersonEnterpriseDistinct (mapPerson p) (mapEntity e) (mapComplaint c)
axiom corr_gold_associated {p e c} : Core.Elements.EmployedOrAssociated p e c →
    Proving.Rico.EmployedOrAssociated (mapPerson p) (mapEntity e) (mapComplaint c)
axiom corr_gold_conducts {p e c} : Core.Elements.ConductsOrParticipates p e c →
    Proving.Rico.ConductsOrParticipates (mapPerson p) (mapEntity e) (mapComplaint c)
axiom corr_gold_pattern {acts c} : Core.Elements.PatternOfRacketeering acts c →
    Proving.Rico.PatternOfRacketeering (mapGoldActs acts) (mapComplaint c)








axiom corr_gold_debtAsPattern {acts : List Core.Elements.Act}
    {d : Core.Elements.UnlawfulDebt} {c : ComplaintText} :
    Core.Elements.CollectionOfUnlawfulDebt d c →
    Proving.Rico.PatternOfRacketeering (mapGoldActs acts) (mapComplaint c)

theorem basis_toGoldenPattern {acts : List Core.Elements.Act}
    {d : Core.Elements.UnlawfulDebt} {c : ComplaintText}
    (h : Core.Elements.PredicateBasis acts d c) :
    Proving.Rico.PatternOfRacketeering (mapGoldActs acts) (mapComplaint c) := by
  cases h with
  | pattern hp      => exact corr_gold_pattern hp
  | unlawfulDebt hd => exact corr_gold_debtAsPattern hd





theorem elements_implies_golden_1962c
    {p : Person} {e : Entity} {acts : List Core.Elements.Act}
    {d : Core.Elements.UnlawfulDebt} {c : ComplaintText}
    (h : Core.Elements.Section1962c p e acts d c) :
    Proving.Rico.Section1962c (mapPerson p) (mapEntity e) (mapGoldActs acts) (mapComplaint c) :=
  ⟨corr_gold_culpable h.culpable, corr_gold_enterprise h.enterprise,
   corr_gold_commerce h.interstateCommerce, corr_gold_distinct h.distinct,
   corr_gold_associated h.associated, corr_gold_conducts h.conducts,
   basis_toGoldenPattern h.basis⟩

end Proving.USC.T18.CoreBridge
