

















































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Core.Elements.Statute
import Proving.USC.T18.Core.Ontology.Predicates
import Proving.USC.T18.Core.Deontic.Predicates
import Proving.USC.T18.Enf.Elements.Statute
import Proving.USC.T18.Enf.Ontology.Predicates
import Proving.USC.T18.CoreStandingBridge
import Proving.USC.T18.Enf.Bridge
import Proving.Rico.Statute

namespace Proving.USC.Common.CrossWaveT18core

open Proving.USC.Common


























axiom mapViol : Proving.USC.T18.Core.Ontology.Section1962Violation → Person






axiom bridge_enfElemViolation_iff_common
    {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Enf.Elements.ViolationOfSection1962 p c ↔ Section1962Violation p c


axiom bridge_enfOntoViolation_to_common
    {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Enf.Ontology.IsSection1962Violation p c → Section1962Violation p c





axiom bridge_coreElem1962c_to_common
    {p : Person} {e : Entity} {acts : List Proving.USC.T18.Core.Elements.Act}
    {d : Proving.USC.T18.Core.Elements.UnlawfulDebt} {c : ComplaintText} :
    Proving.USC.T18.Core.Elements.Section1962c p e acts d c → Section1962Violation p c



axiom bridge_coreOntoViolation_to_common
    {v : Proving.USC.T18.Core.Ontology.Section1962Violation} {c : ComplaintText} :
    Proving.USC.T18.Core.Ontology.IsSection1962Violation v c → Section1962Violation (mapViol v) c

theorem collapse_violation_enfElem_iff
    {p : Person} {c : ComplaintText} :
    Proving.USC.T18.Enf.Elements.ViolationOfSection1962 p c ↔ Section1962Violation p c :=
  bridge_enfElemViolation_iff_common

theorem collapse_violation_enfOnto_clean
    {p : Person} {c : ComplaintText}
    (h : Proving.USC.T18.Enf.Ontology.IsSection1962Violation p c) : Section1962Violation p c :=
  bridge_enfOntoViolation_to_common h

theorem collapse_violation_core1962c_clean
    {p : Person} {e : Entity} {acts : List Proving.USC.T18.Core.Elements.Act}
    {d : Proving.USC.T18.Core.Elements.UnlawfulDebt} {c : ComplaintText}
    (h : Proving.USC.T18.Core.Elements.Section1962c p e acts d c) : Section1962Violation p c :=
  bridge_coreElem1962c_to_common h

theorem collapse_violation_coreOnto_mapped
    {v : Proving.USC.T18.Core.Ontology.Section1962Violation} {c : ComplaintText}
    (h : Proving.USC.T18.Core.Ontology.IsSection1962Violation v c) :
    Section1962Violation (mapViol v) c :=
  bridge_coreOntoViolation_to_common h











axiom bridge_coreElemEnterprise_iff_common
    {e : Entity} {c : ComplaintText} :
    Proving.USC.T18.Core.Elements.IsEnterprise e c ↔ IsEnterprise e c
axiom bridge_coreOntoEnterprise_iff_common
    {e : Entity} {c : ComplaintText} :
    Proving.USC.T18.Core.Ontology.IsEnterprise e c ↔ IsEnterprise e c
axiom bridge_enfOntoEnterprise_to_common
    {e : Entity} {c : ComplaintText} :
    Proving.USC.T18.Enf.Ontology.IsEnterprise e c → IsEnterprise e c

theorem collapse_enterprise_coreElem_iff
    {e : Entity} {c : ComplaintText} :
    Proving.USC.T18.Core.Elements.IsEnterprise e c ↔ IsEnterprise e c :=
  bridge_coreElemEnterprise_iff_common
theorem collapse_enterprise_coreOnto_iff
    {e : Entity} {c : ComplaintText} :
    Proving.USC.T18.Core.Ontology.IsEnterprise e c ↔ IsEnterprise e c :=
  bridge_coreOntoEnterprise_iff_common
theorem collapse_enterprise_enfOnto_clean
    {e : Entity} {c : ComplaintText}
    (h : Proving.USC.T18.Enf.Ontology.IsEnterprise e c) : IsEnterprise e c :=
  bridge_enfOntoEnterprise_to_common h











axiom bridge_conditionMet1962a_to_common
    {e : Entity} {c : ComplaintText} :
    Proving.USC.T18.Core.Deontic.ConditionMet1962a e c → EngagedInInterstateCommerce e c
axiom bridge_conditionMet1962b_to_common
    {e : Entity} {c : ComplaintText} :
    Proving.USC.T18.Core.Deontic.ConditionMet1962b e c → EngagedInInterstateCommerce e c
axiom bridge_conditionMet1962c_to_common
    {e : Entity} {c : ComplaintText} :
    Proving.USC.T18.Core.Deontic.ConditionMet1962c e c → EngagedInInterstateCommerce e c

theorem collapse_commerce_1962a_clean
    {e : Entity} {c : ComplaintText}
    (h : Proving.USC.T18.Core.Deontic.ConditionMet1962a e c) : EngagedInInterstateCommerce e c :=
  bridge_conditionMet1962a_to_common h
theorem collapse_commerce_1962b_clean
    {e : Entity} {c : ComplaintText}
    (h : Proving.USC.T18.Core.Deontic.ConditionMet1962b e c) : EngagedInInterstateCommerce e c :=
  bridge_conditionMet1962b_to_common h
theorem collapse_commerce_1962c_clean
    {e : Entity} {c : ComplaintText}
    (h : Proving.USC.T18.Core.Deontic.ConditionMet1962c e c) : EngagedInInterstateCommerce e c :=
  bridge_conditionMet1962c_to_common h

























axiom align_mapPerson (p : Person) :
    Proving.USC.T18.CoreStandingBridge.mapPerson p = Proving.USC.T18.Enf.Bridge.mapPerson p

axiom align_mapComplaint (c : ComplaintText) :
    Proving.USC.T18.CoreStandingBridge.mapComplaint c = Proving.USC.T18.Enf.Bridge.mapComplaint c



theorem core_violation_under_enf_maps
    {defendant : Person} {e : Entity}
    {acts : List Proving.USC.T18.Core.Elements.Act}
    {dbt : Proving.USC.T18.Core.Elements.UnlawfulDebt} {c : ComplaintText}
    (violation : Proving.USC.T18.Core.Elements.Section1962c defendant e acts dbt c) :
    Proving.Rico.Section1962c
      (Proving.USC.T18.Enf.Bridge.mapPerson defendant)
      (Proving.USC.T18.CoreStandingBridge.mapEntity e)
      (Proving.USC.T18.CoreStandingBridge.mapActs acts)
      (Proving.USC.T18.Enf.Bridge.mapComplaint c) := by
  have hgold := Proving.USC.T18.CoreStandingBridge.core_elements_implies_golden_1962c violation
  rw [align_mapPerson, align_mapComplaint] at hgold
  exact hgold













theorem enf_standing_golden_FULL_via_common
    {pl defendant : Person} {e : Entity}
    {acts : List Proving.USC.T18.Core.Elements.Act}
    {dbt : Proving.USC.T18.Core.Elements.UnlawfulDebt} {c : ComplaintText}
    (standing : Proving.USC.T18.Enf.Elements.Section1964c pl c)
    (violation : Proving.USC.T18.Core.Elements.Section1962c defendant e acts dbt c) :
    Proving.Rico.ValidCivilRicoComplaint1962c
      (Proving.USC.T18.Enf.Bridge.mapPerson pl)
      (Proving.USC.T18.Enf.Bridge.mapPerson defendant)
      (Proving.USC.T18.CoreStandingBridge.mapEntity e)
      (Proving.USC.T18.CoreStandingBridge.mapActs acts)
      (Proving.USC.T18.Enf.Bridge.mapComplaint c) :=
  Proving.USC.T18.Enf.Bridge.s1964c_standing_implies_golden_modulo_gaps
    standing
    (core_violation_under_enf_maps violation)

end Proving.USC.Common.CrossWaveT18core
