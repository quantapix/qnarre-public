














import Proving.USC.Common.Types
import Proving.USC.T42.Ch6ASchI.Reearn.Procedure.Types
import Proving.USC.T42.Ch6ASchI.Reearn.Procedure.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reearn.Procedure

open Proving.USC.Common







noncomputable def latestPermittedReleaseSigningDay (r : SettlementRelease) : Nat :=
  max statutoryFloorDayDecemberThirtyFirstNineteenNinetySeven (releaseFirstSentDay r + 270)


def WithinReleaseSigningWindow (r : SettlementRelease) : Prop :=
  releaseAllPartiesSignedDay r ≤ latestPermittedReleaseSigningDay r



def WithinAnnualReadinessCycle (o : CorpsOfficer) : Prop :=
  daysSincePriorReadinessDetermination o ≤ 366



def WithinSurgeonGeneralFourYearTerm (o : CorpsOfficer) : Prop :=
  daysSinceSurgeonGeneralAppointment o ≤ 1461


def SurgeonGeneralTermExpired (o : CorpsOfficer) : Prop :=
  1461 < daysSinceSurgeonGeneralAppointment o



def WithinOnePerCentumTemporaryPositionLimit (t : PositionRoster) : Prop :=
  100 * specialTemporaryPositionCount t ≤ highestActiveDutyOfficerCountInPrecedingNinetyDays t


def WithinOneYearTemporaryPositionReductionPeriod (t : PositionRoster) : Prop :=
  daysSinceOnePerCentumExceedance t ≤ 365



def WithinOneHalfMajorGeneralLimit (t : PositionRoster) : Prop :=
  2 * assistantSurgeonGeneralAboveBrigadierGeneralCount t ≤ assistantSurgeonGeneralPositionCount t




def AgeFortyFourBarCleared (n : Nominee) : Prop :=
  ageAtAppointmentYears n ≤ 44 + yearsOfActiveServiceAtAppointment n



def WithinTenPerCentumAboveSeniorAssistantLimit (y : AppointmentCycle) : Prop :=
  10 * originalAppointmentsAboveSeniorAssistantGrade y ≤ originalAppointmentsAuthorizedForFiscalYear y



def ReappointmentApplicationWithinTwoYears (n : Nominee) : Prop :=
  daysFromPriorCommissionTerminationToReappointmentApplication n ≤ 730


def WithinAccumulatedAnnualLeaveCap (l : LeaveAccount) : Prop :=
  accumulatedAnnualLeaveDays l ≤ 120




def WithinEightyPerCentumRecommendationFloor (e : ExaminationRecord) : Prop :=
  80 * officersExaminedForPromotion e ≤ 100 * officersRecommendedForPromotion e



def LengthOfServicePromotionRipe (o : CorpsOfficer) (c : ComplaintText) : Prop :=
  (HoldsAssistantGrade o c ∧ 3 ≤ yearsOfServiceAboveJuniorAssistantGrade o) ∨
  (HoldsSeniorAssistantGrade o c ∧ 10 ≤ yearsOfServiceAboveJuniorAssistantGrade o) ∨
  (HoldsFullGrade o c ∧ 17 ≤ yearsOfServiceAboveJuniorAssistantGrade o)


def OneYearInNextLowerGradeSatisfied (o : CorpsOfficer) : Prop :=
  1 ≤ yearsInNextLowerGrade o


def ReexaminationAvailable (o : CorpsOfficer) : Prop :=
  timesExaminedForPromotion o < 2


def TwiceExamined (o : CorpsOfficer) : Prop :=
  2 ≤ timesExaminedForPromotion o



def ThreeYearRecordReviewDue (o : CorpsOfficer) : Prop :=
  3 ≤ yearsSinceOriginalAppointment o


def AgeSixtyFourRetirementEligible (o : CorpsOfficer) : Prop :=
  64 ≤ ageYearsAtRetirement o


def ThirtyYearRetirementEligible (o : CorpsOfficer) : Prop :=
  30 ≤ yearsOfActiveService o



def TwentyYearRetirementEligible (o : CorpsOfficer) : Prop :=
  20 ≤ yearsOfActiveService o ∧ yearsOfActiveService o < 30 ∧
  10 ≤ yearsOfActiveCommissionedService o



