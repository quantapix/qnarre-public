















import Proving.USC.T22.Ontology.Sub.Predicates

namespace Proving.USC.T22.Ontology.Sub
open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  dangling   : Bool := false



def edge_minStandards_dependsOn_efforts : DefEdge :=
  { defined := "minimum standards for the elimination of trafficking",
    dependsOn := "serious and sustained efforts to eliminate severe forms of trafficking",
    citeDefine := "22 USC § 7106(a)" }



def edge_efforts_dependsOn_severeForms : DefEdge :=
  { defined := "serious and sustained efforts to eliminate severe forms of trafficking",
    dependsOn := "severe forms of trafficking in persons",
    citeDefine := "22 USC § 7106(b)", dangling := true }



def edge_minStandards_dependsOn_sexTrafficking : DefEdge :=
  { defined := "minimum standards for the elimination of trafficking",
    dependsOn := "sex trafficking",
    citeDefine := "22 USC § 7106(a)", dangling := true }



def edge_operatingGroup_dependsOn_office : DefEdge :=
  { defined := "Senior Policy Operating Group",
    dependsOn := "Office to Monitor and Combat Trafficking",
    citeDefine := "22 USC § 7103(g)" }



def edge_operatingGroup_dependsOn_taskForce : DefEdge :=
  { defined := "Senior Policy Operating Group",
    dependsOn := "Interagency Task Force to Monitor and Combat Trafficking",
    citeDefine := "22 USC § 7103(g)" }



def edge_office_dependsOn_director : DefEdge :=
  { defined := "Office to Monitor and Combat Trafficking",
    dependsOn := "Director of the Office to Monitor and Combat Trafficking",
    citeDefine := "22 USC § 7103(e)" }


def definitionalDAG : List DefEdge :=
  [ edge_minStandards_dependsOn_efforts,
    edge_efforts_dependsOn_severeForms,
    edge_minStandards_dependsOn_sexTrafficking,
    edge_operatingGroup_dependsOn_office,
    edge_operatingGroup_dependsOn_taskForce,
    edge_office_dependsOn_director ]





structure SatisfiesMinimumStandards (g : Government) (c : ComplaintText) : Prop where
  prohibitPunish : ProhibitsAndPunishesTrafficking g c
  commensurate   : PrescribesCommensuratePunishment g c
  stringent      : PrescribesStringentPunishment g c
  efforts        : MakesSeriousAndSustainedEfforts g c



structure TraffickingApparatusInhabited
    (tf office grp : Entity) (dir : Person) (c : ComplaintText) : Prop where
  taskForce     : IsInteragencyTaskForce tf c
  office        : IsOfficeToMonitorAndCombatTrafficking office c
  director      : IsTraffickingOfficeDirector dir c
  operatingGrp  : IsSeniorPolicyOperatingGroup grp c

end Proving.USC.T22.Ontology.Sub
