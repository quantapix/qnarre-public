









import Proving.USC.T42.ADA.Reslice.Ontology.Types
import Proving.USC.T42.ADA.Reslice.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Ontology

open Proving.USC.Common







structure DefEdge where
  defined : String
  dependsOn : String
  citeDefine : String


structure DanglingTerm where
  term : String
  usedAt : String
  definedAt : String


def edge_discriminate_dependsOn_coveredEntity : DefEdge :=
  { defined := "discriminate against a qualified individual on the basis of disability",
    dependsOn := "covered entity", citeDefine := "42 USC § 12112(b)" }


def edge_discriminate_dependsOn_qualifiedIndividual : DefEdge :=
  { defined := "discriminate against a qualified individual on the basis of disability",
    dependsOn := "qualified individual", citeDefine := "42 USC § 12112(b)" }


def edge_discriminate_dependsOn_disability : DefEdge :=
  { defined := "discriminate against a qualified individual on the basis of disability",
    dependsOn := "disability", citeDefine := "42 USC § 12112(b)" }



def edge_discriminate_dependsOn_prohibitedDiscrimination : DefEdge :=
  { defined := "discriminate against a qualified individual on the basis of disability",
    dependsOn := "discrimination prohibited by this subchapter",
    citeDefine := "42 USC § 12112(b)(2)" }


def edge_discriminate_dependsOn_reasonableAccommodation : DefEdge :=
  { defined := "discriminate against a qualified individual on the basis of disability",
    dependsOn := "reasonable accommodation", citeDefine := "42 USC § 12112(b)(5)(A)" }


def edge_discriminate_dependsOn_undueHardship : DefEdge :=
  { defined := "discriminate against a qualified individual on the basis of disability",
    dependsOn := "undue hardship", citeDefine := "42 USC § 12112(b)(5)(A)" }



def edge_discriminate_dependsOn_qualificationStandard : DefEdge :=
  { defined := "discriminate against a qualified individual on the basis of disability",
    dependsOn := "qualification standard or selection criterion",
    citeDefine := "42 USC § 12112(b)(6)" }



def edge_discriminate_dependsOn_medicalExamination : DefEdge :=
  { defined := "discriminate against a qualified individual on the basis of disability",
    dependsOn := "medical examination or inquiry", citeDefine := "42 USC § 12112(d)(1)" }



def edge_controls_dependsOn_interrelation : DefEdge :=
  { defined := "employer controls a corporation", dependsOn := "interrelation of operations",
    citeDefine := "42 USC § 12112(c)(2)(C)" }


def edge_controls_dependsOn_commonManagement : DefEdge :=
  { defined := "employer controls a corporation", dependsOn := "common management",
    citeDefine := "42 USC § 12112(c)(2)(C)" }


def edge_controls_dependsOn_centralizedLaborControl : DefEdge :=
  { defined := "employer controls a corporation",
    dependsOn := "centralized control of labor relations",
    citeDefine := "42 USC § 12112(c)(2)(C)" }


def edge_controls_dependsOn_commonOwnership : DefEdge :=
  { defined := "employer controls a corporation",
    dependsOn := "common ownership or financial control",
    citeDefine := "42 USC § 12112(c)(2)(C)" }


def edge_foreignExclusion_dependsOn_americanEmployer : DefEdge :=
  { defined := "foreign operations of a foreign-person employer",
    dependsOn := "American employer", citeDefine := "42 USC § 12112(c)(2)(B)" }


def edge_confidentialRecord_dependsOn_separateFiles : DefEdge :=
  { defined := "confidential medical record",
    dependsOn := "separate forms and separate medical files",
    citeDefine := "42 USC § 12112(d)(3)(B)" }


def defEdges : List DefEdge :=
  [ edge_discriminate_dependsOn_coveredEntity,
    edge_discriminate_dependsOn_qualifiedIndividual,
    edge_discriminate_dependsOn_disability,
    edge_discriminate_dependsOn_prohibitedDiscrimination,
    edge_discriminate_dependsOn_reasonableAccommodation,
    edge_discriminate_dependsOn_undueHardship,
    edge_discriminate_dependsOn_qualificationStandard,
    edge_discriminate_dependsOn_medicalExamination,
    edge_controls_dependsOn_interrelation,
    edge_controls_dependsOn_commonManagement,
    edge_controls_dependsOn_centralizedLaborControl,
    edge_controls_dependsOn_commonOwnership,
    edge_foreignExclusion_dependsOn_americanEmployer,
    edge_confidentialRecord_dependsOn_separateFiles ]


