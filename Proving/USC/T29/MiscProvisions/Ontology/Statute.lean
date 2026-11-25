












import Proving.USC.T29.MiscProvisions.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T29.MiscProvisions.Ontology

open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def edge_supervisor_dependsOn_employee : DefEdge :=
  { defined := "supervisor", dependsOn := "employee",
    citeDefine := "29 USC § 164(a)" }


def edge_jurisdiction_dependsOn_laborDispute : DefEdge :=
  { defined := "labor-dispute below jurisdiction threshold", dependsOn := "labor dispute",
    citeDefine := "29 USC § 164(c)" }


def edge_boardAction_dependsOn_section159 : DefEdge :=
  { defined := "validated Board action", dependsOn := "§ 159 certification",
    citeDefine := "29 USC § 168" }


def edge_objector_dependsOn_religiousBody : DefEdge :=
  { defined := "religious-objector employee", dependsOn := "bona fide religious body",
    citeDefine := "29 USC § 169" }


def edge_objector_dependsOn_laborOrganization : DefEdge :=
  { defined := "religious-objector employee", dependsOn := "labor organization",
    citeDefine := "29 USC § 169" }


def edge_substitution_dependsOn_charitableFund : DefEdge :=
  { defined := "dues-substitution arrangement", dependsOn := "charitable fund",
    citeDefine := "29 USC § 169" }


structure SupervisorMembership (s : Supervisor) (c : ComplaintText) : Prop where
  isSupervisor : IsSupervisor s c




structure ReligiousObjectorMembership
    (p : Person) (b : ReligiousBody) (c : ComplaintText) : Prop where
  objector : IsReligiousObjectorEmployee p c
  body     : IsBonaFideReligiousBody b c




structure DuesSubstitution
    (p : Person) (f : CharitableFund) (c : ComplaintText) : Prop where
  objector : IsReligiousObjectorEmployee p c
  fund     : IsCharitableFund f c

end Proving.USC.T29.MiscProvisions.Ontology
