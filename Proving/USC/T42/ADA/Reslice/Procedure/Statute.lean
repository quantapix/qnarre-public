











import Proving.USC.T42.ADA.Reslice.Procedure.Types
import Proving.USC.T42.ADA.Reslice.Procedure.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Procedure

open Proving.USC.Common





def offerTransition (e : CoveredEntity) (p : Person) (c : ComplaintText) : StageTransition :=
  { fromStage := EmploymentStage.JobApplication
    toStage   := EmploymentStage.PostOfferPreCommencement
    guard     := OfferOfEmploymentMade e p c }



def commencementTransition (e : CoveredEntity) (p : Person) (c : ComplaintText) : StageTransition :=
  { fromStage := EmploymentStage.PostOfferPreCommencement
    toStage   := EmploymentStage.Employment
    guard     := EmploymentDutiesCommenced e p c }


def Fires (t : StageTransition) : Prop := t.guard



inductive Reaches (e : CoveredEntity) (p : Person) (c : ComplaintText) : EmploymentStage → Prop

  | application :
      JobApplicationProcedureConducted e p c → Reaches e p c EmploymentStage.JobApplication

  | postOffer :
      Reaches e p c EmploymentStage.JobApplication →
      Fires (offerTransition e p c) →
      Reaches e p c EmploymentStage.PostOfferPreCommencement

  | employment :
      Reaches e p c EmploymentStage.PostOfferPreCommencement →
      Fires (commencementTransition e p c) →
      Reaches e p c EmploymentStage.Employment




abbrev ExaminationAfterOffer
    (e : CoveredEntity) (m : MedicalExamination) (p : Person) (c : ComplaintText) : Prop :=
  dayOfEmploymentOffer e p c ≤ dayOfMedicalExamination e m p c


abbrev ExaminationBeforeDutiesCommence
    (e : CoveredEntity) (m : MedicalExamination) (p : Person) (c : ComplaintText) : Prop :=
  dayOfMedicalExamination e m p c < dayOfEmploymentDutiesCommencement e p c




structure ExaminationWithinPostOfferWindow
    (e : CoveredEntity) (m : MedicalExamination) (p : Person) (c : ComplaintText) : Prop where
  afterOffer       : ExaminationAfterOffer e m p c
  beforeCommencing : ExaminationBeforeDutiesCommence e m p c







structure ConfidentialRecordHandling
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop where
  separateForms    : MedicalInformationKeptOnSeparateConfidentialForms e p c
  supervisorLimit  : RestrictionDisclosureLimitedToSupervisorsAndManagers e p c
  safetyLimit      : EmergencyDisclosureLimitedToFirstAidAndSafetyPersonnel e p c
  investigatorDuty : ComplianceInvestigatorRequestedInformation e p c →
                       RelevantInformationProvidedToComplianceInvestigator e p c








structure PermittedPostOfferExamination
    (e : CoveredEntity) (m : MedicalExamination) (p : Person) (c : ComplaintText) : Prop where
  offerMade     : OfferOfEmploymentMade e p c
  examConducted : MedicalExaminationConducted e m p c
  withinWindow  : ExaminationWithinPostOfferWindow e m p c
  allEntering   : AllEnteringEmployeesSubjectedToExamination e c
  confidential  : ConfidentialRecordHandling e p c
  resultsUse    : ExaminationResultsUsedOnlyAsThisSubchapterPermits e m p c







structure PreOfferMedicalInquiryBreach
    (e : CoveredEntity) (m : MedicalExamination) (p : Person) (c : ComplaintText) : Prop where
  applicantStage : Reaches e p c EmploymentStage.JobApplication
  noOfferYet     : ¬ OfferOfEmploymentMade e p c
  examOrInquiry  : MedicalExaminationConducted e m p c ∨ DisabilityInquiryMade e p c
  notAbilityOnly : ¬ InquiryLimitedToJobRelatedAbility e p c





