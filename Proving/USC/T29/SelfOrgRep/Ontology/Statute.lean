



















import Proving.USC.T29.SelfOrgRep.Ontology.Types
import Proving.USC.T29.SelfOrgRep.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T29.SelfOrgRep.Ontology

open Proving.USC.Common




structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def edge_exclusiveRep_dependsOn_representative : DefEdge :=
  { defined := "exclusive representative", dependsOn := "representative",
    citeDefine := "29 USC § 159(a)" }



def edge_exclusiveRep_dependsOn_unit : DefEdge :=
  { defined := "exclusive representative", dependsOn := "appropriate bargaining unit",
    citeDefine := "29 USC § 159(a)" }


def edge_exclusiveRep_dependsOn_employees : DefEdge :=
  { defined := "exclusive representative", dependsOn := "employees",
    citeDefine := "29 USC § 159(a)" }


def edge_unit_dependsOn_employees : DefEdge :=
  { defined := "appropriate bargaining unit", dependsOn := "employees",
    citeDefine := "29 USC § 159(b)" }


def edge_question_dependsOn_representative : DefEdge :=
  { defined := "question of representation affecting commerce",
    dependsOn := "representative", citeDefine := "29 USC § 159(c)(1)" }


def edge_question_dependsOn_laborOrg : DefEdge :=
  { defined := "question of representation affecting commerce",
    dependsOn := "labor organization", citeDefine := "29 USC § 159(c)(1)" }


def edge_s157_dependsOn_concertedActivity : DefEdge :=
  { defined := "§ 157 self-organization right", dependsOn := "concerted activity",
    citeDefine := "29 USC § 157" }


def edge_s157_dependsOn_laborOrg : DefEdge :=
  { defined := "§ 157 self-organization right", dependsOn := "labor organization",
    citeDefine := "29 USC § 157" }


def defEdges : List DefEdge :=
  [ edge_exclusiveRep_dependsOn_representative,
    edge_exclusiveRep_dependsOn_unit,
    edge_exclusiveRep_dependsOn_employees,
    edge_unit_dependsOn_employees,
    edge_question_dependsOn_representative,
    edge_question_dependsOn_laborOrg,
    edge_s157_dependsOn_concertedActivity,
    edge_s157_dependsOn_laborOrg ]










structure ExclusiveRepresentativeMembership
    (r : Representative) (u : BargainingUnit) (c : ComplaintText) : Prop where
  isRep        : IsRepresentative r c
  unitAppropriate : IsAppropriateBargainingUnit u c
  exclusive    : IsExclusiveRepresentative r u c




structure RepresentationQuestionMembership
    (q : RepresentationQuestion) (e : Entity) (c : ComplaintText) : Prop where
  isQuestion  : IsRepresentationQuestion q c
  affectsCommerce : AffectsCommerce e c




structure Section157RightExercise (p : Person) (c : ComplaintText) : Prop where
  employee  : IsEmployee p c
  concerted : IsConcertedActivity p c

end Proving.USC.T29.SelfOrgRep.Ontology
