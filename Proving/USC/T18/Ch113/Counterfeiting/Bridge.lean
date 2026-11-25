












































import Proving.USC.Common.Types
import Proving.USC.T18.Ch113.Counterfeiting.Elements.Statute
import Proving.USC.T18.Ch113.Counterfeiting.Deontic.Statute
import Proving.USC.T18.Ch113.Counterfeiting.Ontology.Statute
import Proving.USC.T18.Ch113.Counterfeiting.Procedure.Statute
import Proving.USC.T18.Ch113.Counterfeiting.Structure.Statute

namespace Proving.USC.T18.Ch113.Counterfeiting.Bridge

open Proving.USC.Common
open Proving.USC.T18.Ch113.Counterfeiting
open Proving.USC.T18.Ch113.Counterfeiting



namespace S2318


axiom mapArt : Elements.Label → Deontic.CounterfeitArticle

axiom mapOntL : Elements.Label → Ontology.Label



axiom corr_addr {p : Person} {l : Elements.Label} {w : Elements.Work} {c : ComplaintText} :
    Elements.Section2318Offense p l w c → Deontic.AddresseeInClass2318 p c

axiom corr_cond {p : Person} {l : Elements.Label} {w : Elements.Work} {c : ComplaintText} :
    Elements.Section2318Offense p l w c → Deontic.ConditionMet2318 (mapArt l) c

axiom corr_act {p : Person} {l : Elements.Label} {w : Elements.Work} {c : ComplaintText} :
    Elements.Section2318Offense p l w c → Deontic.RegulatedActOccurred2318 p (mapArt l) c


axiom corr_ontLeaf {p : Person} {l : Elements.Label} {w : Elements.Work} {c : ComplaintText} :
    Elements.Section2318Offense p l w c → Ontology.LabelAppearsGenuineButIsNot (mapOntL l) c



axiom corr_struct {p : Person} {l : Elements.Label} {w : Elements.Work} {c : ComplaintText} :
    Elements.Section2318Offense p l w c → Structure.Coherent2318 c


axiom corr_permAddr {p d : Person} {l : Elements.Label} {w : Elements.Work} {c : ComplaintText} :
    Elements.Section2318CivilClaim p d l w c → Deontic.AddresseeInClass2318e p c

axiom corr_permCond {p d : Person} {l : Elements.Label} {w : Elements.Work} {c : ComplaintText} :
    Elements.Section2318CivilClaim p d l w c → Deontic.ConditionMet2318e c

axiom corr_procAccrued {p d : Person} {l : Elements.Label} {w : Elements.Work} {c : ComplaintText} :
    Elements.Section2318CivilClaim p d l w c → Procedure.ClaimAccrued2318 p c

axiom corr_procCommenced {p d : Person} {l : Elements.Label} {w : Elements.Work} {c : ComplaintText} :
    Elements.Section2318CivilClaim p d l w c → Procedure.CivilActionCommenced2318 p c

axiom corr_procWindow {p d : Person} {l : Elements.Label} {w : Elements.Work} {c : ComplaintText} :
    Elements.Section2318CivilClaim p d l w c → Procedure.WithinThreeYearWindow2318 p c


theorem s2318_elements_implies_deontic {p l w c} (h : Elements.Section2318Offense p l w c) :
    Deontic.Prohibition2318Violated p (mapArt l) c :=
  ⟨⟨corr_addr h, corr_cond h⟩, corr_act h⟩


theorem s2318_elements_implies_deontic_permission {p d l w c}
    (h : Elements.Section2318CivilClaim p d l w c) :
    Deontic.Permission2318eGranted p c :=
  ⟨corr_permAddr h, corr_permCond h⟩


theorem s2318_elements_implies_ontology {p l w c} (h : Elements.Section2318Offense p l w c) :
    Ontology.CounterfeitLabel (mapOntL l) c :=
  ⟨corr_ontLeaf h⟩



theorem s2318_elements_implies_procedure {p d l w c}
    (h : Elements.Section2318CivilClaim p d l w c) :
    Procedure.TimelyCivilAction2318 p c :=
  ⟨corr_procAccrued h, corr_procCommenced h, corr_procWindow h⟩


theorem s2318_elements_implies_structure {p l w c} (h : Elements.Section2318Offense p l w c) :
    Structure.Coherent2318 c :=
  corr_struct h

end S2318



namespace S2319

axiom mapArt : Elements.Work → Deontic.CounterfeitArticle


axiom corr_addr {p : Person} {w : Elements.Work} {c : ComplaintText} :
    Elements.Section2319Offense p w c → Deontic.AddresseeInClass2319 p c


axiom corr_cond {p : Person} {w : Elements.Work} {c : ComplaintText} :
    Elements.Section2319Offense p w c → Deontic.ConditionMet2319 (mapArt w) c

axiom corr_act {p : Person} {w : Elements.Work} {c : ComplaintText} :
    Elements.Section2319Offense p w c → Deontic.RegulatedActOccurred2319 p (mapArt w) c


axiom corr_struct {p : Person} {w : Elements.Work} {c : ComplaintText} :
    Elements.Section2319Offense p w c → Structure.Coherent2319 c


theorem s2319_elements_implies_deontic {p w c} (h : Elements.Section2319Offense p w c) :
    Deontic.Prohibition2319Violated p (mapArt w) c :=
  ⟨⟨corr_addr h, corr_cond h⟩, corr_act h⟩


theorem s2319_elements_implies_structure {p w c} (h : Elements.Section2319Offense p w c) :
    Structure.Coherent2319 c :=
  corr_struct h

end S2319



namespace S2320

axiom mapArt : Elements.Goods → Deontic.CounterfeitArticle
axiom mapOntM : Elements.Mark → Ontology.Mark


axiom corr_addr {p : Person} {m : Elements.Mark} {g : Elements.Goods} {c : ComplaintText} :
    Elements.Section2320Offense p m g c → Deontic.AddresseeInClass2320 p c

axiom corr_cond {p : Person} {m : Elements.Mark} {g : Elements.Goods} {c : ComplaintText} :
    Elements.Section2320Offense p m g c → Deontic.ConditionMet2320 (mapArt g) c

axiom corr_act {p : Person} {m : Elements.Mark} {g : Elements.Goods} {c : ComplaintText} :
    Elements.Section2320Offense p m g c → Deontic.RegulatedActOccurred2320 p (mapArt g) c


axiom corr_ontMark {p : Person} {m : Elements.Mark} {g : Elements.Goods} {c : ComplaintText} :
    Elements.Section2320Offense p m g c → Ontology.IsSpuriousMarkAllConditions (mapOntM m) c


axiom corr_struct {p : Person} {m : Elements.Mark} {g : Elements.Goods} {c : ComplaintText} :
    Elements.Section2320Offense p m g c → Structure.Coherent2320 c


theorem s2320_elements_implies_deontic {p m g c} (h : Elements.Section2320Offense p m g c) :
    Deontic.Prohibition2320Violated p (mapArt g) c :=
  ⟨⟨corr_addr h, corr_cond h⟩, corr_act h⟩


theorem s2320_elements_implies_ontology {p m g c} (h : Elements.Section2320Offense p m g c) :
    Ontology.CounterfeitMark (mapOntM m) c :=
  .spuriousMark (corr_ontMark h)


theorem s2320_elements_implies_structure {p m g c} (h : Elements.Section2320Offense p m g c) :
    Structure.Coherent2320 c :=
  corr_struct h

end S2320

end Proving.USC.T18.Ch113.Counterfeiting.Bridge
