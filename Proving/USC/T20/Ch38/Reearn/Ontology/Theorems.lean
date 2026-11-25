import Proving.USC.T20.Ch38.Reearn.Ontology.Statute













set_option autoImplicit false

namespace Proving.USC.T20.Ch38.Reearn.Ontology

open Proving.USC.Common



theorem educationalInstitutionCase_preschool_intro
    {i : EducationalInstitution} {c : ComplaintText}
    (h : IsPreschool i c) : EducationalInstitutionCase i c :=
  .preschool h

theorem educationalInstitutionCase_elementarySchool_intro
    {i : EducationalInstitution} {c : ComplaintText}
    (h : IsElementarySchool i c) : EducationalInstitutionCase i c :=
  .elementarySchool h

theorem educationalInstitutionCase_secondarySchool_intro
    {i : EducationalInstitution} {c : ComplaintText}
    (h : IsSecondarySchool i c) : EducationalInstitutionCase i c :=
  .secondarySchool h

theorem educationalInstitutionCase_vocationalEducation_intro
    {i : EducationalInstitution} {c : ComplaintText}
    (h : IsInstitutionOfVocationalEducation i c) : EducationalInstitutionCase i c :=
  .vocationalEducation h

theorem educationalInstitutionCase_professionalEducation_intro
    {i : EducationalInstitution} {c : ComplaintText}
    (h : IsInstitutionOfProfessionalEducation i c) : EducationalInstitutionCase i c :=
  .professionalEducation h

theorem educationalInstitutionCase_higherEducation_intro
    {i : EducationalInstitution} {c : ComplaintText}
    (h : IsInstitutionOfHigherEducation i c) : EducationalInstitutionCase i c :=
  .higherEducation h

theorem educationalInstitutionMembership_intro
    {i : EducationalInstitution} {c : ComplaintText}
    (hKind : EducationalInstitutionCase i c)
    (hMember : IsEducationalInstitution i c) :
    EducationalInstitutionMembership i c :=
  ⟨hKind, hMember⟩

theorem separateUnitEducationalInstitution_intro
    {u : AdministrativeUnit} {i : EducationalInstitution} {c : ComplaintText}
    (hComposite : IsCompositeEducationalInstitution i c)
    (hUnitOf : IsAdministrativelySeparateUnitOf u i c)
    (hDenotes : DenotesUnitAsEducationalInstitution u c) :
    SeparateUnitEducationalInstitution u i c :=
  ⟨hComposite, hUnitOf, hDenotes⟩



theorem privateOrganizationBasis_assistedAsWhole_intro
    {e : CoveredEntity} {c : ComplaintText}
    (h : IsWholePrivateOrganizationExtendedAssistance e c) :
    PrivateOrganizationBasis e c :=
  .assistedAsWhole h

theorem privateOrganizationBasis_principallyEngaged_intro
    {e : CoveredEntity} {c : ComplaintText}
    (h : IsPrincipallyEngagedInCoveredBusiness e c) :
    PrivateOrganizationBasis e c :=
  .principallyEngaged h

theorem coveredEntityClass_governmentInstrumentality_intro
    {e : CoveredEntity} {c : ComplaintText}
    (h : IsStateOrLocalGovernmentInstrumentality e c) : CoveredEntityClass e c :=
  .governmentInstrumentality h

theorem coveredEntityClass_distributingGovernmentEntity_intro
    {e : CoveredEntity} {c : ComplaintText}
    (h : IsDistributingStateOrLocalGovernmentEntity e c) : CoveredEntityClass e c :=
  .distributingGovernmentEntity h

theorem coveredEntityClass_postsecondaryInstitution_intro
    {e : CoveredEntity} {c : ComplaintText}
    (h : IsCollegeUniversityOrPostsecondaryInstitution e c) : CoveredEntityClass e c :=
  .postsecondaryInstitution h

theorem coveredEntityClass_schoolSystem_intro
    {e : CoveredEntity} {c : ComplaintText}
    (h : IsLocalEducationalAgencyOrSchoolSystem e c) : CoveredEntityClass e c :=
  .schoolSystem h

