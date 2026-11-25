









import Proving.USC.T42.ADA.Reslice.Ontology.Types
import Proving.USC.T42.ADA.Reslice.Ontology.Predicates
import Proving.USC.T42.ADA.Reslice.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Ontology

open Proving.USC.Common




theorem qualifiedIndividualWithDisability_intro
    {p : Person} {d : Disability} {c : ComplaintText}
    (hq : IsQualifiedIndividual p c) (hd : IsDisability d c)
    (hb : HasDisability p d c) : QualifiedIndividualWithDisability p d c :=
  ⟨hq, hd, hb⟩




theorem limitingSegregatingOrClassifying_intro
    {e : Entity} {p : Person} {prac : EmploymentPractice} {d : Disability}
    {c : ComplaintText}
    (hce : IsCoveredEntity e c)
    (hae : IsJobApplicant p e c ∨ IsEmployee p e c)
    (hlim : LimitsSegregatesOrClassifies e p prac c)
    (hadv : AdverselyAffectsOpportunitiesOrStatus prac p c)
    (hbec : BecauseOfDisabilityOfApplicantOrEmployee prac p d c)
    : LimitingSegregatingOrClassifying e p prac d c :=
  ⟨hce, hae, hlim, hadv, hbec⟩


theorem participationInDiscriminatoryArrangement_intro
    {e : Entity} {arr : ContractualArrangement} {p : Person} {c : ComplaintText}
    (hce : IsCoveredEntity e c)
    (hpart : ParticipatesInArrangementOrRelationship e arr c)
    (hae : IsJobApplicant p e c ∨ IsEmployee p e c)
    (heff : ArrangementSubjectsToProhibitedDiscrimination arr p c)
    : ParticipationInDiscriminatoryArrangement e arr p c :=
  ⟨hce, hpart, hae, heff⟩


theorem utilizingDiscriminatoryStandards_intro
    {e : Entity} {std : AdministrativeStandard} {c : ComplaintText}
    (hce : IsCoveredEntity e c)
    (huse : UtilizesStandardsCriteriaOrMethodsOfAdministration e std c)
    (hvice : DiscriminatoryAdministrativeEffect std c)
    : UtilizingDiscriminatoryStandards e std c :=
  ⟨hce, huse, hvice⟩


theorem associationalExclusion_intro
    {e : Entity} {p assoc : Person} {d : Disability}
    {opp : EmploymentOpportunity} {c : ComplaintText}
    (hce : IsCoveredEntity e c)
    (hq : IsQualifiedIndividual p c)
    (hex : ExcludesOrDeniesEqualJobsOrBenefits e p opp c)
    (hrel : HasKnownRelationshipOrAssociation p assoc c)
    (hdis : HasDisability assoc d c)
    (hknown : DisabilityIsKnownToCoveredEntity e assoc d c)
    : AssociationalExclusion e p assoc d opp c :=
  ⟨hce, hq, hex, hrel, hdis, hknown⟩


theorem failureToAccommodate_intro
    {e : Entity} {p : Person} {acc : Accommodation} {d : Disability}
    {c : ComplaintText}
    (hce : IsCoveredEntity e c)
    (hoq : IsOtherwiseQualifiedIndividualWithDisability p d c)
    (hae : IsJobApplicant p e c ∨ IsEmployee p e c)
    (hknown : IsKnownPhysicalOrMentalLimitation p d e c)
    (hreas : IsReasonableAccommodation acc c)
    (hfail : FailsToMakeReasonableAccommodation e p acc c)
    (hnoUH : ¬ DemonstratesUndueHardship e acc c)
    : FailureToAccommodate e p acc d c :=
  ⟨hce, hoq, hae, hknown, hreas, hfail, hnoUH⟩


theorem accommodationBasedDenial_intro
    {e : Entity} {p : Person} {d : Disability} {opp : EmploymentOpportunity}
    {c : ComplaintText}
    (hce : IsCoveredEntity e c)
    (hoq : IsOtherwiseQualifiedIndividualWithDisability p d c)
    (hae : IsJobApplicant p e c ∨ IsEmployee p e c)
    (hden : DeniesEmploymentOpportunity e p opp c)
    (hbase : DenialBasedOnNeedToAccommodate e opp p c)
    : AccommodationBasedDenial e p d opp c :=
  ⟨hce, hoq, hae, hden, hbase⟩


theorem discriminatoryQualificationStandard_intro
    {e : Entity} {q : QualificationStandard} {p : Person} {c : ComplaintText}
    (hce : IsCoveredEntity e c)
    (huse : UsesQualificationStandardOrSelectionCriteria e q c)
    (hscr : ScreensOutIndividualWithDisability q p c)
    (hnj : ¬ (IsJobRelatedForThePositionInQuestion q c ∧
              IsConsistentWithBusinessNecessity q c))
    : DiscriminatoryQualificationStandard e q p c :=
  ⟨hce, huse, hscr, hnj⟩