def SeniorOfficerVoluntaryRetirementEligible (o : CorpsOfficer) : Prop :=
  4 ≤ yearsInSurgeonGeneralOrAssistantSurgeonGeneralService o ∧ 25 ≤ yearsOfActiveService o








structure TimelyHemophiliaSettlementRelease (r : SettlementRelease) (c : ComplaintText) : Prop where
  inLieuOfClassSettlement : ReleaseEnteredInLieuOfClassSettlement r c
  signedByAllParties      : ReleaseSignedByAllAffectedParties r c
  withinWindow            : WithinReleaseSigningWindow r


structure ValidOrganizationalUnitChange (u : OrganizationalChange) (c : ComplaintText) : Prop where
  proposed         : OrganizationalUnitChangeProposed u c
  secretaryApproved : SecretaryApprovedOrganizationalUnitChange u c




structure ValidCorpsAppointment (n : Nominee) (d : EmergencyDeclaration)
    (c : ComplaintText) : Prop where
  citizen        : IsUnitedStatesCitizen n c
  byPresident    : AppointedByPresident n c
  examPassed     : AppointmentExaminationPassed n c
  ageGate        : AgeFortyFourBarCleared n ∨
                   SurgeonGeneralFoundExceptionalQualifications n c ∨
                   CommissionedCorpsDeclaredMilitaryService d c
  commissionSealed : CommissionIssuedBySecretaryUnderDepartmentSeal n c



structure WithinOriginalAppointmentQuota (n : Nominee) (y : AppointmentCycle)
    (c : ComplaintText) : Prop where
  chargedToYear : NominationTransmittedToSenateInFiscalYear n y c
  withinQuota   : WithinTenPerCentumAboveSeniorAssistantLimit y



structure ValidOsteopathyGraduateAppointment (n : Nominee) (d : EmergencyDeclaration)
    (c : ComplaintText) : Prop where
  eligibleGraduate : EligibleOsteopathyGraduate n c
  appointment      : ValidCorpsAppointment n d c



structure TimelyReappointmentWithoutExamination (n : Nominee) (c : ComplaintText) : Prop where
  applicationFiled : FormerOfficerReappointmentApplicationFiled n c
  withinTwoYears   : ReappointmentApplicationWithinTwoYears n
  meetsStandards   : MeetsSecretaryPrescribedReappointmentStandards n c


structure ValidReadyReserveActivation (n : Nominee) (o : CorpsOfficer)
    (c : ComplaintText) : Prop where
  reserveAppointment : OriginalAppointmentToReadyReserveCorps n c
  calledBySurgeonGeneral : CalledToActiveDutyBySurgeonGeneral o c


structure ReadinessComplianceCycle (o : CorpsOfficer) (k : ReadinessCycle)
    (c : ComplaintText) : Prop where
  requirementsEstablished : ReadinessRequirementsEstablishedBySecretary k c
  determinationMade       : AnnualReadinessDeterminationMade o k c
  withinAnnualCycle       : WithinAnnualReadinessCycle o
  memberCompliant         : MeetsReadinessRequirements o k c





structure SubjectToReadinessDiscipline (o : CorpsOfficer) (k : ReadinessCycle)
    (c : ComplaintText) : Prop where
  requirementsEstablished : ReadinessRequirementsEstablishedBySecretary k c
  default : ¬ MeetsReadinessRequirements o k c ∨ FailedToComplyWithDeploymentOrder o c
  noWaiver : ¬ ReadinessRequirementWaiverGranted o c
  proceduresEstablished : DisciplinaryProceduresEstablishedBySecretary c


structure ValidSurgeonGeneralAppointment (n : Nominee) (c : ComplaintText) : Prop where
  nominated        : SurgeonGeneralNominatedByPresident n c
  adviceAndConsent : SenateAdviceAndConsentGiven n c
  fromRegularCorps : AppointedFromRegularCorps n c
  qualified        : HasSpecializedPublicHealthTrainingOrExperience n c


structure SurgeonGeneralReversion (o : CorpsOfficer) (c : ComplaintText) : Prop where
  termExpired   : SurgeonGeneralTermExpired o
  notReappointed : ¬ SurgeonGeneralReappointed o c
  reverted      : RevertedToPriorGradeAndNumber o c



