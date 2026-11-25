






import Proving.USC.T42.ADA.Reslice.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Elements

open Proving.USC.Common



theorem qualifiedIndividual_intro {p : Person} {c : ComplaintText}
    (hPrereq : SatisfiesJobPrerequisites p c)
    (hEssential : CanPerformEssentialFunctions p c) :
    QualifiedIndividual p c :=
  ⟨hPrereq, hEssential⟩



theorem practiceAttributedToCoveredEntity_intro
    {d : CoveredEntity} {a : EmploymentAction} {c : ComplaintText}
    (hDirect : EngagesInPracticeDirectly d a c) :
    PracticeAttributedToCoveredEntity d a c :=
  .direct hDirect

theorem practiceAttributedToCoveredEntity_of_controlledForeignCorporation
    {d : CoveredEntity} {f : ForeignCorporation} {a : EmploymentAction} {c : ComplaintText}
    (hControl : ControlsForeignCorporation d f c)
    (hPractice : ForeignCorporationEngagedInPractice f a c) :
    PracticeAttributedToCoveredEntity d a c :=
  .throughControlledForeignCorporation f hControl hPractice



theorem generalDiscrimination12112a_intro
    {p : Person} {a : EmploymentAction} {c : ComplaintText}
    (hDisability : HasDisability p c)
    (hQualified : IsQualifiedIndividual p c)
    (hAdverse : AdverseToIndividual p a c)
    (hCausation : OnTheBasisOfDisability p a c) :
    GeneralDiscrimination12112a p a c :=
  ⟨hDisability, hQualified, hAdverse, hCausation⟩

theorem discrimination12112b1_intro
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {c : ComplaintText}
    (hDisability : HasDisability p c)
    (hStatus : IsApplicantOrEmployee p c)
    (hLimits : LimitsSegregatesOrClassifies d p a c)
    (hAdverseEffect : AdverselyAffectsOpportunitiesOrStatus p a c)
    (hCausation : OnTheBasisOfDisability p a c) :
    Discrimination12112b1 d p a c :=
  ⟨hDisability, hStatus, hLimits, hAdverseEffect, hCausation⟩

theorem discrimination12112b2_intro
    {d : CoveredEntity} {p : Person} {k : ContractualArrangement} {c : ComplaintText}
    (hDisability : HasDisability p c)
    (hQualified : IsQualifiedIndividual p c)
    (hParticipates : ParticipatesInContractualOrOtherArrangement d k c)
    (hSubjects : ArrangementSubjectsIndividualToProhibitedDiscrimination k p c) :
    Discrimination12112b2 d p k c :=
  ⟨hDisability, hQualified, hParticipates, hSubjects⟩

theorem discrimination12112b3_intro
    {d : CoveredEntity} {s : SelectionCriterion} {c : ComplaintText}
    (hUse : UtilizesStandardsCriteriaOrMethodsOfAdministration d s c)
    (hEffect : HasEffectOfDiscriminationOnBasisOfDisability s c) :
    Discrimination12112b3 d s c :=
  .disparateEffect hUse hEffect

theorem discrimination12112b3_of_perpetuation
    {d : CoveredEntity} {s : SelectionCriterion} {c : ComplaintText}
    (hUse : UtilizesStandardsCriteriaOrMethodsOfAdministration d s c)
    (hPerp : PerpetuatesDiscriminationUnderCommonAdministrativeControl s c) :
    Discrimination12112b3 d s c :=
  .perpetuation hUse hPerp

theorem discrimination12112b4_intro
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {c : ComplaintText}
    (hQualified : IsQualifiedIndividual p c)
    (hExcludes : ExcludesOrDeniesEqualJobsOrBenefits d p a c)
    (hRelationship : HasKnownRelationshipOrAssociation p c)
    (hKnown : AssociatesDisabilityKnownToCoveredEntity d p c) :
    Discrimination12112b4 d p a c :=
  ⟨hQualified, hExcludes, hRelationship, hKnown⟩

theorem discrimination12112b5A_intro
    {d : CoveredEntity} {p : Person} {acc : Accommodation} {c : ComplaintText}
    (hDisability : HasDisability p c)
    (hQualified : IsQualifiedIndividual p c)
    (hStatus : IsApplicantOrEmployee p c)
    (hKnownLimits : LimitationsKnownToCoveredEntity d p c)
    (hReasonable : AccommodationIsReasonable acc p c)
    (hFailure : FailsToMakeAccommodation d acc p c)
    (hNoHardship : ¬ ImposesUndueHardship acc d c) :
    Discrimination12112b5A d p acc c :=
  ⟨hDisability, hQualified, hStatus, hKnownLimits, hReasonable, hFailure, hNoHardship⟩