theorem ineffectiveTestAdministration_intro
    {e : Entity} {t : EmploymentTest} {p : Person} {d : Disability}
    {c : ComplaintText}
    (hce : IsCoveredEntity e c)
    (hae : IsJobApplicant p e c ∨ IsEmployee p e c)
    (himp : DisabilityImpairsSensoryManualOrSpeakingSkills p d c)
    (hfail : FailsToSelectAndAdministerTestInMostEffectiveManner e t p c)
    (hskew : TestResultsReflectImpairedSkillsRatherThanMeasuredFactor t p c)
    (hexc : ¬ ImpairedSkillsAreTheFactorTestPurportsToMeasure t c)
    : IneffectiveTestAdministration e t p d c :=
  ⟨hce, hae, himp, hfail, hskew, hexc⟩




theorem prohibitedApplicantExamination_intro
    {e : Entity} {m : MedicalExamination} {p : Person} {c : ComplaintText}
    (hce : IsCoveredEntity e c)
    (happ : IsJobApplicant p e c)
    (hme : IsMedicalExamination m c)
    (hcond : ConductsMedicalExamination e m p c)
    (hnpo : ¬ IsPostOfferPreCommencementExamination m p c)
    : ProhibitedApplicantExamination e m p c :=
  ⟨hce, happ, hme, hcond, hnpo⟩


theorem prohibitedApplicantInquiry_intro
    {e : Entity} {q : MedicalInquiry} {p : Person} {c : ComplaintText}
    (hce : IsCoveredEntity e c)
    (happ : IsJobApplicant p e c)
    (hinq : MakesInquiryAsToDisabilityOrItsNatureOrSeverity e q p c)
    (hnab : ¬ IsInquiryIntoAbilityToPerformJobRelatedFunctions q c)
    : ProhibitedApplicantInquiry e q p c :=
  ⟨hce, happ, hinq, hnab⟩


theorem permittedPostOfferExamination_intro
    {e : Entity} {m : MedicalExamination} {p : Person} {r : MedicalRecord}
    {c : ComplaintText}
    (hce : IsCoveredEntity e c)
    (happ : IsJobApplicant p e c)
    (hme : IsMedicalExamination m c)
    (hpo : IsPostOfferPreCommencementExamination m p c)
    (huni : AllEnteringEmployeesSubjectedRegardlessOfDisability e m c)
    (hder : RecordDerivedFromExamination r m c)
    (hsep : IsCollectedOnSeparateFormsInSeparateMedicalFiles r e c)
    (hconf : IsTreatedAsConfidentialMedicalRecord r e c)
    (huse : ExaminationResultsUsedOnlyInAccordanceWithSubchapter e m c)
    : PermittedPostOfferExamination e m p r c :=
  ⟨hce, happ, hme, hpo, huni, hder, hsep, hconf, huse⟩


theorem prohibitedEmployeeExamination_intro
    {e : Entity} {m : MedicalExamination} {p : Person} {c : ComplaintText}
    (hce : IsCoveredEntity e c)
    (hemp : IsEmployee p e c)
    (hme : IsMedicalExamination m c)
    (hcond : ConductsMedicalExamination e m p c)
    (hnj : ¬ ExaminationIsJobRelatedAndConsistentWithBusinessNecessity m c)
    (hnv : ¬ IsVoluntaryExaminationInEmployeeHealthProgram m e c)
    : ProhibitedEmployeeExamination e m p c :=
  ⟨hce, hemp, hme, hcond, hnj, hnv⟩


theorem permittedVoluntaryExamination_intro
    {e : Entity} {m : MedicalExamination} {c : ComplaintText}
    (hce : IsCoveredEntity e c)
    (hme : IsMedicalExamination m c)
    (hvol : IsVoluntaryExaminationInEmployeeHealthProgram m e c)
    (havail : IsAvailableToEmployeesAtWorkSite m e c)
    : PermittedVoluntaryExamination e m c :=
  ⟨hce, hme, hvol, havail⟩




theorem foreignLawConflictException_intro
    {e : Entity} {p : Person} {w : Workplace} {fc : ForeignCountry}
    {c : ComplaintText}
    (hce : IsCoveredEntity e c)
    (hemp : IsEmployee p e c)
    (hat : EmployeeWorksAtWorkplace p w c)
    (hfw : IsWorkplaceInForeignCountry w fc c)
    (hcon : ComplianceWouldViolateForeignLaw e fc c)
    : ForeignLawConflictException e p w fc c :=
  ⟨hce, hemp, hat, hfw, hcon⟩


theorem controlDeterminationBasis_intro
    {emp corp : Entity} {c : ComplaintText}
    (hint : HasInterrelationOfOperations emp corp c)
    (hman : HasCommonManagement emp corp c)
    (hlab : HasCentralizedControlOfLaborRelations emp corp c)
    (hown : HasCommonOwnershipOrFinancialControl emp corp c)
    : ControlDeterminationBasis emp corp c :=
  ⟨hint, hman, hlab, hown⟩


