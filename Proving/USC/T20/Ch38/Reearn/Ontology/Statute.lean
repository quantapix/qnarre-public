import Proving.USC.T20.Ch38.Reearn.Ontology.Predicates



























set_option autoImplicit false

namespace Proving.USC.T20.Ch38.Reearn.Ontology

open Proving.USC.Common





structure DefEdge where

  defined : String

  dependsOn : String

  citeDefine : String





structure DanglingTerm where

  term : String

  usedAt : String

  definedElsewhere : String



def edge_eduInst_preschool : DefEdge :=
  { defined := "educational institution", dependsOn := "preschool",
    citeDefine := "20 USC § 1681(c)" }

def edge_eduInst_elementarySchool : DefEdge :=
  { defined := "educational institution", dependsOn := "elementary school",
    citeDefine := "20 USC § 1681(c)" }

def edge_eduInst_secondarySchool : DefEdge :=
  { defined := "educational institution", dependsOn := "secondary school",
    citeDefine := "20 USC § 1681(c)" }

def edge_eduInst_vocationalEducation : DefEdge :=
  { defined := "educational institution",
    dependsOn := "institution of vocational education",
    citeDefine := "20 USC § 1681(c)" }

def edge_eduInst_professionalEducation : DefEdge :=
  { defined := "educational institution",
    dependsOn := "institution of professional education",
    citeDefine := "20 USC § 1681(c)" }

def edge_eduInst_higherEducation : DefEdge :=
  { defined := "educational institution",
    dependsOn := "institution of higher education",
    citeDefine := "20 USC § 1681(c)" }



def edge_eduInst_administrativeUnit : DefEdge :=
  { defined := "educational institution",
    dependsOn := "administratively separate unit",
    citeDefine := "20 USC § 1681(c)" }




def edge_program_programOrActivity : DefEdge :=
  { defined := "program", dependsOn := "program or activity",
    citeDefine := "20 USC § 1687" }

def edge_programOrActivity_operations : DefEdge :=
  { defined := "program or activity", dependsOn := "operations",
    citeDefine := "20 USC § 1687" }

def edge_programOrActivity_govInstrumentality : DefEdge :=
  { defined := "program or activity",
    dependsOn := "instrumentality of a State or of a local government",
    citeDefine := "20 USC § 1687(1)(A)" }

def edge_programOrActivity_distributingEntity : DefEdge :=
  { defined := "program or activity",
    dependsOn := "State or local government entity distributing such assistance",
    citeDefine := "20 USC § 1687(1)(B)" }

def edge_programOrActivity_postsecondary : DefEdge :=
  { defined := "program or activity",
    dependsOn := "college, university, or other postsecondary institution",
    citeDefine := "20 USC § 1687(2)(A)" }

def edge_programOrActivity_localEducationalAgency : DefEdge :=
  { defined := "program or activity", dependsOn := "local educational agency",
    citeDefine := "20 USC § 1687(2)(B)" }

def edge_programOrActivity_privateOrganization : DefEdge :=
  { defined := "program or activity",
    dependsOn := "corporation, partnership, or other private organization",
    citeDefine := "20 USC § 1687(3)(A)" }

def edge_programOrActivity_separateFacility : DefEdge :=
  { defined := "program or activity",
    dependsOn := "entire plant or comparable, geographically separate facility",
    citeDefine := "20 USC § 1687(3)(B)" }

def edge_programOrActivity_jointEntity : DefEdge :=
  { defined := "program or activity",
    dependsOn := "entity established by two or more of the entities described in (1), (2), or (3)",
    citeDefine := "20 USC § 1687(4)" }

def edge_programOrActivity_federalFinancialAssistance : DefEdge :=
  { defined := "program or activity", dependsOn := "Federal financial assistance",
    citeDefine := "20 USC § 1687" }



def edge_programOrActivity_religiousOrganization : DefEdge :=
  { defined := "program or activity", dependsOn := "religious organization",
    citeDefine := "20 USC § 1687" }



def edge_s1681a_person : DefEdge :=
  { defined := "20 USC § 1681(a) (using section)", dependsOn := "person in the United States",
    citeDefine := "20 USC § 1681(a)" }

def edge_s1681a_sex : DefEdge :=
  { defined := "20 USC § 1681(a) (using section)", dependsOn := "sex",
    citeDefine := "20 USC § 1681(a)" }

