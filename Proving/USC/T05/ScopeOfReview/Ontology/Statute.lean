















import Proving.USC.T05.ScopeOfReview.Ontology.Predicates

namespace Proving.USC.T05.ScopeOfReview.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def edge_setAside_dependsOn_agencyAction : DefEdge :=
  { defined := "set aside agency action",
    dependsOn := "agency action", citeDefine := "5 USC § 706(2)" }


def edge_wholeRecord_dependsOn_agencyAction : DefEdge :=
  { defined := "the whole record",
    dependsOn := "agency action", citeDefine := "5 USC § 706" }


def edge_prejudicialError_dependsOn_wholeRecord : DefEdge :=
  { defined := "rule of prejudicial error",
    dependsOn := "the whole record", citeDefine := "5 USC § 706" }


def edge_scopeOfReview_dependsOn_reviewingCourt : DefEdge :=
  { defined := "scope of review",
    dependsOn := "reviewing court", citeDefine := "5 USC § 706" }


def edge_reliefPending_dependsOn_reviewingCourt : DefEdge :=
  { defined := "relief pending review",
    dependsOn := "reviewing court", citeDefine := "5 USC § 705" }


def edge_reliefPending_dependsOn_agencyAction : DefEdge :=
  { defined := "relief pending review",
    dependsOn := "agency action", citeDefine := "5 USC § 705" }



def edge_review_dependsOn_aggrievedPerson : DefEdge :=
  { defined := "judicial review of agency action",
    dependsOn := "person aggrieved (§ 702)", citeDefine := "5 USC § 706" }


def defEdges : List DefEdge :=
  [ edge_setAside_dependsOn_agencyAction,
    edge_wholeRecord_dependsOn_agencyAction,
    edge_prejudicialError_dependsOn_wholeRecord,
    edge_scopeOfReview_dependsOn_reviewingCourt,
    edge_reliefPending_dependsOn_reviewingCourt,
    edge_reliefPending_dependsOn_agencyAction,
    edge_review_dependsOn_aggrievedPerson ]





inductive SetAsideGroundKind


  | arbitraryCapricious

  | contraryToConstitution


  | inExcessOfStatutoryAuthority

  | withoutProcedureRequiredByLaw


  | unsupportedBySubstantialEvidence

  | unwarrantedByFactsDeNovo
  deriving DecidableEq, Repr





structure WholeRecordMembership (a : AgencyAction) (r : Record) (c : ComplaintText) : Prop where
  action : IsAgencyAction a c
  record : IsWholeRecord r c




structure SetAsideMembership
    (court : ReviewingCourt) (a : AgencyAction) (g : SetAsideGround) (r : Record)
    (c : ComplaintText) : Prop where
  forum        : IsReviewingCourt court c
  action       : IsAgencyAction a c
  ground       : IsSetAsideGround g a c
  wholeRecord  : IsWholeRecord r c
  prejudicial  : SatisfiesRuleOfPrejudicialError a r c



structure CompelActionMembership
    (court : ReviewingCourt) (a : AgencyAction) (c : ComplaintText) : Prop where
  forum   : IsReviewingCourt court c
  action  : IsAgencyAction a c
  withheld : IsUnlawfullyWithheldOrDelayed a c



structure ReliefPendingReviewMembership
    (court : ReviewingCourt) (a : AgencyAction) (c : ComplaintText) : Prop where
  forum    : IsReviewingCourt court c
  action   : IsAgencyAction a c
  warranted : WarrantsReliefPendingReview a c

end Proving.USC.T05.ScopeOfReview.Ontology
