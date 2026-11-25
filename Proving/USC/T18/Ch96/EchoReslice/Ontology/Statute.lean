







import Proving.USC.T18.Ch96.EchoReslice.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.EchoReslice.Ontology

open Proving.USC.Common







structure DefEdge where
  defined         : String
  dependsOn       : String
  citeUse         : String
  citeDefine      : String
  resolvedInSlice : Bool


def edge_coveredProceeding_dependsOn_civilAction : DefEdge :=
  { defined := "proceeding covered by § 1967",
    dependsOn := "civil action instituted by the United States under this chapter",
    citeUse := "18 USC § 1967", citeDefine := "18 USC § 1967",
    resolvedInSlice := true }


def edge_coveredProceeding_dependsOn_ancillary : DefEdge :=
  { defined := "proceeding covered by § 1967",
    dependsOn := "proceeding ancillary to",
    citeUse := "18 USC § 1967", citeDefine := "18 USC § 1967",
    resolvedInSlice := true }



def edge_usCivilAction_dependsOn_civilAction : DefEdge :=
  { defined := "civil action instituted by the United States under this chapter",
    dependsOn := "civil action",
    citeUse := "18 USC § 1967", citeDefine := "(undefined in slice)",
    resolvedInSlice := false }


def edge_usCivilAction_dependsOn_unitedStates : DefEdge :=
  { defined := "civil action instituted by the United States under this chapter",
    dependsOn := "the United States",
    citeUse := "18 USC § 1967", citeDefine := "(undefined in slice)",
    resolvedInSlice := false }



def edge_usCivilAction_dependsOn_thisChapter : DefEdge :=
  { defined := "civil action instituted by the United States under this chapter",
    dependsOn := "this chapter (18 USC ch. 96)",
    citeUse := "18 USC § 1967", citeDefine := "(undefined in slice)",
    resolvedInSlice := false }



def edge_accessDetermination_dependsOn_accessStatus : DefEdge :=
  { defined := "§ 1967 access determination",
    dependsOn := "open or closed to the public",
    citeUse := "18 USC § 1967", citeDefine := "18 USC § 1967",
    resolvedInSlice := true }


def edge_accessDetermination_dependsOn_court : DefEdge :=
  { defined := "§ 1967 access determination",
    dependsOn := "the court",
    citeUse := "18 USC § 1967", citeDefine := "(undefined in slice)",
    resolvedInSlice := false }



def edge_accessDetermination_dependsOn_affectedRights : DefEdge :=
  { defined := "§ 1967 access determination",
    dependsOn := "the rights of affected persons",
    citeUse := "18 USC § 1967", citeDefine := "18 USC § 1967",
    resolvedInSlice := true }


def edge_affectedRights_dependsOn_affectedPersons : DefEdge :=
  { defined := "the rights of affected persons",
    dependsOn := "affected persons",
    citeUse := "18 USC § 1967", citeDefine := "18 USC § 1967",
    resolvedInSlice := true }



def edge_affectedPersons_dependsOn_person : DefEdge :=
  { defined := "affected persons",
    dependsOn := "person",
    citeUse := "18 USC § 1967", citeDefine := "(undefined in slice)",
    resolvedInSlice := false }


def defEdges : List DefEdge :=
  [ edge_coveredProceeding_dependsOn_civilAction,
    edge_coveredProceeding_dependsOn_ancillary,
    edge_usCivilAction_dependsOn_civilAction,
    edge_usCivilAction_dependsOn_unitedStates,
    edge_usCivilAction_dependsOn_thisChapter,
    edge_accessDetermination_dependsOn_accessStatus,
    edge_accessDetermination_dependsOn_court,
    edge_accessDetermination_dependsOn_affectedRights,
    edge_affectedRights_dependsOn_affectedPersons,
    edge_affectedPersons_dependsOn_person ]





structure UnitedStatesCivilAction (a : CivilAction) (u : Entity) (c : ComplaintText) : Prop where
  civilAction  : IsCivilAction a c
  unitedStates : IsUnitedStates u c
  instituted   : InstitutedBy a u c
  underChapter : IsUnderThisChapter a c





abbrev IsUnitedStatesCivilAction (a : CivilAction) (c : ComplaintText) : Prop :=
  ∃ u : Entity, UnitedStatesCivilAction a u c




inductive CoveredProceeding (p : Proceeding) (a : CivilAction) (c : ComplaintText) : Prop where


  | ancillary (anc : IsAncillaryProceeding p a c)
              (anchor : IsUnitedStatesCivilAction a c) : CoveredProceeding p a c


  | theAction (isAction : IsTheActionItself p a c)
              (anchor : IsUnitedStatesCivilAction a c) : CoveredProceeding p a c



inductive PublicAccessStatus where
  | openToPublic
  | closedToPublic
  deriving DecidableEq, Repr


def PublicAccessHolds : PublicAccessStatus → Proceeding → ComplaintText → Prop
  | .openToPublic,   p, c => IsOpenToPublic p c
  | .closedToPublic, p, c => IsClosedToPublic p c



structure AffectedPersonRight (r : LegalRight) (x : Person) (p : Proceeding)
    (c : ComplaintText) : Prop where
  affected : IsAffectedPerson x p c
  right    : IsRightOfPerson r x c



structure Section1967Scope (p : Proceeding) (a : CivilAction) (ct : Court)
    (c : ComplaintText) : Prop where
  covered : CoveredProceeding p a c
  court   : IsCourtOfTheProceeding ct p c



structure Section1967AccessDetermination (p : Proceeding) (a : CivilAction)
    (ct : Court) (s : PublicAccessStatus) (c : ComplaintText) : Prop where
  scope  : Section1967Scope p a ct c
  status : PublicAccessHolds s p c

end Proving.USC.T18.Ch96.EchoReslice.Ontology
