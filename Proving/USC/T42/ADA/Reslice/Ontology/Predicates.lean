






import Proving.USC.T42.ADA.Reslice.Ontology.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Ontology

open Proving.USC.Common






axiom IsCoveredEntity (e : Entity) (c : ComplaintText) : Prop




axiom IsQualifiedIndividual (p : Person) (c : ComplaintText) : Prop




axiom IsDisability (d : Disability) (c : ComplaintText) : Prop



axiom HasDisability (p : Person) (d : Disability) (c : ComplaintText) : Prop



axiom IsJobApplicant (p : Person) (e : Entity) (c : ComplaintText) : Prop



axiom IsEmployee (p : Person) (e : Entity) (c : ComplaintText) : Prop



axiom ConcernsJobApplicationProcedures (prac : EmploymentPractice)
    (c : ComplaintText) : Prop



axiom ConcernsHiring (prac : EmploymentPractice) (c : ComplaintText) : Prop



axiom ConcernsAdvancement (prac : EmploymentPractice) (c : ComplaintText) : Prop



axiom ConcernsDischarge (prac : EmploymentPractice) (c : ComplaintText) : Prop



axiom ConcernsEmployeeCompensation (prac : EmploymentPractice)
    (c : ComplaintText) : Prop



axiom ConcernsJobTraining (prac : EmploymentPractice) (c : ComplaintText) : Prop




axiom ConcernsOtherTermsConditionsOrPrivileges (prac : EmploymentPractice)
    (c : ComplaintText) : Prop



axiom IsOnTheBasisOfDisability (prac : EmploymentPractice) (d : Disability)
    (c : ComplaintText) : Prop



axiom EngagedInPractice (e : Entity) (prac : EmploymentPractice)
    (c : ComplaintText) : Prop






axiom LimitsSegregatesOrClassifies (e : Entity) (p : Person)
    (prac : EmploymentPractice) (c : ComplaintText) : Prop




axiom AdverselyAffectsOpportunitiesOrStatus (prac : EmploymentPractice)
    (p : Person) (c : ComplaintText) : Prop




axiom BecauseOfDisabilityOfApplicantOrEmployee (prac : EmploymentPractice)
    (p : Person) (d : Disability) (c : ComplaintText) : Prop






axiom ParticipatesInArrangementOrRelationship (e : Entity)
    (arr : ContractualArrangement) (c : ComplaintText) : Prop





axiom ArrangementSubjectsToProhibitedDiscrimination
    (arr : ContractualArrangement) (p : Person) (c : ComplaintText) : Prop




axiom IsPartyToArrangement (e : Entity) (arr : ContractualArrangement)
    (c : ComplaintText) : Prop



axiom IsEmploymentOrReferralAgency (e : Entity) (c : ComplaintText) : Prop



axiom IsLaborUnion (e : Entity) (c : ComplaintText) : Prop




axiom IsFringeBenefitOrganization (e : Entity) (c : ComplaintText) : Prop




axiom IsTrainingOrApprenticeshipOrganization (e : Entity)
    (c : ComplaintText) : Prop






axiom UtilizesStandardsCriteriaOrMethodsOfAdministration (e : Entity)
    (std : AdministrativeStandard) (c : ComplaintText) : Prop




axiom HasEffectOfDiscriminationOnBasisOfDisability
    (std : AdministrativeStandard) (c : ComplaintText) : Prop




axiom PerpetuatesDiscriminationUnderCommonAdministrativeControl
    (std : AdministrativeStandard) (c : ComplaintText) : Prop






axiom ExcludesOrDeniesEqualJobsOrBenefits (e : Entity) (p : Person)
    (opp : EmploymentOpportunity) (c : ComplaintText) : Prop




axiom HasKnownRelationshipOrAssociation (p : Person) (assoc : Person)
    (c : ComplaintText) : Prop




axiom DisabilityIsKnownToCoveredEntity (e : Entity) (assoc : Person)
    (d : Disability) (c : ComplaintText) : Prop





axiom FailsToMakeReasonableAccommodation (e : Entity) (p : Person)
    (acc : Accommodation) (c : ComplaintText) : Prop




axiom IsReasonableAccommodation (acc : Accommodation) (c : ComplaintText) : Prop




axiom IsKnownPhysicalOrMentalLimitation (p : Person) (d : Disability)
    (e : Entity) (c : ComplaintText) : Prop




axiom IsOtherwiseQualifiedIndividualWithDisability (p : Person)
    (d : Disability) (c : ComplaintText) : Prop





axiom DemonstratesUndueHardship (e : Entity) (acc : Accommodation)
    (c : ComplaintText) : Prop




axiom DeniesEmploymentOpportunity (e : Entity) (p : Person)
    (opp : EmploymentOpportunity) (c : ComplaintText) : Prop




axiom DenialBasedOnNeedToAccommodate (e : Entity)
    (opp : EmploymentOpportunity) (p : Person) (c : ComplaintText) : Prop






axiom UsesQualificationStandardOrSelectionCriteria (e : Entity)
    (q : QualificationStandard) (c : ComplaintText) : Prop