structure ValidSpecialTemporaryPositionCreation (t : PositionRoster) (c : ComplaintText) : Prop where
  createdWithApproval : SpecialTemporaryPositionCreatedWithSecretaryApproval t c
  withinCeiling       : WithinOnePerCentumTemporaryPositionLimit t



structure LawfulTemporaryPositionOverage (t : PositionRoster) (c : ComplaintText) : Prop where
  overCeiling      : ¬ WithinOnePerCentumTemporaryPositionLimit t
  withinCurePeriod : WithinOneYearTemporaryPositionReductionPeriod t
  attritionOnly    : TemporaryPositionReducedOnlyByAttrition t c


structure ValidGradeMaximaRegulation (a : AppropriationAct) (t : PositionRoster)
    (c : ComplaintText) : Prop where
  appropriationEnacted : AppropriationActFixingAuthorizedStrengthEnacted a c
  regulationsPrescribed : GradeMaximaRegulationsPrescribed a c
  withinMajorGeneralLimit : WithinOneHalfMajorGeneralLimit t


structure ValidLeaveGrant (l : LeaveAccount) (c : ComplaintText) : Prop where
  underRegulations : LeaveGrantedUnderPresidentialRegulations l c
  withinCap        : WithinAccumulatedAnnualLeaveCap l



inductive ValidCategoryReassignment (o : CorpsOfficer) (c : ComplaintText) : Prop where
  | originalErroneous :
      ProfessionalCategoryAssignmentMade o c →
      CategoryAssignmentFoundErroneous o c →
      ValidCategoryReassignment o c
  | qualifiedTransferRequest :
      ProfessionalCategoryAssignmentMade o c →
      EquallyQualifiedForRequestedCategoryTransfer o c →
      ValidCategoryReassignment o c


structure ValidLengthOfServicePromotion (o : CorpsOfficer) (m : PromotionAction)
    (e : ExaminationRecord) (c : ComplaintText) : Prop where
  byPresident     : PermanentPromotionMadeByPresident m c
  nextHigherGrade : PromotionToNextHigherGrade m c
  examUnderRegulations : ExaminationGivenUnderPresidentialRegulations e c
  examPassed      : PromotionExaminationPassed m c
  serviceRipe     : LengthOfServicePromotionRipe o c



structure CompliantCompetitiveExamination (e : ExaminationRecord) (c : ComplaintText) : Prop where
  competitive : PromotionExaminationIsCompetitive e c
  inCoveredClass : ExaminationForLengthOfServiceOrUnrestrictedVacancy e c
  withinFloor : WithinEightyPerCentumRecommendationFloor e



structure ValidRestrictedGradePromotion (o : CorpsOfficer) (m : PromotionAction)
    (c : ComplaintText) : Prop where
  restricted   : GradeIsRestricted m c
  vacancy      : VacancyExistsInGrade m c
  oneYearLower : OneYearInNextLowerGradeSatisfied o



inductive SeparationForPromotionFailure (o : CorpsOfficer) (s : SeparationAction)
    (c : ComplaintText) : Prop where
  | twiceExaminedAndPassedOver :
      TwiceExamined o → FailedToBePromoted o c → SeparationPayTendered s c →
      SeparationForPromotionFailure o s c
  | refusedExamination :
      RefusedToTakePromotionExamination o c →
      SeparationForPromotionFailure o s c
  | threeYearReviewFailure :
      ThreeYearRecordReviewDue o → ThreeYearRecordReviewConducted o c →
      FoundNotQualifiedForFurtherService o c → SeparationPayTendered s c →
      SeparationForPromotionFailure o s c



structure InternshipPromotionCreditAllowed (o : CorpsOfficer) (c : ComplaintText) : Prop where
  internshipCompleted : CompletedMedicalInternshipOnAppointmentDate o c
  continuousService   : ContinuousServiceSinceAppointment o c
  noDuplicateCredit   : ¬ SimilarInternshipCreditReceivedUnderOtherLaw o c


inductive RetirementEligibility (o : CorpsOfficer) (c : ComplaintText) : Prop where
  | ageSixtyFour : AgeSixtyFourRetirementEligible o → RetirementEligibility o c
  | thirtyYears  : ThirtyYearRetirementEligible o → RetirementEligibility o c
  | twentyYears  : TwentyYearRetirementEligible o → RetirementEligibility o c
  | seniorVoluntary :
      SeniorOfficerVoluntaryRetirementEligible o →
      RetirementEligibility o c




