












import Proving.USC.T42.ADA.Reslice.Procedure.Types

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Procedure

open Proving.USC.Common





axiom JobApplicationProcedureConducted
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop



axiom OfferOfEmploymentMade
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop



axiom EmploymentDutiesCommenced
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop






axiom MedicalExaminationConducted
    (e : CoveredEntity) (m : MedicalExamination) (p : Person) (c : ComplaintText) : Prop





axiom DisabilityInquiryMade
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop




axiom InquiryLimitedToJobRelatedAbility
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop




axiom OfferConditionedOnExaminationResults
    (e : CoveredEntity) (m : MedicalExamination) (p : Person) (c : ComplaintText) : Prop




axiom AllEnteringEmployeesSubjectedToExamination
    (e : CoveredEntity) (c : ComplaintText) : Prop





axiom MedicalInformationKeptOnSeparateConfidentialForms
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop




axiom RestrictionDisclosureLimitedToSupervisorsAndManagers
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop





axiom EmergencyDisclosureLimitedToFirstAidAndSafetyPersonnel
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop





axiom ComplianceInvestigatorRequestedInformation
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop




axiom RelevantInformationProvidedToComplianceInvestigator
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop




axiom ExaminationResultsUsedOnlyAsThisSubchapterPermits
    (e : CoveredEntity) (m : MedicalExamination) (p : Person) (c : ComplaintText) : Prop





axiom ExaminationShownJobRelatedAndConsistentWithBusinessNecessity
    (e : CoveredEntity) (m : MedicalExamination) (p : Person) (c : ComplaintText) : Prop




axiom ExaminationVoluntaryUnderEmployeeHealthProgram
    (e : CoveredEntity) (m : MedicalExamination) (p : Person) (c : ComplaintText) : Prop







axiom KnownLimitationBroughtToEntityAttention
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop




axiom ReasonableAccommodationMade
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop





axiom UndueHardshipDemonstratedByEntity
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop




axiom EmploymentOpportunityDeniedForAccommodationNeed
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop







axiom QualificationStandardScreensOutIndividualWithDisability
    (e : CoveredEntity) (q : QualificationStandard) (p : Person) (c : ComplaintText) : Prop





axiom StandardShownJobRelatedAndConsistentWithBusinessNecessity
    (e : CoveredEntity) (q : QualificationStandard) (c : ComplaintText) : Prop





axiom TestAdministeredInMostEffectiveManner
    (e : CoveredEntity) (t : EmploymentTest) (p : Person) (c : ComplaintText) : Prop





axiom TestTakerSkillsImpairedBySensoryManualOrSpeakingDisability
    (t : EmploymentTest) (p : Person) (c : ComplaintText) : Prop




axiom ImpairedSkillsAreTheFactorTestPurportsToMeasure
    (t : EmploymentTest) (c : ComplaintText) : Prop






axiom WorkplaceLocatedInForeignCountry
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop





axiom ComplianceWouldViolateForeignLaw
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop




axiom EmployerIsForeignPersonNotControlledByAmericanEmployer
    (e : CoveredEntity) (c : ComplaintText) : Prop






axiom PlaceOfIncorporationIsForeignCountry
    (f : ForeignCorporation) (c : ComplaintText) : Prop




axiom ForeignCorporationEngagedInDiscriminatoryPractice
    (f : ForeignCorporation) (p : Person) (c : ComplaintText) : Prop




axiom EmployerControlsForeignCorporation
    (e : CoveredEntity) (f : ForeignCorporation) (c : ComplaintText) : Prop




axiom DeterminationConsideredInterrelationOfOperations
    (e : CoveredEntity) (f : ForeignCorporation) (c : ComplaintText) : Prop




axiom DeterminationConsideredCommonManagement
    (e : CoveredEntity) (f : ForeignCorporation) (c : ComplaintText) : Prop




axiom DeterminationConsideredCentralizedControlOfLaborRelations
    (e : CoveredEntity) (f : ForeignCorporation) (c : ComplaintText) : Prop




axiom DeterminationConsideredCommonOwnershipOrFinancialControl
    (e : CoveredEntity) (f : ForeignCorporation) (c : ComplaintText) : Prop







axiom dayOfEmploymentOffer
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Nat




axiom dayOfMedicalExamination
    (e : CoveredEntity) (m : MedicalExamination) (p : Person) (c : ComplaintText) : Nat




axiom dayOfEmploymentDutiesCommencement
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Nat

end Proving.USC.T42.ADA.Reslice.Procedure