def danglingTerms : List DanglingTerm :=
  [ { term := "covered entity", usedAt := "42 USC § 12112(a)",
      definedAt := "42 USC § 12111(2)" },
    { term := "qualified individual", usedAt := "42 USC § 12112(a)",
      definedAt := "42 USC § 12111(8)" },
    { term := "disability", usedAt := "42 USC § 12112(a)",
      definedAt := "42 USC § 12102" },
    { term := "employer", usedAt := "42 USC § 12112(c)(2)(A)",
      definedAt := "42 USC § 12111(5)" },
    { term := "employee", usedAt := "42 USC § 12112(a)",
      definedAt := "42 USC § 12111(4)" },
    { term := "person", usedAt := "42 USC § 12112(c)(2)(B)",
      definedAt := "42 USC § 12111(7)" },
    { term := "reasonable accommodation", usedAt := "42 USC § 12112(b)(5)(A)",
      definedAt := "42 USC § 12111(9)" },
    { term := "undue hardship", usedAt := "42 USC § 12112(b)(5)(A)",
      definedAt := "42 USC § 12111(10)" },
    { term := "American employer", usedAt := "42 USC § 12112(c)(2)(B)",
      definedAt := "not defined in this slice" },
    { term := "discrimination prohibited by this subchapter",
      usedAt := "42 USC § 12112(b)(2)",
      definedAt := "self-referential to subchapter I of chapter 126" },
    { term := "business necessity", usedAt := "42 USC § 12112(b)(6)",
      definedAt := "not defined in this slice" },
    { term := "individual with a disability", usedAt := "42 USC § 12112(b)(6)",
      definedAt := "42 USC § 12102" } ]






inductive CoveredEmploymentAspect (prac : EmploymentPractice)
    (c : ComplaintText) : Prop where
  | jobApplicationProcedures (h : ConcernsJobApplicationProcedures prac c)
  | hiring (h : ConcernsHiring prac c)
  | advancement (h : ConcernsAdvancement prac c)
  | discharge (h : ConcernsDischarge prac c)
  | employeeCompensation (h : ConcernsEmployeeCompensation prac c)
  | jobTraining (h : ConcernsJobTraining prac c)
  | otherTermsConditionsOrPrivileges
      (h : ConcernsOtherTermsConditionsOrPrivileges prac c)




structure QualifiedIndividualWithDisability (p : Person) (d : Disability)
    (c : ComplaintText) : Prop where
  qualified : IsQualifiedIndividual p c
  disability : IsDisability d c
  bearer : HasDisability p d c




structure LimitingSegregatingOrClassifying (e : Entity) (p : Person)
    (prac : EmploymentPractice) (d : Disability) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity e c
  applicantOrEmployee : IsJobApplicant p e c ∨ IsEmployee p e c
  limitingAct : LimitsSegregatesOrClassifies e p prac c
  adverseEffect : AdverselyAffectsOpportunitiesOrStatus prac p c
  becauseOfDisability : BecauseOfDisabilityOfApplicantOrEmployee prac p d c





inductive CoveredArrangementRelationship (arr : ContractualArrangement)
    (c : ComplaintText) : Prop where
  | employmentOrReferralAgency (e2 : Entity)
      (party : IsPartyToArrangement e2 arr c)
      (kind : IsEmploymentOrReferralAgency e2 c)
  | laborUnion (e2 : Entity)
      (party : IsPartyToArrangement e2 arr c)
      (kind : IsLaborUnion e2 c)
  | fringeBenefitOrganization (e2 : Entity)
      (party : IsPartyToArrangement e2 arr c)
      (kind : IsFringeBenefitOrganization e2 c)
  | trainingOrApprenticeshipOrganization (e2 : Entity)
      (party : IsPartyToArrangement e2 arr c)
      (kind : IsTrainingOrApprenticeshipOrganization e2 c)


structure ParticipationInDiscriminatoryArrangement (e : Entity)
    (arr : ContractualArrangement) (p : Person) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity e c
  participates : ParticipatesInArrangementOrRelationship e arr c
  qualifiedApplicantOrEmployee : IsJobApplicant p e c ∨ IsEmployee p e c
  effect : ArrangementSubjectsToProhibitedDiscrimination arr p c



inductive DiscriminatoryAdministrativeEffect (std : AdministrativeStandard)
    (c : ComplaintText) : Prop where
  | effectOfDiscrimination (h : HasEffectOfDiscriminationOnBasisOfDisability std c)
  | perpetuatesUnderCommonControl
      (h : PerpetuatesDiscriminationUnderCommonAdministrativeControl std c)


