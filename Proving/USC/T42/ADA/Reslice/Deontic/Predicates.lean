






import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.ADA.Reslice.Deontic.Types

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Deontic

open Proving.USC.Common






axiom IsCoveredEntity (e : Entity) (c : ComplaintText) : Prop




axiom IsQualifiedIndividualWithDisability (p : Person) (e : Entity)
    (c : ComplaintText) : Prop



axiom IsJobApplicantOf (p : Person) (e : Entity) (c : ComplaintText) : Prop



axiom IsEmployeeOf (p : Person) (e : Entity) (c : ComplaintText) : Prop








axiom ActionConcernsEmploymentTerm (e : Entity) (p : Person) (t : EmploymentTerm)
    (c : ComplaintText) : Prop




axiom OnBasisOfDisability (e : Entity) (p : Person) (c : ComplaintText) : Prop






axiom AdverseEmploymentActionTaken (e : Entity) (p : Person) (t : EmploymentTerm)
    (c : ComplaintText) : Prop




axiom LimitedSegregatedOrClassifiedAdversely (e : Entity) (p : Person)
    (c : ComplaintText) : Prop





axiom ParticipatedInArrangementSubjectingToDiscrimination (e : Entity)
    (a : Arrangement) (p : Person) (c : ComplaintText) : Prop




axiom UtilizedAdministrativeMethod (e : Entity) (m : AdministrativeMethod)
    (c : ComplaintText) : Prop




axiom MethodHasEffectOfDisabilityDiscrimination (e : Entity)
    (m : AdministrativeMethod) (c : ComplaintText) : Prop




axiom MethodPerpetuatesDiscriminationUnderCommonControl (e : Entity)
    (m : AdministrativeMethod) (c : ComplaintText) : Prop




axiom DeniedEqualJobsOrBenefits (e : Entity) (p : Person) (c : ComplaintText) : Prop




axiom KnownAssociationWithIndividualWithDisability (e : Entity) (p : Person)
    (c : ComplaintText) : Prop




axiom ReasonableAccommodationNotMade (e : Entity) (p : Person) (a : Accommodation)
    (c : ComplaintText) : Prop




axiom LimitationsKnownToCoveredEntity (e : Entity) (p : Person)
    (c : ComplaintText) : Prop





axiom AccommodationImposesUndueHardship (e : Entity) (a : Accommodation)
    (c : ComplaintText) : Prop




axiom DeniedOpportunityBecauseOfAccommodationNeed (e : Entity) (p : Person)
    (c : ComplaintText) : Prop




axiom UsedSelectionCriterion (e : Entity) (s : SelectionCriterion) (p : Person)
    (c : ComplaintText) : Prop




axiom SelectionCriterionScreensOutDisability (e : Entity) (s : SelectionCriterion)
    (p : Person) (c : ComplaintText) : Prop





axiom SelectionCriterionJobRelatedAndConsistentWithBusinessNecessity (e : Entity)
    (s : SelectionCriterion) (c : ComplaintText) : Prop






axiom FailedToAdministerTestInMostEffectiveManner (e : Entity) (t : EmploymentTest)
    (p : Person) (c : ComplaintText) : Prop




axiom TestTakerHasSensoryManualOrSpeakingImpairment (p : Person)
    (c : ComplaintText) : Prop




axiom ImpairedSkillsAreFactorsTestPurportsToMeasure (t : EmploymentTest)
    (c : ComplaintText) : Prop






axiom EmployeeWorkplaceInForeignCountry (p : Person) (w : Workplace)
    (c : ComplaintText) : Prop




axiom ComplianceWouldViolateForeignLaw (e : Entity) (w : Workplace)
    (c : ComplaintText) : Prop




axiom ControlsForeignCorporation (e : Entity) (f : Entity) (c : ComplaintText) : Prop




axiom ForeignCorporationIncorporatedAbroad (f : Entity) (c : ComplaintText) : Prop




