









import Proving.USC.Common.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Ontology.Types
import Proving.USC.T42.PublicAccommodations.Enforcement.Ontology.Predicates

namespace Proving.USC.T42.PublicAccommodations.Enforcement.Ontology

open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_patternOrPractice_dependsOn_subchapterRight : DefEdge :=
  { defined := "pattern or practice of resistance",
    dependsOn := "right secured by this subchapter",
    citeDefine := "42 USC § 2000a-5(a)" }



def edge_agCivilAction_dependsOn_personOrGroup : DefEdge :=
  { defined := "Attorney General civil action",
    dependsOn := "person or group of persons",
    citeDefine := "42 USC § 2000a-5(a)" }


def edge_agCivilAction_dependsOn_patternOrPractice : DefEdge :=
  { defined := "Attorney General civil action",
    dependsOn := "pattern or practice of resistance",
    citeDefine := "42 USC § 2000a-5(a)" }


def edge_agCivilAction_dependsOn_preventiveRelief : DefEdge :=
  { defined := "Attorney General civil action",
    dependsOn := "preventive relief",
    citeDefine := "42 USC § 2000a-5(a)" }



def edge_threeJudgeCourt_dependsOn_certificate : DefEdge :=
  { defined := "court of three judges",
    dependsOn := "certificate of general public importance",
    citeDefine := "42 USC § 2000a-5(b)" }


def edge_service_dependsOn_referredComplaint : DefEdge :=
  { defined := "Community Relations Service",
    dependsOn := "referred complaint",
    citeDefine := "42 USC § 2000a-4" }


def edge_service_dependsOn_voluntarySettlement : DefEdge :=
  { defined := "Community Relations Service",
    dependsOn := "voluntary settlement",
    citeDefine := "42 USC § 2000a-4" }


def defEdges : List DefEdge :=
  [ edge_patternOrPractice_dependsOn_subchapterRight,
    edge_agCivilAction_dependsOn_personOrGroup,
    edge_agCivilAction_dependsOn_patternOrPractice,
    edge_agCivilAction_dependsOn_preventiveRelief,
    edge_threeJudgeCourt_dependsOn_certificate,
    edge_service_dependsOn_referredComplaint,
    edge_service_dependsOn_voluntarySettlement ]





structure AGCivilActionMembership
    (act : AttorneyGeneralCivilAction) (p : PersonOrGroup) (x : PatternOrPractice)
    (r : SubchapterRight) (rel : PreventiveRelief) (c : ComplaintText) : Prop where
  action       : IsAttorneyGeneralCivilAction act c
  personOrGroup : IsPersonOrGroup p c
  pattern      : IsPatternOrPractice x c
  right        : IsSubchapterRight r c
  relief       : IsPreventiveRelief rel c




structure ThreeJudgeCourtMembership
    (ct : ThreeJudgeCourt) (cert : GeneralPublicImportanceCertificate)
    (c : ComplaintText) : Prop where
  court       : IsThreeJudgeCourt ct c
  certificate : IsGeneralPublicImportanceCertificate cert c




structure ServiceConciliationMembership
    (e : CommunityRelationsService) (rc : ReferredComplaint)
    (s : VoluntarySettlement) (c : ComplaintText) : Prop where
  service     : IsCommunityRelationsService e c
  referred    : IsReferredComplaint rc c
  settlement  : IsVoluntarySettlement s c

end Proving.USC.T42.PublicAccommodations.Enforcement.Ontology
