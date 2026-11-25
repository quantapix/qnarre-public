import Proving.USC.T20.Ontology.Types
import Proving.USC.Common.Types







namespace Proving.USC.T20.Ontology





axiom IsEducationalInstitution (i : EducationalInstitution)
    (c : Common.ComplaintText) : Prop





axiom IsAdministrativelySeparateUnit (i : EducationalInstitution)
    (c : Common.ComplaintText) : Prop




axiom IsPreschoolElementaryOrSecondarySchool (i : EducationalInstitution)
    (c : Common.ComplaintText) : Prop




axiom IsInstitutionOfVocationalEducation (i : EducationalInstitution)
    (c : Common.ComplaintText) : Prop




axiom IsInstitutionOfProfessionalEducation (i : EducationalInstitution)
    (c : Common.ComplaintText) : Prop




axiom IsInstitutionOfGraduateHigherEducation (i : EducationalInstitution)
    (c : Common.ComplaintText) : Prop




axiom IsPublicInstitutionOfUndergraduateHigherEducation
    (i : EducationalInstitution) (c : Common.ComplaintText) : Prop





axiom IsInstitutionOfHigherEducation (i : EducationalInstitution)
    (c : Common.ComplaintText) : Prop





axiom IsReligiouslyControlledInstitution (i : EducationalInstitution)
    (c : Common.ComplaintText) : Prop




axiom IsMilitaryTrainingInstitution (i : EducationalInstitution)
    (c : Common.ComplaintText) : Prop





axiom IsTraditionallySingleSexPublicInstitution (i : EducationalInstitution)
    (c : Common.ComplaintText) : Prop





axiom IsTaxExemptSocialFraternityOrSorority (o : MembershipOrganization)
    (c : Common.ComplaintText) : Prop





axiom IsSingleSexVoluntaryYouthOrganization (o : MembershipOrganization)
    (c : Common.ComplaintText) : Prop





axiom IsEducationProgramOrActivity (p : EducationProgramOrActivity)
    (c : Common.ComplaintText) : Prop





axiom IsFederalFinancialAssistance (a : FederalAssistance)
    (c : Common.ComplaintText) : Prop



axiom IsAssistanceByGrant (a : FederalAssistance)
    (c : Common.ComplaintText) : Prop



axiom IsAssistanceByLoan (a : FederalAssistance)
    (c : Common.ComplaintText) : Prop




axiom IsAssistanceByContractNotInsuranceOrGuaranty (a : FederalAssistance)
    (c : Common.ComplaintText) : Prop





axiom IsFederalAgency (g : FederalAgency)
    (c : Common.ComplaintText) : Prop




axiom IsRecipient (r : Recipient)
    (c : Common.ComplaintText) : Prop




axiom IsSection1682Requirement (q : AdministrativeRequirement)
    (c : Common.ComplaintText) : Prop





axiom IsSection1682EnforcementAction (act : AgencyAction)
    (c : Common.ComplaintText) : Prop




axiom IsPersonAggrieved (p : Common.Person) (act : AgencyAction)
    (c : Common.ComplaintText) : Prop




axiom IsStateOrPoliticalSubdivision (p : Common.Person)
    (c : Common.ComplaintText) : Prop

end Proving.USC.T20.Ontology