theorem foreignCorporationPracticeAttribution_intro
    {emp corp : Entity} {fc : ForeignCountry} {prac : EmploymentPractice}
    {c : ComplaintText}
    (hctl : EmployerControlsCorporation emp corp c)
    (hinc : IsIncorporatedInForeignCountry corp fc c)
    (heng : EngagedInPractice corp prac c)
    : ForeignCorporationPracticeAttribution emp corp fc prac c :=
  ⟨hctl, hinc, heng⟩


theorem foreignPersonOperationsExclusion_intro
    {emp : Entity} {prac : EmploymentPractice} {c : ComplaintText}
    (hfp : IsForeignPerson emp c)
    (hfo : IsForeignOperationOfEmployer prac emp c)
    (hnac : ¬ ∃ amer : Entity,
        IsAmericanEmployer amer c ∧ EmployerControlsCorporation amer emp c)
    : ForeignPersonOperationsExclusion emp prac c :=
  ⟨hfp, hfo, hnac⟩




theorem discriminate_of_limitingSegregatingOrClassifying
    {e : Entity} {p : Person} {prac : EmploymentPractice} {d : Disability}
    {c : ComplaintText} (h : LimitingSegregatingOrClassifying e p prac d c)
    : DiscriminateOnBasisOfDisability e p c :=
  .limitingSegregatingClassifying prac d h


theorem discriminate_of_participationInDiscriminatoryArrangement
    {e : Entity} {arr : ContractualArrangement} {p : Person}
    {c : ComplaintText} (h : ParticipationInDiscriminatoryArrangement e arr p c)
    : DiscriminateOnBasisOfDisability e p c :=
  .discriminatoryArrangement arr h


theorem discriminate_of_utilizingDiscriminatoryStandards
    {e : Entity} {p : Person} {std : AdministrativeStandard}
    {c : ComplaintText} (h : UtilizingDiscriminatoryStandards e std c)
    : DiscriminateOnBasisOfDisability e p c :=
  .discriminatoryAdministration std h


theorem discriminate_of_associationalExclusion
    {e : Entity} {p assoc : Person} {d : Disability}
    {opp : EmploymentOpportunity} {c : ComplaintText}
    (h : AssociationalExclusion e p assoc d opp c)
    : DiscriminateOnBasisOfDisability e p c :=
  .associationalExclusion assoc d opp h


theorem discriminate_of_failureToAccommodate
    {e : Entity} {p : Person} {acc : Accommodation} {d : Disability}
    {c : ComplaintText} (h : FailureToAccommodate e p acc d c)
    : DiscriminateOnBasisOfDisability e p c :=
  .failureToAccommodate acc d h


theorem discriminate_of_accommodationBasedDenial
    {e : Entity} {p : Person} {d : Disability} {opp : EmploymentOpportunity}
    {c : ComplaintText} (h : AccommodationBasedDenial e p d opp c)
    : DiscriminateOnBasisOfDisability e p c :=
  .accommodationBasedDenial d opp h


theorem discriminate_of_discriminatoryQualificationStandard
    {e : Entity} {q : QualificationStandard} {p : Person} {c : ComplaintText}
    (h : DiscriminatoryQualificationStandard e q p c)
    : DiscriminateOnBasisOfDisability e p c :=
  .discriminatoryQualificationStandard q h


theorem discriminate_of_ineffectiveTestAdministration
    {e : Entity} {t : EmploymentTest} {p : Person} {d : Disability}
    {c : ComplaintText} (h : IneffectiveTestAdministration e t p d c)
    : DiscriminateOnBasisOfDisability e p c :=
  .ineffectiveTestAdministration t d h


theorem discriminate_of_prohibitedApplicantExamination
    {e : Entity} {m : MedicalExamination} {p : Person} {c : ComplaintText}
    (h : ProhibitedApplicantExamination e m p c)
    : DiscriminateOnBasisOfDisability e p c :=
  .prohibitedApplicantExamination m h


theorem discriminate_of_prohibitedApplicantInquiry
    {e : Entity} {q : MedicalInquiry} {p : Person} {c : ComplaintText}
    (h : ProhibitedApplicantInquiry e q p c)
    : DiscriminateOnBasisOfDisability e p c :=
  .prohibitedApplicantInquiry q h


theorem discriminate_of_prohibitedEmployeeExamination
    {e : Entity} {m : MedicalExamination} {p : Person} {c : ComplaintText}
    (h : ProhibitedEmployeeExamination e m p c)
    : DiscriminateOnBasisOfDisability e p c :=
  .prohibitedEmployeeExamination m h




theorem section12112a_intro
    {e : Entity} {p : Person} {d : Disability} {prac : EmploymentPractice}
    {c : ComplaintText}
    (hce : IsCoveredEntity e c)
    (hsub : QualifiedIndividualWithDisability p d c)
    (heng : EngagedInPractice e prac c)
    (hasp : CoveredEmploymentAspect prac c)
    (hbasis : IsOnTheBasisOfDisability prac d c)
    (hdisc : DiscriminateOnBasisOfDisability e p c)
    : Section12112a e p d prac c :=
  ⟨hce, hsub, heng, hasp, hbasis, hdisc⟩

end Proving.USC.T42.ADA.Reslice.Ontology
