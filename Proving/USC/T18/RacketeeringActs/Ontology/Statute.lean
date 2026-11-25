














import Proving.USC.T18.RacketeeringActs.Ontology.Predicates

namespace Proving.USC.T18.RacketeeringActs.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def edge_racketeering_dependsOn_s1951 : DefEdge :=
  { defined := "racketeering activity", dependsOn := "§ 1951 interference with commerce",
    citeDefine := "18 USC § 1961(1)(B)" }


def edge_racketeering_dependsOn_s1952 : DefEdge :=
  { defined := "racketeering activity", dependsOn := "§ 1952 travel-act racketeering",
    citeDefine := "18 USC § 1961(1)(B)" }


def edge_racketeering_dependsOn_s1956 : DefEdge :=
  { defined := "racketeering activity", dependsOn := "§ 1956 laundering of monetary instruments",
    citeDefine := "18 USC § 1961(1)(B)" }


def edge_racketeering_dependsOn_s1957 : DefEdge :=
  { defined := "racketeering activity", dependsOn := "§ 1957 monetary transactions in derived property",
    citeDefine := "18 USC § 1961(1)(B)" }


def edge_s1951_dependsOn_robbery : DefEdge :=
  { defined := "§ 1951 interference with commerce", dependsOn := "robbery",
    citeDefine := "18 USC § 1951(b)(1)" }


def edge_s1951_dependsOn_extortion : DefEdge :=
  { defined := "§ 1951 interference with commerce", dependsOn := "extortion",
    citeDefine := "18 USC § 1951(b)(2)" }


def edge_s1951_dependsOn_commerce : DefEdge :=
  { defined := "§ 1951 interference with commerce", dependsOn := "commerce",
    citeDefine := "18 USC § 1951(b)(3)" }


def edge_s1952_dependsOn_unlawfulActivity : DefEdge :=
  { defined := "§ 1952 travel-act racketeering", dependsOn := "unlawful activity",
    citeDefine := "18 USC § 1952(b)" }


def edge_unlawfulActivity_dependsOn_s1956s1957 : DefEdge :=
  { defined := "unlawful activity", dependsOn := "§ 1956 / § 1957 laundering acts",
    citeDefine := "18 USC § 1952(b)(i)(3)" }


def edge_s1956_dependsOn_specifiedUnlawfulActivity : DefEdge :=
  { defined := "§ 1956 laundering of monetary instruments", dependsOn := "specified unlawful activity",
    citeDefine := "18 USC § 1956(c)(7)" }



def edge_specifiedUnlawfulActivity_dependsOn_racketeering : DefEdge :=
  { defined := "specified unlawful activity", dependsOn := "racketeering activity (§ 1961(1))",
    citeDefine := "18 USC § 1956(c)(7)(A)" }


def edge_s1956_dependsOn_financialTransaction : DefEdge :=
  { defined := "§ 1956 laundering of monetary instruments", dependsOn := "financial transaction",
    citeDefine := "18 USC § 1956(c)(4)" }



def edge_financialTransaction_dependsOn_monetaryInstrument : DefEdge :=
  { defined := "financial transaction", dependsOn := "monetary instrument",
    citeDefine := "18 USC § 1956(c)(5)" }

def edge_financialTransaction_dependsOn_financialInstitution : DefEdge :=
  { defined := "financial transaction", dependsOn := "financial institution",
    citeDefine := "18 USC § 1956(c)(6)" }



def edge_s1956_dependsOn_proceeds : DefEdge :=
  { defined := "§ 1956 laundering of monetary instruments", dependsOn := "proceeds",
    citeDefine := "18 USC § 1956(c)(9)" }


def edge_s1957_dependsOn_monetaryTransaction : DefEdge :=
  { defined := "§ 1957 monetary transactions in derived property", dependsOn := "monetary transaction",
    citeDefine := "18 USC § 1957(f)(1)" }



def edge_monetaryTransaction_dependsOn_monetaryInstrument : DefEdge :=
  { defined := "monetary transaction", dependsOn := "monetary instrument",
    citeDefine := "18 USC § 1957(f)(1) → § 1956(c)(5)" }


