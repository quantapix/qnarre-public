import Proving.USC.T20.Ontology.Types
import Proving.USC.T20.Ontology.Predicates
import Proving.USC.Common.Types








namespace Proving.USC.T20.Ontology



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String



def edge_educationalInstitution_dependsOn_higherEducation : DefEdge :=
  { defined := "educational institution",
    dependsOn := "institution of higher education",
    citeDefine := "20 USC § 1681(c)" }



def edge_coveredProgram_dependsOn_programOrActivity : DefEdge :=
  { defined := "education program or activity receiving Federal financial assistance",
    dependsOn := "education program or activity",
    citeDefine := "20 USC § 1681(a)" }



def edge_coveredProgram_dependsOn_federalFinancialAssistance : DefEdge :=
  { defined := "education program or activity receiving Federal financial assistance",
    dependsOn := "Federal financial assistance",
    citeDefine := "20 USC § 1681(a)" }



def edge_federalFinancialAssistance_dependsOn_forms : DefEdge :=
  { defined := "Federal financial assistance",
    dependsOn := "grant, loan, or contract other than a contract of insurance or guaranty",
    citeDefine := "20 USC § 1682" }



def edge_section1682Requirement_dependsOn_section1681 : DefEdge :=
  { defined := "requirement adopted pursuant to section 1682",
    dependsOn := "20 USC § 1681 nondiscrimination mandate",
    citeDefine := "20 USC § 1682" }



def edge_personAggrieved_dependsOn_person : DefEdge :=
  { defined := "person aggrieved",
    dependsOn := "person",
    citeDefine := "20 USC § 1683" }



def edge_personAggrieved_dependsOn_section1682Action : DefEdge :=
  { defined := "person aggrieved",
    dependsOn := "action taken pursuant to section 1682",
    citeDefine := "20 USC § 1683" }





inductive EducationalInstitutionDefinition (i : EducationalInstitution)
    (c : Common.ComplaintText) : Prop where
  | school (h : IsPreschoolElementaryOrSecondarySchool i c) :
      EducationalInstitutionDefinition i c
  | vocational (h : IsInstitutionOfVocationalEducation i c) :
      EducationalInstitutionDefinition i c
  | professional (h : IsInstitutionOfProfessionalEducation i c) :
      EducationalInstitutionDefinition i c
  | higherEducation (h : IsInstitutionOfHigherEducation i c) :
      EducationalInstitutionDefinition i c
  | separateUnit (h : IsAdministrativelySeparateUnit i c) :
      EducationalInstitutionDefinition i c



inductive FederalAssistanceFormDefinition (a : FederalAssistance)
    (c : Common.ComplaintText) : Prop where
  | grant (h : IsAssistanceByGrant a c) : FederalAssistanceFormDefinition a c
  | loan (h : IsAssistanceByLoan a c) : FederalAssistanceFormDefinition a c
  | contract (h : IsAssistanceByContractNotInsuranceOrGuaranty a c) :
      FederalAssistanceFormDefinition a c




inductive ExemptMembershipOrganizationDefinition (o : MembershipOrganization)
    (c : Common.ComplaintText) : Prop where
  | fraternityOrSorority (h : IsTaxExemptSocialFraternityOrSorority o c) :
      ExemptMembershipOrganizationDefinition o c
  | youthOrganization (h : IsSingleSexVoluntaryYouthOrganization o c) :
      ExemptMembershipOrganizationDefinition o c




structure CoveredProgramMembership (p : EducationProgramOrActivity)
    (a : FederalAssistance) (c : Common.ComplaintText) : Prop where
  program    : IsEducationProgramOrActivity p c
  assistance : IsFederalFinancialAssistance a c




structure AggrievedPersonMembership (p : Common.Person) (act : AgencyAction)
    (c : Common.ComplaintText) : Prop where
  action    : IsSection1682EnforcementAction act c
  aggrieved : IsPersonAggrieved p act c

end Proving.USC.T20.Ontology