def edge_s1681a_educationProgramOrActivity : DefEdge :=
  { defined := "20 USC § 1681(a) (using section)", dependsOn := "program or activity",
    citeDefine := "20 USC § 1687" }

def edge_s1681a_federalFinancialAssistance : DefEdge :=
  { defined := "20 USC § 1681(a) (using section)", dependsOn := "Federal financial assistance",
    citeDefine := "20 USC § 1681(a)" }


def edge_personAggrieved_stateOrSubdivision : DefEdge :=
  { defined := "person aggrieved",
    dependsOn := "State, political subdivision thereof, or agency of either",
    citeDefine := "20 USC § 1683" }

def edge_s1684_recipient : DefEdge :=
  { defined := "20 USC § 1684 (using section)",
    dependsOn := "recipient of Federal financial assistance",
    citeDefine := "20 USC § 1684" }

def edge_s1684_courseOfStudy : DefEdge :=
  { defined := "20 USC § 1684 (using section)", dependsOn := "course of study",
    citeDefine := "20 USC § 1684" }

def edge_s1685_insuranceOrGuaranty : DefEdge :=
  { defined := "20 USC § 1685 (using section)",
    dependsOn := "contract of insurance or guaranty",
    citeDefine := "20 USC § 1685" }

def edge_s1686_livingFacility : DefEdge :=
  { defined := "20 USC § 1686 (using section)",
    dependsOn := "separate living facilities for the different sexes",
    citeDefine := "20 USC § 1686" }

def edge_s1688_publicOrPrivateEntity : DefEdge :=
  { defined := "20 USC § 1688 (using section)", dependsOn := "public or private entity",
    citeDefine := "20 USC § 1688" }



def edge_s1689EduInst_higherEducation : DefEdge :=
  { defined := "educational institution (in § 1689 only)",
    dependsOn := "institution of higher education",
    citeDefine := "20 USC § 1689(e)(1)" }

def edge_s1689EduInst_elementarySchool : DefEdge :=
  { defined := "educational institution (in § 1689 only)",
    dependsOn := "elementary school", citeDefine := "20 USC § 1689(e)(1)" }

def edge_s1689EduInst_secondarySchool : DefEdge :=
  { defined := "educational institution (in § 1689 only)",
    dependsOn := "secondary school", citeDefine := "20 USC § 1689(e)(1)" }

def edge_taskForce_establishingOfficers : DefEdge :=
  { defined := "Task Force on Sexual Violence in Education",
    dependsOn := "Secretary of Education, Secretary of Health and Human Services, Attorney General",
    citeDefine := "20 USC § 1689(a)" }



def edge_elementarySchool_s7801 : DefEdge :=
  { defined := "elementary school", dependsOn := "20 USC § 7801 (outside slice)",
    citeDefine := "20 USC § 1689(e)(2)" }

def edge_secondarySchool_s7801 : DefEdge :=
  { defined := "secondary school", dependsOn := "20 USC § 7801 (outside slice)",
    citeDefine := "20 USC § 1689(e)(2)" }

def edge_higherEducation_s1002 : DefEdge :=
  { defined := "institution of higher education", dependsOn := "20 USC § 1002 (outside slice)",
    citeDefine := "20 USC § 1689(e)(3)" }





def edge_localEducationalAgency_s7801 : DefEdge :=
  { defined := "local educational agency", dependsOn := "20 USC § 7801 (outside slice)",
    citeDefine := "20 USC § 1687(2)(B)" }

def edge_socialFraternity_t26s501a : DefEdge :=
  { defined := "social fraternity or social sorority",
    dependsOn := "26 USC § 501(a) (outside slice, cross-title)",
    citeDefine := "20 USC § 1681(a)(6)(A)" }

def edge_judicialReview_t5ch7 : DefEdge :=
  { defined := "judicial review (of § 1682 action)",
    dependsOn := "5 USC ch. 7 (outside slice, cross-title)",
    citeDefine := "20 USC § 1683" }



def dangling_person : DanglingTerm :=
  { term := "person in the United States", usedAt := "20 USC § 1681(a); § 1684; § 1688",
    definedElsewhere := "(undefined)" }

def dangling_sex : DanglingTerm :=
  { term := "sex", usedAt := "20 USC § 1681(a)", definedElsewhere := "(undefined)" }

