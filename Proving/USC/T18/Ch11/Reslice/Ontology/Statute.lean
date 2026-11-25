import Proving.USC.Common.Types
import Proving.USC.T18.Ch11.Reslice.Ontology.Types
import Proving.USC.T18.Ch11.Reslice.Ontology.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false
















namespace Proving.USC.T18.Ch11.Reslice.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String




def defEdges : List DefEdge :=
  [ { defined := "public official",          dependsOn := "official act",           citeDefine := "18 USC § 201(a)(1)" },
    { defined := "public official",          dependsOn := "Member of Congress",     citeDefine := "18 USC § 201(a)(1)" },
    { defined := "public official",          dependsOn := "officer or employee",    citeDefine := "18 USC § 201(a)(1)" },
    { defined := "person selected to be a public official", dependsOn := "public official", citeDefine := "18 USC § 201(a)(2)" },
    { defined := "special Government employee", dependsOn := "officer or employee",  citeDefine := "18 USC § 202(a)" },
    { defined := "special Government employee", dependsOn := "executive branch",     citeDefine := "18 USC § 202(a)" },
    { defined := "special Government employee", dependsOn := "legislative branch",   citeDefine := "18 USC § 202(a)" },
    { defined := "officer or employee",      dependsOn := "executive branch",       citeDefine := "18 USC § 202(c)" },
    { defined := "official responsibility",  dependsOn := "Government action",       citeDefine := "18 USC § 202(b)" },
    { defined := "Member of Congress",       dependsOn := "Member of the House of Representatives", citeDefine := "18 USC § 202(d)" },
    { defined := "covered matter",           dependsOn := "particular matter",      citeDefine := "18 USC § 205(h)" },
    { defined := "examiner",                 dependsOn := "Federal financial institution regulatory agency", citeDefine := "18 USC § 212(c)(1)" },
    { defined := "examiner",                 dependsOn := "financial institution",  citeDefine := "18 USC § 212(c)(1)" },
    { defined := "foreign entity",           dependsOn := "Foreign Agents Registration Act of 1938", citeDefine := "18 USC § 207(f)(3)" },
    { defined := "continuing financial crimes enterprise", dependsOn := "financial institution", citeDefine := "18 USC § 225(b)" },
    { defined := "clinical treatment facility", dependsOn := "health care benefit program", citeDefine := "18 USC § 220(e)(2)" },
    { defined := "recovery home",            dependsOn := "health care benefit program", citeDefine := "18 USC § 220(e)(5)" },
    { defined := "laboratory",               dependsOn := "health care benefit program", citeDefine := "18 USC § 220(e)(4)" },
    { defined := "covered government person", dependsOn := "Member of Congress",     citeDefine := "18 USC § 227(b)(1)" },
    { defined := "covered government person", dependsOn := "officer or employee",    citeDefine := "18 USC § 227(b)(3)" },
    { defined := "scheme in commerce",       dependsOn := "interstate or foreign commerce", citeDefine := "18 USC § 224(c)(1)" },
    { defined := "sporting contest",         dependsOn := "sporting contest",       citeDefine := "18 USC § 224(c)(2)" } ]





inductive GovernmentBranch where
  | executive
  | legislative
  | judicial


inductive MemberOfCongressRole where
  | senator
  | representative
  | delegate
  | residentCommissioner



inductive FederalRegulatoryAgencyKind where
  | comptrollerOfCurrency
  | federalReserveBoard
  | fdic
  | fhfa
  | farmCreditAdministration
  | farmCreditSystemInsurance
  | smallBusinessAdministration




inductive ReferralTarget (o : Organization) (c : ComplaintText) : Prop where
  | recoveryHome              (h : IsRecoveryHome o c)
  | clinicalTreatmentFacility (h : IsClinicalTreatmentFacility o c)
  | laboratory                (h : IsLaboratory o c)





structure IllegalRemunerationObject (target program : Organization)
    (c : ComplaintText) : Prop where
  referralTarget : ReferralTarget target c
  underProgram   : IsHealthCareBenefitProgram program c




structure ExaminerMembership (p : Person) (agency : Organization)
    (c : ComplaintText) : Prop where
  isExaminer : IsExaminer p c
  regulator  : IsFederalFinancialInstitutionRegulatoryAgency agency c



structure ContinuingFinancialCrimesEnterpriseMembership (e fi : Organization)
    (c : ComplaintText) : Prop where
  isEnterprise         : IsContinuingFinancialCrimesEnterprise e c
  affectsFinancialInst : IsFinancialInstitution fi c

end Proving.USC.T18.Ch11.Reslice.Ontology
