


















import Proving.USC.T42.EqualRights.Ontology.Predicates

namespace Proving.USC.T42.EqualRights.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_s1981Right_dependsOn_personInUS : DefEdge :=
  { defined := "§ 1981 equal-rights holder (§ 1981(a))",
    dependsOn := "person within the jurisdiction of the United States",
    citeDefine := "42 USC § 1981(a)" }


def edge_s1981Right_dependsOn_makeEnforce : DefEdge :=
  { defined := "§ 1981 equal-rights holder (§ 1981(a))",
    dependsOn := "make and enforce contracts", citeDefine := "42 USC § 1981(a)" }



def edge_makeEnforce_dependsOn_contracts : DefEdge :=
  { defined := "make and enforce contracts (§ 1981(b))", dependsOn := "contracts",
    citeDefine := "42 USC § 1981(b)" }



def edge_s1981Right_dependsOn_whiteCitizenBaseline : DefEdge :=
  { defined := "§ 1981 equal-rights holder (§ 1981(a))",
    dependsOn := "white-citizen comparator baseline",
    citeDefine := "42 USC § 1981(a)" }


def edge_s1982Right_dependsOn_citizen : DefEdge :=
  { defined := "§ 1982 equal-property-rights holder (§ 1982)",
    dependsOn := "citizen of the United States", citeDefine := "42 USC § 1982" }


def edge_s1982Right_dependsOn_property : DefEdge :=
  { defined := "§ 1982 equal-property-rights holder (§ 1982)",
    dependsOn := "real and personal property", citeDefine := "42 USC § 1982" }



def edge_s1982Right_dependsOn_whiteCitizenBaseline : DefEdge :=
  { defined := "§ 1982 equal-property-rights holder (§ 1982)",
    dependsOn := "white-citizen comparator baseline", citeDefine := "42 USC § 1982" }



def edge_discriminatoryPractice_dependsOn_intentionalDiscrim : DefEdge :=
  { defined := "discriminatory practice (§ 1981a(d)(2))",
    dependsOn := "unlawful intentional discrimination (§ 1981a(a))",
    citeDefine := "42 USC § 1981a(d)(2)" }



def edge_complainingParty_dependsOn_mayBringAction : DefEdge :=
  { defined := "complaining party (§ 1981a(d)(1))",
    dependsOn := "person who may bring a Title VII / § 794a / ADA action",
    citeDefine := "42 USC § 1981a(d)(1)" }



def edge_damagesRemedy_dependsOn_complainingParty : DefEdge :=
  { defined := "§ 1981a damages remedy (§ 1981a(a))",
    dependsOn := "complaining party (§ 1981a(d)(1))",
    citeDefine := "42 USC § 1981a(a)(1)" }


def definitionalDAG : List DefEdge :=
  [ edge_s1981Right_dependsOn_personInUS,
    edge_s1981Right_dependsOn_makeEnforce,
    edge_makeEnforce_dependsOn_contracts,
    edge_s1981Right_dependsOn_whiteCitizenBaseline,
    edge_s1982Right_dependsOn_citizen,
    edge_s1982Right_dependsOn_property,
    edge_s1982Right_dependsOn_whiteCitizenBaseline,
    edge_discriminatoryPractice_dependsOn_intentionalDiscrim,
    edge_complainingParty_dependsOn_mayBringAction,
    edge_damagesRemedy_dependsOn_complainingParty ]








structure EqualContractRightMembership
    (p : Person) (r : ContractRelationship) (c : ComplaintText) : Prop where
  protectedPerson : IsProtectedPerson p c
  personInUS      : IsPersonInUS p c
  contractRel     : IsContractRelationship r c




structure EqualPropertyRightMembership
    (p : Person) (x : Property) (c : ComplaintText) : Prop where
  citizen  : IsCitizen p c
  property : IsProperty x c






structure DamagesClaimMembership
    (p : Person) (d : DiscriminatoryPractice) (c : ComplaintText) : Prop where
  complainingParty : IsComplainingParty p c
  practice         : IsDiscriminatoryPractice d c
  intentional      : IntentToDiscriminate p c




inductive ComplainingPartyCase (p : Person) (c : ComplaintText) : Prop where

  | byEnumeration : IsComplainingParty p c → ComplainingPartyCase p c


  | viaDiscriminatoryPractice {d : DiscriminatoryPractice} :
      IsComplainingParty p c → IsDiscriminatoryPractice d c → ComplainingPartyCase p c

end Proving.USC.T42.EqualRights.Ontology
