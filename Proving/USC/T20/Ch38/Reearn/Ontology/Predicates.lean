import Proving.USC.T20.Ch38.Reearn.Ontology.Types









set_option autoImplicit false

namespace Proving.USC.T20.Ch38.Reearn.Ontology

open Proving.USC.Common



axiom IsEducationalInstitution (i : EducationalInstitution) (c : ComplaintText) : Prop



axiom IsPreschool (i : EducationalInstitution) (c : ComplaintText) : Prop



axiom IsElementarySchool (i : EducationalInstitution) (c : ComplaintText) : Prop



axiom IsSecondarySchool (i : EducationalInstitution) (c : ComplaintText) : Prop



axiom IsInstitutionOfVocationalEducation (i : EducationalInstitution) (c : ComplaintText) : Prop



axiom IsInstitutionOfProfessionalEducation (i : EducationalInstitution) (c : ComplaintText) : Prop



axiom IsInstitutionOfHigherEducation (i : EducationalInstitution) (c : ComplaintText) : Prop



axiom IsCompositeEducationalInstitution (i : EducationalInstitution) (c : ComplaintText) : Prop



axiom IsAdministrativelySeparateUnitOf (u : AdministrativeUnit) (i : EducationalInstitution) (c : ComplaintText) : Prop



axiom DenotesUnitAsEducationalInstitution (u : AdministrativeUnit) (c : ComplaintText) : Prop



axiom IsInstitutionOfGraduateHigherEducation (i : EducationalInstitution) (c : ComplaintText) : Prop



axiom IsPublicInstitutionOfUndergraduateHigherEducation (i : EducationalInstitution) (c : ComplaintText) : Prop



axiom IsInstitutionTransitioningToCoeducation (i : EducationalInstitution) (c : ComplaintText) : Prop



axiom HasApprovedTransitionPlan (i : EducationalInstitution) (c : ComplaintText) : Prop



axiom IsReligiousOrganization (o : ReligiousOrganization) (c : ComplaintText) : Prop



axiom IsControlledByReligiousOrganization (i : EducationalInstitution) (o : ReligiousOrganization) (c : ComplaintText) : Prop



axiom InconsistentWithReligiousTenets (o : ReligiousOrganization) (c : ComplaintText) : Prop



axiom IsMilitaryOrMerchantMarineTrainingInstitution (i : EducationalInstitution) (c : ComplaintText) : Prop



axiom IsTraditionallySingleSexPublicUndergraduateInstitution (i : EducationalInstitution) (c : ComplaintText) : Prop



axiom IsMembershipPracticeOf (m : MembershipPractice) (e : Entity) (c : ComplaintText) : Prop



axiom IsTaxExemptSocialFraternityOrSorority (e : Entity) (c : ComplaintText) : Prop



axiom IsExemptVoluntaryYouthServiceOrganization (e : Entity) (c : ComplaintText) : Prop



axiom IsBoysOrGirlsStateOrNationConference (f : YouthConference) (c : ComplaintText) : Prop



axiom IsFatherSonOrMotherDaughterActivity (a : SingleSexActivity) (c : ComplaintText) : Prop



axiom IsReasonablyComparableActivity (a : SingleSexActivity) (b : SingleSexActivity) (c : ComplaintText) : Prop



axiom IsSingleSexPageantAward (w : PageantAward) (c : ComplaintText) : Prop



axiom IsPersonInUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom IsSexGround (g : ProtectedGround) (c : ComplaintText) : Prop



axiom IsEducationProgramOrActivity (p : ProgramOrActivity) (c : ComplaintText) : Prop



axiom ReceivesFederalFinancialAssistance (p : ProgramOrActivity) (c : ComplaintText) : Prop



axiom IsFederalFinancialAssistance (f : FederalFinancialAssistance) (c : ComplaintText) : Prop