structure ValidRetirementAction (o : CorpsOfficer) (r : RetirementAction)
    (c : ComplaintText) : Prop where
  eligible : RetirementEligibility o c
  trigger  : RetirementApplicationFiled r c ∨ RetirementOrderedBySecretary r c
  effectiveFirstOfMonth : RetirementEffectiveFirstDayOfMonth r c



structure ValidSeniorVoluntaryRetirement (o : CorpsOfficer) (r : RetirementAction)
    (c : ComplaintText) : Prop where
  eligible            : SeniorOfficerVoluntaryRetirementEligible o
  presidentialApproval : PresidentialApprovalOfVoluntaryRetirement r c


structure ValidConsensualRecall (o : CorpsOfficer) (c : ComplaintText) : Prop where
  notSeniorGradePassOver : ¬ RetiredForFailureOfPromotionToSeniorGrade o c
  recalledWithConsent    : RecalledToActiveDutyWithConsent o c



structure MilitaryBenefitsEntitlement (o : CorpsOfficer) (d : EmergencyDeclaration)
    (c : ComplaintText) : Prop where
  qualifyingService : ServedInTimeOfWar o c ∨ DetailedForDutyWithArmedForces o c ∨
                      ServicePartOfMilitaryForcesByExecutiveOrder d c
  authorityExercised : SecretaryOrDesigneeExercisedTitleTenAuthority o c




structure FlagPresentationDue (o : CorpsOfficer) (f : FlagPresentation)
    (c : ComplaintText) : Prop where
  releasedForRetirement : ReleasedFromActiveCommissionedServiceForRetirement o c
  notPreviouslyPresented : ¬ FlagPreviouslyPresented o c
  presentedBySecretary  : FlagPresentedBySecretary f c
  noCostToRecipient     : FlagPresentedAtNoCostToRecipient f c


structure ValidInterdepartmentalDetail (d : DetailAssignment) (c : ComplaintText) : Prop where
  requested   : DetailRequestedByExecutiveDepartmentHead d c
  termsAgreed : DetailTermsAgreedBySecretaryAndRequester d c
  subjectToReceivingLaws : DetaileeSubjectToLawsOfReceivingService d c


structure ValidStateDetail (d : DetailAssignment) (c : ComplaintText) : Prop where
  requested       : DetailRequestedByStateHealthAuthority d c
  reimbursementAgreed : ReimbursementAgreementExecuted d c



structure ValidEmergencyDeploymentDirection (d : DetailAssignment) (c : ComplaintText) : Prop where
  needExists : UrgentOrEmergencyPublicHealthCareNeedExists c
  authority  : SecretaryExercisedSoleDeploymentAuthority d c ∨
               DeploymentAuthorityExceptionApplies d c


structure MilitaryServiceDeclarationInEffect (o : CorpsOfficer) (d : EmergencyDeclaration)
    (c : ComplaintText) : Prop where
  warOrEmergency : WarOrProclaimedEmergencyInEffect d c
  executiveOrder : ExecutiveOrderDeclaringMilitaryServiceIssued d c
  withinPeriod   : WithinPeriodPrescribedByPresident d c
  ucmjSubjection : SubjectToUniformCodeOfMilitaryJustice o d c


structure ValidAdvisoryCouncilAppointment (b : AdvisoryBody) (n : Nominee)
    (c : ComplaintText) : Prop where
  appointedBySecretary : AdvisoryCouncilAppointedBySecretary b c
  periodSpecified      : AdvisoryCouncilPeriodCommencementDateSpecified b c
  apolitical           : AppointedWithoutRegardToPoliticalAffiliation n c



structure ValidAdvisoryFunctionDelegation (b : AdvisoryBody) (c : ComplaintText) : Prop where
  councilAppointed : AdvisoryCouncilAppointedBySecretary b c
  functionsDelegated : AdvisoryFunctionsDelegated b c



structure ValidNoncompetitiveResearchAppointment (n : Nominee) (c : ComplaintText) : Prop where
  opmApproved : OfficeOfPersonnelManagementApprovedQualifications n c



