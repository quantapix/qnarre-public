








import Proving.USC.T42.SchoolDesegregationAid.Ontology.Predicates

namespace Proving.USC.T42.SchoolDesegregationAid.Ontology
open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_desegregation_dependsOn_protectedGround : DefEdge :=
  { defined := "desegregation",
    dependsOn := "protected ground (race, color, religion, sex, national origin)",
    citeDefine := "42 USC § 2000c(b)" }



def edge_desegregation_dependsOn_notRacialBalance : DefEdge :=
  { defined := "desegregation",
    dependsOn := "assignment for reasons other than a protected ground (not racial-balance)",
    citeDefine := "42 USC § 2000c(b)" }



def edge_publicSchool_dependsOn_governmentalOperation : DefEdge :=
  { defined := "public school",
    dependsOn := "governmental operation or funding",
    citeDefine := "42 USC § 2000c(c)" }



def edge_publicCollege_dependsOn_governmentalOperation : DefEdge :=
  { defined := "public college",
    dependsOn := "governmental operation or funding",
    citeDefine := "42 USC § 2000c(c)" }



def edge_schoolBoard_dependsOn_publicSchool : DefEdge :=
  { defined := "school board",
    dependsOn := "public school",
    citeDefine := "42 USC § 2000c(d)" }



def subchapterIVDefEdges : List DefEdge :=
  [ edge_desegregation_dependsOn_protectedGround,
    edge_desegregation_dependsOn_notRacialBalance,
    edge_publicSchool_dependsOn_governmentalOperation,
    edge_publicCollege_dependsOn_governmentalOperation,
    edge_schoolBoard_dependsOn_publicSchool ]




structure DesegregationMembership (d : Desegregation) (c : ComplaintText) : Prop where
  withoutRegard    : IsWithoutRegardToProtectedGround d c
  notRacialBalance : IsNotRacialBalanceAssignment d c



structure PublicSchoolMembership (ps : PublicSchool) (e : Entity) (c : ComplaintText) : Prop where
  institution : IsPublicSchool ps c
  governmental : IsGovernmentallyOperated e c



structure PublicCollegeMembership (pc : PublicCollege) (e : Entity) (c : ComplaintText) : Prop where
  institution : IsPublicCollege pc c
  governmental : IsGovernmentallyOperated e c





structure SubchapterIVTermsInhabited
    (s : Secretary) (ps : PublicSchool) (e : Entity) (c : ComplaintText) : Prop where
  secretary  : IsSecretary s c
  school      : PublicSchoolMembership ps e c
  board       : IsSchoolBoard e c

end Proving.USC.T42.SchoolDesegregationAid.Ontology
