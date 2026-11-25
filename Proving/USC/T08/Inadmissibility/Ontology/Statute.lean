







import Proving.USC.T08.Inadmissibility.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T08.Inadmissibility.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def edge_unauthorized_dependsOn_alien : DefEdge :=
  { defined := "unauthorized alien", dependsOn := "alien",
    citeDefine := "8 USC § 1324a(h)(3)" }


def edge_unauthorized_dependsOn_lpr : DefEdge :=
  { defined := "unauthorized alien", dependsOn := "lawful permanent resident",
    citeDefine := "8 USC § 1324a(h)(3)" }


def edge_unauthorized_dependsOn_authorization : DefEdge :=
  { defined := "unauthorized alien", dependsOn := "authorized to be employed",
    citeDefine := "8 USC § 1324a(h)(3)" }


def edge_engages_dependsOn_activity : DefEdge :=
  { defined := "engage in terrorist activity", dependsOn := "terrorist activity",
    citeDefine := "8 USC § 1182(a)(3)(B)(iv)" }


def edge_terroristOrg_dependsOn_activity : DefEdge :=
  { defined := "terrorist organization", dependsOn := "terrorist activity",
    citeDefine := "8 USC § 1182(a)(3)(B)(vi)" }


def edge_representative_dependsOn_org : DefEdge :=
  { defined := "representative", dependsOn := "organization",
    citeDefine := "8 USC § 1182(a)(3)(B)(v)" }



def edge_securityGround_dependsOn_engages : DefEdge :=
  { defined := "security ground (§ 1182(a)(3))",
    dependsOn := "engage in terrorist activity",
    citeDefine := "8 USC § 1182(a)(3)" }


def edge_inadmissible_dependsOn_alien : DefEdge :=
  { defined := "inadmissible alien", dependsOn := "alien",
    citeDefine := "8 USC § 1182(a)" }


def definitionalEdges : List DefEdge :=
  [ edge_unauthorized_dependsOn_alien, edge_unauthorized_dependsOn_lpr,
    edge_unauthorized_dependsOn_authorization, edge_engages_dependsOn_activity,
    edge_terroristOrg_dependsOn_activity, edge_representative_dependsOn_org,
    edge_securityGround_dependsOn_engages, edge_inadmissible_dependsOn_alien ]





structure UnauthorizedAlienMembership (a : Alien) (c : ComplaintText) : Prop where
  isAlien       : IsAlien a c
  notLPR        : ¬ IsLawfulPermanentResident a c
  notAuthorized : ¬ IsAuthorizedToWork a c
  unauthorized  : IsUnauthorizedAlien a c



structure TerroristOrganizationMembership
    (o : Organization) (act : Activity) (c : ComplaintText) : Prop where
  constituentActivity : IsTerroristActivity act c
  isOrganization      : IsTerroristOrganization o c



structure RepresentativeMembership
    (a : Alien) (o : Organization) (c : ComplaintText) : Prop where
  ofOrganization : IsTerroristOrganization o c
  isRepresentative : IsRepresentative a o c



structure SecurityGroundMembership (a : Alien) (c : ComplaintText) : Prop where
  engages  : EngagesInTerroristActivity a c
  security : IsSecurityGround a c



structure EntityMembership (e : Entity) (c : ComplaintText) : Prop where
  isEntity : IsEntity e c





inductive IsInadmissibleAlien (a : Alien) (c : ComplaintText) : Prop where
  | health            (h : IsHealthRelatedGround a c)        : IsInadmissibleAlien a c
  | criminal          (h : IsCriminalGround a c)             : IsInadmissibleAlien a c
  | security          (h : IsSecurityGround a c)             : IsInadmissibleAlien a c
  | publicCharge      (h : IsPublicChargeGround a c)         : IsInadmissibleAlien a c
  | laborCert         (h : IsLaborCertGround a c)            : IsInadmissibleAlien a c
  | illegalEntrant    (h : IsIllegalEntrantGround a c)       : IsInadmissibleAlien a c
  | documentation     (h : IsDocumentationGround a c)        : IsInadmissibleAlien a c
  | ineligibleCitizen (h : IsIneligibleCitizenshipGround a c): IsInadmissibleAlien a c
  | previouslyRemoved (h : IsPreviouslyRemovedGround a c)    : IsInadmissibleAlien a c
  | miscellaneous     (h : IsMiscellaneousGround a c)        : IsInadmissibleAlien a c

end Proving.USC.T08.Inadmissibility.Ontology
