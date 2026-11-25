









import Proving.USC.T42.ADA.Reslice.Procedure.Types
import Proving.USC.T42.ADA.Reslice.Procedure.Predicates
import Proving.USC.T42.ADA.Reslice.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Procedure

open Proving.USC.Common




theorem reachesJobApplication_intro
    {e : CoveredEntity} {p : Person} {c : ComplaintText}
    (hApp : JobApplicationProcedureConducted e p c) :
    Reaches e p c EmploymentStage.JobApplication :=
  Reaches.application hApp


theorem reachesPostOffer_intro
    {e : CoveredEntity} {p : Person} {c : ComplaintText}
    (hApp : JobApplicationProcedureConducted e p c)
    (hOffer : OfferOfEmploymentMade e p c) :
    Reaches e p c EmploymentStage.PostOfferPreCommencement :=
  Reaches.postOffer (Reaches.application hApp) hOffer


theorem reachesEmployment_intro
    {e : CoveredEntity} {p : Person} {c : ComplaintText}
    (hApp : JobApplicationProcedureConducted e p c)
    (hOffer : OfferOfEmploymentMade e p c)
    (hCommenced : EmploymentDutiesCommenced e p c) :
    Reaches e p c EmploymentStage.Employment :=
  Reaches.employment (Reaches.postOffer (Reaches.application hApp) hOffer) hCommenced





theorem examinationWithinPostOfferWindow_intro
    {e : CoveredEntity} {m : MedicalExamination} {p : Person} {c : ComplaintText}
    (hAfter : dayOfEmploymentOffer e p c ≤ dayOfMedicalExamination e m p c)
    (hBefore : dayOfMedicalExamination e m p c < dayOfEmploymentDutiesCommencement e p c) :
    ExaminationWithinPostOfferWindow e m p c :=
  ⟨by omega, by omega⟩




theorem offerPrecedesCommencement_of_window
    {e : CoveredEntity} {m : MedicalExamination} {p : Person} {c : ComplaintText}
    (h : ExaminationWithinPostOfferWindow e m p c) :
    dayOfEmploymentOffer e p c < dayOfEmploymentDutiesCommencement e p c := by
  have h1 := h.afterOffer
  have h2 := h.beforeCommencing
  omega




theorem confidentialRecordHandling_intro
    {e : CoveredEntity} {p : Person} {c : ComplaintText}
    (hForms : MedicalInformationKeptOnSeparateConfidentialForms e p c)
    (hSup : RestrictionDisclosureLimitedToSupervisorsAndManagers e p c)
    (hSafety : EmergencyDisclosureLimitedToFirstAidAndSafetyPersonnel e p c)
    (hInvestigator : ComplianceInvestigatorRequestedInformation e p c →
                       RelevantInformationProvidedToComplianceInvestigator e p c) :
    ConfidentialRecordHandling e p c :=
  ⟨hForms, hSup, hSafety, hInvestigator⟩


theorem permittedPostOfferExamination_intro
    {e : CoveredEntity} {m : MedicalExamination} {p : Person} {c : ComplaintText}
    (hOffer : OfferOfEmploymentMade e p c)
    (hExam : MedicalExaminationConducted e m p c)
    (hWindow : ExaminationWithinPostOfferWindow e m p c)
    (hAll : AllEnteringEmployeesSubjectedToExamination e c)
    (hConf : ConfidentialRecordHandling e p c)
    (hUse : ExaminationResultsUsedOnlyAsThisSubchapterPermits e m p c) :
    PermittedPostOfferExamination e m p c :=
  ⟨hOffer, hExam, hWindow, hAll, hConf, hUse⟩




theorem preOfferMedicalInquiryBreach_intro
    {e : CoveredEntity} {m : MedicalExamination} {p : Person} {c : ComplaintText}
    (hStage : Reaches e p c EmploymentStage.JobApplication)
    (hNoOffer : ¬ OfferOfEmploymentMade e p c)
    (hStep : MedicalExaminationConducted e m p c ∨ DisabilityInquiryMade e p c)
    (hNotAbility : ¬ InquiryLimitedToJobRelatedAbility e p c) :
    PreOfferMedicalInquiryBreach e m p c :=
  ⟨hStage, hNoOffer, hStep, hNotAbility⟩


theorem employeeStageMedicalInquiryBreach_intro
    {e : CoveredEntity} {m : MedicalExamination} {p : Person} {c : ComplaintText}
    (hStage : Reaches e p c EmploymentStage.Employment)
    (hStep : MedicalExaminationConducted e m p c ∨ DisabilityInquiryMade e p c)
    (hNotJobRelated : ¬ ExaminationShownJobRelatedAndConsistentWithBusinessNecessity e m p c)
    (hNotVoluntary : ¬ ExaminationVoluntaryUnderEmployeeHealthProgram e m p c)
    (hNotAbility : ¬ InquiryLimitedToJobRelatedAbility e p c) :
    EmployeeStageMedicalInquiryBreach e m p c :=
  ⟨hStage, hStep, hNotJobRelated, hNotVoluntary, hNotAbility⟩


