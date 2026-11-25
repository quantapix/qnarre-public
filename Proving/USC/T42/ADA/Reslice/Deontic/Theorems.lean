







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.ADA.Reslice.Deontic.Types
import Proving.USC.T42.ADA.Reslice.Deontic.Predicates
import Proving.USC.T42.ADA.Reslice.Deontic.Statute

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Deontic

open Proving.USC.Common



theorem foreignLawDefense12112c1_intro {e : Entity} {p : Person} {w : Workplace}
    {c : ComplaintText}
    (hAbroad : EmployeeWorkplaceInForeignCountry p w c)
    (hConflict : ComplianceWouldViolateForeignLaw e w c) :
    ForeignLawDefense12112c1 e p w c :=
  ⟨hAbroad, hConflict⟩

theorem foreignLawExempt12112c1_intro {e : Entity} {p : Person} {c : ComplaintText}
    (w : Workplace) (h : ForeignLawDefense12112c1 e p w c) :
    ForeignLawExempt12112c1 e p c :=
  ⟨w, h⟩

theorem scopeExclusion12112c2B_intro {e : Entity} {p : Person} {c : ComplaintText}
    (hForeign : IsForeignPersonNotControlledByAmericanEmployer e c)
    (hOperations : ConductConcernsForeignOperations e p c) :
    ScopeExclusion12112c2B e p c :=
  ⟨hForeign, hOperations⟩

theorem imputedPractice12112c2A_intro {e f : Entity} {p : Person}
    {c : ComplaintText}
    (hControl : ControlsForeignCorporation e f c)
    (hIncorporated : ForeignCorporationIncorporatedAbroad f c)
    (hPractice : PracticeConstitutingDiscriminationEngagedInBy f p c) :
    ImputedPractice12112c2A e f p c :=
  ⟨hControl, hIncorporated, hPractice⟩

theorem controlFactors12112c2C_intro {e f : Entity} {c : ComplaintText}
    (hInterrelation : InterrelationOfOperations e f c)
    (hManagement : CommonManagement e f c)
    (hLabor : CentralizedControlOfLaborRelations e f c)
    (hOwnership : CommonOwnershipOrFinancialControl e f c) :
    ControlFactors12112c2C e f c :=
  ⟨hInterrelation, hManagement, hLabor, hOwnership⟩



theorem prohibition12112a_intro {e : Entity} {p : Person} {t : EmploymentTerm}
    {c : ComplaintText}
    (hAddressee : IsCoveredEntity e c)
    (hClass : IsQualifiedIndividualWithDisability p e c)
    (hMatter : ActionConcernsEmploymentTerm e p t c) :
    Prohibition12112a e p t c :=
  ⟨hAddressee, hClass, hMatter⟩

theorem discriminatoryAct12112b_intro {e : Entity} {p : Person}
    {c : ComplaintText} (t : EmploymentTerm)
    (hAct : AdverseEmploymentActionTaken e p t c) :
    DiscriminatoryAct12112b e p c :=
  .residual t hAct

theorem discriminatoryAct12112b_accommodationFailure_intro {e : Entity}
    {p : Person} {c : ComplaintText} (a : Accommodation)
    (hKnown : LimitationsKnownToCoveredEntity e p c)
    (hOmitted : ReasonableAccommodationNotMade e p a c)
    (hNoHardship : ¬ AccommodationImposesUndueHardship e a c) :
    DiscriminatoryAct12112b e p c :=
  .accommodationFailure a hKnown hOmitted hNoHardship

theorem discriminatoryAct12112b_screeningCriterion_intro {e : Entity} {p : Person}
    {c : ComplaintText} (s : SelectionCriterion)
    (hUse : UsedSelectionCriterion e s p c)
    (hScreen : SelectionCriterionScreensOutDisability e s p c)
    (hUnjustified :
      ¬ SelectionCriterionJobRelatedAndConsistentWithBusinessNecessity e s c) :
    DiscriminatoryAct12112b e p c :=
  .screeningCriterion s hUse hScreen hUnjustified

theorem discriminatoryAct12112b_testAdministration_intro {e : Entity} {p : Person}
    {c : ComplaintText} (t : EmploymentTest)
    (hImpairment : TestTakerHasSensoryManualOrSpeakingImpairment p c)
    (hFailure : FailedToAdministerTestInMostEffectiveManner e t p c)
    (hNotTheFactor : ¬ ImpairedSkillsAreFactorsTestPurportsToMeasure t c) :
    DiscriminatoryAct12112b e p c :=
  .testAdministration t hImpairment hFailure hNotTheFactor

