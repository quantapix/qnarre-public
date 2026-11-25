




























import Proving.USC.T18.RacketeeringActs.Elements.Theorems
import Proving.USC.T18.RacketeeringActs.Ontology.Theorems
import Proving.USC.T18.RacketeeringActs.Deontic.Theorems

namespace Proving.USC.T18.RacketeeringActs.Bridge

open Proving.USC.Common








axiom mapActToOffence    : Elements.Act      → Ontology.Offence
axiom mapTxn             : Elements.Txn      → Ontology.Transaction
axiom mapProperty        : Elements.Property → Ontology.Property

axiom suaOffenceOf       : Elements.Property → Ontology.Offence







axiom corr_1951_robbery {a c} :
    Elements.IsRobbery a c → Ontology.IsRobbery (mapActToOffence a) c
axiom corr_1951_extortion {a c} :
    Elements.IsExtortion a c → Ontology.IsExtortion (mapActToOffence a) c
axiom corr_1951_commerce {a c} :
    Elements.AffectsCommerce a c → Ontology.AffectsCommerce (mapActToOffence a) c



theorem s1951_elements_implies_ontology {a c}
    (h : Elements.Section1951 a c) :
    Ontology.Section1951Membership (mapActToOffence a) c :=
  ⟨ (match h.means with
      | Elements.HobbsMeans.robbery hr   => Ontology.HobbsActMeans.byRobbery (corr_1951_robbery hr)
      | Elements.HobbsMeans.extortion he => Ontology.HobbsActMeans.byExtortion (corr_1951_extortion he)),
    corr_1951_commerce h.commerce ⟩












axiom corr_1952_unlawful {a c} :
    Elements.PromotesUnlawfulActivity a c → Ontology.IsUnlawfulActivity (mapActToOffence a) c



theorem s1952_elements_implies_ontology {a c}
    (h : Elements.Section1952 a c) :
    Ontology.Section1952Membership (mapActToOffence a) c :=
  ⟨ corr_1952_unlawful h.promotes ⟩













axiom corr_1956_transaction {t c} :
    Elements.ConductsFinancialTransaction t c → Ontology.IsFinancialTransaction (mapTxn t) c
axiom corr_1956_proceeds {pr c} :
    Elements.InvolvesProceeds pr c → Ontology.IsProceeds (mapProperty pr) c
axiom corr_1956_sua {pr c} :
    Elements.DerivedFromSpecifiedUnlawfulActivity pr c →
    Ontology.IsSpecifiedUnlawfulActivity (suaOffenceOf pr) c






theorem s1956_elements_implies_ontology {p t pr c}
    (h : Elements.Section1956 p t pr c) :
    Ontology.Section1956Membership (mapTxn t) (mapProperty pr) (suaOffenceOf pr) c :=
  ⟨ corr_1956_transaction h.transaction,
    corr_1956_proceeds h.proceeds,
    corr_1956_sua h.sua ⟩














axiom corr_1957_transaction {t c} :
    Elements.EngagesMonetaryTransaction t c → Ontology.IsMonetaryTransaction (mapTxn t) c
axiom corr_1957_cdp {pr c} :
    Elements.IsCriminallyDerivedProperty pr c → Ontology.IsCriminallyDerivedProperty (mapProperty pr) c
axiom corr_1957_sua {pr c} :
    Elements.CdpDerivedFromSpecifiedUnlawfulActivity pr c →
    Ontology.IsSpecifiedUnlawfulActivity (suaOffenceOf pr) c





theorem s1957_elements_implies_ontology {p t pr c}
    (h : Elements.Section1957 p t pr c) :
    Ontology.Section1957Membership (mapTxn t) (mapProperty pr) (suaOffenceOf pr) c :=
  ⟨ corr_1957_transaction h.transaction,
    corr_1957_cdp h.cdp,
    corr_1957_sua h.sua ⟩








axiom actorOf : Elements.Act → Person
axiom corr_1951_d_commerce {a c} :
    Elements.AffectsCommerce a c → Deontic.ObstructedOrAffectedCommerce (actorOf a) c
axiom corr_1951_d_robbery {a c} :
    Elements.IsRobbery a c → Deontic.ByRobbery (actorOf a) c
axiom corr_1951_d_extortion {a c} :
    Elements.IsExtortion a c → Deontic.ByExtortion (actorOf a) c



theorem s1951_elements_implies_deontic {a c}
    (h : Elements.Section1951 a c) :
    Deontic.HobbsActDone (actorOf a) c :=
  ⟨ corr_1951_d_commerce h.commerce,
    (match h.means with
      | Elements.HobbsMeans.robbery hr   => Deontic.HobbsMeansSatisfied.robbery (corr_1951_d_robbery hr)
      | Elements.HobbsMeans.extortion he => Deontic.HobbsMeansSatisfied.extortion (corr_1951_d_extortion he)) ⟩

end Proving.USC.T18.RacketeeringActs.Bridge