structure UtilizingDiscriminatoryStandards (e : Entity)
    (std : AdministrativeStandard) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity e c
  utilizes : UtilizesStandardsCriteriaOrMethodsOfAdministration e std c
  vice : DiscriminatoryAdministrativeEffect std c


structure AssociationalExclusion (e : Entity) (p : Person) (assoc : Person)
    (d : Disability) (opp : EmploymentOpportunity) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity e c
  qualified : IsQualifiedIndividual p c
  exclusion : ExcludesOrDeniesEqualJobsOrBenefits e p opp c
  relationship : HasKnownRelationshipOrAssociation p assoc c
  associateDisability : HasDisability assoc d c
  knownToEntity : DisabilityIsKnownToCoveredEntity e assoc d c




structure FailureToAccommodate (e : Entity) (p : Person) (acc : Accommodation)
    (d : Disability) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity e c
  otherwiseQualified : IsOtherwiseQualifiedIndividualWithDisability p d c
  applicantOrEmployee : IsJobApplicant p e c ∨ IsEmployee p e c
  knownLimitation : IsKnownPhysicalOrMentalLimitation p d e c
  reasonable : IsReasonableAccommodation acc c
  failure : FailsToMakeReasonableAccommodation e p acc c
  noUndueHardship : ¬ DemonstratesUndueHardship e acc c


structure AccommodationBasedDenial (e : Entity) (p : Person) (d : Disability)
    (opp : EmploymentOpportunity) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity e c
  otherwiseQualified : IsOtherwiseQualifiedIndividualWithDisability p d c
  applicantOrEmployee : IsJobApplicant p e c ∨ IsEmployee p e c
  denial : DeniesEmploymentOpportunity e p opp c
  basedOnAccommodationNeed : DenialBasedOnNeedToAccommodate e opp p c



structure DiscriminatoryQualificationStandard (e : Entity)
    (q : QualificationStandard) (p : Person) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity e c
  uses : UsesQualificationStandardOrSelectionCriteria e q c
  screensOut : ScreensOutIndividualWithDisability q p c
  notJustified :
    ¬ (IsJobRelatedForThePositionInQuestion q c ∧ IsConsistentWithBusinessNecessity q c)



structure IneffectiveTestAdministration (e : Entity) (t : EmploymentTest)
    (p : Person) (d : Disability) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity e c
  applicantOrEmployee : IsJobApplicant p e c ∨ IsEmployee p e c
  impairingDisability : DisabilityImpairsSensoryManualOrSpeakingSkills p d c
  failure : FailsToSelectAndAdministerTestInMostEffectiveManner e t p c
  resultsSkewed : TestResultsReflectImpairedSkillsRatherThanMeasuredFactor t p c
  exceptionInapplicable : ¬ ImpairedSkillsAreTheFactorTestPurportsToMeasure t c






structure ProhibitedApplicantExamination (e : Entity) (m : MedicalExamination)
    (p : Person) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity e c
  applicant : IsJobApplicant p e c
  examination : IsMedicalExamination m c
  conducts : ConductsMedicalExamination e m p c
  notPostOffer : ¬ IsPostOfferPreCommencementExamination m p c


structure ProhibitedApplicantInquiry (e : Entity) (q : MedicalInquiry)
    (p : Person) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity e c
  applicant : IsJobApplicant p e c
  inquiry : MakesInquiryAsToDisabilityOrItsNatureOrSeverity e q p c
  notPermittedAbilityInquiry :
    ¬ IsInquiryIntoAbilityToPerformJobRelatedFunctions q c



inductive PermittedConfidentialityDisclosure (r : MedicalRecord)
    (c : ComplaintText) : Prop where
  | supervisorsAndManagers
      (h : DisclosureToSupervisorsRegardingRestrictionsAndAccommodations r c)
  | firstAidAndSafetyPersonnel
      (h : DisclosureToFirstAidAndSafetyPersonnel r c)
  | governmentComplianceOfficials
      (h : DisclosureToGovernmentOfficialsInvestigatingCompliance r c)



structure PermittedPostOfferExamination (e : Entity) (m : MedicalExamination)
    (p : Person) (r : MedicalRecord) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity e c
  applicant : IsJobApplicant p e c
  examination : IsMedicalExamination m c
  postOffer : IsPostOfferPreCommencementExamination m p c
  uniform : AllEnteringEmployeesSubjectedRegardlessOfDisability e m c
  derived : RecordDerivedFromExamination r m c
  separateFiles : IsCollectedOnSeparateFormsInSeparateMedicalFiles r e c
  confidential : IsTreatedAsConfidentialMedicalRecord r e c
  resultsUse : ExaminationResultsUsedOnlyInAccordanceWithSubchapter e m c