theorem coveredEntityClass_privateOrganization_intro
    {e : CoveredEntity} {c : ComplaintText}
    (h : PrivateOrganizationBasis e c) : CoveredEntityClass e c :=
  .privateOrganization h

theorem coveredEntityClass_separateFacility_intro
    {e : CoveredEntity} {c : ComplaintText}
    (h : IsGeographicallySeparateFacilityExtendedAssistance e c) : CoveredEntityClass e c :=
  .separateFacility h

theorem coveredEntityClass_jointlyEstablishedEntity_intro
    {e : CoveredEntity} {c : ComplaintText}
    (h : IsEntityEstablishedByTwoOrMoreCoveredEntities e c) : CoveredEntityClass e c :=
  .jointlyEstablishedEntity h

theorem programOrActivityMembership_intro
    {p : ProgramOrActivity} {e : CoveredEntity} {c : ComplaintText}
    (hOperations : IsAllOperationsOf p e c)
    (hClass : CoveredEntityClass e c)
    (hFunded : SomePartExtendedFederalFinancialAssistance e c)
    (hNotExempt : ¬ IsReligiouslyControlledExemptOperation p c)
    (hMember : IsProgramOrActivity p c) :
    ProgramOrActivityMembership p e c :=
  ⟨hOperations, hClass, hFunded, hNotExempt, hMember⟩

theorem coveredEducationProgram_intro
    {p : ProgramOrActivity} {e : CoveredEntity} {c : ComplaintText}
    (hProgram : ProgramOrActivityMembership p e c)
    (hEducational : IsEducationProgramOrActivity p c)
    (hReceiving : ReceivesFederalFinancialAssistance p c) :
    CoveredEducationProgram p e c :=
  ⟨hProgram, hEducational, hReceiving⟩



theorem religiousControlExemption_intro
    {i : EducationalInstitution} {o : ReligiousOrganization} {c : ComplaintText}
    (hOrg : IsReligiousOrganization o c)
    (hControlled : IsControlledByReligiousOrganization i o c)
    (hInconsistent : InconsistentWithReligiousTenets o c) :
    ReligiousControlExemption i o c :=
  ⟨hOrg, hControlled, hInconsistent⟩



theorem section1682AssistanceMembership_intro
    {f : FederalFinancialAssistance} {c : ComplaintText}
    (hAssistance : IsFederalFinancialAssistance f c)
    (hMode : IsExtendedByGrantLoanOrContract f c)
    (hNotInsurance : ¬ IsContractOfInsuranceOrGuaranty f c) :
    Section1682AssistanceMembership f c :=
  ⟨hAssistance, hMode, hNotInsurance⟩

theorem enforcingAgencyMembership_intro
    {a : FederalAgency} {c : ComplaintText}
    (hAgency : IsFederalDepartmentOrAgency a c)
    (hEmpowered : IsEmpoweredToExtendFederalFinancialAssistance a c) :
    EnforcingAgencyMembership a c :=
  ⟨hAgency, hEmpowered⟩

theorem recipientMembership_intro
    {r : Recipient} {c : ComplaintText}
    (h : IsRecipientOfFederalFinancialAssistance r c) : RecipientMembership r c :=
  ⟨h⟩

theorem personAggrievedBasis_aggrieved_intro
    {p : Person} {c : ComplaintText}
    (h : IsPersonAggrieved p c) : PersonAggrievedBasis p c :=
  .aggrieved h

theorem personAggrievedBasis_governmentalClaimant_intro
    {p : Person} {c : ComplaintText}
    (h : IsStateOrPoliticalSubdivisionOrAgencyThereof p c) : PersonAggrievedBasis p c :=
  .governmentalClaimant h

theorem section1684Subject_intro
    {p : Person} {g : ProtectedGround} {s : CourseOfStudy} {r : Recipient}
    {c : ComplaintText}
    (hPerson : IsPersonInUnitedStates p c)
    (hGround : IsBlindnessOrSeverelyImpairedVisionGround g c)
    (hCourse : IsCourseOfStudy s c)
    (hRecipient : RecipientMembership r c) :
    Section1684Subject p g s r c :=
  ⟨hPerson, hGround, hCourse, hRecipient⟩



