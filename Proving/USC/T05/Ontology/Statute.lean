














import Proving.USC.T05.Ontology.Types
import Proving.USC.T05.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T05.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def edge_party_person : DefEdge :=
  { defined := "party", dependsOn := "person", citeDefine := "5 USC § 551(3)" }


def edge_party_agency : DefEdge :=
  { defined := "party", dependsOn := "agency", citeDefine := "5 USC § 551(3)" }


def edge_ruleMaking_rule : DefEdge :=
  { defined := "rule making", dependsOn := "rule", citeDefine := "5 USC § 551(5)" }


def edge_adjudication_order : DefEdge :=
  { defined := "adjudication", dependsOn := "order", citeDefine := "5 USC § 551(7)" }



def edge_order_ruleMaking : DefEdge :=
  { defined := "order", dependsOn := "rule making", citeDefine := "5 USC § 551(6)" }


def edge_licensing_license : DefEdge :=
  { defined := "licensing", dependsOn := "license", citeDefine := "5 USC § 551(9)" }


def edge_agencyProceeding_ruleMaking : DefEdge :=
  { defined := "agency proceeding", dependsOn := "rule making", citeDefine := "5 USC § 551(12)" }


def edge_agencyProceeding_adjudication : DefEdge :=
  { defined := "agency proceeding", dependsOn := "adjudication", citeDefine := "5 USC § 551(12)" }


def edge_agencyProceeding_licensing : DefEdge :=
  { defined := "agency proceeding", dependsOn := "licensing", citeDefine := "5 USC § 551(12)" }


def edge_agencyAction_rule : DefEdge :=
  { defined := "agency action", dependsOn := "rule", citeDefine := "5 USC § 551(13)" }


def edge_agencyAction_order : DefEdge :=
  { defined := "agency action", dependsOn := "order", citeDefine := "5 USC § 551(13)" }


def edge_agencyAction_license : DefEdge :=
  { defined := "agency action", dependsOn := "license", citeDefine := "5 USC § 551(13)" }


def edge_agencyAction_sanction : DefEdge :=
  { defined := "agency action", dependsOn := "sanction", citeDefine := "5 USC § 551(13)" }


def edge_agencyAction_relief : DefEdge :=
  { defined := "agency action", dependsOn := "relief", citeDefine := "5 USC § 551(13)" }



def edge_ch7_incorporates_s551 : DefEdge :=
  { defined := "agency action (ch.7)", dependsOn := "agency action (§551)",
    citeDefine := "5 USC § 701(b)(2)" }



def defEdges : List DefEdge :=
  [ edge_party_person, edge_party_agency,
    edge_ruleMaking_rule, edge_adjudication_order, edge_order_ruleMaking,
    edge_licensing_license,
    edge_agencyProceeding_ruleMaking, edge_agencyProceeding_adjudication,
    edge_agencyProceeding_licensing,
    edge_agencyAction_rule, edge_agencyAction_order, edge_agencyAction_license,
    edge_agencyAction_sanction, edge_agencyAction_relief,
    edge_ch7_incorporates_s551 ]







structure PartyMembership (x : Party) (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  isPerson : IsPerson p c
  isAgency : IsAgency e c
  isParty  : IsParty x c



structure RuleMakingMembership (rm : RuleMaking) (r : Rule) (c : ComplaintText) : Prop where
  isRule       : IsRule r c
  isRuleMaking : IsRuleMaking rm c



structure AdjudicationMembership (a : Adjudication) (o : Order) (c : ComplaintText) : Prop where
  isOrder        : IsOrder o c
  isAdjudication : IsAdjudication a c



structure LicensingMembership (l : Licensing) (lic : License) (c : ComplaintText) : Prop where
  isLicense   : IsLicense lic c
  isLicensing : IsLicensing l c



inductive AgencyProceedingDef (c : ComplaintText) : Prop
  | viaRuleMaking  (rm : RuleMaking)   (h : IsRuleMaking rm c)   : AgencyProceedingDef c
  | viaAdjudication (a : Adjudication) (h : IsAdjudication a c)  : AgencyProceedingDef c
  | viaLicensing   (l : Licensing)     (h : IsLicensing l c)     : AgencyProceedingDef c



inductive AgencyActionDef (c : ComplaintText) : Prop
  | viaRule     (r : Rule)        (h : IsRule r c)        : AgencyActionDef c
  | viaOrder    (o : Order)       (h : IsOrder o c)       : AgencyActionDef c
  | viaLicense  (l : License)     (h : IsLicense l c)     : AgencyActionDef c
  | viaSanction (s : ApaSanction) (h : IsApaSanction s c) : AgencyActionDef c
  | viaRelief   (rl : Relief)     (h : IsRelief rl c)     : AgencyActionDef c

end Proving.USC.T05.Ontology