def dangling_discrimination : DanglingTerm :=
  { term := "discrimination", usedAt := "20 USC § 1681(a); § 1684 (heading)",
    definedElsewhere := "(undefined)" }

def dangling_federalFinancialAssistance : DanglingTerm :=
  { term := "Federal financial assistance",
    usedAt := "20 USC § 1681(a); § 1682; § 1684; § 1685; § 1687",
    definedElsewhere := "(undefined; § 1682 gives modes only)" }

def dangling_recipient : DanglingTerm :=
  { term := "recipient", usedAt := "20 USC § 1682; § 1684",
    definedElsewhere := "(undefined)" }

def dangling_religiousOrganization : DanglingTerm :=
  { term := "religious organization", usedAt := "20 USC § 1681(a)(3); § 1687",
    definedElsewhere := "(undefined)" }

def dangling_blindness : DanglingTerm :=
  { term := "blindness or severely impaired vision", usedAt := "20 USC § 1684",
    definedElsewhere := "(undefined)" }

def dangling_abortion : DanglingTerm :=
  { term := "abortion", usedAt := "20 USC § 1688", definedElsewhere := "(undefined)" }

def dangling_contractOfInsuranceOrGuaranty : DanglingTerm :=
  { term := "contract of insurance or guaranty", usedAt := "20 USC § 1682; § 1685",
    definedElsewhere := "(undefined)" }





def dangling_thisAct : DanglingTerm :=
  { term := "this Act", usedAt := "20 USC § 1686",
    definedElsewhere := "(enacting statute; not identified in the codified text)" }

def dangling_sexualViolence : DanglingTerm :=
  { term := "sexual violence", usedAt := "20 USC § 1689(a); § 1689(c)",
    definedElsewhere := "(undefined)" }

def dangling_localEducationalAgency : DanglingTerm :=
  { term := "local educational agency", usedAt := "20 USC § 1687(2)(B)",
    definedElsewhere := "20 USC § 7801 (outside slice; cross-reference is textually defective)" }







inductive EducationalInstitutionCase (i : EducationalInstitution) (c : ComplaintText) : Prop where
  | preschool (h : IsPreschool i c)
  | elementarySchool (h : IsElementarySchool i c)
  | secondarySchool (h : IsSecondarySchool i c)
  | vocationalEducation (h : IsInstitutionOfVocationalEducation i c)
  | professionalEducation (h : IsInstitutionOfProfessionalEducation i c)
  | higherEducation (h : IsInstitutionOfHigherEducation i c)



structure EducationalInstitutionMembership (i : EducationalInstitution)
    (c : ComplaintText) : Prop where

  kind : EducationalInstitutionCase i c

  member : IsEducationalInstitution i c



structure SeparateUnitEducationalInstitution (u : AdministrativeUnit)
    (i : EducationalInstitution) (c : ComplaintText) : Prop where

  composite : IsCompositeEducationalInstitution i c

  unitOf : IsAdministrativelySeparateUnitOf u i c

  denotes : DenotesUnitAsEducationalInstitution u c




inductive PrivateOrganizationBasis (e : CoveredEntity) (c : ComplaintText) : Prop where
  | assistedAsWhole (h : IsWholePrivateOrganizationExtendedAssistance e c)
  | principallyEngaged (h : IsPrincipallyEngagedInCoveredBusiness e c)



inductive CoveredEntityClass (e : CoveredEntity) (c : ComplaintText) : Prop where
  | governmentInstrumentality (h : IsStateOrLocalGovernmentInstrumentality e c)
  | distributingGovernmentEntity (h : IsDistributingStateOrLocalGovernmentEntity e c)
  | postsecondaryInstitution (h : IsCollegeUniversityOrPostsecondaryInstitution e c)
  | schoolSystem (h : IsLocalEducationalAgencyOrSchoolSystem e c)
  | privateOrganization (h : PrivateOrganizationBasis e c)
  | separateFacility (h : IsGeographicallySeparateFacilityExtendedAssistance e c)
  | jointlyEstablishedEntity (h : IsEntityEstablishedByTwoOrMoreCoveredEntities e c)








structure ProgramOrActivityMembership (p : ProgramOrActivity) (e : CoveredEntity)
    (c : ComplaintText) : Prop where

  operations : IsAllOperationsOf p e c

  entityClass : CoveredEntityClass e c

  funded : SomePartExtendedFederalFinancialAssistance e c

  notReligiouslyExempt : ¬ IsReligiouslyControlledExemptOperation p c

  member : IsProgramOrActivity p c