def edge_s1957_dependsOn_criminallyDerivedProperty : DefEdge :=
  { defined := "§ 1957 monetary transactions in derived property", dependsOn := "criminally derived property",
    citeDefine := "18 USC § 1957(f)(2)" }



def edge_criminallyDerivedProperty_dependsOn_proceeds : DefEdge :=
  { defined := "criminally derived property", dependsOn := "proceeds",
    citeDefine := "18 USC § 1957(f)(2) → § 1956(c)(9)" }


def edge_s1957_dependsOn_s1956defs : DefEdge :=
  { defined := "§ 1957 monetary transactions in derived property",
    dependsOn := "specified unlawful activity (§ 1956(c)(7))",
    citeDefine := "18 USC § 1957(f)(3)" }


def defEdges : List DefEdge :=
  [ edge_racketeering_dependsOn_s1951, edge_racketeering_dependsOn_s1952,
    edge_racketeering_dependsOn_s1956, edge_racketeering_dependsOn_s1957,
    edge_s1951_dependsOn_robbery, edge_s1951_dependsOn_extortion,
    edge_s1951_dependsOn_commerce, edge_s1952_dependsOn_unlawfulActivity,
    edge_unlawfulActivity_dependsOn_s1956s1957,
    edge_s1956_dependsOn_specifiedUnlawfulActivity,
    edge_specifiedUnlawfulActivity_dependsOn_racketeering,
    edge_s1956_dependsOn_financialTransaction,
    edge_financialTransaction_dependsOn_monetaryInstrument,
    edge_financialTransaction_dependsOn_financialInstitution,
    edge_s1956_dependsOn_proceeds, edge_s1957_dependsOn_monetaryTransaction,
    edge_monetaryTransaction_dependsOn_monetaryInstrument,
    edge_s1957_dependsOn_criminallyDerivedProperty,
    edge_criminallyDerivedProperty_dependsOn_proceeds,
    edge_s1957_dependsOn_s1956defs ]









inductive RacketeeringCategory
  | stateLawOffence
  | title18Offence
  | title29LaborOffence
  | bankruptcySecuritiesDrugFraud
  | currencyReporting
  | immigrationForGain
  | terrorismListed
  deriving DecidableEq, Repr





structure Title18PredicateMembership (o : Offence) (c : ComplaintText) : Prop where
  enumerated : IsTitle18PredicateOffence o c
  racketeering : IsRacketeeringActivity o c





inductive HobbsActMeans (o : Offence) (c : ComplaintText) : Prop where
  | byRobbery   (h : IsRobbery o c)   : HobbsActMeans o c
  | byExtortion (h : IsExtortion o c) : HobbsActMeans o c



structure Section1951Membership (o : Offence) (c : ComplaintText) : Prop where
  means    : HobbsActMeans o c
  commerce : AffectsCommerce o c


structure Section1952Membership (o : Offence) (c : ComplaintText) : Prop where
  unlawful : IsUnlawfulActivity o c




structure FinancialTransactionMembership
    (t : Transaction) (p : Property) (e : Entity) (c : ComplaintText) : Prop where
  isFinancialTransaction : IsFinancialTransaction t c
  instrument : IsMonetaryInstrument p c
  institution : IsFinancialInstitution e c



structure Section1956Membership
    (t : Transaction) (p : Property) (oSua : Offence) (c : ComplaintText) : Prop where
  transaction : IsFinancialTransaction t c
  proceeds : IsProceeds p c
  specifiedUnlawful : IsSpecifiedUnlawfulActivity oSua c



structure Section1957Membership
    (t : Transaction) (p : Property) (oSua : Offence) (c : ComplaintText) : Prop where
  monetaryTransaction : IsMonetaryTransaction t c
  criminallyDerived : IsCriminallyDerivedProperty p c
  specifiedUnlawful : IsSpecifiedUnlawfulActivity oSua c

end Proving.USC.T18.RacketeeringActs.Ontology
