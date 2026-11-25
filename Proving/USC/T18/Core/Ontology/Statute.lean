










import Proving.USC.T18.Core.Ontology.Types
import Proving.USC.T18.Core.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Core.Ontology

open Proving.USC.Common






structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_pattern_dependsOn_activity : DefEdge :=
  { defined := "pattern of racketeering activity",
    dependsOn := "racketeering activity", citeDefine := "18 USC § 1961(5)" }


def edge_s1962_dependsOn_enterprise : DefEdge :=
  { defined := "§ 1962 violation",
    dependsOn := "enterprise", citeDefine := "18 USC § 1962" }


def edge_s1962_dependsOn_pattern : DefEdge :=
  { defined := "§ 1962 violation",
    dependsOn := "pattern of racketeering activity", citeDefine := "18 USC § 1962" }


def edge_s1962_dependsOn_person : DefEdge :=
  { defined := "§ 1962 violation",
    dependsOn := "person", citeDefine := "18 USC § 1962" }



def edge_s1962_dependsOn_unlawfulDebt : DefEdge :=
  { defined := "§ 1962 violation",
    dependsOn := "unlawful debt", citeDefine := "18 USC § 1962" }



def defEdges : List DefEdge :=
  [ edge_pattern_dependsOn_activity,
    edge_s1962_dependsOn_enterprise,
    edge_s1962_dependsOn_pattern,
    edge_s1962_dependsOn_person,
    edge_s1962_dependsOn_unlawfulDebt ]







structure PatternMembership (pat : Pattern) (a : Act) (c : ComplaintText) : Prop where
  constituent : IsRacketeeringActivity a c
  pattern     : IsPatternOfRacketeering pat c









inductive RacketeeringPredicate (pat : Pattern) (d : UnlawfulDebt) (c : ComplaintText) : Prop where

  | viaPattern     (h : IsPatternOfRacketeering pat c) : RacketeeringPredicate pat d c

  | viaUnlawfulDebt (h : IsUnlawfulDebt d c)           : RacketeeringPredicate pat d c





structure Section1962ViolationMembership
    (v : Section1962Violation) (p : Person) (e : Entity)
    (pat : Pattern) (d : UnlawfulDebt) (c : ComplaintText) : Prop where

  person     : IsPerson p c

  enterprise : IsEnterprise e c

  predicate  : RacketeeringPredicate pat d c

  violation  : IsSection1962Violation v c

end Proving.USC.T18.Core.Ontology