theorem violation12112a_intro {e : Entity} {p : Person} {t : EmploymentTerm}
    {c : ComplaintText}
    (hNorm : Prohibition12112a e p t c)
    (hBasis : OnBasisOfDisability e p c)
    (hAct : DiscriminatoryAct12112b e p c)
    (hNotExempt : ¬ ForeignLawExempt12112c1 e p c)
    (hInScope : ¬ ScopeExclusion12112c2B e p c) :
    Violation12112a e p t c :=
  ⟨hNorm, hBasis, hAct, hNotExempt, hInScope⟩



theorem permission12112d3_intro {e : Entity} {p : Person} {m : MedicalExamination}
    {r : MedicalRecord} {c : ComplaintText}
    (hAddressee : IsCoveredEntity e c)
    (hApplicant : IsJobApplicantOf p e c)
    (hTiming : ExaminationAfterOfferBeforeDutiesCommence e p m c)
    (hUniform : AllEnteringEmployeesExaminedRegardlessOfDisability e m c)
    (hConfidential : MedicalInfoOnSeparateFormsAndTreatedConfidential e r c)
    (hUseLimit : ExaminationResultsUsedOnlyInAccordanceWithSubchapter e m c) :
    Permission12112d3 e p m r c :=
  ⟨hAddressee, hApplicant, hTiming, hUniform, hConfidential, hUseLimit⟩

theorem postOfferExceptionApplies12112d3_intro {e : Entity} {p : Person}
    {m : MedicalExamination} {c : ComplaintText} (r : MedicalRecord)
    (h : Permission12112d3 e p m r c) :
    PostOfferExceptionApplies12112d3 e p m c :=
  ⟨r, h⟩

theorem permittedOfferCondition12112d3_intro {e : Entity} {p : Person}
    {m : MedicalExamination} {r : MedicalRecord} {c : ComplaintText}
    (hConditions : Permission12112d3 e p m r c)
    (hAct : OfferConditionedOnExaminationResults e p m c) :
    PermittedOfferCondition12112d3 e p m r c :=
  ⟨hConditions, hAct⟩

theorem prohibition12112d2A_intro {e : Entity} {p : Person} {c : ComplaintText}
    (hAddressee : IsCoveredEntity e c)
    (hApplicant : IsJobApplicantOf p e c) :
    Prohibition12112d2A e p c :=
  ⟨hAddressee, hApplicant⟩

theorem preOfferMedicalAct12112d2A_intro {e : Entity} {p : Person}
    {m : MedicalExamination} {c : ComplaintText}
    (h : ConductedMedicalExaminationOfApplicant e p m c) :
    PreOfferMedicalAct12112d2A e p m c :=
  .examination h

theorem preOfferMedicalAct12112d2A_inquiry_intro {e : Entity} {p : Person}
    {m : MedicalExamination} {c : ComplaintText}
    (h : MadeDisabilityInquiryOfApplicant e p m c) :
    PreOfferMedicalAct12112d2A e p m c :=
  .inquiry h

theorem violation12112d2A_intro {e : Entity} {p : Person} {m : MedicalExamination}
    {c : ComplaintText}
    (hNorm : Prohibition12112d2A e p c)
    (hMedical : ExaminationIsMedicalExaminationOrInquiry m c)
    (hAct : PreOfferMedicalAct12112d2A e p m c)
    (hNotExcepted : ¬ PostOfferExceptionApplies12112d3 e p m c) :
    Violation12112d2A e p m c :=
  ⟨hNorm, hMedical, hAct, hNotExcepted⟩

theorem permission12112d2B_intro {e : Entity} {p : Person}
    {m : MedicalExamination} {c : ComplaintText}
    (hAddressee : IsCoveredEntity e c)
    (hApplicant : IsJobApplicantOf p e c)
    (hAct : InquiryIntoApplicantJobRelatedAbility e p m c) :
    Permission12112d2B e p m c :=
  ⟨hAddressee, hApplicant, hAct⟩

theorem permittedSupervisorDisclosure12112d3Bi_intro {e : Entity}
    {r : MedicalRecord} {c : ComplaintText}
    (hAddressee : IsCoveredEntity e c)
    (hAct : SupervisorsInformedOfNecessaryRestrictions e r c) :
    PermittedSupervisorDisclosure12112d3Bi e r c :=
  ⟨hAddressee, hAct⟩

theorem permittedFirstAidDisclosure12112d3Bii_intro {e : Entity}
    {r : MedicalRecord} {c : ComplaintText}
    (hAddressee : IsCoveredEntity e c)
    (hAct : FirstAidPersonnelInformedOfEmergencyNeed e r c) :
    PermittedFirstAidDisclosure12112d3Bii e r c :=
  ⟨hAddressee, hAct⟩

