




























import Proving.USC.T18.Trafficking.Elements.Statute
import Proving.USC.T18.Trafficking.Deontic.Statute
import Proving.USC.T18.Trafficking.Scienter.Statute
import Proving.USC.T18.Trafficking.Structure.Statute
import Proving.USC.T18.Trafficking.Ontology.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Trafficking.Bridge

open Proving.USC.Common
open Proving.USC.T18.Trafficking










axiom corr_d1581_addressee {p v : Person} {c : ComplaintText} :
    Elements.HoldsOrReturnsToPeonage p v c → Deontic.AddresseeInClass1581 p c
axiom corr_d1581_act {p v : Person} {c : ComplaintText} :
    Elements.HoldsOrReturnsToPeonage p v c → Elements.ConditionOfPeonage v c → Deontic.RegulatedActOccurred1581 p c


theorem s1581_elements_implies_deontic {p v : Person} {c : ComplaintText}
    (h : Elements.Section1581 p v c) : Deontic.ProhibitionViolated1581 p c :=
  ⟨⟨corr_d1581_addressee h.holds⟩, corr_d1581_act h.holds h.condition⟩






axiom corr_d1589_addressee {p v : Person} {c : ComplaintText} :
    Elements.ObtainedLaborOrServices p v c → Deontic.AddresseeInClass1589 p c
axiom corr_d1589_condition {p v : Person} {c : ComplaintText} :
    Elements.ForcedLaborMeans p v c → Deontic.ConditionMet1589 p c
axiom corr_d1589_act {p v : Person} {c : ComplaintText} :
    Elements.ObtainedLaborOrServices p v c → Deontic.RegulatedActOccurred1589 p c


theorem s1589a_elements_implies_deontic {p v : Person} {c : ComplaintText}
    (h : Elements.Section1589a p v c) : Deontic.ProhibitionViolated1589 p c :=
  ⟨⟨corr_d1589_addressee h.obtained, corr_d1589_condition h.means⟩, corr_d1589_act h.obtained⟩



