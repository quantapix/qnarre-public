


















import Proving.USC.T42.TitleVII.Ontology.Predicates

namespace Proving.USC.T42.TitleVII.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  deriving Repr


def edge_employer_person : DefEdge :=
  { defined := "employer", dependsOn := "person", citeDefine := "42 USC § 2000e(b)" }


def edge_employer_affectingCommerce : DefEdge :=
  { defined := "employer", dependsOn := "industry affecting commerce",
    citeDefine := "42 USC § 2000e(b)" }


def edge_employer_employee : DefEdge :=
  { defined := "employer", dependsOn := "employee", citeDefine := "42 USC § 2000e(b)" }


def edge_employmentAgency_employer : DefEdge :=
  { defined := "employment agency", dependsOn := "employer",
    citeDefine := "42 USC § 2000e(c)" }


def edge_employmentAgency_employee : DefEdge :=
  { defined := "employment agency", dependsOn := "employee",
    citeDefine := "42 USC § 2000e(c)" }


def edge_laborOrg_affectingCommerce : DefEdge :=
  { defined := "labor organization", dependsOn := "industry affecting commerce",
    citeDefine := "42 USC § 2000e(d)" }


def edge_laborOrg_employer : DefEdge :=
  { defined := "labor organization", dependsOn := "employer",
    citeDefine := "42 USC § 2000e(d)" }


def edge_employee_employer : DefEdge :=
  { defined := "employee", dependsOn := "employer", citeDefine := "42 USC § 2000e(f)" }


def edge_affectingCommerce_commerce : DefEdge :=
  { defined := "industry affecting commerce", dependsOn := "commerce",
    citeDefine := "42 USC § 2000e(h)" }


def edge_respondent_employer : DefEdge :=
  { defined := "respondent", dependsOn := "employer", citeDefine := "42 USC § 2000e(n)" }


def edge_respondent_employmentAgency : DefEdge :=
  { defined := "respondent", dependsOn := "employment agency",
    citeDefine := "42 USC § 2000e(n)" }


def edge_respondent_laborOrg : DefEdge :=
  { defined := "respondent", dependsOn := "labor organization",
    citeDefine := "42 USC § 2000e(n)" }


def edge_complainingParty_person : DefEdge :=
  { defined := "complaining party", dependsOn := "person",
    citeDefine := "42 USC § 2000e(l)" }



def edge_unlawfulPractice_employer : DefEdge :=
  { defined := "unlawful employment practice", dependsOn := "employer",
    citeDefine := "42 USC § 2000e-2(a)" }


def edge_unlawfulPractice_employee : DefEdge :=
  { defined := "unlawful employment practice", dependsOn := "employee",
    citeDefine := "42 USC § 2000e-2(a)" }


def edge_retaliation_protectedActivity : DefEdge :=
  { defined := "unlawful employment practice (retaliation)",
    dependsOn := "protected activity", citeDefine := "42 USC § 2000e-3(a)" }


def definitionalDag : List DefEdge :=
  [ edge_employer_person, edge_employer_affectingCommerce, edge_employer_employee,
    edge_employmentAgency_employer, edge_employmentAgency_employee,
    edge_laborOrg_affectingCommerce, edge_laborOrg_employer,
    edge_employee_employer, edge_affectingCommerce_commerce,
    edge_respondent_employer, edge_respondent_employmentAgency,
    edge_respondent_laborOrg, edge_complainingParty_person,
    edge_unlawfulPractice_employer, edge_unlawfulPractice_employee,
    edge_retaliation_protectedActivity ]







structure EmployerMembership (e : Employer) (p : TPerson) (ent : Entity)
    (c : ComplaintText) : Prop where
  isEmployer    : IsEmployer e c
  isPerson      : IsPerson p c
  affectsComm   : AffectsCommerce ent c



structure EmploymentAgencyMembership (a : EmploymentAgency) (p : TPerson)
    (c : ComplaintText) : Prop where
  isAgency : IsEmploymentAgency a c
  isPerson : IsPerson p c



structure LaborOrganizationMembership (l : LaborOrganization) (ent : Entity)
    (c : ComplaintText) : Prop where
  isLaborOrg  : IsLaborOrganization l c
  affectsComm : AffectsCommerce ent c



structure IndustryAffectingCommerceMembership (ent : Entity) (x : Commerce)
    (c : ComplaintText) : Prop where
  affectsComm : AffectsCommerce ent c
  isCommerce  : IsCommerce x c


inductive RespondentKind (c : ComplaintText) : Prop where
  | employer        (e : Employer)          (h : IsEmployer e c)          : RespondentKind c
  | employmentAgency (a : EmploymentAgency)  (h : IsEmploymentAgency a c)  : RespondentKind c
  | laborOrg        (l : LaborOrganization)  (h : IsLaborOrganization l c) : RespondentKind c








structure UnlawfulPractice (x : EmploymentPractice) (c : ComplaintText) : Prop where
  respondent  : RespondentKind c
  isUnlawful  : IsUnlawfulEmploymentPractice x c


structure MotivatingFactorPractice (x : EmploymentPractice) (c : ComplaintText) : Prop where
  base       : UnlawfulPractice x c
  motivating : IsMotivatingFactor x c



structure RetaliationPractice (x : EmploymentPractice) (a : ProtectedActivity)
    (c : ComplaintText) : Prop where
  respondent : RespondentKind c
  protected_ : IsProtectedActivity a c
  isUnlawful : IsUnlawfulEmploymentPractice x c



structure FederalSectorPractice (act : PersonnelAction) (x : EmploymentPractice)
    (c : ComplaintText) : Prop where
  isPersonnelAction : IsPersonnelAction act c
  isUnlawful        : IsUnlawfulEmploymentPractice x c

end Proving.USC.T42.TitleVII.Ontology
