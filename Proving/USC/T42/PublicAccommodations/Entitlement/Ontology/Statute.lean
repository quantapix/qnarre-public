









import Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.Types
import Proving.USC.T42.PublicAccommodations.Entitlement.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Entitlement.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_ppa_dependsOn_establishment : DefEdge :=
  { defined := "place of public accommodation",
    dependsOn := "establishment which serves the public",
    citeDefine := "42 USC § 2000a(b)" }



def edge_ppa_dependsOn_affectCommerce : DefEdge :=
  { defined := "place of public accommodation",
    dependsOn := "operations affect commerce",
    citeDefine := "42 USC § 2000a(b)" }


def edge_ppa_dependsOn_stateAction : DefEdge :=
  { defined := "place of public accommodation",
    dependsOn := "supported by State action",
    citeDefine := "42 USC § 2000a(b)" }


def edge_affectCommerce_dependsOn_commerce : DefEdge :=
  { defined := "operations affect commerce",
    dependsOn := "commerce",
    citeDefine := "42 USC § 2000a(c)" }


def edge_privateClub_dependsOn_establishment : DefEdge :=
  { defined := "private club exemption",
    dependsOn := "establishment which serves the public",
    citeDefine := "42 USC § 2000a(e)" }


def definitionalDAG : List DefEdge :=
  [ edge_ppa_dependsOn_establishment,
    edge_ppa_dependsOn_affectCommerce,
    edge_ppa_dependsOn_stateAction,
    edge_affectCommerce_dependsOn_commerce,
    edge_privateClub_dependsOn_establishment ]





inductive EstablishmentCategory

  | lodging

  | food

  | entertainment


  | contained
  deriving DecidableEq, Repr





structure AffectCommerceMembership
    (est : Establishment) (x : Commerce) (c : ComplaintText) : Prop where
  commerce : IsCommerce x c
  affects  : OperationsAffectCommerce est c




structure PlaceOfPublicAccommodationMembership
    (e : PlaceOfPublicAccommodation) (est : Establishment) (s : StateActionSupport)
    (c : ComplaintText) : Prop where
  ppa          : IsPlaceOfPublicAccommodation e c
  servesPublic : IsEstablishmentServingPublic est c
  gate         : OperationsAffectCommerce est c ∨ IsSupportedByStateAction s c

end Proving.USC.T42.PublicAccommodations.Entitlement.Ontology