structure EmployeeStageMedicalInquiryBreach
    (e : CoveredEntity) (m : MedicalExamination) (p : Person) (c : ComplaintText) : Prop where
  employeeStage  : Reaches e p c EmploymentStage.Employment
  examOrInquiry  : MedicalExaminationConducted e m p c ∨ DisabilityInquiryMade e p c
  notJobRelated  : ¬ ExaminationShownJobRelatedAndConsistentWithBusinessNecessity e m p c
  notVoluntary   : ¬ ExaminationVoluntaryUnderEmployeeHealthProgram e m p c
  notAbilityOnly : ¬ InquiryLimitedToJobRelatedAbility e p c





structure AccommodationProcessBreach
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop where
  limitationKnown : KnownLimitationBroughtToEntityAttention e p c
  notAccommodated : ¬ ReasonableAccommodationMade e p c
  noHardshipShown : ¬ UndueHardshipDemonstratedByEntity e p c



structure AccommodationAvoidanceDenialBreach
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop where
  limitationKnown : KnownLimitationBroughtToEntityAttention e p c
  denialForNeed   : EmploymentOpportunityDeniedForAccommodationNeed e p c



structure ScreeningStandardBreach
    (e : CoveredEntity) (q : QualificationStandard) (p : Person) (c : ComplaintText) : Prop where
  screensOut : QualificationStandardScreensOutIndividualWithDisability e q p c
  notShown   : ¬ StandardShownJobRelatedAndConsistentWithBusinessNecessity e q c



structure TestAdministrationBreach
    (e : CoveredEntity) (t : EmploymentTest) (p : Person) (c : ComplaintText) : Prop where
  impairedSkills   : TestTakerSkillsImpairedBySensoryManualOrSpeakingDisability t p c
  notMostEffective : ¬ TestAdministeredInMostEffectiveManner e t p c
  notMeasuredSkill : ¬ ImpairedSkillsAreTheFactorTestPurportsToMeasure t c





structure ForeignComplianceDefense
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop where
  foreignWorkplace : WorkplaceLocatedInForeignCountry e p c
  conflictOfLaws   : ComplianceWouldViolateForeignLaw e p c




def ForeignOperationsExclusion
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop :=
  WorkplaceLocatedInForeignCountry e p c ∧ EmployerIsForeignPersonNotControlledByAmericanEmployer e c



structure SectionApplies
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop where
  noForeignDefense   : ¬ ForeignComplianceDefense e p c
  noForeignExclusion : ¬ ForeignOperationsExclusion e p c






structure ControlDeterminationBasis
    (e : CoveredEntity) (f : ForeignCorporation) (c : ComplaintText) : Prop where
  interrelation  : DeterminationConsideredInterrelationOfOperations e f c
  management     : DeterminationConsideredCommonManagement e f c
  laborRelations : DeterminationConsideredCentralizedControlOfLaborRelations e f c
  ownership      : DeterminationConsideredCommonOwnershipOrFinancialControl e f c






structure ForeignSubsidiaryPresumption
    (e : CoveredEntity) (f : ForeignCorporation) (p : Person) (c : ComplaintText) : Prop where
  foreignIncorporation : PlaceOfIncorporationIsForeignCountry f c
  determinationBasis   : ControlDeterminationBasis e f c
  control              : EmployerControlsForeignCorporation e f c
  corporatePractice    : ForeignCorporationEngagedInDiscriminatoryPractice f p c





inductive ProceduralBreachTheory
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop

  | preOfferInquiry (m : MedicalExamination) :
      PreOfferMedicalInquiryBreach e m p c → ProceduralBreachTheory e p c

  | employeeStageInquiry (m : MedicalExamination) :
      EmployeeStageMedicalInquiryBreach e m p c → ProceduralBreachTheory e p c

  | accommodationProcess :
      AccommodationProcessBreach e p c → ProceduralBreachTheory e p c

  | accommodationAvoidance :
      AccommodationAvoidanceDenialBreach e p c → ProceduralBreachTheory e p c

  | screeningStandard (q : QualificationStandard) :
      ScreeningStandardBreach e q p c → ProceduralBreachTheory e p c

  | testAdministration (t : EmploymentTest) :
      TestAdministrationBreach e t p c → ProceduralBreachTheory e p c



structure Section12112ProceduralClaim
    (e : CoveredEntity) (p : Person) (c : ComplaintText) : Prop where
  applies : SectionApplies e p c
  theory  : ProceduralBreachTheory e p c

end Proving.USC.T42.ADA.Reslice.Procedure
