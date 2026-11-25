















import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.ADA.Reslice.Deontic.Types
import Proving.USC.T42.ADA.Reslice.Deontic.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Deontic

open Proving.USC.Common













structure ForeignLawDefense12112c1 (e : Entity) (p : Person) (w : Workplace)
    (c : ComplaintText) : Prop where
  workplaceAbroad : EmployeeWorkplaceInForeignCountry p w c
  complianceConflict : ComplianceWouldViolateForeignLaw e w c


def ForeignLawExempt12112c1 (e : Entity) (p : Person) (c : ComplaintText) : Prop :=
  ∃ w : Workplace, ForeignLawDefense12112c1 e p w c




structure ScopeExclusion12112c2B (e : Entity) (p : Person) (c : ComplaintText) :
    Prop where
  foreignPerson : IsForeignPersonNotControlledByAmericanEmployer e c
  foreignOperations : ConductConcernsForeignOperations e p c




structure ImputedPractice12112c2A (e : Entity) (f : Entity) (p : Person)
    (c : ComplaintText) : Prop where
  control : ControlsForeignCorporation e f c
  incorporatedAbroad : ForeignCorporationIncorporatedAbroad f c
  practice : PracticeConstitutingDiscriminationEngagedInBy f p c






structure ControlFactors12112c2C (e : Entity) (f : Entity) (c : ComplaintText) :
    Prop where
  interrelation : InterrelationOfOperations e f c
  management : CommonManagement e f c
  laborRelations : CentralizedControlOfLaborRelations e f c
  ownership : CommonOwnershipOrFinancialControl e f c






structure Prohibition12112a (e : Entity) (p : Person) (t : EmploymentTerm)
    (c : ComplaintText) : Prop where
  addressee : IsCoveredEntity e c
  protectedClass : IsQualifiedIndividualWithDisability p e c
  employmentMatter : ActionConcernsEmploymentTerm e p t c










inductive DiscriminatoryAct12112b (e : Entity) (p : Person) (c : ComplaintText) :
    Prop where

  | residual (t : EmploymentTerm) (h : AdverseEmploymentActionTaken e p t c)

  | limitSegregateClassify (h : LimitedSegregatedOrClassifiedAdversely e p c)

  | contractualArrangement (a : Arrangement)
      (h : ParticipatedInArrangementSubjectingToDiscrimination e a p c)

  | discriminatoryMethod (m : AdministrativeMethod)
      (hUse : UtilizedAdministrativeMethod e m c)
      (hEffect : MethodHasEffectOfDisabilityDiscrimination e m c)

  | perpetuatingMethod (m : AdministrativeMethod)
      (hUse : UtilizedAdministrativeMethod e m c)
      (hPerpetuate : MethodPerpetuatesDiscriminationUnderCommonControl e m c)

  | associationDenial (hAssoc : KnownAssociationWithIndividualWithDisability e p c)
      (hDeny : DeniedEqualJobsOrBenefits e p c)

  | accommodationFailure (a : Accommodation)
      (hKnown : LimitationsKnownToCoveredEntity e p c)
      (hOmitted : ReasonableAccommodationNotMade e p a c)
      (hNoHardship : ¬ AccommodationImposesUndueHardship e a c)

  | accommodationBasedDenial (h : DeniedOpportunityBecauseOfAccommodationNeed e p c)

  | screeningCriterion (s : SelectionCriterion)
      (hUse : UsedSelectionCriterion e s p c)
      (hScreen : SelectionCriterionScreensOutDisability e s p c)
      (hUnjustified :
        ¬ SelectionCriterionJobRelatedAndConsistentWithBusinessNecessity e s c)

  | testAdministration (t : EmploymentTest)
      (hImpairment : TestTakerHasSensoryManualOrSpeakingImpairment p c)
      (hFailure : FailedToAdministerTestInMostEffectiveManner e t p c)
      (hNotTheFactor : ¬ ImpairedSkillsAreFactorsTestPurportsToMeasure t c)



structure Violation12112a (e : Entity) (p : Person) (t : EmploymentTerm)
    (c : ComplaintText) : Prop where
  norm : Prohibition12112a e p t c
  basis : OnBasisOfDisability e p c
  act : DiscriminatoryAct12112b e p c
  notForeignLawExempt : ¬ ForeignLawExempt12112c1 e p c
  notOutOfScope : ¬ ScopeExclusion12112c2B e p c






structure Permission12112d3 (e : Entity) (p : Person) (m : MedicalExamination)
    (r : MedicalRecord) (c : ComplaintText) : Prop where
  addressee : IsCoveredEntity e c
  applicant : IsJobApplicantOf p e c
  timing : ExaminationAfterOfferBeforeDutiesCommence e p m c
  uniformity : AllEnteringEmployeesExaminedRegardlessOfDisability e m c
  confidentiality : MedicalInfoOnSeparateFormsAndTreatedConfidential e r c
  useLimitation : ExaminationResultsUsedOnlyInAccordanceWithSubchapter e m c


def PostOfferExceptionApplies12112d3 (e : Entity) (p : Person)
    (m : MedicalExamination) (c : ComplaintText) : Prop :=
  ∃ r : MedicalRecord, Permission12112d3 e p m r c



