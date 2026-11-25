














import Proving.USC.T42.TitleVIIDef.Ontology.Predicates

namespace Proving.USC.T42.TitleVIIDef.Ontology

open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String




def edge_employer_dependsOn_person : DefEdge :=
  { defined := "employer", dependsOn := "person", citeDefine := "42 USC § 2000e(b)" }


def edge_employer_dependsOn_industryAffectingCommerce : DefEdge :=
  { defined := "employer", dependsOn := "industry affecting commerce",
    citeDefine := "42 USC § 2000e(b)" }



def edge_employmentAgency_dependsOn_employer : DefEdge :=
  { defined := "employment agency", dependsOn := "employer",
    citeDefine := "42 USC § 2000e(c)" }



def edge_laborOrganization_dependsOn_industryAffectingCommerce : DefEdge :=
  { defined := "labor organization", dependsOn := "industry affecting commerce",
    citeDefine := "42 USC § 2000e(d)" }



def edge_laborOrganization_dependsOn_employer : DefEdge :=
  { defined := "labor organization", dependsOn := "employer",
    citeDefine := "42 USC § 2000e(d)" }


def edge_employee_dependsOn_employer : DefEdge :=
  { defined := "employee", dependsOn := "employer", citeDefine := "42 USC § 2000e(f)" }


def edge_industryAffectingCommerce_dependsOn_commerce : DefEdge :=
  { defined := "industry affecting commerce", dependsOn := "commerce",
    citeDefine := "42 USC § 2000e(h)" }


def edge_complainingParty_dependsOn_person : DefEdge :=
  { defined := "complaining party", dependsOn := "person",
    citeDefine := "42 USC § 2000e(l)" }


def edge_respondent_dependsOn_employer : DefEdge :=
  { defined := "respondent", dependsOn := "employer", citeDefine := "42 USC § 2000e(n)" }


def edge_respondent_dependsOn_employmentAgency : DefEdge :=
  { defined := "respondent", dependsOn := "employment agency",
    citeDefine := "42 USC § 2000e(n)" }


def edge_respondent_dependsOn_laborOrganization : DefEdge :=
  { defined := "respondent", dependsOn := "labor organization",
    citeDefine := "42 USC § 2000e(n)" }




def edge_uep_dependsOn_employer : DefEdge :=
  { defined := "unlawful employment practice", dependsOn := "employer",
    citeDefine := "42 USC § 2000e-2(a)" }


def edge_uep_dependsOn_employmentAgency : DefEdge :=
  { defined := "unlawful employment practice", dependsOn := "employment agency",
    citeDefine := "42 USC § 2000e-2(b)" }


def edge_uep_dependsOn_laborOrganization : DefEdge :=
  { defined := "unlawful employment practice", dependsOn := "labor organization",
    citeDefine := "42 USC § 2000e-2(c)" }


def edge_uep_dependsOn_employee : DefEdge :=
  { defined := "unlawful employment practice", dependsOn := "employee",
    citeDefine := "42 USC § 2000e-2(a)" }


def definitionalDAG : List DefEdge :=
  [ edge_employer_dependsOn_person,
    edge_employer_dependsOn_industryAffectingCommerce,
    edge_employmentAgency_dependsOn_employer,
    edge_laborOrganization_dependsOn_industryAffectingCommerce,
    edge_laborOrganization_dependsOn_employer,
    edge_employee_dependsOn_employer,
    edge_industryAffectingCommerce_dependsOn_commerce,
    edge_complainingParty_dependsOn_person,
    edge_respondent_dependsOn_employer,
    edge_respondent_dependsOn_employmentAgency,
    edge_respondent_dependsOn_laborOrganization,
    edge_uep_dependsOn_employer,
    edge_uep_dependsOn_employmentAgency,
    edge_uep_dependsOn_laborOrganization,
    edge_uep_dependsOn_employee ]









structure EmployerMembership (x : Employer) (c : ComplaintText) : Prop where
  engagedInCommerce : EngagedInIndustryAffectingCommerce x c
  meetsThreshold    : MeetsEmployerCoverageThreshold x c
  isEmployer        : IsEmployer x c




inductive RespondentMembership (c : ComplaintText) : Prop where
  | viaEmployer        (x : Employer)          (h : IsEmployer x c)          : RespondentMembership c
  | viaEmploymentAgency (x : EmploymentAgency) (h : IsEmploymentAgency x c)  : RespondentMembership c
  | viaLaborOrg        (x : LaborOrganization) (h : IsLaborOrganization x c) : RespondentMembership c





structure UnlawfulEmploymentPracticeMembership
    (x : UnlawfulEmploymentPractice) (c : ComplaintText) : Prop where
  coveredActor : RespondentMembership c
  affectsEmployee : ∃ e : Employee, IsEmployee e c
  practice : IsUnlawfulEmploymentPractice x c

end Proving.USC.T42.TitleVIIDef.Ontology
