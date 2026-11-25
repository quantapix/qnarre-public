













import Proving.USC.Common.Types
import Proving.USC.T42.SchoolDesegregation.Ontology.Types
import Proving.USC.T42.SchoolDesegregation.Ontology.Predicates

namespace Proving.USC.T42.SchoolDesegregation.Ontology

open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_parent_dependsOn_person : DefEdge :=
  { defined := "parent",
    dependsOn := "person (in loco parentis)",
    citeDefine := "42 USC § 2000c-6(c)" }




def edge_complaint_dependsOn_s1001 : DefEdge :=
  { defined := "complaint",
    dependsOn := "writing or document (18 USC § 1001)",
    citeDefine := "42 USC § 2000c-6(c)" }



def edge_schoolTrigger_dependsOn_parent : DefEdge :=
  { defined := "school-desegregation complaint trigger",
    dependsOn := "parent",
    citeDefine := "42 USC § 2000c-6(a)(1)" }



def edge_schoolTrigger_dependsOn_class : DefEdge :=
  { defined := "school-desegregation complaint trigger",
    dependsOn := "class of persons similarly situated",
    citeDefine := "42 USC § 2000c-6(a)(1)" }


def edge_schoolTrigger_dependsOn_schoolBoard : DefEdge :=
  { defined := "school-desegregation complaint trigger",
    dependsOn := "school board",
    citeDefine := "42 USC § 2000c-6(a)(1)" }



def edge_collegeTrigger_dependsOn_publicCollege : DefEdge :=
  { defined := "public-college complaint trigger",
    dependsOn := "public college",
    citeDefine := "42 USC § 2000c-6(a)(2)" }



def edge_agCivilAction_dependsOn_complaint : DefEdge :=
  { defined := "Attorney General civil action",
    dependsOn := "complaint",
    citeDefine := "42 USC § 2000c-6(a)" }



def edge_unableStatus_dependsOn_parent : DefEdge :=
  { defined := "unable to initiate and maintain proceedings",
    dependsOn := "parent",
    citeDefine := "42 USC § 2000c-6(b)" }




def edge_personalSuit_dependsOn_person : DefEdge :=
  { defined := "personal suit for relief",
    dependsOn := "person (pre-existing right to sue)",
    citeDefine := "42 USC § 2000c-8" }


def defEdges : List DefEdge :=
  [ edge_parent_dependsOn_person,
    edge_complaint_dependsOn_s1001,
    edge_schoolTrigger_dependsOn_parent,
    edge_schoolTrigger_dependsOn_class,
    edge_schoolTrigger_dependsOn_schoolBoard,
    edge_collegeTrigger_dependsOn_publicCollege,
    edge_agCivilAction_dependsOn_complaint,
    edge_unableStatus_dependsOn_parent,
    edge_personalSuit_dependsOn_person ]




structure SchoolTriggerMembership
    (par : ParentT42IV) (cls : SimilarlySituatedClass) (sb : SchoolBoard)
    (c : ComplaintText) : Prop where
  parent     : IsParentT42IV par c
  klass      : IsSimilarlySituatedClass cls c
  schoolBoard : IsSchoolBoard sb c





structure CollegeTriggerMembership
    (par : ParentT42IV) (pc : PublicCollege) (c : ComplaintText) : Prop where
  parent  : IsParentT42IV par c
  college : IsPublicCollege pc c




inductive QualifyingComplaintTrigger
    (par : ParentT42IV) (cls : SimilarlySituatedClass) (sb : SchoolBoard)
    (pc : PublicCollege) (c : ComplaintText) : Prop
  | school  (h : SchoolTriggerMembership par cls sb c)
  | college (h : CollegeTriggerMembership par pc c)




structure AGCivilActionMembership
    (act : AttorneyGeneralCivilAction) (w : WrittenComplaintT42IV)
    (par : ParentT42IV) (cls : SimilarlySituatedClass) (sb : SchoolBoard)
    (pc : PublicCollege) (c : ComplaintText) : Prop where
  action  : IsAttorneyGeneralCivilAction act c
  complaint : IsWrittenComplaintT42IV w c
  trigger : QualifyingComplaintTrigger par cls sb pc c





structure PersonalSuitMembership
    (s : PersonalSuitForRelief) (p : Person) (c : ComplaintText) : Prop where
  suit     : IsPersonalSuitForRelief s c
  preserved : PreservesPrivateRight p c

end Proving.USC.T42.SchoolDesegregation.Ontology
