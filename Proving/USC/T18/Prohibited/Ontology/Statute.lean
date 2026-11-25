
















import Proving.USC.T18.Prohibited.Ontology.Predicates

namespace Proving.USC.T18.Prohibited.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_pattern_dependsOn_activity : DefEdge :=
  { defined := "pattern of racketeering activity",
    dependsOn := "racketeering activity", citeDefine := "18 USC § 1961(5)" }


def edge_s1962_dependsOn_enterprise : DefEdge :=
  { defined := "18 USC § 1962", dependsOn := "enterprise",
    citeDefine := "18 USC § 1961(4)" }



def edge_s1962_dependsOn_pattern : DefEdge :=
  { defined := "18 USC § 1962", dependsOn := "pattern of racketeering activity",
    citeDefine := "18 USC § 1961(5)" }


def edge_s1962_dependsOn_unlawfulDebt : DefEdge :=
  { defined := "18 USC § 1962", dependsOn := "unlawful debt",
    citeDefine := "18 USC § 1961(6)" }


def edge_s1962_dependsOn_person : DefEdge :=
  { defined := "18 USC § 1962", dependsOn := "person",
    citeDefine := "18 USC § 1961(3)" }


def edge_s1962a_dependsOn_income : DefEdge :=
  { defined := "18 USC § 1962(a)", dependsOn := "income (UNDEFINED)",
    citeDefine := "18 USC § 1962(a)" }


def defEdges : List DefEdge :=
  [ edge_pattern_dependsOn_activity,
    edge_s1962_dependsOn_enterprise,
    edge_s1962_dependsOn_pattern,
    edge_s1962_dependsOn_unlawfulDebt,
    edge_s1962_dependsOn_person,
    edge_s1962a_dependsOn_income ]






structure EnterpriseMembership (e : Enterprise) (c : ComplaintText) : Prop where
  purpose       : HasCommonPurpose e c
  relationships : HasRelationships e c
  longevity     : HasLongevity e c




structure PatternMembership (pat : Pattern) (c : ComplaintText) : Prop where
  multiplicity : HasTwoOrMorePredicateActs pat c
  relatedness  : ActsAreRelated pat c
  continuity   : ActsShowContinuity pat c

end Proving.USC.T18.Prohibited.Ontology
