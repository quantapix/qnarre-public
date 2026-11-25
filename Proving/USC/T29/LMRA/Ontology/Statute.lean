










import Proving.USC.Common.Types
import Proving.USC.T29.LMRA.Ontology.Types
import Proving.USC.T29.LMRA.Ontology.Predicates

namespace Proving.USC.T29.LMRA.Ontology

open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String





def edge_service_dependsOn_director : DefEdge :=
  { defined := "the Service", dependsOn := "the Director", citeDefine := "29 USC § 172(a)" }



def edge_service_dependsOn_laborDispute : DefEdge :=
  { defined := "the Service", dependsOn := "labor dispute", citeDefine := "29 USC § 173(a)" }


def edge_laborDispute_dependsOn_affectsCommerce : DefEdge :=
  { defined := "labor dispute", dependsOn := "affects commerce", citeDefine := "29 USC § 173(a)" }



def edge_nationalEmergency_dependsOn_affectsCommerce : DefEdge :=
  { defined := "national emergency dispute", dependsOn := "affects commerce", citeDefine := "29 USC § 176" }



def edge_nationalEmergency_dependsOn_boardOfInquiry : DefEdge :=
  { defined := "national emergency dispute", dependsOn := "board of inquiry", citeDefine := "29 USC § 176" }



def edge_boardOfInquiry_dependsOn_healthCareInstitution : DefEdge :=
  { defined := "board of inquiry", dependsOn := "health care institution", citeDefine := "29 USC § 183(a)" }



def edge_cbaContract_dependsOn_employer : DefEdge :=
  { defined := "CBA contract", dependsOn := "employer", citeDefine := "29 USC § 185(a)" }


def edge_cbaContract_dependsOn_laborOrganization : DefEdge :=
  { defined := "CBA contract", dependsOn := "labor organization", citeDefine := "29 USC § 185(a)" }



def edge_laborOrganization_dependsOn_affectsCommerce : DefEdge :=
  { defined := "labor organization", dependsOn := "affects commerce", citeDefine := "29 USC § 185(a)" }


def edge_laborOrganization_dependsOn_agent : DefEdge :=
  { defined := "labor organization", dependsOn := "agent", citeDefine := "29 USC § 185(e)" }


def edge_thingOfValue_dependsOn_representative : DefEdge :=
  { defined := "thing of value", dependsOn := "employee representative", citeDefine := "29 USC § 186(a)" }



def edge_trustFund_dependsOn_representative : DefEdge :=
  { defined := "trust fund", dependsOn := "employee representative", citeDefine := "29 USC § 186(c)(5)" }



def edge_section303_dependsOn_ulp : DefEdge :=
  { defined := "§ 303 unlawful conduct", dependsOn := "§ 158(b)(4) unfair labor practice", citeDefine := "29 USC § 187(a)" }


def defDag : List DefEdge :=
  [ edge_service_dependsOn_director,
    edge_service_dependsOn_laborDispute,
    edge_laborDispute_dependsOn_affectsCommerce,
    edge_nationalEmergency_dependsOn_affectsCommerce,
    edge_nationalEmergency_dependsOn_boardOfInquiry,
    edge_boardOfInquiry_dependsOn_healthCareInstitution,
    edge_cbaContract_dependsOn_employer,
    edge_cbaContract_dependsOn_laborOrganization,
    edge_laborOrganization_dependsOn_affectsCommerce,
    edge_laborOrganization_dependsOn_agent,
    edge_thingOfValue_dependsOn_representative,
    edge_trustFund_dependsOn_representative,
    edge_section303_dependsOn_ulp ]





structure ServiceMembership (s : Service) (d : Director) (c : ComplaintText) : Prop where
  isService  : IsService s c
  hasDirector : IsDirector d c



structure LaborDisputeMembership (disp : LaborDispute) (e : Entity) (c : ComplaintText) : Prop where
  isDispute       : IsLaborDispute disp c
  affectsCommerce : AffectsCommerce e c



structure NationalEmergencyMembership
    (ned : NationalEmergencyDispute) (e : Entity) (b : BoardOfInquiry) (c : ComplaintText) : Prop where
  isNationalEmergency : IsNationalEmergencyDispute ned c
  affectsCommerce     : AffectsCommerce e c
  hasBoard            : IsBoardOfInquiry b c



structure HealthCareBoardMembership
    (b : BoardOfInquiry) (h : HealthCareInstitution) (c : ComplaintText) : Prop where
  isBoard       : IsBoardOfInquiry b c
  isInstitution : IsHealthCareInstitution h c



structure CbaContractMembership
    (k : CbaContract) (emp : Employer) (org : LaborOrganization) (c : ComplaintText) : Prop where
  isContract       : IsCbaContract k c
  isEmployer       : IsEmployerAffectingCommerce emp c
  isLaborOrg       : IsLaborOrganization org c




structure ProhibitedPaymentMembership
    (v : ThingOfValue) (r : EmployeeRepresentative) (c : ComplaintText) : Prop where
  isThingOfValue : IsThingOfValue v c
  isRepresentative : IsEmployeeRepresentative r c



structure TrustFundMembership
    (tf : TrustFund) (r : EmployeeRepresentative) (c : ComplaintText) : Prop where
  isTrustFund      : IsTrustFund tf c
  isRepresentative : IsEmployeeRepresentative r c



structure Section303Membership
    (org : LaborOrganization) (c : ComplaintText) : Prop where
  isLaborOrg : IsLaborOrganization org c
  isUlp      : IsSection158b4UnfairLaborPractice c

end Proving.USC.T29.LMRA.Ontology
