











import Proving.USC.T18.Enf.Ontology.Predicates

namespace Proving.USC.T18.Enf.Ontology

open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def edge_forfeitableInterest_dependsOn_violation : DefEdge :=
  { defined := "forfeitable interest", dependsOn := "violation of section 1962",
    citeDefine := "18 USC § 1963(a)" }


def edge_forfeitableInterest_dependsOn_enterprise : DefEdge :=
  { defined := "forfeitable interest", dependsOn := "enterprise",
    citeDefine := "18 USC § 1963(a)(2)" }


def edge_forfeitableProperty_dependsOn_realProperty : DefEdge :=
  { defined := "forfeitable property", dependsOn := "real property",
    citeDefine := "18 USC § 1963(b)(1)" }


def edge_forfeitableProperty_dependsOn_personalProperty : DefEdge :=
  { defined := "forfeitable property", dependsOn := "personal property",
    citeDefine := "18 USC § 1963(b)(2)" }


def edge_injuredPerson_dependsOn_violation : DefEdge :=
  { defined := "injured person (1964(c) standing)",
    dependsOn := "violation of section 1962",
    citeDefine := "18 USC § 1964(c)" }



def edge_venueNexus_dependsOn_civilAction : DefEdge :=
  { defined := "venue nexus", dependsOn := "civil action under section 1964",
    citeDefine := "18 USC § 1965(a)" }


def defEdges : List DefEdge :=
  [ edge_forfeitableInterest_dependsOn_violation,
    edge_forfeitableInterest_dependsOn_enterprise,
    edge_forfeitableProperty_dependsOn_realProperty,
    edge_forfeitableProperty_dependsOn_personalProperty,
    edge_injuredPerson_dependsOn_violation,
    edge_venueNexus_dependsOn_civilAction ]




inductive ForfeitablePropertyMembership (x : Property) (c : ComplaintText) : Prop where

  | real     (h : IsRealProperty x c) : ForfeitablePropertyMembership x c

  | personal (h : IsPersonalProperty x c) : ForfeitablePropertyMembership x c




structure ForfeitableInterestMembership (i : Interest) (p : Person) (c : ComplaintText) : Prop where
  interest  : IsForfeitableInterest i c
  violation : IsSection1962Violation p c




structure InjuredPersonMembership (p : Person) (c : ComplaintText) : Prop where
  injured   : IsInjuredPerson p c
  violation : IsSection1962Violation p c



structure VenueMembership (p : Person) (c : ComplaintText) : Prop where
  nexus : HasVenueNexus p c

end Proving.USC.T18.Enf.Ontology
