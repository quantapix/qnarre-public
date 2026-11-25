





import Proving.USC.T42.ADA.Reslice.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Elements

open Proving.USC.Common




structure QualifiedIndividual (p : Person) (c : ComplaintText) : Prop where
  prerequisites : SatisfiesJobPrerequisites p c
  essentialFunctions : CanPerformEssentialFunctions p c


abbrev IsQualifiedIndividual (p : Person) (c : ComplaintText) : Prop :=
  QualifiedIndividual p c






inductive PracticeAttributedToCoveredEntity
    (d : CoveredEntity) (a : EmploymentAction) (c : ComplaintText) : Prop where
  | direct (h : EngagesInPracticeDirectly d a c)
  | throughControlledForeignCorporation (f : ForeignCorporation)
      (hControl : ControlsForeignCorporation d f c)
      (hPractice : ForeignCorporationEngagedInPractice f a c)




structure GeneralDiscrimination12112a
    (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop where
  disability : HasDisability p c
  qualified : IsQualifiedIndividual p c
  adverse : AdverseToIndividual p a c
  causation : OnTheBasisOfDisability p a c


structure Discrimination12112b1
    (d : CoveredEntity) (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop where
  disability : HasDisability p c
  applicantOrEmployee : IsApplicantOrEmployee p c
  limitsSegregatesClassifies : LimitsSegregatesOrClassifies d p a c
  adverseEffect : AdverselyAffectsOpportunitiesOrStatus p a c
  causation : OnTheBasisOfDisability p a c


structure Discrimination12112b2
    (d : CoveredEntity) (p : Person) (k : ContractualArrangement) (c : ComplaintText) : Prop where
  disability : HasDisability p c
  qualified : IsQualifiedIndividual p c
  participates : ParticipatesInContractualOrOtherArrangement d k c
  subjectsToDiscrimination : ArrangementSubjectsIndividualToProhibitedDiscrimination k p c




inductive Discrimination12112b3
    (d : CoveredEntity) (s : SelectionCriterion) (c : ComplaintText) : Prop where
  | disparateEffect
      (hUse : UtilizesStandardsCriteriaOrMethodsOfAdministration d s c)
      (hEffect : HasEffectOfDiscriminationOnBasisOfDisability s c)
  | perpetuation
      (hUse : UtilizesStandardsCriteriaOrMethodsOfAdministration d s c)
      (hPerp : PerpetuatesDiscriminationUnderCommonAdministrativeControl s c)


structure Discrimination12112b4
    (d : CoveredEntity) (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop where
  qualified : IsQualifiedIndividual p c
  excludesOrDenies : ExcludesOrDeniesEqualJobsOrBenefits d p a c
  relationship : HasKnownRelationshipOrAssociation p c
  knownDisabilityOfAssociate : AssociatesDisabilityKnownToCoveredEntity d p c



structure Discrimination12112b5A
    (d : CoveredEntity) (p : Person) (acc : Accommodation) (c : ComplaintText) : Prop where
  disability : HasDisability p c
  qualified : IsQualifiedIndividual p c
  applicantOrEmployee : IsApplicantOrEmployee p c
  knownLimitations : LimitationsKnownToCoveredEntity d p c
  reasonable : AccommodationIsReasonable acc p c
  failure : FailsToMakeAccommodation d acc p c
  noUndueHardship : ¬ ImposesUndueHardship acc d c



structure Discrimination12112b5B
    (d : CoveredEntity) (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop where
  disability : HasDisability p c
  qualified : IsQualifiedIndividual p c
  applicantOrEmployee : IsApplicantOrEmployee p c
  denial : DeniesEmploymentOpportunities d p a c
  basedOnAccommodationNeed : DenialBasedOnNeedToAccommodate d p a c


inductive Discrimination12112b5
    (d : CoveredEntity) (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop where
  | failureToAccommodate (acc : Accommodation) (h : Discrimination12112b5A d p acc c)
  | denialBecauseAccommodationNeeded (h : Discrimination12112b5B d p a c)




structure Discrimination12112b6
    (d : CoveredEntity) (p : Person) (s : SelectionCriterion) (c : ComplaintText) : Prop where
  disability : HasDisability p c
  uses : UsesQualificationStandardOrSelectionCriterion d s c
  screensOut : ScreensOutIndividualWithDisability s p c
  notJustified :
    ¬ (IsJobRelatedForPositionInQuestion s c ∧ IsConsistentWithBusinessNecessity s c)



structure Discrimination12112b7
    (d : CoveredEntity) (p : Person) (t : EmploymentTest) (c : ComplaintText) : Prop where
  disability : HasDisability p c
  applicantOrEmployee : IsApplicantOrEmployee p c
  impairedSkills : HasSensoryManualOrSpeakingImpairment p c
  failsEffectiveAdministration : FailsToAdministerTestInMostEffectiveManner d t c
  resultsReflectImpairment : TestResultsReflectImpairedSkills t p c
  notTheMeasuredFactor : ¬ ImpairedSkillsAreTheMeasuredFactors t c





structure PostOfferExaminationSafeHarbor12112d3
    (d : CoveredEntity) (m : MedicalInquiry) (c : ComplaintText) : Prop where
  timing : MadeAfterOfferAndBeforeCommencement m c
  allEntering : AllEnteringEmployeesExaminedRegardlessOfDisability m d c
  confidential : MedicalInformationKeptConfidentialAndSeparate m d c
  useLimited : ExaminationResultsUsedOnlyAsSubchapterPermits m d c


abbrev PostOfferExaminationSafeHarbor
    (d : CoveredEntity) (m : MedicalInquiry) (c : ComplaintText) : Prop :=
  PostOfferExaminationSafeHarbor12112d3 d m c





structure Discrimination12112d2
    (d : CoveredEntity) (p : Person) (m : MedicalInquiry) (c : ComplaintText) : Prop where
  applicant : IsJobApplicant p c
  examination : ConductsMedicalExaminationOrDisabilityInquiry d m p c
  preOffer : PrecededConditionalOfferOfEmployment m c
  notAbilityInquiry : ¬ LimitedToAbilityToPerformJobRelatedFunctions m c
  notSafeHarbored : ¬ PostOfferExaminationSafeHarbor d m c





structure Discrimination12112d4
    (d : CoveredEntity) (p : Person) (m : MedicalInquiry) (c : ComplaintText) : Prop where
  employee : IsCurrentEmployee p c
  examination : RequiresMedicalExaminationOrInquiryOfEmployee d m p c
  notJustified :
    ¬ (ExaminationIsJobRelated m c ∧ ExaminationIsConsistentWithBusinessNecessity m c)
  notVoluntaryProgram : ¬ IsVoluntaryEmployeeHealthProgramExamination m d c
  notAbilityInquiry : ¬ LimitedToAbilityToPerformJobRelatedFunctions m c




inductive Confidentiality12112d4C
    (d : CoveredEntity) (p : Person) (m : MedicalInquiry) (c : ComplaintText) : Prop where
  | confidentialityBreach
      (hEmployee : IsCurrentEmployee p c)
      (hVoluntary : IsVoluntaryEmployeeHealthProgramExamination m d c)
      (hBreach : ¬ MedicalInformationKeptConfidentialAndSeparate m d c)
  | improperUse
      (hEmployee : IsCurrentEmployee p c)
      (hVoluntary : IsVoluntaryEmployeeHealthProgramExamination m d c)
      (hMisuse : ¬ ExaminationResultsUsedOnlyAsSubchapterPermits m d c)





inductive DiscriminationTheory12112
    (d : CoveredEntity) (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop where
  | general (h : GeneralDiscrimination12112a p a c)
  | limitSegregateClassify (h : Discrimination12112b1 d p a c)
  | contractualArrangement (k : ContractualArrangement) (h : Discrimination12112b2 d p k c)
  | standardsCriteriaMethods (s : SelectionCriterion) (h : Discrimination12112b3 d s c)
  | associationalDiscrimination (h : Discrimination12112b4 d p a c)
  | accommodation (h : Discrimination12112b5 d p a c)
  | qualificationStandards (s : SelectionCriterion) (h : Discrimination12112b6 d p s c)
  | testAdministration (t : EmploymentTest) (h : Discrimination12112b7 d p t c)
  | applicantMedicalInquiry (m : MedicalInquiry) (h : Discrimination12112d2 d p m c)
  | employeeMedicalInquiry (m : MedicalInquiry) (h : Discrimination12112d4 d p m c)
  | medicalConfidentiality (m : MedicalInquiry) (h : Confidentiality12112d4C d p m c)




structure Section12112
    (d : CoveredEntity) (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop where
  coveredEntity : IsCoveredEntity d c
  employmentPractice : AffectsCoveredEmploymentPractice a c
  attribution : PracticeAttributedToCoveredEntity d a c
  theory : DiscriminationTheory12112 d p a c
  notForeignLawConflict : ¬ ForeignLawComplianceConflict d p c
  notUncontrolledForeignEmployer : ¬ ForeignOperationsOfUncontrolledForeignEmployer d p c



structure ValidSection12112Claim
    (d : CoveredEntity) (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop where
  violation : Section12112 d p a c
  injury : SufferedInjuryFromPractice p a c
  proximateCause : ProximateCause p c
  timeliness : WithinLimitations p c

end Proving.USC.T42.ADA.Reslice.Elements