axiom IsExtendedByGrantLoanOrContract (f : FederalFinancialAssistance) (c : ComplaintText) : Prop



axiom IsContractOfInsuranceOrGuaranty (f : FederalFinancialAssistance) (c : ComplaintText) : Prop



axiom IsFederalDepartmentOrAgency (a : FederalAgency) (c : ComplaintText) : Prop



axiom IsEmpoweredToExtendFederalFinancialAssistance (a : FederalAgency) (c : ComplaintText) : Prop



axiom IsRecipientOfFederalFinancialAssistance (r : Recipient) (c : ComplaintText) : Prop



axiom IsPoliticalEntityOrPartThereof (r : Recipient) (c : ComplaintText) : Prop



axiom IsPersonAggrieved (p : Person) (c : ComplaintText) : Prop



axiom IsStateOrPoliticalSubdivisionOrAgencyThereof (p : Person) (c : ComplaintText) : Prop



axiom IsBlindnessOrSeverelyImpairedVisionGround (g : ProtectedGround) (c : ComplaintText) : Prop



axiom IsCourseOfStudy (s : CourseOfStudy) (c : ComplaintText) : Prop



axiom IsSpecialServiceForVisualImpairment (s : SpecialService) (c : ComplaintText) : Prop



axiom IsSeparateLivingFacilityForDifferentSexes (l : LivingFacility) (c : ComplaintText) : Prop



axiom ReceivesFundsUnderTheEducationAmendmentsOf1972 (i : EducationalInstitution) (c : ComplaintText) : Prop



axiom IsProgramOrActivity (p : ProgramOrActivity) (c : ComplaintText) : Prop



axiom IsAllOperationsOf (p : ProgramOrActivity) (e : CoveredEntity) (c : ComplaintText) : Prop



axiom IsStateOrLocalGovernmentInstrumentality (e : CoveredEntity) (c : ComplaintText) : Prop



axiom IsDistributingStateOrLocalGovernmentEntity (e : CoveredEntity) (c : ComplaintText) : Prop



axiom IsCollegeUniversityOrPostsecondaryInstitution (e : CoveredEntity) (c : ComplaintText) : Prop



axiom IsLocalEducationalAgencyOrSchoolSystem (e : CoveredEntity) (c : ComplaintText) : Prop



axiom IsWholePrivateOrganizationExtendedAssistance (e : CoveredEntity) (c : ComplaintText) : Prop



axiom IsPrincipallyEngagedInCoveredBusiness (e : CoveredEntity) (c : ComplaintText) : Prop



axiom IsGeographicallySeparateFacilityExtendedAssistance (e : CoveredEntity) (c : ComplaintText) : Prop



axiom IsEntityEstablishedByTwoOrMoreCoveredEntities (e : CoveredEntity) (c : ComplaintText) : Prop



axiom SomePartExtendedFederalFinancialAssistance (e : CoveredEntity) (c : ComplaintText) : Prop



axiom IsReligiouslyControlledExemptOperation (p : ProgramOrActivity) (c : ComplaintText) : Prop



axiom IsPublicOrPrivateEntity (e : Entity) (c : ComplaintText) : Prop



axiom IsBenefitOrServiceRelatedToAbortion (b : BenefitOrService) (c : ComplaintText) : Prop



axiom IsBenefitOrServiceRelatedToLegalAbortion (b : BenefitOrService) (c : ComplaintText) : Prop



axiom IsTaskForceOnSexualViolenceInEducation (t : TaskForce) (c : ComplaintText) : Prop



axiom IsJointInteragencyTaskForce (t : TaskForce) (c : ComplaintText) : Prop



axiom EstablishedBySecretariesAndAttorneyGeneral (t : TaskForce) (c : ComplaintText) : Prop



axiom IsEducationalInstitutionUnderSection1689 (i : EducationalInstitution) (c : ComplaintText) : Prop

end Proving.USC.T20.Ch38.Reearn.Ontology