axiom PracticeConstitutingDiscriminationEngagedInBy (f : Entity) (p : Person)
    (c : ComplaintText) : Prop




axiom IsForeignPersonNotControlledByAmericanEmployer (e : Entity)
    (c : ComplaintText) : Prop




axiom ConductConcernsForeignOperations (e : Entity) (p : Person)
    (c : ComplaintText) : Prop




axiom InterrelationOfOperations (e : Entity) (f : Entity) (c : ComplaintText) : Prop



axiom CommonManagement (e : Entity) (f : Entity) (c : ComplaintText) : Prop




axiom CentralizedControlOfLaborRelations (e : Entity) (f : Entity)
    (c : ComplaintText) : Prop




axiom CommonOwnershipOrFinancialControl (e : Entity) (f : Entity)
    (c : ComplaintText) : Prop






axiom ExaminationIsMedicalExaminationOrInquiry (m : MedicalExamination)
    (c : ComplaintText) : Prop




axiom ConductedMedicalExaminationOfApplicant (e : Entity) (p : Person)
    (m : MedicalExamination) (c : ComplaintText) : Prop





axiom MadeDisabilityInquiryOfApplicant (e : Entity) (p : Person)
    (m : MedicalExamination) (c : ComplaintText) : Prop




axiom InquiryIntoApplicantJobRelatedAbility (e : Entity) (p : Person)
    (m : MedicalExamination) (c : ComplaintText) : Prop





axiom ExaminationAfterOfferBeforeDutiesCommence (e : Entity) (p : Person)
    (m : MedicalExamination) (c : ComplaintText) : Prop




axiom OfferConditionedOnExaminationResults (e : Entity) (p : Person)
    (m : MedicalExamination) (c : ComplaintText) : Prop




axiom AllEnteringEmployeesExaminedRegardlessOfDisability (e : Entity)
    (m : MedicalExamination) (c : ComplaintText) : Prop





axiom MedicalInfoOnSeparateFormsAndTreatedConfidential (e : Entity)
    (r : MedicalRecord) (c : ComplaintText) : Prop





axiom SupervisorsInformedOfNecessaryRestrictions (e : Entity) (r : MedicalRecord)
    (c : ComplaintText) : Prop





axiom FirstAidPersonnelInformedOfEmergencyNeed (e : Entity) (r : MedicalRecord)
    (c : ComplaintText) : Prop





axiom GovernmentOfficialRequestedRelevantInformation (r : MedicalRecord)
    (c : ComplaintText) : Prop





axiom RelevantInformationProvidedToInvestigatingOfficials (e : Entity)
    (r : MedicalRecord) (c : ComplaintText) : Prop




axiom ExaminationResultsUsedOnlyInAccordanceWithSubchapter (e : Entity)
    (m : MedicalExamination) (c : ComplaintText) : Prop




axiom RequiredMedicalExaminationOfEmployee (e : Entity) (p : Person)
    (m : MedicalExamination) (c : ComplaintText) : Prop





axiom MadeDisabilityInquiryOfEmployee (e : Entity) (p : Person)
    (m : MedicalExamination) (c : ComplaintText) : Prop




axiom ExaminationJobRelatedAndConsistentWithBusinessNecessity (e : Entity)
    (m : MedicalExamination) (c : ComplaintText) : Prop





axiom VoluntaryExaminationInEmployeeHealthProgram (e : Entity) (p : Person)
    (m : MedicalExamination) (c : ComplaintText) : Prop




axiom InquiryIntoEmployeeJobRelatedAbility (e : Entity) (p : Person)
    (m : MedicalExamination) (c : ComplaintText) : Prop





axiom InformationObtainedUnderVoluntaryProgram (r : MedicalRecord)
    (m : MedicalExamination) (c : ComplaintText) : Prop

end Proving.USC.T42.ADA.Reslice.Deontic
