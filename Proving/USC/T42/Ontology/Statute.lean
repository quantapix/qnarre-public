
















import Proving.USC.T42.Ontology.Predicates

namespace Proving.USC.T42.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_makeEnforce_dependsOn_contracts : DefEdge :=
  { defined := "make and enforce contracts", dependsOn := "contracts",
    citeDefine := "42 USC § 1981(b)" }



def edge_protectedContractor_dependsOn_personInUS : DefEdge :=
  { defined := "protected contractor (§ 1981(a))",
    dependsOn := "person within the jurisdiction of the United States",
    citeDefine := "42 USC § 1981(a)" }


def edge_protectedContractor_dependsOn_makeEnforce : DefEdge :=
  { defined := "protected contractor (§ 1981(a))",
    dependsOn := "make and enforce contracts", citeDefine := "42 USC § 1981(a)" }



def edge_discriminatoryPractice_dependsOn_intentionalDiscrim : DefEdge :=
  { defined := "discriminatory practice", dependsOn := "unlawful intentional discrimination",
    citeDefine := "42 USC § 1981a(d)(2)" }



def edge_complainingParty_dependsOn_mayBringAction : DefEdge :=
  { defined := "complaining party", dependsOn := "person who may bring a Title VII action",
    citeDefine := "42 USC § 1981a(d)(1)" }


def edge_recipient_dependsOn_assistance : DefEdge :=
  { defined := "recipient", dependsOn := "Federal financial assistance",
    citeDefine := "42 USC § 2000d-1" }



def edge_fundedProgram_dependsOn_assistance : DefEdge :=
  { defined := "program or activity receiving Federal financial assistance",
    dependsOn := "Federal financial assistance", citeDefine := "42 USC § 2000d" }


def edge_fundedProgram_dependsOn_personInUS : DefEdge :=
  { defined := "Title VI prohibition (§ 2000d)",
    dependsOn := "person in the United States", citeDefine := "42 USC § 2000d" }


def edge_neglectfulPreventor_dependsOn_conspiracy : DefEdge :=
  { defined := "neglect to prevent (§ 1986)", dependsOn := "conspiracy (§ 1985)",
    citeDefine := "42 USC § 1986" }



def edge_state_dependsOn_recipient : DefEdge :=
  { defined := "State (§ 2000d-7)", dependsOn := "recipient of Federal financial assistance",
    citeDefine := "42 USC § 2000d-7(a)" }


def definitionalDAG : List DefEdge :=
  [ edge_makeEnforce_dependsOn_contracts,
    edge_protectedContractor_dependsOn_personInUS,
    edge_protectedContractor_dependsOn_makeEnforce,
    edge_discriminatoryPractice_dependsOn_intentionalDiscrim,
    edge_complainingParty_dependsOn_mayBringAction,
    edge_recipient_dependsOn_assistance,
    edge_fundedProgram_dependsOn_assistance,
    edge_fundedProgram_dependsOn_personInUS,
    edge_neglectfulPreventor_dependsOn_conspiracy,
    edge_state_dependsOn_recipient ]






structure ProtectedContractorMembership
    (x : ProtectedContractor) (p : ProtectedPerson) (r : ContractRelationship)
    (c : ComplaintText) : Prop where
  contractor : IsProtectedContractor x c
  personInUS : IsPersonInUS p c
  contractRel : IsContractRelationship r c




structure RecipientMembership
    (e : Recipient) (f : FundedProgram) (a : FederalFinancialAssistance)
    (c : ComplaintText) : Prop where
  recipient : IsRecipient e c
  fundedProgram : IsFundedProgram f c
  assistance : IsFederalFinancialAssistance a c




structure NeglectfulPreventorMembership
    (n : NeglectfulPreventor) (g : CivilRightsConspiracy) (c : ComplaintText) : Prop where
  preventor : IsNeglectfulPreventor n c
  conspiracy : IsCivilRightsConspiracy g c




structure AbrogatedStateMembership
    (s : State) (e : Recipient) (c : ComplaintText) : Prop where
  state : IsState s c
  recipient : IsRecipient e c



inductive ComplainingPartyCase (x : ComplainingParty) (c : ComplaintText) : Prop where

  | byEnumeration : IsComplainingParty x c → ComplainingPartyCase x c

  | viaDiscriminatoryPractice {d : DiscriminatoryPractice} :
      IsComplainingParty x c → IsDiscriminatoryPractice d c → ComplainingPartyCase x c

end Proving.USC.T42.Ontology
