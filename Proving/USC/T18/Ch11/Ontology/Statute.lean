







import Proving.USC.T18.Ch11.Ontology.Predicates

namespace Proving.USC.T18.Ch11.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  deriving Repr


def edge_sge_dependsOn_officerOrEmployee : DefEdge :=
  { defined := "special Government employee", dependsOn := "officer or employee",
    citeDefine := "18 USC § 202(a)" }


def edge_sge_dependsOn_executiveBranch : DefEdge :=
  { defined := "special Government employee", dependsOn := "executive branch",
    citeDefine := "18 USC § 202(a)" }


def edge_sge_dependsOn_legislativeBranch : DefEdge :=
  { defined := "special Government employee", dependsOn := "legislative branch",
    citeDefine := "18 USC § 202(a)" }


def edge_memberOfCongress_dependsOn_senator : DefEdge :=
  { defined := "Member of Congress", dependsOn := "Senator",
    citeDefine := "18 USC § 202(d)" }


def edge_memberOfCongress_dependsOn_representative : DefEdge :=
  { defined := "Member of Congress",
    dependsOn := "Representative, Delegate, or Resident Commissioner",
    citeDefine := "18 USC § 202(d)" }


def edge_officialAct_dependsOn_publicOfficial : DefEdge :=
  { defined := "official act", dependsOn := "public official",
    citeDefine := "18 USC § 201(a)(3)" }


def edge_coveredMatter_dependsOn_particularMatter : DefEdge :=
  { defined := "covered matter", dependsOn := "particular matter",
    citeDefine := "18 USC § 205(h)" }


def edge_examiner_dependsOn_regulatoryAgency : DefEdge :=
  { defined := "examiner", dependsOn := "Federal financial institution regulatory agency",
    citeDefine := "18 USC § 212(c)(1)" }


def edge_examiner_dependsOn_financialInstitution : DefEdge :=
  { defined := "examiner", dependsOn := "financial institution",
    citeDefine := "18 USC § 212(c)(1)" }


def edge_s213Examiner_dependsOn_s212Examiner : DefEdge :=
  { defined := "examiner (§ 213)", dependsOn := "examiner (§ 212)",
    citeDefine := "18 USC § 213(b)" }


def edge_s213FinancialInstitution_dependsOn_s212 : DefEdge :=
  { defined := "financial institution (§ 213)", dependsOn := "financial institution (§ 212)",
    citeDefine := "18 USC § 213(b)" }


def edge_s213Loan_dependsOn_s212 : DefEdge :=
  { defined := "loan (§ 213)", dependsOn := "loan (§ 212)",
    citeDefine := "18 USC § 213(b)" }


def edge_s219PublicOfficial_dependsOn_s201 : DefEdge :=
  { defined := "public official (§ 219)", dependsOn := "public official (§ 201)",
    citeDefine := "18 USC § 219(c)" }


def edge_cfce_dependsOn_financialInstitution : DefEdge :=
  { defined := "continuing financial crimes enterprise", dependsOn := "financial institution",
    citeDefine := "18 USC § 225(b)" }


def edge_recoveryHome_dependsOn_hcbp : DefEdge :=
  { defined := "recovery home", dependsOn := "health care benefit program",
    citeDefine := "18 USC § 220(e)(5)" }


def edge_clinicalTreatmentFacility_dependsOn_hcbp : DefEdge :=
  { defined := "clinical treatment facility", dependsOn := "health care benefit program",
    citeDefine := "18 USC § 220(e)(2)" }


def edge_coveredGovernmentPerson_dependsOn_memberOfCongress : DefEdge :=
  { defined := "covered government person", dependsOn := "Member of Congress",
    citeDefine := "18 USC § 227(b)" }


def edge_coveredGovernmentPerson_dependsOn_executiveBranchEmployee : DefEdge :=
  { defined := "covered government person", dependsOn := "executive branch employee",
    citeDefine := "18 USC § 227(b)(3)" }


def ch11DefEdges : List DefEdge :=
  [ edge_sge_dependsOn_officerOrEmployee,
    edge_sge_dependsOn_executiveBranch,
    edge_sge_dependsOn_legislativeBranch,
    edge_memberOfCongress_dependsOn_senator,
    edge_memberOfCongress_dependsOn_representative,
    edge_officialAct_dependsOn_publicOfficial,
    edge_coveredMatter_dependsOn_particularMatter,
    edge_examiner_dependsOn_regulatoryAgency,
    edge_examiner_dependsOn_financialInstitution,
    edge_s213Examiner_dependsOn_s212Examiner,
    edge_s213FinancialInstitution_dependsOn_s212,
    edge_s213Loan_dependsOn_s212,
    edge_s219PublicOfficial_dependsOn_s201,
    edge_cfce_dependsOn_financialInstitution,
    edge_recoveryHome_dependsOn_hcbp,
    edge_clinicalTreatmentFacility_dependsOn_hcbp,
    edge_coveredGovernmentPerson_dependsOn_memberOfCongress,
    edge_coveredGovernmentPerson_dependsOn_executiveBranchEmployee ]





structure SpecialGovtEmployeeMembership (p : Person) (c : ComplaintText) : Prop where
  base : IsOfficerOrEmployee p c
  sge  : IsSpecialGovernmentEmployee p c



structure ExaminerMembership (ex : Person) (agency fi : Entity) (c : ComplaintText) : Prop where
  appointer : IsFederalFinancialInstitutionRegulatoryAgency agency c
  examined  : IsFinancialInstitution fi c
  examiner  : IsExaminer ex c


structure OfficialActMembership (m : Matter) (p : Person) (c : ComplaintText) : Prop where
  act      : IsOfficialAct m c
  official : IsPublicOfficial p c



structure ContinuingFinancialCrimesEnterpriseMembership
    (ent fi : Entity) (c : ComplaintText) : Prop where
  enterprise : IsContinuingFinancialCrimesEnterprise ent c
  affectsFI  : IsFinancialInstitution fi c





inductive MemberOfCongressDefn (p : Person) (c : ComplaintText) : Prop where
  | senator (h : IsSenator p c) : MemberOfCongressDefn p c
  | representative (h : IsRepresentativeDelegateOrResidentCommissioner p c) :
      MemberOfCongressDefn p c



inductive CoveredGovernmentPersonDefn (p : Person) (c : ComplaintText) : Prop where
  | member (h : IsMemberOfCongress p c) : CoveredGovernmentPersonDefn p c
  | congressional (h : IsCongressionalEmployee p c) : CoveredGovernmentPersonDefn p c
  | executive (h : IsExecutiveBranchEmployee p c) : CoveredGovernmentPersonDefn p c



inductive ReferralTargetDefn (e : Entity) (c : ComplaintText) : Prop where
  | recoveryHome (h : IsRecoveryHome e c) : ReferralTargetDefn e c
  | clinicalTreatmentFacility (h : IsClinicalTreatmentFacility e c) : ReferralTargetDefn e c
  | laboratory (h : IsLaboratory e c) : ReferralTargetDefn e c

end Proving.USC.T18.Ch11.Ontology