theorem accommodationProcessBreach_intro
    {e : CoveredEntity} {p : Person} {c : ComplaintText}
    (hKnown : KnownLimitationBroughtToEntityAttention e p c)
    (hNotAcc : ¬ ReasonableAccommodationMade e p c)
    (hNoHardship : ¬ UndueHardshipDemonstratedByEntity e p c) :
    AccommodationProcessBreach e p c :=
  ⟨hKnown, hNotAcc, hNoHardship⟩


theorem accommodationAvoidanceDenialBreach_intro
    {e : CoveredEntity} {p : Person} {c : ComplaintText}
    (hKnown : KnownLimitationBroughtToEntityAttention e p c)
    (hDenial : EmploymentOpportunityDeniedForAccommodationNeed e p c) :
    AccommodationAvoidanceDenialBreach e p c :=
  ⟨hKnown, hDenial⟩


theorem screeningStandardBreach_intro
    {e : CoveredEntity} {q : QualificationStandard} {p : Person} {c : ComplaintText}
    (hScreens : QualificationStandardScreensOutIndividualWithDisability e q p c)
    (hNotShown : ¬ StandardShownJobRelatedAndConsistentWithBusinessNecessity e q c) :
    ScreeningStandardBreach e q p c :=
  ⟨hScreens, hNotShown⟩


theorem testAdministrationBreach_intro
    {e : CoveredEntity} {t : EmploymentTest} {p : Person} {c : ComplaintText}
    (hImpaired : TestTakerSkillsImpairedBySensoryManualOrSpeakingDisability t p c)
    (hNotEffective : ¬ TestAdministeredInMostEffectiveManner e t p c)
    (hNotMeasured : ¬ ImpairedSkillsAreTheFactorTestPurportsToMeasure t c) :
    TestAdministrationBreach e t p c :=
  ⟨hImpaired, hNotEffective, hNotMeasured⟩




theorem foreignComplianceDefense_intro
    {e : CoveredEntity} {p : Person} {c : ComplaintText}
    (hForeign : WorkplaceLocatedInForeignCountry e p c)
    (hConflict : ComplianceWouldViolateForeignLaw e p c) :
    ForeignComplianceDefense e p c :=
  ⟨hForeign, hConflict⟩


theorem foreignOperationsExclusion_intro
    {e : CoveredEntity} {p : Person} {c : ComplaintText}
    (hForeign : WorkplaceLocatedInForeignCountry e p c)
    (hNotControlled : EmployerIsForeignPersonNotControlledByAmericanEmployer e c) :
    ForeignOperationsExclusion e p c :=
  ⟨hForeign, hNotControlled⟩


theorem sectionApplies_intro
    {e : CoveredEntity} {p : Person} {c : ComplaintText}
    (hNoDefense : ¬ ForeignComplianceDefense e p c)
    (hNoExclusion : ¬ ForeignOperationsExclusion e p c) :
    SectionApplies e p c :=
  ⟨hNoDefense, hNoExclusion⟩




theorem controlDeterminationBasis_intro
    {e : CoveredEntity} {f : ForeignCorporation} {c : ComplaintText}
    (hInterrelation : DeterminationConsideredInterrelationOfOperations e f c)
    (hManagement : DeterminationConsideredCommonManagement e f c)
    (hLabor : DeterminationConsideredCentralizedControlOfLaborRelations e f c)
    (hOwnership : DeterminationConsideredCommonOwnershipOrFinancialControl e f c) :
    ControlDeterminationBasis e f c :=
  ⟨hInterrelation, hManagement, hLabor, hOwnership⟩


theorem foreignSubsidiaryPresumption_intro
    {e : CoveredEntity} {f : ForeignCorporation} {p : Person} {c : ComplaintText}
    (hIncorporation : PlaceOfIncorporationIsForeignCountry f c)
    (hBasis : ControlDeterminationBasis e f c)
    (hControl : EmployerControlsForeignCorporation e f c)
    (hPractice : ForeignCorporationEngagedInDiscriminatoryPractice f p c) :
    ForeignSubsidiaryPresumption e f p c :=
  ⟨hIncorporation, hBasis, hControl, hPractice⟩




theorem section12112ProceduralClaim_intro
    {e : CoveredEntity} {p : Person} {c : ComplaintText}
    (hApplies : SectionApplies e p c)
    (hTheory : ProceduralBreachTheory e p c) :
    Section12112ProceduralClaim e p c :=
  ⟨hApplies, hTheory⟩

end Proving.USC.T42.ADA.Reslice.Procedure
