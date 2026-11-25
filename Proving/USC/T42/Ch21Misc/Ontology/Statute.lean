import Proving.USC.T42.Ch21Misc.Ontology.Types
import Proving.USC.T42.Ch21Misc.Ontology.Predicates








namespace Proving.USC.T42.Ch21Misc.Ontology

open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String





def edge_programOrActivity_dependsOn_federalAssistance : DefEdge :=
  { defined := "program or activity",
    dependsOn := "Federal financial assistance",
    citeDefine := "42 USC § 2000d-4a" }


def edge_programOrActivity_dependsOn_stateLocalGovernment : DefEdge :=
  { defined := "program or activity",
    dependsOn := "instrumentality of a State or local government",
    citeDefine := "42 USC § 2000d-4a(1)" }



def edge_programOrActivity_dependsOn_localEducationalAgency : DefEdge :=
  { defined := "program or activity",
    dependsOn := "local educational agency (20 USC § 7801)",
    citeDefine := "42 USC § 2000d-4a(2)(B)" }



def edge_religiousExemption_dependsOn_religion : DefEdge :=
  { defined := "religious-entity exemption",
    dependsOn := "religion",
    citeDefine := "42 USC § 2000e-1(a)" }



def edge_control_dependsOn_employer : DefEdge :=
  { defined := "employer controls a corporation",
    dependsOn := "employer",
    citeDefine := "42 USC § 2000e-1(c)(3)" }



def edge_attribution_dependsOn_control : DefEdge :=
  { defined := "presumed practice of controlling employer",
    dependsOn := "employer controls a corporation",
    citeDefine := "42 USC § 2000e-1(c)(1)" }



def edge_foreignEmployerCarveOut_dependsOn_control : DefEdge :=
  { defined := "foreign person not controlled by an American employer",
    dependsOn := "employer controls a corporation",
    citeDefine := "42 USC § 2000e-1(c)(2)" }



def edge_preemptedStateLaw_dependsOn_unlawfulEmploymentPractice : DefEdge :=
  { defined := "preempted State law",
    dependsOn := "unlawful employment practice",
    citeDefine := "42 USC § 2000e-7" }



def edge_notice_dependsOn_commission : DefEdge :=
  { defined := "Commission-approved notice",
    dependsOn := "Commission",
    citeDefine := "42 USC § 2000e-10(a)" }



def edge_personnelProtection_dependsOn_title18 : DefEdge :=
  { defined := "Commission personnel protection",
    dependsOn := "18 USC §§ 111, 1114",
    citeDefine := "42 USC § 2000e-13" }



def edge_acceptedPlan_dependsOn_ofcc : DefEdge :=
  { defined := "accepted affirmative action plan",
    dependsOn := "Office of Federal Contract Compliance",
    citeDefine := "42 USC § 2000e-17" }



def edge_contractorProtection_dependsOn_apa554 : DefEdge :=
  { defined := "accepted-plan contractor protection",
    dependsOn := "5 USC § 554 adjudication",
    citeDefine := "42 USC § 2000e-17" }


def ch21MiscDefEdges : List DefEdge :=
  [ edge_programOrActivity_dependsOn_federalAssistance,
    edge_programOrActivity_dependsOn_stateLocalGovernment,
    edge_programOrActivity_dependsOn_localEducationalAgency,
    edge_religiousExemption_dependsOn_religion,
    edge_control_dependsOn_employer,
    edge_attribution_dependsOn_control,
    edge_foreignEmployerCarveOut_dependsOn_control,
    edge_preemptedStateLaw_dependsOn_unlawfulEmploymentPractice,
    edge_notice_dependsOn_commission,
    edge_personnelProtection_dependsOn_title18,
    edge_acceptedPlan_dependsOn_ofcc,
    edge_contractorProtection_dependsOn_apa554 ]






inductive ProgramOrActivityMembership (e : Entity) (c : ComplaintText) : Prop where

  | govt (hOp : IsGovernmentalOperation e c)
         (hFFA : ReceivesFederalFinancialAssistance e c) :
      ProgramOrActivityMembership e c

  | education (hOp : IsEducationalOperation e c)
              (hFFA : ReceivesFederalFinancialAssistance e c) :
      ProgramOrActivityMembership e c

  | privateOrg (hOp : IsPrivateOrganizationOperation e c)
               (hFFA : ReceivesFederalFinancialAssistance e c) :
      ProgramOrActivityMembership e c

  | joint (hOp : IsJointlyEstablishedEntity e c)
          (hFFA : ReceivesFederalFinancialAssistance e c) :
      ProgramOrActivityMembership e c



structure EmployerControlsCorporation (er : Employer) (corp : Corporation)
    (c : ComplaintText) : Prop where
  interrelatedOperations : HasInterrelatedOperations er corp c
  commonManagement       : HasCommonManagement er corp c
  centralizedLabor       : HasCentralizedLaborRelationsControl er corp c
  commonOwnership        : HasCommonOwnershipOrFinancialControl er corp c



structure ForeignPracticeAttribution (er : Employer) (corp : Corporation)
    (c : ComplaintText) : Prop where
  foreignIncorporated : IsForeignIncorporated corp c
  control             : EmployerControlsCorporation er corp c


structure ReligiousEmployerExemption (e : Entity) (c : ComplaintText) : Prop where
  religiousEntity : IsReligiousEntity e c


structure AlienOverseasExemption (emp : EmploymentRelation) (c : ComplaintText) : Prop where
  outsideStates : IsEmploymentOfAliensOutsideStates emp c


structure ForeignLawDefense (emp : EmploymentRelation) (c : ComplaintText) : Prop where
  conflict : ForeignLawComplianceConflict emp c


structure ForeignEmployerCarveOut (er : Employer) (c : ComplaintText) : Prop where
  foreignPerson : IsForeignPersonNotAmericanControlled er c



structure PreemptedStateLaw (l : Law) (c : ComplaintText) : Prop where
  stateLaw : IsStateOrLocalLaw l c
  purports : PurportsToRequireUnlawfulEmploymentPractice l c


structure PostingViolation (e : Entity) (c : ComplaintText) : Prop where
  willful : WillfulPostingViolation e c


structure VeteransPreferenceSaving (l : Law) (c : ComplaintText) : Prop where
  vetLaw : IsVeteransPreferenceLaw l c


structure CommissionPersonnelProtection (p : Person) (c : ComplaintText) : Prop where
  personnel : IsCommissionPersonnel p c




structure AcceptedPlanContractorProtection (er : Employer)
    (pl : AffirmativeActionPlan) (c : ComplaintText) : Prop where
  planAccepted   : IsAcceptedAffirmativeActionPlan pl c
  remainedOnPlan : ¬ HasSubstantiallyDeviatedFromPlan er pl c

end Proving.USC.T42.Ch21Misc.Ontology
