














import Proving.USC.T42.Ch6ASchI.Part3.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.Ch6ASchI.Part3.Ontology

open Proving.USC.Common






structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  dangling   : Bool := false


def edge_actor_dependsOn_scope : DefEdge :=
  { defined := "commissioned officer or employee of the PHS (covered actor)",
    dependsOn := "acting within the scope of his office or employment",
    citeDefine := "42 USC § 233(a)" }


def edge_deemed_dependsOn_entity : DefEdge :=
  { defined := "deemed to be an employee of the Public Health Service",
    dependsOn := "entity described in § 233(g)(4)",
    citeDefine := "42 USC § 233(g)(1)" }


def edge_entity_dependsOn_254b : DefEdge :=
  { defined := "entity described in § 233(g)(4)",
    dependsOn := "Federal funds under § 254b",
    citeDefine := "42 USC § 233(g)(4)", dangling := true }


def edge_coveredPerson_dependsOn_countermeasure : DefEdge :=
  { defined := "covered person",
    dependsOn := "covered countermeasure against smallpox",
    citeDefine := "42 USC § 233(p)(7)(B)" }


def edge_coveredPerson_dependsOn_qualified : DefEdge :=
  { defined := "covered person",
    dependsOn := "qualified person",
    citeDefine := "42 USC § 233(p)(7)(B)" }


def edge_fcProf_dependsOn_freeClinic : DefEdge :=
  { defined := "free clinic health professional",
    dependsOn := "free clinic",
    citeDefine := "42 USC § 233(o)(2)" }



def edge_fcProf_dependsOn_qhs : DefEdge :=
  { defined := "free clinic health professional",
    dependsOn := "qualifying health service",
    citeDefine := "42 USC § 233(o)(2)" }


def edge_hpv_dependsOn_entity : DefEdge :=
  { defined := "health professional volunteer",
    dependsOn := "entity described in § 233(g)(4)",
    citeDefine := "42 USC § 233(q)(2)" }


def edge_hcp_dependsOn_hcs : DefEdge :=
  { defined := "health care professional",
    dependsOn := "health care services",
    citeDefine := "42 USC § 234(d)(1)" }



def edge_council_dependsOn_center : DefEdge :=
  { defined := "National Advisory Council on Migrant Health member",
    dependsOn := "migrant health center",
    citeDefine := "42 USC § 218", dangling := true }


def edge_fiscalAgent_dependsOn_carrier : DefEdge :=
  { defined := "fiscal agent",
    dependsOn := "carrier described in § 1395u(f)(1)",
    citeDefine := "42 USC § 238m(e)", dangling := true }


def definitionalDAG : List DefEdge :=
  [ edge_actor_dependsOn_scope, edge_deemed_dependsOn_entity,
    edge_entity_dependsOn_254b, edge_coveredPerson_dependsOn_countermeasure,
    edge_coveredPerson_dependsOn_qualified, edge_fcProf_dependsOn_freeClinic,
    edge_fcProf_dependsOn_qhs, edge_hpv_dependsOn_entity, edge_hcp_dependsOn_hcs,
    edge_council_dependsOn_center, edge_fiscalAgent_dependsOn_carrier ]






structure ChanneledActor (p : Person) (c : ComplaintText) : Prop where
  officer : IsCommissionedOfficerOrEmployee p c
  inScope : ActsWithinScopeOfEmployment p c



structure DeemedEmployeeMembership (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  entity : IsDeemedEmployeeEntity e c
  deemed : IsDeemedPHSEmployee p c



structure CoveredPersonMembership (p : Person) (m : Countermeasure) (c : ComplaintText) : Prop where
  person        : IsCoveredPerson p c
  countermeasure : IsCoveredCountermeasure m c



structure FreeClinicProfessionalMembership
    (p : Person) (e : Entity) (s : HealthService) (c : ComplaintText) : Prop where
  professional : IsFreeClinicHealthProfessional p c
  clinic       : IsFreeClinic e c
  service      : IsQualifyingHealthService s c


structure HealthCareProfessionalService
    (p : Person) (s : HealthService) (c : ComplaintText) : Prop where
  professional : IsHealthCareProfessional p c
  service      : IsHealthCareService s c





inductive GiftClassification (g : Gift) (c : ComplaintText) : Prop
  | unconditional : IsUnconditionalGift g c → GiftClassification g c
  | conditional   : IsConditionalGift g c → GiftClassification g c

end Proving.USC.T42.Ch6ASchI.Part3.Ontology