structure ProhibitedEmployeeExamination (e : Entity) (m : MedicalExamination)
    (p : Person) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity e c
  employee : IsEmployee p e c
  examination : IsMedicalExamination m c
  conducts : ConductsMedicalExamination e m p c
  notJustified : ¬ ExaminationIsJobRelatedAndConsistentWithBusinessNecessity m c
  notVoluntaryProgram : ¬ IsVoluntaryExaminationInEmployeeHealthProgram m e c



structure PermittedVoluntaryExamination (e : Entity) (m : MedicalExamination)
    (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity e c
  examination : IsMedicalExamination m c
  voluntaryProgram : IsVoluntaryExaminationInEmployeeHealthProgram m e c
  availableAtWorkSite : IsAvailableToEmployeesAtWorkSite m e c











inductive DiscriminateOnBasisOfDisability (e : Entity) (p : Person)
    (c : ComplaintText) : Prop where
  | limitingSegregatingClassifying (prac : EmploymentPractice) (d : Disability)
      (h : LimitingSegregatingOrClassifying e p prac d c)
  | discriminatoryArrangement (arr : ContractualArrangement)
      (h : ParticipationInDiscriminatoryArrangement e arr p c)
  | discriminatoryAdministration (std : AdministrativeStandard)
      (h : UtilizingDiscriminatoryStandards e std c)
  | associationalExclusion (assoc : Person) (d : Disability)
      (opp : EmploymentOpportunity)
      (h : AssociationalExclusion e p assoc d opp c)
  | failureToAccommodate (acc : Accommodation) (d : Disability)
      (h : FailureToAccommodate e p acc d c)
  | accommodationBasedDenial (d : Disability) (opp : EmploymentOpportunity)
      (h : AccommodationBasedDenial e p d opp c)
  | discriminatoryQualificationStandard (q : QualificationStandard)
      (h : DiscriminatoryQualificationStandard e q p c)
  | ineffectiveTestAdministration (t : EmploymentTest) (d : Disability)
      (h : IneffectiveTestAdministration e t p d c)
  | prohibitedApplicantExamination (m : MedicalExamination)
      (h : ProhibitedApplicantExamination e m p c)
  | prohibitedApplicantInquiry (q : MedicalInquiry)
      (h : ProhibitedApplicantInquiry e q p c)
  | prohibitedEmployeeExamination (m : MedicalExamination)
      (h : ProhibitedEmployeeExamination e m p c)




structure ForeignLawConflictException (e : Entity) (p : Person) (w : Workplace)
    (fc : ForeignCountry) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity e c
  employee : IsEmployee p e c
  worksAt : EmployeeWorksAtWorkplace p w c
  foreignWorkplace : IsWorkplaceInForeignCountry w fc c
  conflict : ComplianceWouldViolateForeignLaw e fc c





structure ControlDeterminationBasis (emp : Entity) (corp : Entity)
    (c : ComplaintText) : Prop where
  interrelation : HasInterrelationOfOperations emp corp c
  commonManagement : HasCommonManagement emp corp c
  centralizedLaborControl : HasCentralizedControlOfLaborRelations emp corp c
  commonOwnership : HasCommonOwnershipOrFinancialControl emp corp c



structure ForeignCorporationPracticeAttribution (emp : Entity) (corp : Entity)
    (fc : ForeignCountry) (prac : EmploymentPractice) (c : ComplaintText) : Prop where
  controls : EmployerControlsCorporation emp corp c
  foreignIncorporation : IsIncorporatedInForeignCountry corp fc c
  corporationEngaged : EngagedInPractice corp prac c



structure ForeignPersonOperationsExclusion (emp : Entity)
    (prac : EmploymentPractice) (c : ComplaintText) : Prop where
  foreignPerson : IsForeignPerson emp c
  foreignOperation : IsForeignOperationOfEmployer prac emp c
  notAmericanControlled :
    ¬ ∃ amer : Entity, IsAmericanEmployer amer c ∧ EmployerControlsCorporation amer emp c





structure Section12112a (e : Entity) (p : Person) (d : Disability)
    (prac : EmploymentPractice) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity e c
  subject : QualifiedIndividualWithDisability p d c
  engagedIn : EngagedInPractice e prac c
  aspect : CoveredEmploymentAspect prac c
  onBasis : IsOnTheBasisOfDisability prac d c
  discriminates : DiscriminateOnBasisOfDisability e p c

end Proving.USC.T42.ADA.Reslice.Ontology