structure DeploymentMachineryEstablished (p : Person) (c : ComplaintText) : Prop where
  unitsOrganized       : RapidDeploymentUnitsOrganized c
  waiverRegulations    : WaiverRegulationsPromulgated c
  delegationExcludesRules : DelegationExcludesRulemaking p c



structure SurgeonGeneralSuccessionChainEstablished (o : CorpsOfficer) (c : ComplaintText) : Prop where
  deputyAssigned : DeputySurgeonGeneralAssigned o c
  actingDesignated : ActingSurgeonGeneralDesignated o c


structure PromotionDeemedAccepted (o : CorpsOfficer) (m : PromotionAction)
    (c : ComplaintText) : Prop where
  promoted     : PermanentPromotionMadeByPresident m c
  notDeclined  : ¬ PromotionExpresslyDeclined o c



structure ValidRegularCorpsOriginalAppointment (n : Nominee) (e : ExaminationRecord)
    (c : ComplaintText) : Prop where
  regularCorpsTrack : OriginalAppointmentToRegularCorps n c
  examUnderRegulations : ExaminationGivenUnderPresidentialRegulations e c
  examPassed : AppointmentExaminationPassed n c






structure Transition where
  source : CommissionStage
  target : CommissionStage
  guard  : Prop



inductive ReachableVia : List Transition → CommissionStage → CommissionStage → Prop where
  | nil {s : CommissionStage} : ReachableVia [] s s
  | cons {t : Transition} {ts : List Transition} {s s' : CommissionStage} :
      t.source = s → t.guard → ReachableVia ts t.target s' →
      ReachableVia (t :: ts) s s'


def appointmentTransition (n : Nominee) (d : EmergencyDeclaration) (c : ComplaintText) : Transition :=
  { source := CommissionStage.Nominated
  , target := CommissionStage.Commissioned
  , guard  := ValidCorpsAppointment n d c }


def activationTransition (n : Nominee) (o : CorpsOfficer) (c : ComplaintText) : Transition :=
  { source := CommissionStage.Commissioned
  , target := CommissionStage.OnActiveDuty
  , guard  := ValidReadyReserveActivation n o c }


def promotionTransition (o : CorpsOfficer) (m : PromotionAction) (e : ExaminationRecord)
    (c : ComplaintText) : Transition :=
  { source := CommissionStage.OnActiveDuty
  , target := CommissionStage.Promoted
  , guard  := ValidLengthOfServicePromotion o m e c }


def separationTransition (o : CorpsOfficer) (s : SeparationAction) (c : ComplaintText) : Transition :=
  { source := CommissionStage.OnActiveDuty
  , target := CommissionStage.Separated
  , guard  := SeparationForPromotionFailure o s c }


def retirementTransition (o : CorpsOfficer) (r : RetirementAction) (c : ComplaintText) : Transition :=
  { source := CommissionStage.Promoted
  , target := CommissionStage.Retired
  , guard  := ValidRetirementAction o r c }


def recallTransition (o : CorpsOfficer) (c : ComplaintText) : Transition :=
  { source := CommissionStage.Retired
  , target := CommissionStage.Recalled
  , guard  := ValidConsensualRecall o c }


def militarizationTransition (o : CorpsOfficer) (d : EmergencyDeclaration)
    (c : ComplaintText) : Transition :=
  { source := CommissionStage.OnActiveDuty
  , target := CommissionStage.MilitaryService
  , guard  := MilitaryServiceDeclarationInEffect o d c }



def commissionedCorpsCareerPath (n : Nominee) (o : CorpsOfficer) (m : PromotionAction)
    (e : ExaminationRecord) (r : RetirementAction) (d : EmergencyDeclaration)
    (c : ComplaintText) : List Transition :=
  [ appointmentTransition n d c
  , activationTransition n o c
  , promotionTransition o m e c
  , retirementTransition o r c ]



def separationPath (n : Nominee) (o : CorpsOfficer) (s : SeparationAction)
    (d : EmergencyDeclaration) (c : ComplaintText) : List Transition :=
  [ appointmentTransition n d c
  , activationTransition n o c
  , separationTransition o s c ]

end Proving.USC.T42.Ch6ASchI.Reearn.Procedure