theorem livingFacilitiesInterpretation_intro
    {i : EducationalInstitution} {l : LivingFacility} {c : ComplaintText}
    (hInstitution : IsEducationalInstitution i c)
    (hFunded : ReceivesFundsUnderTheEducationAmendmentsOf1972 i c)
    (hFacility : IsSeparateLivingFacilityForDifferentSexes l c) :
    LivingFacilitiesInterpretation i l c :=
  ⟨hInstitution, hFunded, hFacility⟩



theorem abortionNeutralityScope_intro
    {e : Entity} {b : BenefitOrService} {c : ComplaintText}
    (hSubject : IsPublicOrPrivateEntity e c)
    (hItem : IsBenefitOrServiceRelatedToAbortion b c) :
    AbortionNeutralityScope e b c :=
  ⟨hSubject, hItem⟩

theorem legalAbortionNoPenaltyScope_intro
    {p : Person} {b : BenefitOrService} {c : ComplaintText}
    (hSubject : IsPersonInUnitedStates p c)
    (hItem : IsBenefitOrServiceRelatedToLegalAbortion b c) :
    LegalAbortionNoPenaltyScope p b c :=
  ⟨hSubject, hItem⟩



theorem taskForceMembership_intro
    {t : TaskForce} {c : ComplaintText}
    (hJoint : IsJointInteragencyTaskForce t c)
    (hEstablished : EstablishedBySecretariesAndAttorneyGeneral t c)
    (hNamed : IsTaskForceOnSexualViolenceInEducation t c) :
    TaskForceMembership t c :=
  ⟨hJoint, hEstablished, hNamed⟩

theorem section1689EducationalInstitutionCase_higherEducation_intro
    {i : EducationalInstitution} {c : ComplaintText}
    (h : IsInstitutionOfHigherEducation i c) :
    Section1689EducationalInstitutionCase i c :=
  .higherEducation h

theorem section1689EducationalInstitutionCase_elementarySchool_intro
    {i : EducationalInstitution} {c : ComplaintText}
    (h : IsElementarySchool i c) : Section1689EducationalInstitutionCase i c :=
  .elementarySchool h

theorem section1689EducationalInstitutionCase_secondarySchool_intro
    {i : EducationalInstitution} {c : ComplaintText}
    (h : IsSecondarySchool i c) : Section1689EducationalInstitutionCase i c :=
  .secondarySchool h

theorem section1689EducationalInstitutionCase_otherIncluded_intro
    {i : EducationalInstitution} {c : ComplaintText}
    (h : IsEducationalInstitutionUnderSection1689 i c) :
    Section1689EducationalInstitutionCase i c :=
  .otherIncluded h

theorem section1689EducationalInstitutionMembership_intro
    {i : EducationalInstitution} {c : ComplaintText}
    (hKind : Section1689EducationalInstitutionCase i c)
    (hMember : IsEducationalInstitutionUnderSection1689 i c) :
    Section1689EducationalInstitutionMembership i c :=
  ⟨hKind, hMember⟩



theorem membershipPracticeOrganization_socialFraternityOrSorority_intro
    {e : Entity} {c : ComplaintText}
    (h : IsTaxExemptSocialFraternityOrSorority e c) :
    MembershipPracticeOrganization e c :=
  .socialFraternityOrSorority h

theorem membershipPracticeOrganization_youthServiceOrganization_intro
    {e : Entity} {c : ComplaintText}
    (h : IsExemptVoluntaryYouthServiceOrganization e c) :
    MembershipPracticeOrganization e c :=
  .youthServiceOrganization h

theorem membershipPracticeExemption_intro
    {m : MembershipPractice} {e : Entity} {c : ComplaintText}
    (hOrganization : MembershipPracticeOrganization e c)
    (hPractice : IsMembershipPracticeOf m e c) :
    MembershipPracticeExemption m e c :=
  ⟨hOrganization, hPractice⟩

end Proving.USC.T20.Ch38.Reearn.Ontology
