


































import Proving.USC.T18.Ch31.Elements.Statute
import Proving.USC.T18.Ch31.Deontic.Statute
import Proving.USC.T18.Ch31.Ontology.Statute
import Proving.Rico.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch31.Bridge
open Proving.USC.Common








axiom shipOf   : Elements.Property → Deontic.Shipment
axiom goodsOfP : Elements.Property → Ontology.Goods
axiom goodsOfS : Deontic.Shipment  → Ontology.Goods
axiom planE2D  : Elements.BenefitPlan → Deontic.BenefitPlan
axiom planE2O  : Elements.BenefitPlan → Ontology.BenefitPlan
axiom planD2O  : Deontic.BenefitPlan  → Ontology.BenefitPlan

axiom mapC   : ComplaintText → Proving.Rico.ComplaintText
axiom act659 : Person → Elements.Property → Proving.Rico.Act
axiom act664 : Person → Elements.Property → Elements.BenefitPlan → Proving.Rico.Act






theorem s659_shipEvidence {p prop c}
    (h : Elements.Section659Conduct p prop c) :
    Elements.GoodsMovingAsInterstateShipment prop c :=
  match h with
  | .taking t    => t.shipment
  | .receiving r => r.shipment




axiom corr659_ed_addressee {p prop c} :
    Elements.Section659Conduct p prop c → Deontic.AddresseeInClass659 p c

axiom corr659_ed_condition {prop c} :
    Elements.GoodsMovingAsInterstateShipment prop c →
    Deontic.ConditionMet659 (shipOf prop) c

axiom corr659_ed_act {p prop c} :
    Elements.Section659Conduct p prop c →
    Deontic.RegulatedActOccurred659 p (shipOf prop) c


theorem s659_elements_implies_deontic {p prop c}
    (h : Elements.Section659 p prop c) :
    Deontic.ProhibitionViolated659 p (shipOf prop) c :=
  ⟨⟨corr659_ed_addressee h.conduct, corr659_ed_condition (s659_shipEvidence h.conduct)⟩,
   corr659_ed_act h.conduct⟩



axiom corr659_eo_goods {prop c} :
    Elements.GoodsMovingAsInterstateShipment prop c →
    Ontology.IsGoodsOrChattels (goodsOfP prop) c
axiom corr659_eo_moving {prop c} :
    Elements.GoodsMovingAsInterstateShipment prop c →
    Ontology.IsMovingInInterstateCommerce (goodsOfP prop) c



theorem s659_elements_implies_ontology {p prop c}
    (h : Elements.Section659 p prop c) :
    Ontology.InterstateShipment (goodsOfP prop) c :=
  ⟨corr659_eo_goods (s659_shipEvidence h.conduct),
   corr659_eo_moving (s659_shipEvidence h.conduct)⟩



axiom corr659_do_goods {s c} :
    Deontic.ConditionMet659 s c → Ontology.IsGoodsOrChattels (goodsOfS s) c
axiom corr659_do_moving {s c} :
    Deontic.ConditionMet659 s c → Ontology.IsMovingInInterstateCommerce (goodsOfS s) c





theorem s659_deontic_implies_ontology
    {p : Person} {s : Deontic.Shipment} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated659 p s c) :
    Ontology.InterstateShipment (goodsOfS s) c :=
  ⟨corr659_do_goods h.1.condition, corr659_do_moving h.1.condition⟩






axiom corr659_golden {p prop c} :
    Elements.Section659 p prop c →
    Proving.Rico.IsRacketeeringActivity (act659 p prop) (mapC c)



theorem cand659_implies_golden {p prop c}
    (h : Elements.Section659 p prop c) :
    Proving.Rico.IsRacketeeringActivity (act659 p prop) (mapC c) :=
  corr659_golden h





axiom corr664_ed_addressee {p prop c} :
    Elements.EmbezzlesOrConverts p prop c → Deontic.AddresseeInClass664 p c
