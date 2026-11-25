













import Proving.USC.T29.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T29.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_employer_dependsOn_person : DefEdge :=
  { defined := "employer", dependsOn := "person", citeDefine := "29 USC § 152(2)" }



def edge_employee_dependsOn_supervisor : DefEdge :=
  { defined := "employee", dependsOn := "supervisor", citeDefine := "29 USC § 152(3)" }




def edge_employee_dependsOn_employer : DefEdge :=
  { defined := "employee", dependsOn := "employer", citeDefine := "29 USC § 152(3)" }



def edge_employee_dependsOn_laborDispute : DefEdge :=
  { defined := "employee", dependsOn := "labor dispute", citeDefine := "29 USC § 152(3)" }



def edge_laborOrganization_dependsOn_employee : DefEdge :=
  { defined := "labor organization", dependsOn := "employee", citeDefine := "29 USC § 152(5)" }



def edge_laborOrganization_dependsOn_employer : DefEdge :=
  { defined := "labor organization", dependsOn := "employer", citeDefine := "29 USC § 152(5)" }



def edge_representatives_dependsOn_laborOrganization : DefEdge :=
  { defined := "representatives", dependsOn := "labor organization", citeDefine := "29 USC § 152(4)" }


def edge_affectingCommerce_dependsOn_commerce : DefEdge :=
  { defined := "affecting commerce", dependsOn := "commerce", citeDefine := "29 USC § 152(7)" }



def edge_affectingCommerce_dependsOn_laborDispute : DefEdge :=
  { defined := "affecting commerce", dependsOn := "labor dispute", citeDefine := "29 USC § 152(7)" }



def edge_unfairLaborPractice_dependsOn_section158 : DefEdge :=
  { defined := "unfair labor practice", dependsOn := "section 158 (listed practices)",
    citeDefine := "29 USC § 152(8)" }



def edge_board_dependsOn_section153 : DefEdge :=
  { defined := "National Labor Relations Board", dependsOn := "section 153 (the Board)",
    citeDefine := "29 USC § 152(10)" }


def defEdges : List DefEdge :=
  [ edge_employer_dependsOn_person,
    edge_employee_dependsOn_supervisor,
    edge_employee_dependsOn_employer,
    edge_employee_dependsOn_laborDispute,
    edge_laborOrganization_dependsOn_employee,
    edge_laborOrganization_dependsOn_employer,
    edge_representatives_dependsOn_laborOrganization,
    edge_affectingCommerce_dependsOn_commerce,
    edge_affectingCommerce_dependsOn_laborDispute,
    edge_unfairLaborPractice_dependsOn_section158,
    edge_board_dependsOn_section153 ]





structure EmployerMembership (e : Employer) (c : ComplaintText) : Prop where
  isEmployer  : IsEmployer e c
  notExcluded : ¬ IsSection152EmployerExcluded e c



structure EmployeeMembership (e : Employee) (c : ComplaintText) : Prop where
  isEmployee  : IsEmployee e c
  notExcluded : ¬ IsSection152EmployeeExcluded e c




structure LaborOrganizationMembership (l : LaborOrganization) (c : ComplaintText) : Prop where
  isLaborOrg : IsLaborOrganization l c



structure AffectingCommerceMembership (k : Commerce) (c : ComplaintText) : Prop where
  commerce  : IsCommerce k c
  affecting : IsAffectingCommerce k c



structure UnfairLaborPracticeMembership (u : UnfairLaborPractice) (c : ComplaintText) : Prop where
  isUlp : IsUnfairLaborPractice u c





inductive PersonCase (p : Person) (c : ComplaintText) : Prop where
  | individual         : IsPerson p c → PersonCase p c
  | laborOrganization  : IsPerson p c → PersonCase p c
  | partnershipOrAssoc : IsPerson p c → PersonCase p c
  | corporation        : IsPerson p c → PersonCase p c
  | legalRepOrTrustee  : IsPerson p c → PersonCase p c

end Proving.USC.T29.Ontology