structure PermittedOfferCondition12112d3 (e : Entity) (p : Person)
    (m : MedicalExamination) (r : MedicalRecord) (c : ComplaintText) : Prop where
  conditions : Permission12112d3 e p m r c
  act : OfferConditionedOnExaminationResults e p m c



structure Prohibition12112d2A (e : Entity) (p : Person) (c : ComplaintText) :
    Prop where
  addressee : IsCoveredEntity e c
  applicant : IsJobApplicantOf p e c



inductive PreOfferMedicalAct12112d2A (e : Entity) (p : Person)
    (m : MedicalExamination) (c : ComplaintText) : Prop where
  | examination (h : ConductedMedicalExaminationOfApplicant e p m c)
  | inquiry (h : MadeDisabilityInquiryOfApplicant e p m c)




structure Violation12112d2A (e : Entity) (p : Person) (m : MedicalExamination)
    (c : ComplaintText) : Prop where
  norm : Prohibition12112d2A e p c
  medical : ExaminationIsMedicalExaminationOrInquiry m c
  act : PreOfferMedicalAct12112d2A e p m c
  notExcepted : ¬ PostOfferExceptionApplies12112d3 e p m c



structure Permission12112d2B (e : Entity) (p : Person) (m : MedicalExamination)
    (c : ComplaintText) : Prop where
  addressee : IsCoveredEntity e c
  applicant : IsJobApplicantOf p e c
  act : InquiryIntoApplicantJobRelatedAbility e p m c



structure PermittedSupervisorDisclosure12112d3Bi (e : Entity) (r : MedicalRecord)
    (c : ComplaintText) : Prop where
  addressee : IsCoveredEntity e c
  act : SupervisorsInformedOfNecessaryRestrictions e r c



structure PermittedFirstAidDisclosure12112d3Bii (e : Entity) (r : MedicalRecord)
    (c : ComplaintText) : Prop where
  addressee : IsCoveredEntity e c
  act : FirstAidPersonnelInformedOfEmergencyNeed e r c




structure Obligation12112d3Biii (e : Entity) (r : MedicalRecord)
    (c : ComplaintText) : Prop where
  addressee : IsCoveredEntity e c
  condition : GovernmentOfficialRequestedRelevantInformation r c



structure Breach12112d3Biii (e : Entity) (r : MedicalRecord) (c : ComplaintText) :
    Prop where
  norm : Obligation12112d3Biii e r c
  omission : ¬ RelevantInformationProvidedToInvestigatingOfficials e r c





structure Prohibition12112d4A (e : Entity) (p : Person) (c : ComplaintText) :
    Prop where
  addressee : IsCoveredEntity e c
  employee : IsEmployeeOf p e c



inductive EmployeeMedicalAct12112d4A (e : Entity) (p : Person)
    (m : MedicalExamination) (c : ComplaintText) : Prop where
  | examination (h : RequiredMedicalExaminationOfEmployee e p m c)
  | inquiry (h : MadeDisabilityInquiryOfEmployee e p m c)



structure Violation12112d4A (e : Entity) (p : Person) (m : MedicalExamination)
    (c : ComplaintText) : Prop where
  norm : Prohibition12112d4A e p c
  medical : ExaminationIsMedicalExaminationOrInquiry m c
  act : EmployeeMedicalAct12112d4A e p m c
  notJustified : ¬ ExaminationJobRelatedAndConsistentWithBusinessNecessity e m c




inductive VoluntaryProgramAct12112d4B (e : Entity) (p : Person)
    (m : MedicalExamination) (c : ComplaintText) : Prop where
  | voluntaryExamination (h : VoluntaryExaminationInEmployeeHealthProgram e p m c)
  | abilityInquiry (h : InquiryIntoEmployeeJobRelatedAbility e p m c)


structure Permission12112d4B (e : Entity) (p : Person) (m : MedicalExamination)
    (c : ComplaintText) : Prop where
  addressee : IsCoveredEntity e c
  employee : IsEmployeeOf p e c
  act : VoluntaryProgramAct12112d4B e p m c



structure Obligation12112d4C (e : Entity) (p : Person) (m : MedicalExamination)
    (r : MedicalRecord) (c : ComplaintText) : Prop where
  addressee : IsCoveredEntity e c
  source : VoluntaryExaminationInEmployeeHealthProgram e p m c
  information : InformationObtainedUnderVoluntaryProgram r m c


structure Breach12112d4C (e : Entity) (p : Person) (m : MedicalExamination)
    (r : MedicalRecord) (c : ComplaintText) : Prop where
  norm : Obligation12112d4C e p m r c
  omission : ¬ MedicalInfoOnSeparateFormsAndTreatedConfidential e r c
      ∨ ¬ ExaminationResultsUsedOnlyInAccordanceWithSubchapter e m c






inductive MedicalExamWithinProhibition12112d1 (e : Entity) (p : Person)
    (m : MedicalExamination) (c : ComplaintText) : Prop where
  | applicant (h : Violation12112d2A e p m c)
  | employee (h : Violation12112d4A e p m c)

end Proving.USC.T42.ADA.Reslice.Deontic