theorem obligation12112d3Biii_intro {e : Entity} {r : MedicalRecord}
    {c : ComplaintText}
    (hAddressee : IsCoveredEntity e c)
    (hRequest : GovernmentOfficialRequestedRelevantInformation r c) :
    Obligation12112d3Biii e r c :=
  ⟨hAddressee, hRequest⟩

theorem breach12112d3Biii_intro {e : Entity} {r : MedicalRecord}
    {c : ComplaintText}
    (hNorm : Obligation12112d3Biii e r c)
    (hOmission : ¬ RelevantInformationProvidedToInvestigatingOfficials e r c) :
    Breach12112d3Biii e r c :=
  ⟨hNorm, hOmission⟩



theorem prohibition12112d4A_intro {e : Entity} {p : Person} {c : ComplaintText}
    (hAddressee : IsCoveredEntity e c)
    (hEmployee : IsEmployeeOf p e c) :
    Prohibition12112d4A e p c :=
  ⟨hAddressee, hEmployee⟩

theorem employeeMedicalAct12112d4A_intro {e : Entity} {p : Person}
    {m : MedicalExamination} {c : ComplaintText}
    (h : RequiredMedicalExaminationOfEmployee e p m c) :
    EmployeeMedicalAct12112d4A e p m c :=
  .examination h

theorem employeeMedicalAct12112d4A_inquiry_intro {e : Entity} {p : Person}
    {m : MedicalExamination} {c : ComplaintText}
    (h : MadeDisabilityInquiryOfEmployee e p m c) :
    EmployeeMedicalAct12112d4A e p m c :=
  .inquiry h

theorem violation12112d4A_intro {e : Entity} {p : Person} {m : MedicalExamination}
    {c : ComplaintText}
    (hNorm : Prohibition12112d4A e p c)
    (hMedical : ExaminationIsMedicalExaminationOrInquiry m c)
    (hAct : EmployeeMedicalAct12112d4A e p m c)
    (hNotJustified :
      ¬ ExaminationJobRelatedAndConsistentWithBusinessNecessity e m c) :
    Violation12112d4A e p m c :=
  ⟨hNorm, hMedical, hAct, hNotJustified⟩

theorem voluntaryProgramAct12112d4B_intro {e : Entity} {p : Person}
    {m : MedicalExamination} {c : ComplaintText}
    (h : VoluntaryExaminationInEmployeeHealthProgram e p m c) :
    VoluntaryProgramAct12112d4B e p m c :=
  .voluntaryExamination h

theorem permission12112d4B_intro {e : Entity} {p : Person}
    {m : MedicalExamination} {c : ComplaintText}
    (hAddressee : IsCoveredEntity e c)
    (hEmployee : IsEmployeeOf p e c)
    (hAct : VoluntaryProgramAct12112d4B e p m c) :
    Permission12112d4B e p m c :=
  ⟨hAddressee, hEmployee, hAct⟩

theorem obligation12112d4C_intro {e : Entity} {p : Person}
    {m : MedicalExamination} {r : MedicalRecord} {c : ComplaintText}
    (hAddressee : IsCoveredEntity e c)
    (hSource : VoluntaryExaminationInEmployeeHealthProgram e p m c)
    (hInfo : InformationObtainedUnderVoluntaryProgram r m c) :
    Obligation12112d4C e p m r c :=
  ⟨hAddressee, hSource, hInfo⟩

theorem breach12112d4C_intro {e : Entity} {p : Person} {m : MedicalExamination}
    {r : MedicalRecord} {c : ComplaintText}
    (hNorm : Obligation12112d4C e p m r c)
    (hOmission : ¬ MedicalInfoOnSeparateFormsAndTreatedConfidential e r c
        ∨ ¬ ExaminationResultsUsedOnlyInAccordanceWithSubchapter e m c) :
    Breach12112d4C e p m r c :=
  ⟨hNorm, hOmission⟩



theorem medicalExamWithinProhibition12112d1_intro {e : Entity} {p : Person}
    {m : MedicalExamination} {c : ComplaintText}
    (h : Violation12112d2A e p m c) :
    MedicalExamWithinProhibition12112d1 e p m c :=
  .applicant h

theorem medicalExamWithinProhibition12112d1_employee_intro {e : Entity}
    {p : Person} {m : MedicalExamination} {c : ComplaintText}
    (h : Violation12112d4A e p m c) :
    MedicalExamWithinProhibition12112d1 e p m c :=
  .employee h

end Proving.USC.T42.ADA.Reslice.Deontic