axiom corr_d1590_addressee {p v : Person} {a : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.RecruitsHarborsTransports p v a c → Deontic.AddresseeInClass1590 p c
axiom corr_d1590_condition {p v : Person} {c : ComplaintText} :
    Elements.ForChapter77Violation v c → Deontic.ConditionMet1590 p c
axiom corr_d1590_act {p v : Person} {a : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.RecruitsHarborsTransports p v a c → Deontic.RegulatedActOccurred1590 p c


theorem s1590_elements_implies_deontic {p v : Person} {a : Elements.TraffickingAct} {c : ComplaintText}
    (h : Elements.Section1590 p v a c) : Deontic.ProhibitionViolated1590 p c :=
  ⟨⟨corr_d1590_addressee h.traffics, corr_d1590_condition h.forViolation⟩, corr_d1590_act h.traffics⟩





axiom corr_d1591_addressee {p v : Person} {a : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.SexTraffickingAct p v a c → Deontic.AddresseeInClass1591 p c
axiom corr_d1591_condition {p : Person} {e : Entity} {c : ComplaintText} :
    EngagedInInterstateCommerce e c → Deontic.ConditionMet1591 p c
axiom corr_d1591_act {p v : Person} {a : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.SexTraffickingAct p v a c → Deontic.RegulatedActOccurred1591 p c


theorem s1591a1_elements_implies_deontic
    {p v : Person} {e : Entity} {a : Elements.TraffickingAct} {c : ComplaintText}
    (h : Elements.Section1591a1 p v e a c) : Deontic.ProhibitionViolated1591 p c :=
  ⟨⟨corr_d1591_addressee h.act, corr_d1591_condition h.commerce⟩, corr_d1591_act h.act⟩










axiom corr_s1581 {p v : Person} {c : ComplaintText} :
    ActedWithScienter p c → Elements.HoldsOrReturnsToPeonage p v c → Scienter.Scienter1581 p c
axiom corr_s1589 {p c} : ActedWithScienter p c → Scienter.Scienter1589a p c
axiom corr_s1590 {p c} : ActedWithScienter p c → Scienter.Scienter1590 p c
axiom corr_s1591 {p c} : ActedWithScienter p c → Scienter.Scienter1591 p c


theorem s1581_elements_implies_scienter {p v : Person} {c : ComplaintText}
    (h : Elements.Section1581 p v c) : Scienter.Scienter1581 p c :=
  corr_s1581 h.scienter h.holds


theorem s1589a_elements_implies_scienter {p v : Person} {c : ComplaintText}
    (h : Elements.Section1589a p v c) : Scienter.Section1589Culpable p c :=
  Or.inl (corr_s1589 h.scienter)


theorem s1590_elements_implies_scienter {p v : Person} {a : Elements.TraffickingAct} {c : ComplaintText}
    (h : Elements.Section1590 p v a c) : Scienter.Scienter1590 p c :=
  corr_s1590 h.scienter


theorem s1591a1_elements_implies_scienter
    {p v : Person} {e : Entity} {a : Elements.TraffickingAct} {c : ComplaintText}
    (h : Elements.Section1591a1 p v e a c) : Scienter.Scienter1591 p c :=
  corr_s1591 h.scienter









axiom corr_x1581 {p v : Person} {c : ComplaintText} :
    Elements.Section1581 p v c → Structure.Coherent1581 c
axiom corr_x1589 {p v : Person} {e : Entity} {c : ComplaintText} :
    Elements.Section1589 p v e c → Structure.Coherent1589 c
axiom corr_x1590 {p v : Person} {a : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.Section1590 p v a c → Structure.Coherent1590 c
axiom corr_x1591 {p v : Person} {e : Entity} {a : Elements.TraffickingAct} {c : ComplaintText} :
    Elements.Section1591 p v e a c → Structure.Coherent1591 c


theorem s1581_elements_implies_structure {p v : Person} {c : ComplaintText}
    (h : Elements.Section1581 p v c) : Structure.Coherent1581 c := corr_x1581 h

theorem s1589_elements_implies_structure {p v : Person} {e : Entity} {c : ComplaintText}
    (h : Elements.Section1589 p v e c) : Structure.Coherent1589 c := corr_x1589 h

theorem s1590_elements_implies_structure {p v : Person} {a : Elements.TraffickingAct} {c : ComplaintText}
    (h : Elements.Section1590 p v a c) : Structure.Coherent1590 c := corr_x1590 h

theorem s1591_elements_implies_structure
    {p v : Person} {e : Entity} {a : Elements.TraffickingAct} {c : ComplaintText}
    (h : Elements.Section1591 p v e a c) : Structure.Coherent1591 c := corr_x1591 h












axiom corr_o_seriousHarm {p v : Person} {c : ComplaintText} (h : Ontology.SeriousHarm) :
    Elements.MeansSeriousHarm p v c → Ontology.IsSeriousHarm h c
axiom corr_o_abuse {p v : Person} {c : ComplaintText} (a : Ontology.AbuseOfLegalProcess) :
    Elements.MeansAbuseOfLegalProcess p v c → Ontology.IsAbuseOfLegalProcess a c



theorem s1589_seriousHarm_elements_implies_ontology
    {p v : Person} {c : ComplaintText} (h : Ontology.SeriousHarm)
    (hm : Elements.MeansSeriousHarm p v c) : Ontology.IsSeriousHarm h c :=
  corr_o_seriousHarm h hm


theorem s1589_abuse_elements_implies_ontology
    {p v : Person} {c : ComplaintText} (a : Ontology.AbuseOfLegalProcess)
    (hm : Elements.MeansAbuseOfLegalProcess p v c) : Ontology.IsAbuseOfLegalProcess a c :=
  corr_o_abuse a hm









def s1581_tierA : Prop :=
  (∀ {p v c}, Elements.Section1581 p v c → Deontic.ProhibitionViolated1581 p c)
  ∧ (∀ {p v c}, Elements.Section1581 p v c → Scienter.Scienter1581 p c)
  ∧ (∀ {p v c}, Elements.Section1581 p v c → Structure.Coherent1581 c)

theorem s1581_tierA_discharge : s1581_tierA :=
  ⟨fun h => s1581_elements_implies_deontic h,
   fun h => s1581_elements_implies_scienter h,
   fun h => s1581_elements_implies_structure h⟩


def s1590_tierA : Prop :=
  (∀ {p v a c}, Elements.Section1590 p v a c → Deontic.ProhibitionViolated1590 p c)
  ∧ (∀ {p v a c}, Elements.Section1590 p v a c → Scienter.Scienter1590 p c)
  ∧ (∀ {p v a c}, Elements.Section1590 p v a c → Structure.Coherent1590 c)

theorem s1590_tierA_discharge : s1590_tierA :=
  ⟨fun h => s1590_elements_implies_deontic h,
   fun h => s1590_elements_implies_scienter h,
   fun h => s1590_elements_implies_structure h⟩

end Proving.USC.T18.Trafficking.Bridge
