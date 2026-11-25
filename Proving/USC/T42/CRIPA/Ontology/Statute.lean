























import Proving.USC.Common.Types
import Proving.USC.T42.CRIPA.Ontology.Types
import Proving.USC.T42.CRIPA.Ontology.Predicates

namespace Proving.USC.T42.CRIPA.Ontology

open Proving.USC.Common (Person ComplaintText)



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def edge_institution_dependsOn_state : DefEdge :=
  { defined := "institution", dependsOn := "State",
    citeDefine := "42 USC § 1997(1)(A)" }


def edge_agAction_dependsOn_institution : DefEdge :=
  { defined := "AG civil action (§ 1997a)", dependsOn := "institution",
    citeDefine := "42 USC § 1997a(a)" }



def edge_agAction_dependsOn_institutionalizedPerson : DefEdge :=
  { defined := "AG civil action (§ 1997a)", dependsOn := "institutionalized person",
    citeDefine := "42 USC § 1997a(a)" }


def edge_agAction_dependsOn_conditions : DefEdge :=
  { defined := "AG civil action (§ 1997a)", dependsOn := "egregious or flagrant conditions",
    citeDefine := "42 USC § 1997a(a)" }


def edge_agAction_dependsOn_pattern : DefEdge :=
  { defined := "AG civil action (§ 1997a)", dependsOn := "pattern or practice of resistance",
    citeDefine := "42 USC § 1997a(a)" }


def edge_exhaustion_dependsOn_prisoner : DefEdge :=
  { defined := "prisoner-suit exhaustion (§ 1997e(a))", dependsOn := "prisoner",
    citeDefine := "42 USC § 1997e(h)" }


def cripaDefEdges : List DefEdge :=
  [ edge_institution_dependsOn_state,
    edge_agAction_dependsOn_institution,
    edge_agAction_dependsOn_institutionalizedPerson,
    edge_agAction_dependsOn_conditions,
    edge_agAction_dependsOn_pattern,
    edge_exhaustion_dependsOn_prisoner ]





structure AGActionObjects
    (i : Institution) (p : InstitutionalizedPerson)
    (x : Conditions) (pat : PatternOrPractice) (c : ComplaintText) : Prop where
  isInstitution         : IsInstitution i c
  isInstitutionalized   : IsInstitutionalizedPerson p c
  isConditions          : IsEgregiousOrFlagrantConditions x c
  isPattern             : IsPatternOrPracticeOfResistance pat c




structure PrisonerSuit (p : Prisoner) (c : ComplaintText) : Prop where
  isPrisoner : IsPrisoner p c

end Proving.USC.T42.CRIPA.Ontology
