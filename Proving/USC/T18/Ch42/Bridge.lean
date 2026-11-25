
























import Proving.USC.T18.Ch42.Elements.Statute
import Proving.USC.T18.Ch42.Deontic.Statute
import Proving.USC.T18.Ch42.Ontology.Statute
import Proving.USC.T18.Ch42.Scienter.Statute
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Ch42.Bridge
open Proving.USC.T18.Ch42
open Proving.USC.Common







axiom corr_addr892_making {p : Person} {cr : Elements.Credit} {c : ComplaintText} :
    Elements.MakesExtensionOfCredit p cr c → Deontic.AddresseeInClass892 p c

axiom corr_act892_making {p : Person} {cr : Elements.Credit} {c : ComplaintText} :
    Elements.MakesExtensionOfCredit p cr c → Deontic.RegulatedActOccurred892 p c


axiom corr_addr892_consp {p : Person} {ag : Agreement} {c : ComplaintText} :
    AgreementAmongTwoOrMore ag c → Deontic.AddresseeInClass892 p c

axiom corr_act892_consp {p : Person} {ag : Agreement} {c : ComplaintText} :
    AgreementAmongTwoOrMore ag c → Deontic.RegulatedActOccurred892 p c


axiom corr_cond892 {cr : Elements.Credit} {c : ComplaintText} :
    Elements.ExtensionIsExtortionate cr c → Deontic.ConditionMet892 c



theorem s892_elements_implies_deontic {p : Person} {ag : Agreement} {cr : Elements.Credit}
    {c : ComplaintText} (h : Elements.Section892 p ag cr c) :
    Deontic.ProhibitionViolated892 p c :=
  match h with
  | .making hm =>
      ⟨⟨corr_addr892_making hm.makes, corr_cond892 hm.extortionate⟩, corr_act892_making hm.makes⟩
  | .conspiracy hc =>
      ⟨⟨corr_addr892_consp hc.agreement, corr_cond892 hc.object⟩, corr_act892_consp hc.agreement⟩




axiom mapCredit : Elements.Credit → Ontology.ExtensionOfCredit

axiom debtorWitness : Person → Person


axiom corr_o892_extension {p : Person} {cr : Elements.Credit} {c : ComplaintText} :
    Elements.MakesExtensionOfCredit p cr c → Ontology.IsExtensionOfCredit (mapCredit cr) c

axiom corr_o892_creditor {p : Person} {cr : Elements.Credit} {c : ComplaintText} :
    Elements.MakesExtensionOfCredit p cr c → Ontology.IsCreditor p c

axiom corr_o892_debtor {p : Person} {cr : Elements.Credit} {c : ComplaintText} :
    Elements.MakesExtensionOfCredit p cr c → Ontology.IsDebtor (debtorWitness p) c

axiom corr_o892_extortion {cr : Elements.Credit} {c : ComplaintText} :
    Elements.ExtensionIsExtortionate cr c → Ontology.IsExtortionateExtensionOfCredit (mapCredit cr) c




theorem s892_elements_implies_ontology {p : Person} {cr : Elements.Credit} {c : ComplaintText}
    (h : Elements.Section892Making p cr c) :
    Ontology.ExtortionateExtensionInhabited (mapCredit cr) p (debtorWitness p) c :=
  ⟨corr_o892_extension h.makes, corr_o892_creditor h.makes,
   corr_o892_debtor h.makes, corr_o892_extortion h.extortionate⟩







axiom corr_addr893 {p : Person} {c : ComplaintText} :
    Elements.AdvancesMoneyOrProperty p c → Deontic.AddresseeInClass893 p c

axiom corr_act893 {p : Person} {c : ComplaintText} :
    Elements.AdvancesMoneyOrProperty p c → ActedWithScienter p c →
    Deontic.RegulatedActOccurred893 p c


axiom corr_cond893 {p : Person} {c : ComplaintText} :
    Elements.ReasonableGroundsToBelieveExtortionatePurpose p c → Deontic.ConditionMet893 p c



theorem s893_elements_implies_deontic {p : Person} {c : ComplaintText}
    (h : Elements.Section893 p c) : Deontic.ProhibitionViolated893 p c :=
  ⟨⟨corr_addr893 h.advances, corr_cond893 h.reasonableGrounds⟩,
   corr_act893 h.advances h.scienter⟩





axiom corr_scienter893 {p : Person} {c : ComplaintText} :
    Scienter.Scienter893Advance p c → ActedWithScienter p c




theorem s893_scienter_implies_elements_scienter {p : Person} {c : ComplaintText}
    (h : Scienter.Scienter893Advance p c) : ActedWithScienter p c :=
  corr_scienter893 h







axiom corr_addr894 {p : Person} {c : ComplaintText} :
    Elements.ParticipatesInUseOfMeans p c → Deontic.AddresseeInClass894 p c

axiom corr_act894 {p : Person} {c : ComplaintText} :
    Elements.ParticipatesInUseOfMeans p c → Deontic.RegulatedActOccurred894 p c


axiom corr_addr894_consp {p : Person} {ag : Agreement} {c : ComplaintText} :
    AgreementAmongTwoOrMore ag c → Deontic.AddresseeInClass894 p c
axiom corr_act894_consp {p : Person} {ag : Agreement} {c : ComplaintText} :
    AgreementAmongTwoOrMore ag c → Deontic.RegulatedActOccurred894 p c


axiom corr_cond894 {c : ComplaintText} :
    Elements.MeansAreExtortionate c → Deontic.ConditionMet894 c




theorem s894_elements_implies_deontic {p : Person} {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section894 p ag c) : Deontic.ProhibitionViolated894 p c :=
  match h with
  | .collect hc =>
      ⟨⟨corr_addr894 hc.participates, corr_cond894 hc.meansExtortionate⟩,
       corr_act894 hc.participates⟩
  | .punish hp =>
      ⟨⟨corr_addr894 hp.participates, corr_cond894 hp.meansExtortionate⟩,
       corr_act894 hp.participates⟩
  | .conspiracy hk =>
      ⟨⟨corr_addr894_consp hk.agreement, corr_cond894 hk.meansExtortionate⟩,
       corr_act894_consp hk.agreement⟩




axiom extWitness894 : ComplaintText → Ontology.ExtensionOfCredit

axiom meansWitness894 : ComplaintText → Ontology.Means


axiom corr_o894_extension {p : Person} {c : ComplaintText} :
    Elements.ToCollectExtensionOfCredit p c → Ontology.IsExtensionOfCredit (extWitness894 c) c

axiom corr_o894_collection {p : Person} {c : ComplaintText} :
    Elements.ToCollectExtensionOfCredit p c → Ontology.IsCollectionOfExtension (extWitness894 c) c

axiom corr_o894_means {c : ComplaintText} :
    Elements.MeansAreExtortionate c → Ontology.IsExtortionateMeans (meansWitness894 c) c




theorem s894_collect_implies_ontology {p : Person} {c : ComplaintText}
    (h : Elements.Section894Collect p c) :
    Ontology.CollectionByExtortionateMeansInhabited (extWitness894 c) (meansWitness894 c) c :=
  ⟨corr_o894_extension h.purpose, corr_o894_collection h.purpose,
   corr_o894_means h.meansExtortionate⟩

end Proving.USC.T18.Ch42.Bridge