structure CoveredEducationProgram (p : ProgramOrActivity) (e : CoveredEntity)
    (c : ComplaintText) : Prop where

  programOrActivity : ProgramOrActivityMembership p e c

  educational : IsEducationProgramOrActivity p c

  receiving : ReceivesFederalFinancialAssistance p c








structure ReligiousControlExemption (i : EducationalInstitution)
    (o : ReligiousOrganization) (c : ComplaintText) : Prop where

  organization : IsReligiousOrganization o c

  controlled : IsControlledByReligiousOrganization i o c

  inconsistent : InconsistentWithReligiousTenets o c






structure Section1682AssistanceMembership (f : FederalFinancialAssistance)
    (c : ComplaintText) : Prop where

  assistance : IsFederalFinancialAssistance f c

  mode : IsExtendedByGrantLoanOrContract f c

  notInsuranceOrGuaranty : ¬ IsContractOfInsuranceOrGuaranty f c


structure EnforcingAgencyMembership (a : FederalAgency) (c : ComplaintText) : Prop where

  federalAgency : IsFederalDepartmentOrAgency a c


  empowered : IsEmpoweredToExtendFederalFinancialAssistance a c



structure RecipientMembership (r : Recipient) (c : ComplaintText) : Prop where

  recipient : IsRecipientOfFederalFinancialAssistance r c




inductive PersonAggrievedBasis (p : Person) (c : ComplaintText) : Prop where
  | aggrieved (h : IsPersonAggrieved p c)
  | governmentalClaimant (h : IsStateOrPoliticalSubdivisionOrAgencyThereof p c)






structure Section1684Subject (p : Person) (g : ProtectedGround) (s : CourseOfStudy)
    (r : Recipient) (c : ComplaintText) : Prop where

  personInUS : IsPersonInUnitedStates p c

  ground : IsBlindnessOrSeverelyImpairedVisionGround g c

  course : IsCourseOfStudy s c

  recipient : RecipientMembership r c






structure LivingFacilitiesInterpretation (i : EducationalInstitution)
    (l : LivingFacility) (c : ComplaintText) : Prop where

  institution : IsEducationalInstitution i c

  funded : ReceivesFundsUnderTheEducationAmendmentsOf1972 i c

  facility : IsSeparateLivingFacilityForDifferentSexes l c






structure AbortionNeutralityScope (e : Entity) (b : BenefitOrService)
    (c : ComplaintText) : Prop where

  subject : IsPublicOrPrivateEntity e c


  item : IsBenefitOrServiceRelatedToAbortion b c


structure LegalAbortionNoPenaltyScope (p : Person) (b : BenefitOrService)
    (c : ComplaintText) : Prop where

  subject : IsPersonInUnitedStates p c

  item : IsBenefitOrServiceRelatedToLegalAbortion b c




structure TaskForceMembership (t : TaskForce) (c : ComplaintText) : Prop where

  jointInteragency : IsJointInteragencyTaskForce t c

  established : EstablishedBySecretariesAndAttorneyGeneral t c

  named : IsTaskForceOnSexualViolenceInEducation t c




inductive Section1689EducationalInstitutionCase (i : EducationalInstitution)
    (c : ComplaintText) : Prop where
  | higherEducation (h : IsInstitutionOfHigherEducation i c)
  | elementarySchool (h : IsElementarySchool i c)
  | secondarySchool (h : IsSecondarySchool i c)
  | otherIncluded (h : IsEducationalInstitutionUnderSection1689 i c)




structure Section1689EducationalInstitutionMembership (i : EducationalInstitution)
    (c : ComplaintText) : Prop where

  kind : Section1689EducationalInstitutionCase i c

  member : IsEducationalInstitutionUnderSection1689 i c





inductive MembershipPracticeOrganization (e : Entity) (c : ComplaintText) : Prop where
  | socialFraternityOrSorority (h : IsTaxExemptSocialFraternityOrSorority e c)
  | youthServiceOrganization (h : IsExemptVoluntaryYouthServiceOrganization e c)


structure MembershipPracticeExemption (m : MembershipPractice) (e : Entity)
    (c : ComplaintText) : Prop where

  organization : MembershipPracticeOrganization e c

  practice : IsMembershipPracticeOf m e c

end Proving.USC.T20.Ch38.Reearn.Ontology
