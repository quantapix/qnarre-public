






import Proving.USC.T42.Ch21Tail.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch21Tail.Ontology

open Proving.USC.Common






structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  dangling   : Bool
deriving Repr


def edge_reportingPerson_dependsOn_reportableCondition : DefEdge :=
  { defined := "reporting person", dependsOn := "reportable condition",
    citeDefine := "42 USC § 1997d", dangling := false }



def edge_reportableCondition_dependsOn_violation : DefEdge :=
  { defined := "reportable condition", dependsOn := "violation under this subchapter",
    citeDefine := "42 USC § 1997d", dangling := true }



def edge_prohibition_dependsOn_reportingPerson : DefEdge :=
  { defined := "prohibition of retaliation", dependsOn := "reporting person",
    citeDefine := "42 USC § 1997d", dangling := false }


def edge_prohibition_dependsOn_retaliation : DefEdge :=
  { defined := "prohibition of retaliation", dependsOn := "retaliation",
    citeDefine := "42 USC § 1997d", dangling := true }



def edge_federalFunds_dependsOn_coveredInstitution : DefEdge :=
  { defined := "federal funds", dependsOn := "covered institution",
    citeDefine := "42 USC § 1997g", dangling := false }



def edge_coveredInstitution_dependsOn_subchapterCoverage : DefEdge :=
  { defined := "covered institution", dependsOn := "institution covered by this subchapter",
    citeDefine := "42 USC § 1997g", dangling := true }



def edge_deprivingCondition_dependsOn_protectedRights : DefEdge :=
  { defined := "depriving (unconstitutional or illegal) condition",
    dependsOn := "rights protected by the Constitution or laws of the United States",
    citeDefine := "42 USC § 1997g", dangling := true }



def edge_fundingPriority_dependsOn_governmentAgency : DefEdge :=
  { defined := "funding priority", dependsOn := "government agency",
    citeDefine := "42 USC § 1997g", dangling := false }


def defEdges : List DefEdge :=
  [ edge_reportingPerson_dependsOn_reportableCondition,
    edge_reportableCondition_dependsOn_violation,
    edge_prohibition_dependsOn_reportingPerson,
    edge_prohibition_dependsOn_retaliation,
    edge_federalFunds_dependsOn_coveredInstitution,
    edge_coveredInstitution_dependsOn_subchapterCoverage,
    edge_deprivingCondition_dependsOn_protectedRights,
    edge_fundingPriority_dependsOn_governmentAgency ]







inductive DeprivingCondition (cond : InstitutionalCondition) (c : ComplaintText) : Prop where
  | constitutional (h : DeprivesConstitutionalRight cond c) : DeprivingCondition cond c
  | federalLaw     (h : DeprivesFederalStatutoryRight cond c) : DeprivingCondition cond c






structure ProtectedReporterMembership
    (p : Person) (cond : InstitutionalCondition) (c : ComplaintText) : Prop where
  reporter   : IsReportingPerson p c
  reportable : IsReportableCondition cond c




structure FundingPriorityMembership
    (fund : Funds) (inst : Institution) (cond : InstitutionalCondition)
    (c : ComplaintText) : Prop where
  federalFunds       : IsFederalFunds fund c
  coveredInstitution : IsCoveredInstitution inst c
  deprivingCondition : DeprivingCondition cond c

end Proving.USC.T42.Ch21Tail.Ontology