theorem discrimination12112b5B_intro
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {c : ComplaintText}
    (hDisability : HasDisability p c)
    (hQualified : IsQualifiedIndividual p c)
    (hStatus : IsApplicantOrEmployee p c)
    (hDenial : DeniesEmploymentOpportunities d p a c)
    (hBasis : DenialBasedOnNeedToAccommodate d p a c) :
    Discrimination12112b5B d p a c :=
  ⟨hDisability, hQualified, hStatus, hDenial, hBasis⟩

theorem discrimination12112b5_intro
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {acc : Accommodation}
    {c : ComplaintText}
    (h : Discrimination12112b5A d p acc c) :
    Discrimination12112b5 d p a c :=
  .failureToAccommodate acc h

theorem discrimination12112b5_of_denial
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {c : ComplaintText}
    (h : Discrimination12112b5B d p a c) :
    Discrimination12112b5 d p a c :=
  .denialBecauseAccommodationNeeded h

theorem discrimination12112b6_intro
    {d : CoveredEntity} {p : Person} {s : SelectionCriterion} {c : ComplaintText}
    (hDisability : HasDisability p c)
    (hUses : UsesQualificationStandardOrSelectionCriterion d s c)
    (hScreens : ScreensOutIndividualWithDisability s p c)
    (hNotJustified :
      ¬ (IsJobRelatedForPositionInQuestion s c ∧ IsConsistentWithBusinessNecessity s c)) :
    Discrimination12112b6 d p s c :=
  ⟨hDisability, hUses, hScreens, hNotJustified⟩

theorem discrimination12112b7_intro
    {d : CoveredEntity} {p : Person} {t : EmploymentTest} {c : ComplaintText}
    (hDisability : HasDisability p c)
    (hStatus : IsApplicantOrEmployee p c)
    (hImpaired : HasSensoryManualOrSpeakingImpairment p c)
    (hFails : FailsToAdministerTestInMostEffectiveManner d t c)
    (hResults : TestResultsReflectImpairedSkills t p c)
    (hNotMeasured : ¬ ImpairedSkillsAreTheMeasuredFactors t c) :
    Discrimination12112b7 d p t c :=
  ⟨hDisability, hStatus, hImpaired, hFails, hResults, hNotMeasured⟩



theorem postOfferExaminationSafeHarbor12112d3_intro
    {d : CoveredEntity} {m : MedicalInquiry} {c : ComplaintText}
    (hTiming : MadeAfterOfferAndBeforeCommencement m c)
    (hAllEntering : AllEnteringEmployeesExaminedRegardlessOfDisability m d c)
    (hConfidential : MedicalInformationKeptConfidentialAndSeparate m d c)
    (hUseLimited : ExaminationResultsUsedOnlyAsSubchapterPermits m d c) :
    PostOfferExaminationSafeHarbor12112d3 d m c :=
  ⟨hTiming, hAllEntering, hConfidential, hUseLimited⟩

theorem discrimination12112d2_intro
    {d : CoveredEntity} {p : Person} {m : MedicalInquiry} {c : ComplaintText}
    (hApplicant : IsJobApplicant p c)
    (hExam : ConductsMedicalExaminationOrDisabilityInquiry d m p c)
    (hPreOffer : PrecededConditionalOfferOfEmployment m c)
    (hNotAbility : ¬ LimitedToAbilityToPerformJobRelatedFunctions m c)
    (hNotSafeHarbored : ¬ PostOfferExaminationSafeHarbor d m c) :
    Discrimination12112d2 d p m c :=
  ⟨hApplicant, hExam, hPreOffer, hNotAbility, hNotSafeHarbored⟩

theorem discrimination12112d4_intro
    {d : CoveredEntity} {p : Person} {m : MedicalInquiry} {c : ComplaintText}
    (hEmployee : IsCurrentEmployee p c)
    (hExam : RequiresMedicalExaminationOrInquiryOfEmployee d m p c)
    (hNotJustified :
      ¬ (ExaminationIsJobRelated m c ∧ ExaminationIsConsistentWithBusinessNecessity m c))
    (hNotVoluntary : ¬ IsVoluntaryEmployeeHealthProgramExamination m d c)
    (hNotAbility : ¬ LimitedToAbilityToPerformJobRelatedFunctions m c) :
    Discrimination12112d4 d p m c :=
  ⟨hEmployee, hExam, hNotJustified, hNotVoluntary, hNotAbility⟩