axiom corr664_ed_condition {plan c} :
    Elements.IsERISABenefitPlan plan c → Deontic.ConditionMet664 (planE2D plan) c
axiom corr664_ed_act {p prop plan c} :
    Elements.EmbezzlesOrConverts p prop c → Elements.IsPlanAsset prop plan c →
    Deontic.RegulatedActOccurred664 p (planE2D plan) c


theorem s664_elements_implies_deontic {p prop plan c}
    (h : Elements.Section664 p prop plan c) :
    Deontic.ProhibitionViolated664 p (planE2D plan) c :=
  ⟨⟨corr664_ed_addressee h.embezzles, corr664_ed_condition h.erisaPlan⟩,
   corr664_ed_act h.embezzles h.planAsset⟩



axiom corr664_eo_base {plan c} :
    Elements.IsERISABenefitPlan plan c → Ontology.IsEmployeeBenefitPlan (planE2O plan) c
axiom corr664_eo_erisa {plan c} :
    Elements.IsERISABenefitPlan plan c → Ontology.IsErisaTitleISubject (planE2O plan) c



theorem s664_elements_implies_ontology {p prop plan c}
    (h : Elements.Section664 p prop plan c) :
    Ontology.CoveredBenefitPlan (planE2O plan) c :=
  ⟨corr664_eo_base h.erisaPlan, corr664_eo_erisa h.erisaPlan⟩



axiom corr664_do_base {b c} :
    Deontic.ConditionMet664 b c → Ontology.IsEmployeeBenefitPlan (planD2O b) c
axiom corr664_do_erisa {b c} :
    Deontic.ConditionMet664 b c → Ontology.IsErisaTitleISubject (planD2O b) c



theorem s664_deontic_implies_ontology
    {p : Person} {b : Deontic.BenefitPlan} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated664 p b c) :
    Ontology.CoveredBenefitPlan (planD2O b) c :=
  ⟨corr664_do_base h.1.condition, corr664_do_erisa h.1.condition⟩






axiom corr664_golden {p prop plan c} :
    Elements.Section664 p prop plan c →
    Proving.Rico.IsRacketeeringActivity (act664 p prop plan) (mapC c)



theorem cand664_implies_golden {p prop plan c}
    (h : Elements.Section664 p prop plan c) :
    Proving.Rico.IsRacketeeringActivity (act664 p prop plan) (mapC c) :=
  corr664_golden h






def s659_tierA_pairwise : Prop :=
  (∀ {p prop c}, Elements.Section659 p prop c →
      Deontic.ProhibitionViolated659 p (shipOf prop) c)
  ∧ (∀ {p prop c}, Elements.Section659 p prop c →
      Ontology.InterstateShipment (goodsOfP prop) c)
  ∧ (∀ {p : Person} {s : Deontic.Shipment} {c : ComplaintText},
      Deontic.ProhibitionViolated659 p s c →
      Ontology.InterstateShipment (goodsOfS s) c)

theorem s659_tierA : s659_tierA_pairwise :=
  ⟨fun h => s659_elements_implies_deontic h,
   fun h => s659_elements_implies_ontology h,
   fun h => s659_deontic_implies_ontology h⟩

def s664_tierA_pairwise : Prop :=
  (∀ {p prop plan c}, Elements.Section664 p prop plan c →
      Deontic.ProhibitionViolated664 p (planE2D plan) c)
  ∧ (∀ {p prop plan c}, Elements.Section664 p prop plan c →
      Ontology.CoveredBenefitPlan (planE2O plan) c)
  ∧ (∀ {p : Person} {b : Deontic.BenefitPlan} {c : ComplaintText},
      Deontic.ProhibitionViolated664 p b c →
      Ontology.CoveredBenefitPlan (planD2O b) c)

theorem s664_tierA : s664_tierA_pairwise :=
  ⟨fun h => s664_elements_implies_deontic h,
   fun h => s664_elements_implies_ontology h,
   fun h => s664_deontic_implies_ontology h⟩

end Proving.USC.T18.Ch31.Bridge