axiom ScreensOutIndividualWithDisability (q : QualificationStandard)
    (p : Person) (c : ComplaintText) : Prop




axiom IsJobRelatedForThePositionInQuestion (q : QualificationStandard)
    (c : ComplaintText) : Prop



axiom IsConsistentWithBusinessNecessity (q : QualificationStandard)
    (c : ComplaintText) : Prop






axiom FailsToSelectAndAdministerTestInMostEffectiveManner (e : Entity)
    (t : EmploymentTest) (p : Person) (c : ComplaintText) : Prop




axiom DisabilityImpairsSensoryManualOrSpeakingSkills (p : Person)
    (d : Disability) (c : ComplaintText) : Prop




axiom TestResultsReflectImpairedSkillsRatherThanMeasuredFactor
    (t : EmploymentTest) (p : Person) (c : ComplaintText) : Prop




axiom ImpairedSkillsAreTheFactorTestPurportsToMeasure (t : EmploymentTest)
    (c : ComplaintText) : Prop





axiom IsWorkplaceInForeignCountry (w : Workplace) (fc : ForeignCountry)
    (c : ComplaintText) : Prop



axiom EmployeeWorksAtWorkplace (p : Person) (w : Workplace)
    (c : ComplaintText) : Prop




axiom ComplianceWouldViolateForeignLaw (e : Entity) (fc : ForeignCountry)
    (c : ComplaintText) : Prop






axiom IsIncorporatedInForeignCountry (corp : Entity) (fc : ForeignCountry)
    (c : ComplaintText) : Prop




axiom EmployerControlsCorporation (emp : Entity) (corp : Entity)
    (c : ComplaintText) : Prop



axiom HasInterrelationOfOperations (emp : Entity) (corp : Entity)
    (c : ComplaintText) : Prop



axiom HasCommonManagement (emp : Entity) (corp : Entity)
    (c : ComplaintText) : Prop



axiom HasCentralizedControlOfLaborRelations (emp : Entity) (corp : Entity)
    (c : ComplaintText) : Prop



axiom HasCommonOwnershipOrFinancialControl (emp : Entity) (corp : Entity)
    (c : ComplaintText) : Prop



axiom IsForeignPerson (e : Entity) (c : ComplaintText) : Prop




axiom IsAmericanEmployer (e : Entity) (c : ComplaintText) : Prop



axiom IsForeignOperationOfEmployer (prac : EmploymentPractice) (e : Entity)
    (c : ComplaintText) : Prop





axiom IsMedicalExamination (m : MedicalExamination) (c : ComplaintText) : Prop




axiom ConductsMedicalExamination (e : Entity) (m : MedicalExamination)
    (p : Person) (c : ComplaintText) : Prop





axiom MakesInquiryAsToDisabilityOrItsNatureOrSeverity (e : Entity)
    (q : MedicalInquiry) (p : Person) (c : ComplaintText) : Prop





axiom IsInquiryIntoAbilityToPerformJobRelatedFunctions (q : MedicalInquiry)
    (c : ComplaintText) : Prop




axiom IsPostOfferPreCommencementExamination (m : MedicalExamination)
    (p : Person) (c : ComplaintText) : Prop




axiom OfferConditionedOnExaminationResults (e : Entity)
    (m : MedicalExamination) (p : Person) (c : ComplaintText) : Prop




axiom AllEnteringEmployeesSubjectedRegardlessOfDisability (e : Entity)
    (m : MedicalExamination) (c : ComplaintText) : Prop




axiom IsCollectedOnSeparateFormsInSeparateMedicalFiles (r : MedicalRecord)
    (e : Entity) (c : ComplaintText) : Prop




axiom IsTreatedAsConfidentialMedicalRecord (r : MedicalRecord) (e : Entity)
    (c : ComplaintText) : Prop




axiom RecordDerivedFromExamination (r : MedicalRecord)
    (m : MedicalExamination) (c : ComplaintText) : Prop




axiom DisclosureToSupervisorsRegardingRestrictionsAndAccommodations
    (r : MedicalRecord) (c : ComplaintText) : Prop





axiom DisclosureToFirstAidAndSafetyPersonnel (r : MedicalRecord)
    (c : ComplaintText) : Prop





axiom DisclosureToGovernmentOfficialsInvestigatingCompliance
    (r : MedicalRecord) (c : ComplaintText) : Prop




axiom ExaminationResultsUsedOnlyInAccordanceWithSubchapter (e : Entity)
    (m : MedicalExamination) (c : ComplaintText) : Prop




axiom ExaminationIsJobRelatedAndConsistentWithBusinessNecessity
    (m : MedicalExamination) (c : ComplaintText) : Prop




axiom IsVoluntaryExaminationInEmployeeHealthProgram (m : MedicalExamination)
    (e : Entity) (c : ComplaintText) : Prop




axiom IsAvailableToEmployeesAtWorkSite (m : MedicalExamination) (e : Entity)
    (c : ComplaintText) : Prop

end Proving.USC.T42.ADA.Reslice.Ontology