theorem confidentiality12112d4C_intro
    {d : CoveredEntity} {p : Person} {m : MedicalInquiry} {c : ComplaintText}
    (hEmployee : IsCurrentEmployee p c)
    (hVoluntary : IsVoluntaryEmployeeHealthProgramExamination m d c)
    (hBreach : ¬ MedicalInformationKeptConfidentialAndSeparate m d c) :
    Confidentiality12112d4C d p m c :=
  .confidentialityBreach hEmployee hVoluntary hBreach

theorem confidentiality12112d4C_of_improperUse
    {d : CoveredEntity} {p : Person} {m : MedicalInquiry} {c : ComplaintText}
    (hEmployee : IsCurrentEmployee p c)
    (hVoluntary : IsVoluntaryEmployeeHealthProgramExamination m d c)
    (hMisuse : ¬ ExaminationResultsUsedOnlyAsSubchapterPermits m d c) :
    Confidentiality12112d4C d p m c :=
  .improperUse hEmployee hVoluntary hMisuse



theorem discriminationTheory12112_intro
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {c : ComplaintText}
    (h : GeneralDiscrimination12112a p a c) :
    DiscriminationTheory12112 d p a c :=
  .general h

theorem discriminationTheory12112_of_b1
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {c : ComplaintText}
    (h : Discrimination12112b1 d p a c) :
    DiscriminationTheory12112 d p a c :=
  .limitSegregateClassify h

theorem discriminationTheory12112_of_b2
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {k : ContractualArrangement}
    {c : ComplaintText}
    (h : Discrimination12112b2 d p k c) :
    DiscriminationTheory12112 d p a c :=
  .contractualArrangement k h

theorem discriminationTheory12112_of_b3
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {s : SelectionCriterion}
    {c : ComplaintText}
    (h : Discrimination12112b3 d s c) :
    DiscriminationTheory12112 d p a c :=
  .standardsCriteriaMethods s h

theorem discriminationTheory12112_of_b4
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {c : ComplaintText}
    (h : Discrimination12112b4 d p a c) :
    DiscriminationTheory12112 d p a c :=
  .associationalDiscrimination h

theorem discriminationTheory12112_of_b5
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {c : ComplaintText}
    (h : Discrimination12112b5 d p a c) :
    DiscriminationTheory12112 d p a c :=
  .accommodation h

theorem discriminationTheory12112_of_b6
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {s : SelectionCriterion}
    {c : ComplaintText}
    (h : Discrimination12112b6 d p s c) :
    DiscriminationTheory12112 d p a c :=
  .qualificationStandards s h

theorem discriminationTheory12112_of_b7
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {t : EmploymentTest}
    {c : ComplaintText}
    (h : Discrimination12112b7 d p t c) :
    DiscriminationTheory12112 d p a c :=
  .testAdministration t h

theorem discriminationTheory12112_of_d2
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {m : MedicalInquiry}
    {c : ComplaintText}
    (h : Discrimination12112d2 d p m c) :
    DiscriminationTheory12112 d p a c :=
  .applicantMedicalInquiry m h

theorem discriminationTheory12112_of_d4
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {m : MedicalInquiry}
    {c : ComplaintText}
    (h : Discrimination12112d4 d p m c) :
    DiscriminationTheory12112 d p a c :=
  .employeeMedicalInquiry m h

theorem discriminationTheory12112_of_d4C
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {m : MedicalInquiry}
    {c : ComplaintText}
    (h : Confidentiality12112d4C d p m c) :
    DiscriminationTheory12112 d p a c :=
  .medicalConfidentiality m h



theorem section12112_intro
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {c : ComplaintText}
    (hCovered : IsCoveredEntity d c)
    (hPractice : AffectsCoveredEmploymentPractice a c)
    (hAttribution : PracticeAttributedToCoveredEntity d a c)
    (hTheory : DiscriminationTheory12112 d p a c)
    (hNoForeignLawConflict : ¬ ForeignLawComplianceConflict d p c)
    (hNoUncontrolledForeign : ¬ ForeignOperationsOfUncontrolledForeignEmployer d p c) :
    Section12112 d p a c :=
  ⟨hCovered, hPractice, hAttribution, hTheory, hNoForeignLawConflict, hNoUncontrolledForeign⟩

theorem validSection12112Claim_intro
    {d : CoveredEntity} {p : Person} {a : EmploymentAction} {c : ComplaintText}
    (hViolation : Section12112 d p a c)
    (hInjury : SufferedInjuryFromPractice p a c)
    (hCause : ProximateCause p c)
    (hTimely : WithinLimitations p c) :
    ValidSection12112Claim d p a c :=
  ⟨hViolation, hInjury, hCause, hTimely⟩

end Proving.USC.T42.ADA.Reslice.Elements
