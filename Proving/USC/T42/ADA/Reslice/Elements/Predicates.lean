






import Proving.USC.T42.ADA.Reslice.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Elements

open Proving.USC.Common







axiom IsCoveredEntity (d : CoveredEntity) (c : ComplaintText) : Prop







axiom HasDisability (p : Person) (c : ComplaintText) : Prop





axiom SatisfiesJobPrerequisites (p : Person) (c : ComplaintText) : Prop





axiom CanPerformEssentialFunctions (p : Person) (c : ComplaintText) : Prop






axiom AffectsCoveredEmploymentPractice (a : EmploymentAction) (c : ComplaintText) : Prop



axiom AdverseToIndividual (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop




axiom OnTheBasisOfDisability (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop





axiom EngagesInPracticeDirectly (d : CoveredEntity) (a : EmploymentAction) (c : ComplaintText) : Prop





axiom ControlsForeignCorporation (d : CoveredEntity) (f : ForeignCorporation) (c : ComplaintText) : Prop




axiom ForeignCorporationEngagedInPractice (f : ForeignCorporation) (a : EmploymentAction) (c : ComplaintText) : Prop







axiom ForeignLawComplianceConflict (d : CoveredEntity) (p : Person) (c : ComplaintText) : Prop





axiom ForeignOperationsOfUncontrolledForeignEmployer (d : CoveredEntity) (p : Person) (c : ComplaintText) : Prop






axiom LimitsSegregatesOrClassifies (d : CoveredEntity) (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop




axiom AdverselyAffectsOpportunitiesOrStatus (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop



axiom IsApplicantOrEmployee (p : Person) (c : ComplaintText) : Prop






axiom ParticipatesInContractualOrOtherArrangement (d : CoveredEntity) (k : ContractualArrangement) (c : ComplaintText) : Prop





axiom ArrangementSubjectsIndividualToProhibitedDiscrimination (k : ContractualArrangement) (p : Person) (c : ComplaintText) : Prop






axiom UtilizesStandardsCriteriaOrMethodsOfAdministration (d : CoveredEntity) (s : SelectionCriterion) (c : ComplaintText) : Prop




axiom HasEffectOfDiscriminationOnBasisOfDisability (s : SelectionCriterion) (c : ComplaintText) : Prop




axiom PerpetuatesDiscriminationUnderCommonAdministrativeControl (s : SelectionCriterion) (c : ComplaintText) : Prop






axiom ExcludesOrDeniesEqualJobsOrBenefits (d : CoveredEntity) (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop




axiom HasKnownRelationshipOrAssociation (p : Person) (c : ComplaintText) : Prop




axiom AssociatesDisabilityKnownToCoveredEntity (d : CoveredEntity) (p : Person) (c : ComplaintText) : Prop






axiom LimitationsKnownToCoveredEntity (d : CoveredEntity) (p : Person) (c : ComplaintText) : Prop




axiom AccommodationIsReasonable (acc : Accommodation) (p : Person) (c : ComplaintText) : Prop



axiom FailsToMakeAccommodation (d : CoveredEntity) (acc : Accommodation) (p : Person) (c : ComplaintText) : Prop





axiom ImposesUndueHardship (acc : Accommodation) (d : CoveredEntity) (c : ComplaintText) : Prop



axiom DeniesEmploymentOpportunities (d : CoveredEntity) (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop




axiom DenialBasedOnNeedToAccommodate (d : CoveredEntity) (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop






axiom UsesQualificationStandardOrSelectionCriterion (d : CoveredEntity) (s : SelectionCriterion) (c : ComplaintText) : Prop




axiom ScreensOutIndividualWithDisability (s : SelectionCriterion) (p : Person) (c : ComplaintText) : Prop





axiom IsJobRelatedForPositionInQuestion (s : SelectionCriterion) (c : ComplaintText) : Prop





axiom IsConsistentWithBusinessNecessity (s : SelectionCriterion) (c : ComplaintText) : Prop







axiom FailsToAdministerTestInMostEffectiveManner (d : CoveredEntity) (t : EmploymentTest) (c : ComplaintText) : Prop




axiom HasSensoryManualOrSpeakingImpairment (p : Person) (c : ComplaintText) : Prop





axiom TestResultsReflectImpairedSkills (t : EmploymentTest) (p : Person) (c : ComplaintText) : Prop




axiom ImpairedSkillsAreTheMeasuredFactors (t : EmploymentTest) (c : ComplaintText) : Prop





axiom IsJobApplicant (p : Person) (c : ComplaintText) : Prop





axiom ConductsMedicalExaminationOrDisabilityInquiry (d : CoveredEntity) (m : MedicalInquiry) (p : Person) (c : ComplaintText) : Prop




axiom PrecededConditionalOfferOfEmployment (m : MedicalInquiry) (c : ComplaintText) : Prop





axiom LimitedToAbilityToPerformJobRelatedFunctions (m : MedicalInquiry) (c : ComplaintText) : Prop





axiom MadeAfterOfferAndBeforeCommencement (m : MedicalInquiry) (c : ComplaintText) : Prop




axiom AllEnteringEmployeesExaminedRegardlessOfDisability (m : MedicalInquiry) (d : CoveredEntity) (c : ComplaintText) : Prop






axiom MedicalInformationKeptConfidentialAndSeparate (m : MedicalInquiry) (d : CoveredEntity) (c : ComplaintText) : Prop




axiom ExaminationResultsUsedOnlyAsSubchapterPermits (m : MedicalInquiry) (d : CoveredEntity) (c : ComplaintText) : Prop



axiom IsCurrentEmployee (p : Person) (c : ComplaintText) : Prop




axiom RequiresMedicalExaminationOrInquiryOfEmployee (d : CoveredEntity) (m : MedicalInquiry) (p : Person) (c : ComplaintText) : Prop





axiom ExaminationIsJobRelated (m : MedicalInquiry) (c : ComplaintText) : Prop





axiom ExaminationIsConsistentWithBusinessNecessity (m : MedicalInquiry) (c : ComplaintText) : Prop





axiom IsVoluntaryEmployeeHealthProgramExamination (m : MedicalInquiry) (d : CoveredEntity) (c : ComplaintText) : Prop





axiom SufferedInjuryFromPractice (p : Person) (a : EmploymentAction) (c : ComplaintText) : Prop

end Proving.USC.T42.ADA.Reslice.Elements
