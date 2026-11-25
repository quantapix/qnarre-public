






import Proving.USC.T42.Ch6ASchI.Reearn.Elements.Types
import Proving.USC.T42.Ch6ASchI.Reearn.Elements.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reearn.Elements

open Proving.USC.Common






def ReleaseSignedWithin270Days (pay : Payment) (c : ComplaintText) : Prop :=
  daysFromReleaseFirstSentToSigning pay c ≤ 270



inductive ReleaseTimelySigned (pay : Payment) (c : ComplaintText) : Prop where
  | byCalendarDeadline (h : ReleaseSignedOnOrBeforeDecember31_1997 pay c)
  | within270Days (h : ReleaseSignedWithin270Days pay c)



structure ReleaseInLieuPayment (pay : Payment) (c : ComplaintText) : Prop where
  inLieu : PaymentUnderReleaseInLieuOfClassSettlement pay c
  allParties : ReleaseSignedByAllAffectedParties pay c
  timely : ReleaseTimelySigned pay c



inductive SubsectionACoveredPayment (pay : Payment) (c : ComplaintText) : Prop where
  | classSettlement (h : PaymentFromWalkerClassSettlementFund pay c)
  | releaseInLieu (h : ReleaseInLieuPayment pay c)



inductive SubsectionACoveredDetermination (c : ComplaintText) : Prop where
  | medicaid (h : DeterminationOfMedicaidEligibilityOrAmount c)
  | ssi (h : DeterminationOfSsiEligibilityOrAmount c)


structure SubsectionAExclusionApplies (pay : Payment) (c : ComplaintText) : Prop where
  payment : SubsectionACoveredPayment pay c
  determination : SubsectionACoveredDetermination c


structure SubsectionBExclusionApplies (pay : Payment) (c : ComplaintText) : Prop where
  payment : PaymentFromSection101Fund pay c
  determination : DeterminationOfSsiEligibilityOrAmount c


inductive Section201ExclusionApplies (pay : Payment) (c : ComplaintText) : Prop where
  | subsectionA (h : SubsectionAExclusionApplies pay c)
  | subsectionB (h : SubsectionBExclusionApplies pay c)



structure Section201ExclusionViolated (pay : Payment) (c : ComplaintText) : Prop where
  exclusion : Section201ExclusionApplies pay c
  counted : PaymentCountedAsIncomeOrResources pay c




structure Section203DivisionActionUnauthorized (a : AgencyAction) (c : ComplaintText) : Prop where
  divisionAction : IsDivisionEstablishmentAbolitionTransferOrConsolidation a c
  noApproval : ¬ SecretaryApprovedDivisionAction a c



structure Section203DelegationUltraVires (p : Person) (a : AgencyAction) (c : ComplaintText) : Prop where
  delegate : IsOfficerOrEmployeeOfService p c
  underDelegation : ActionTakenUnderSecretarialDelegation a c
  excludedPower : DelegatedActionIsMakingOfRegulations a c




structure Section204RegularCorpsAppointment (p : Person) (c : ComplaintText) : Prop where
  citizen : IsUnitedStatesCitizen p c
  president : AppointedByPresident p c
  regularCorps : AppointedToRegularCorps p c
  notCivilService : AppointedWithoutRegardToCivilServiceLaws p c


structure Section204ReadyReserveAppointment (p : Person) (c : ComplaintText) : Prop where
  citizen : IsUnitedStatesCitizen p c
  president : AppointedByPresident p c
  readyReserve : AppointedToReadyReserveCorps p c
  notCivilService : AppointedWithoutRegardToCivilServiceLaws p c
  subjectToCall : SubjectToCallToActiveDutyBySurgeonGeneral p c



structure Section204WarrantOfficerDeemedCommissioned (p : Person) (c : ComplaintText) : Prop where
  citizen : IsUnitedStatesCitizen p c
  warrantAppointment : AppointedAsWarrantOfficerForHealthDeliverySupport p c



structure Section204ReserveOfficerDeemedRegular (p : Person) (c : ComplaintText) : Prop where
  priorClassification : ClassifiedAsReserveCorpsOfficerBeforeMarch23_2010 p c
  activeDuty : ServingOnActiveDutyOnMarch23_2010 p c


inductive Section204CommissionedOfficerStatus (p : Person) (c : ComplaintText) : Prop where
  | regular (h : Section204RegularCorpsAppointment p c)
  | readyReserve (h : Section204ReadyReserveAppointment p c)
  | warrant (h : Section204WarrantOfficerDeemedCommissioned p c)
  | deemedRegular (h : Section204ReserveOfficerDeemedRegular p c)





inductive UrgentOrEmergencyPublicHealthCareNeed (e : Emergency) (c : ComplaintText) : Prop where
  | nationalEmergency (h : NationalEmergencyDeclaredByPresident e c)
  | staffordDeclaration (h : StaffordActEmergencyOrMajorDisasterDeclared e c)
  | publicHealthEmergency (h : PublicHealthEmergencyDeclaredBySecretary e c)
  | secretaryJudgment (h : SecretaryJudgedEmergencyAppropriateForCorpsDeployment e c)


inductive ReadinessFailure (p : Person) (c : ComplaintText) : Prop where
  | requirements (h : FailedToMeetOrMaintainReadinessRequirements p c)
  | orders (h : FailedToComplyWithDeploymentOrders p c)



inductive ReadinessWaiverGround (p : Person) (c : ComplaintText) : Prop where
  | disability (h : UnableToMeetRequirementsBecauseOfDisability p c)
  | temporaryCondition (h : UnableToMeetRequirementsBecauseOfTemporaryMedicalCondition p c)
  | extraordinaryLimitation (h : SecretaryDeterminedExtraordinaryLimitation p c)




structure Section204aDisciplinaryExposure (p : Person) (c : ComplaintText) : Prop where
  member : IsMemberOfCommissionedCorps p c
  requirements : ReadinessRequirementsEstablishedBySecretary c
  failure : ReadinessFailure p c
  noWaiver : ¬ SecretaryGrantedReadinessWaiver p c


structure Section204aWaiverEligibility (p : Person) (c : ComplaintText) : Prop where
  member : IsMemberOfCommissionedCorps p c
  ground : ReadinessWaiverGround p c




inductive Section204aUnlawfulDisciplineTheory (p : Person) (c : ComplaintText) : Prop where
  | waived (h : SecretaryGrantedReadinessWaiver p c)
  | noFailure (h : ¬ ReadinessFailure p c)
  | procedureViolated (h : ¬ DisciplinaryActionFollowedSecretaryEstablishedProcedures p c)


structure Section204aUnlawfulDisciplineClaim (p : Person) (c : ComplaintText) : Prop where
  member : IsMemberOfCommissionedCorps p c
  imposed : DisciplinaryActionImposed p c
  theory : Section204aUnlawfulDisciplineTheory p c




structure Section204aDeploymentDeemedAuthorized
    (p : Person) (fe : FederalEntity) (e : Emergency) (c : ComplaintText) : Prop where
  officer : IsCommissionedOfficerOfService p c
  detailed : OfficerDetailedOrAssignedToFederalEntity p fe c
  need : UrgentOrEmergencyPublicHealthCareNeed e c
  deployed : DeployedBySecretaryInResponseToUrgentNeed p e c




structure Section205SurgeonGeneralAppointment (p : Person) (c : ComplaintText) : Prop where
  regularCorpsMember : IsMemberOfRegularCorps p c
  qualifications : HasSpecializedTrainingOrExperienceInPublicHealthPrograms p c
  senateConfirmed : AppointedByPresidentWithSenateAdviceAndConsent p c
  fourYearTerm : AppointedForFourYearTermAsSurgeonGeneral p c



structure Section205ReversionEntitlement (p : Person) (c : ComplaintText) : Prop where
  appointment : Section205SurgeonGeneralAppointment p c
  termExpired : SurgeonGeneralTermExpired p c
  notReappointed : ¬ ReappointedAsSurgeonGeneral p c



structure Section205ReversionDenied (p : Person) (c : ComplaintText) : Prop where
  entitlement : Section205ReversionEntitlement p c
  notReverted : ¬ RevertedToPriorGradeAndNumber p c




structure Section206DeputySurgeonGeneralAssignment (p : Person) (c : ComplaintText) : Prop where
  regularCorpsMember : IsMemberOfRegularCorps p c
  bySurgeonGeneral : AssignedBySurgeonGeneral p c
  administersOffice : AssignedToAdministerOfficeOfSurgeonGeneral p c



structure Section206AssistantSurgeonGeneralAssignment (p : Person) (c : ComplaintText) : Prop where
  regularCorpsMember : IsMemberOfRegularCorps p c
  bySurgeonGeneral : AssignedBySurgeonGeneral p c
  enumeratedPosition : AssignedToEnumeratedAssistantSurgeonGeneralPosition p c



def WithinOnePercentTemporaryPositionCap (c : ComplaintText) : Prop :=
  100 * numberOfSpecialTemporaryAssistantSurgeonGeneralPositions c
    ≤ peakActiveDutyOfficerCountPrecedingNinetyDays c


structure Section206TemporaryAssistantSurgeonGeneralAssignment
    (p : Person) (c : ComplaintText) : Prop where
  bySurgeonGeneral : AssignedBySurgeonGeneral p c
  secretaryApproval : SecretaryApprovedSpecialTemporaryPosition p c
  necessary : TemporaryPositionNecessaryForProperStaffing p c
  eligibleCorps : AssignedFromRegularOrReadyReserveCorps p c
  withinCap : WithinOnePercentTemporaryPositionCap c


inductive Section206AssistantSurgeonGeneralTitle (p : Person) (c : ComplaintText) : Prop where
  | statutory (h : Section206AssistantSurgeonGeneralAssignment p c)
  | temporary (h : Section206TemporaryAssistantSurgeonGeneralAssignment p c)


structure Section206ActingSurgeonGeneralDesignation (p : Person) (c : ComplaintText) : Prop where
  title : Section206AssistantSurgeonGeneralTitle p c
  designated : DesignatedToServeAsSurgeonGeneralDuringVacancy p c





def WithinAssistantSurgeonGeneralHigherGradeCap (c : ComplaintText) : Prop :=
  2 * numberOfAssistantSurgeonsGeneralAboveBrigadierGrade c
    ≤ numberOfAssistantSurgeonGeneralPositions c



def GradeMaximumWithinAppropriationLimit (g : Grade) (c : ComplaintText) : Prop :=
  numberPrescribedForGrade g c ≤ appropriationActLimitForGrade g c



def WithinDefensePolicymakingExclusionCap (c : ComplaintText) : Prop :=
  numberOfExcludedGeneralGradeOfficersInDefensePolicymaking c ≤ 3



structure Section207HigherGradeCapExceeded (p : Person) (c : ComplaintText) : Prop where
  holdsHigherGrade : HoldsAssistantSurgeonGeneralGradeAboveBrigadierGeneral p c
  overCap : ¬ WithinAssistantSurgeonGeneralHigherGradeCap c




structure Section207SeparationShieldClaim (p : Person) (c : ComplaintText) : Prop where
  officer : IsCommissionedOfficerOfService p c
  causedByMaxima : SeparationOrGradeReductionRequiredSolelyByGradeMaxima p c
  notOtherProvision : ¬ ActionTakenPursuantToOtherProvisionOfChapter p c


structure Section207DefensePolicymakingExclusion (p : Person) (c : ComplaintText) : Prop where
  higherGrade : HoldsAssistantSurgeonGeneralGradeAboveBrigadierGeneral p c
  assignedToDefense : AssignedToDutyInDepartmentOfDefense p c
  policymaking : ServingInPolicymakingPositionInDepartmentOfDefense p c
  withinCap : WithinDefensePolicymakingExclusionCap c




def AgeThresholdReached (p : Person) (c : ComplaintText) : Prop :=
  44 ≤ ageAtAppointment p c



def ServiceOffsetSatisfied (p : Person) (c : ComplaintText) : Prop :=
  ageAtAppointment p c ≤ 44 + yearsOfActiveServiceAtAppointment p c


inductive Section209AgeBarOvercome (p : Person) (c : ComplaintText) : Prop where
  | belowThreshold (h : ¬ AgeThresholdReached p c)
  | serviceOffset (h : ServiceOffsetSatisfied p c)
  | exceptionalQualifications (h : SurgeonGeneralDeterminedExceptionalQualifications p c)
  | militaryServiceDeclared
      (hReserve : IsMemberOfReadyReserveCorps p c)
      (hDeclared : CommissionedCorpsDeclaredMilitaryServiceByPresident c)



def WithinTenPercentAboveSeniorAssistantCap (c : ComplaintText) : Prop :=
  10 * numberOfOriginalAppointmentsAboveSeniorAssistantGrade c
    ≤ numberOfOriginalAppointmentsAuthorized c



def WithinThreeAndOneHalfYearActiveDutyLimit (p : Person) (c : ComplaintText) : Prop :=
  monthsOfContinuousPostJune1960ActiveDutyBeforeApplication p c ≤ 42




structure Section209RegularCorpsOriginalAppointment (p : Person) (c : ComplaintText) : Prop where
  citizen : IsUnitedStatesCitizen p c
  president : AppointedByPresident p c
  eligibleGrade : AppointedToEligibleOriginalRegularCorpsGrade p c
  examination : AppointmentAboveJuniorAssistantGrade p c → PassedPrescribedAppointmentExamination p c
  age : Section209AgeBarOvercome p c
  commission : CommissionIssuedBySecretaryUnderDepartmentSeal p c



structure Section209ReadyReserveOriginalAppointment (p : Person) (c : ComplaintText) : Prop where
  citizen : IsUnitedStatesCitizen p c
  president : AppointedByPresident p c
  gradeNotAboveDirector : AppointedToReadyReserveGradeNotAboveDirector p c
  examination : PassedPrescribedAppointmentExamination p c
  indefinitePeriod : ReserveCommissionForIndefinitePeriod p c
  age : CalledToActiveDutyInReadyReserveForMoreThanOneYear p c → Section209AgeBarOvercome p c
  commission : CommissionIssuedBySecretaryUnderDepartmentSeal p c



structure Section209AboveSeniorAssistantAppointment (p : Person) (c : ComplaintText) : Prop where
  aboveSeniorAssistant : AppointmentAboveSeniorAssistantGrade p c
  notAboveDirector : ¬ AppointmentAboveDirectorGrade p c
  withinCap : WithinTenPercentAboveSeniorAssistantCap c
  standards : MeetsPresidentiallyPrescribedAppointmentStandards p c
  commission : CommissionIssuedBySecretaryUnderDepartmentSeal p c



structure Section209ReadyReserveTransferAppointment (p : Person) (c : ComplaintText) : Prop where
  aboveSeniorAssistant : AppointmentAboveSeniorAssistantGrade p c
  notAboveDirector : ¬ AppointmentAboveDirectorGrade p c
  continuousYear : OnActiveDutyContinuouslyOneYearBeforeAppointment p c
  withinActiveDutyLimit : WithinThreeAndOneHalfYearActiveDutyLimit p c
  standards : MeetsPresidentiallyPrescribedAppointmentStandards p c


structure Section209Reappointment (p : Person) (c : ComplaintText) : Prop where
  priorCommission : HeldPriorRegularCorpsCommission p c
  timelyApplication : AppliedForReappointmentWithinTwoYearsOfTermination p c
  grade : ReappointedToPriorPermanentOrNextHigherGrade p c
  standards : MeetsSecretaryPrescribedReappointmentStandards p c


structure Section209SpecialConsultant (p : Person) (c : ComplaintText) : Prop where
  consultant : EmployedAsSpecialConsultantUnderRegulations p c
  notCivilService : AppointedWithoutRegardToCivilServiceLaws p c


structure Section209Fellowship (p : Person) (c : ComplaintText) : Prop where
  designated : DesignatedBySurgeonGeneralToReceiveFellowship p c
  notCommissioned : IsNotCommissionedOfficerOfService p c
  notCivilService : AppointedWithoutRegardToCivilServiceLaws p c


inductive Section209NonCitizenRoute (p : Person) (c : ComplaintText) : Prop where
  | consultant (h : Section209SpecialConsultant p c)
  | fellowship (h : Section209Fellowship p c)



structure Section209NonCitizenEngagement (p : Person) (c : ComplaintText) : Prop where
  notCitizen : ¬ IsUnitedStatesCitizen p c
  route : Section209NonCitizenRoute p c


structure Section209CivilServiceAppointment (p : Person) (c : ComplaintText) : Prop where
  civilServiceLaws : AppointmentMadeInAccordanceWithCivilServiceLaws p c
  bySecretary : AppointmentMadeBySecretary p c



inductive Section209ValidServiceAppointment (p : Person) (c : ComplaintText) : Prop where
  | regularOriginal (h : Section209RegularCorpsOriginalAppointment p c)
  | readyReserveOriginal (h : Section209ReadyReserveOriginalAppointment p c)
  | aboveSeniorAssistant (h : Section209AboveSeniorAssistantAppointment p c)
  | readyReserveTransfer (h : Section209ReadyReserveTransferAppointment p c)
  | reappointment (h : Section209Reappointment p c)
  | consultant (h : Section209SpecialConsultant p c)
  | fellowship (h : Section209Fellowship p c)
  | civilService (h : Section209CivilServiceAppointment p c)




inductive OsteopathyCollegeQualification (p : Person) (c : ComplaintText) : Prop where
  | majorityStateLicensure (h : GraduateOfOsteopathyCollegeLicensableInMajorityOfStates p c)
  | secretaryAcceptableApproval (h : GraduateOfOsteopathyCollegeApprovedByAcceptableBody p c)


structure Section209dAppointmentEligibility (p : Person) (c : ComplaintText) : Prop where
  qualification : OsteopathyCollegeQualification p c
  otherProvisions : SatisfiesOtherAppointmentProvisionsOfAct p c





inductive Section210SupplyPurchaseClass (p : Person) (c : ComplaintText) : Prop where
  | activeDuty (hOfficer : IsCommissionedOfficerOfService p c) (hActive : IsOnActiveDuty p c)
  | retired (h : IsRetiredOfficerEntitledToRetiredPay p c)


structure Section210SupplyPurchaseClaim (p : Person) (c : ComplaintText) : Prop where
  class_ : Section210SupplyPurchaseClass p c
  denied : DeniedSupplyPurchaseAtOfficerPrice p c



def WithinGs18DailyEquivalentCap (p : Person) (c : ComplaintText) : Prop :=
  dailyCompensationRateCents p c ≤ grade18DailyEquivalentRateCents c


structure Section210AdvisoryCompensationEntitlement
    (p : Person) (ab : AdvisoryBody) (c : ComplaintText) : Prop where
  member : IsMemberOfNationalAdvisoryOrReviewCouncil p ab c
  notExOfficio : ¬ IsExOfficioMemberOfCouncil p ab c
  service : AttendedCouncilMeetingOrServedAtSecretaryRequest p ab c
  withinCap : WithinGs18DailyEquivalentCap p c



def WithinPartTimeAnnualCompensationCap (p : Person) (c : ComplaintText) : Prop :=
  totalFiscalYearCompensationDollars p c ≤ minimumAnnualSalaryRateForGradeDollars p c



structure Section210PartTimeFieldCompensation (p : Person) (c : ComplaintText) : Prop where
  fieldEmployee : IsFieldEmployeeRenderingPartTimeDuty p c
  notPerDiemOrFee : ¬ EmployedOnPerDiemOrFeeBasis p c
  subjectToCall : SubjectToCallForServicesBeyondRegularPartTimeEmployment p c
  withinCap : WithinPartTimeAnnualCompensationCap p c


structure Section210HansensCenterSupplement (p : Person) (c : ComplaintText) : Prop where
  civilianEmployee : IsCivilianEmployeeOfService p c
  employedOnDate : EmployedAtGillisLongCenterOnApril7_1986 p c
  stillEmployed : RemainsEmployedAtGillisLongCenter p c





def WithinAccumulatedAnnualLeaveCap (p : Person) (c : ComplaintText) : Prop :=
  accumulatedAnnualLeaveDays p c ≤ 120




inductive Section210_1EligibleOfficer (p : Person) (c : ComplaintText) : Prop where
  | regular (hMember : IsMemberOfRegularCorps p c) (hActive : IsOnActiveDuty p c)
  | readyReserve (hMember : IsMemberOfReadyReserveCorps p c) (hActive : IsOnActiveDuty p c)




structure Section210_1LeaveEntitlement (p : Person) (c : ComplaintText) : Prop where
  eligible : Section210_1EligibleOfficer p c
  underRegulations : LeaveGrantedInAccordanceWithPresidentialRegulations p c
  noDeduction : ¬ DeductionMadeFromPayAndAllowancesForLeave p c
  withinCap : WithinAccumulatedAnnualLeaveCap p c




def VacancyExistsInGradeInCategory
    (g : Grade) (pc : ProfessionalCategory) (c : ComplaintText) : Prop :=
  officersOnActiveDutyInGradeInCategory g pc c < maximumOfficersFixedForGradeInCategory g pc c



structure Section210bCategoryAssignment
    (p : Person) (pc : ProfessionalCategory) (c : ComplaintText) : Prop where
  regularCorpsMember : IsMemberOfRegularCorps p c
  activeDuty : IsOnActiveDuty p c
  categoriesEstablished : ProfessionalCategoriesEstablishedByRegulation c
  categoryBasis : CategoryBasedOnSection209ExaminationSubject pc c
  assignment : AssignedToCategoryOnBasisOfTrainingAndExperience p pc c


structure Section210bQualifiedTransferRequest
    (p : Person) (pc : ProfessionalCategory) (c : ComplaintText) : Prop where
  requested : RequestedTransferToCategory p pc c
  equallyQualified : EquallyWellQualifiedToServeInCategory p pc c
  serviceInterest : TransferInInterestsOfService p pc c


inductive Section210bCategoryChangeAuthority
    (p : Person) (pc : ProfessionalCategory) (c : ComplaintText) : Prop where
  | regulationsAmended (h : CategoryRegulationsAmended c)
  | erroneousOriginal (h : OriginalCategoryAssignmentErroneous p c)
  | qualifiedTransfer (h : Section210bQualifiedTransferRequest p pc c)




structure Section210bUnlawfulCategoryChangeClaim
    (p : Person) (pc : ProfessionalCategory) (c : ComplaintText) : Prop where
  regularCorpsMember : IsMemberOfRegularCorps p c
  activeDuty : IsOnActiveDuty p c
  changed : CategoryAssignmentChanged p c
  noAuthority : ¬ Section210bCategoryChangeAuthority p pc c






def CompetitiveRecommendationFloorMet (c : ComplaintText) : Prop :=
  4 * numberOfOfficersToBeExaminedForPromotion c
    ≤ 5 * numberOfOfficersToBeRecommendedForPromotion c



def CompletedThreeYearsAboveJuniorAssistant (p : Person) (c : ComplaintText) : Prop :=
  3 ≤ yearsOfServiceAboveJuniorAssistantGrade p c



def CompletedTenYearsAboveJuniorAssistant (p : Person) (c : ComplaintText) : Prop :=
  10 ≤ yearsOfServiceAboveJuniorAssistantGrade p c



def CompletedSeventeenYearsAboveJuniorAssistant (p : Person) (c : ComplaintText) : Prop :=
  17 ≤ yearsOfServiceAboveJuniorAssistantGrade p c


structure Section211PermanentPromotion (p : Person) (c : ComplaintText) : Prop where
  regularCorpsMember : IsMemberOfRegularCorps p c
  byPresident : PermanentPromotionMadeByPresident p c
  nextHigherGrade : PromotionToNextHigherGrade p c
  examination : PassedPromotionExamination p c



structure Section211NoncompetitiveExaminationRequired (p : Person) (c : ComplaintText) : Prop where
  lowerGradePromotion : PromotionToAssistantOrSeniorAssistantGrade p c
  noncompetitive : PromotionExaminationNoncompetitive p c


inductive Section211LengthOfServiceEligibility (p : Person) (c : ComplaintText) : Prop where
  | fromAssistant
      (hRank : HoldsPermanentRankInAssistantGrade p c)
      (hYears : CompletedThreeYearsAboveJuniorAssistant p c)
  | fromSeniorAssistant
      (hRank : HoldsPermanentRankInSeniorAssistantGrade p c)
      (hYears : CompletedTenYearsAboveJuniorAssistant p c)
  | fromFull
      (hRank : HoldsPermanentRankInFullGrade p c)
      (hYears : CompletedSeventeenYearsAboveJuniorAssistant p c)



structure Section211LengthOfServicePromotionDenied (p : Person) (c : ComplaintText) : Prop where
  regularCorpsMember : IsMemberOfRegularCorps p c
  eligibility : Section211LengthOfServiceEligibility p c
  qualified : FoundQualifiedForPromotion p c
  notPromoted : ¬ ReceivedLengthOfServicePromotion p c



structure Section211ReexaminationRight (p : Person) (c : ComplaintText) : Prop where
  eligibility : Section211LengthOfServiceEligibility p c
  missedPromotion : ¬ ReceivedLengthOfServicePromotion p c
  notTwiceExamined : ¬ TwiceExaminedForPromotion p c




inductive Section211NonPromotionConsequence (p : Person) (c : ComplaintText) : Prop where
  | separationJuniorGrades
      (hGrade : HoldsWarrantOfficerW1OrJuniorAssistantGrade p c)
      (hUnqualified : ¬ FoundQualifiedForPromotion p c)
      (hSeparated : SeparatedFromService p c)
  | separationSixMonthsPay
      (hGrade : HoldsChiefWarrantW2OrAssistantGrade p c)
      (hTwiceExamined : TwiceExaminedForPromotion p c)
      (hSeparated : SeparatedFromService p c)
      (hPaid : PaidSeveranceBasicPayAndAllowances p c)
  | separationOneYearPay
      (hGrade : HoldsChiefWarrantW3OrSeniorAssistantGrade p c)
      (hTwiceExamined : TwiceExaminedForPromotion p c)
      (hSeparated : SeparatedFromService p c)
      (hPaid : PaidSeveranceBasicPayAndAllowances p c)
  | retirementFromFullGrade
      (hGrade : HoldsPermanentRankInFullGrade p c)
      (hTwiceExamined : TwiceExaminedForPromotion p c)
      (hRetired : RetiredFromServiceWithRetiredPay p c)




structure Section211DisabilityExclusionClaim (p : Person) (c : ComplaintText) : Prop where
  regularCorpsMember : IsMemberOfRegularCorps p c
  consequence : Section211NonPromotionConsequence p c
  disability : NonPromotionForPhysicalDisability p c



structure Section211RefusalSeparation (p : Person) (c : ComplaintText) : Prop where
  regularCorpsMember : IsMemberOfRegularCorps p c
  refused : RefusedToTakePromotionExamination p c
  separated : SeparatedFromService p c



structure Section211ThreeYearReviewSeparation (p : Person) (c : ComplaintText) : Prop where
  regularCorpsMember : IsMemberOfRegularCorps p c
  seniorAppointment : OriginallyAppointedToSeniorAssistantGradeOrAbove p c
  reviewed : RecordReviewedAtEndOfFirstThreeYears p c
  notQualified : FoundNotQualifiedForFurtherService p c
  separated : SeparatedFromService p c
  paid : PaidSeveranceBasicPayAndAllowances p c



inductive Section211ThreeYearReviewDefect (p : Person) (c : ComplaintText) : Prop where
  | noReview (h : ¬ RecordReviewedAtEndOfFirstThreeYears p c)
  | unpaid (h : ¬ PaidSeveranceBasicPayAndAllowances p c)



structure Section211TemporaryPromotion (p : Person) (c : ComplaintText) : Prop where
  regularCorpsMember : IsMemberOfRegularCorps p c
  recommended : RecommendedForTemporaryPromotionToHigherGrade p c
  promoted : PromotedToHigherGrade p c



structure Section211DeemedAcceptance (p : Person) (c : ComplaintText) : Prop where
  promoted : PromotedToHigherGrade p c
  notDeclined : ¬ ExpresslyDeclinedPromotion p c




inductive Section211cAppointmentRoute (p : Person) (c : ComplaintText) : Prop where
  | priorAppointment
      (hAppointed : AppointedToAssistantGradeInRegularCorps p c)
      (hContinuous : ServiceContinuousFromDateOfAppointment p c)
  | futureAppointment (h : AppointedToAssistantGradeInRegularCorps p c)



structure Section211cCreditEntitlement (p : Person) (c : ComplaintText) : Prop where
  medicalOfficer : IsMedicalOfficerOfRegularCorps p c
  route : Section211cAppointmentRoute p c
  internship : CompletedMedicalInternshipByDateOfAppointment p c
  noDuplicateCredit : ¬ ReceivedSimilarInternshipCreditUnderOtherLaw p c


structure Section211cCreditDenied (p : Person) (c : ComplaintText) : Prop where
  entitlement : Section211cCreditEntitlement p c
  notCredited : ¬ CreditedWithOneYearForPromotionAndSeniority p c




def AttainedAgeSixtyFour (p : Person) (c : ComplaintText) : Prop :=
  64 ≤ attainedAgeYears p c


def CompletedThirtyYearsActiveService (p : Person) (c : ComplaintText) : Prop :=
  30 ≤ yearsOfActiveServiceForRetirement p c


def CompletedTwentyYearsActiveService (p : Person) (c : ComplaintText) : Prop :=
  20 ≤ yearsOfActiveServiceForRetirement p c



def CompletedTenYearsCommissionedService (p : Person) (c : ComplaintText) : Prop :=
  10 ≤ yearsOfActiveCommissionedServiceInUniformedServices p c



def CompletedFourYearsInSurgeonGeneralPositions (p : Person) (c : ComplaintText) : Prop :=
  4 ≤ yearsOfServiceInSurgeonGeneralPositions p c



def CompletedTwentyFiveYearsInRegularCorps (p : Person) (c : ComplaintText) : Prop :=
  25 ≤ yearsOfActiveServiceInRegularCorps p c


inductive Section212ActiveService (p : Person) (c : ComplaintText) : Prop where
  | uniformedService (h : ActiveServiceInUniformedService p c)
  | comparablePhsService (h : NonCommissionedPhsServiceDeterminedComparable p c)
  | creditableService (h : ServiceCreditableForUniformedServiceRetirement p c)
  | biomedicalResearchService (h : ServiceAsMemberOfSeniorBiomedicalResearchService p c)


structure Section212AgeRetirementOnApplication (p : Person) (c : ComplaintText) : Prop where
  regularCorpsMember : IsMemberOfRegularCorps p c
  applied : AppliedForRetirement p c
  age : AttainedAgeSixtyFour p c


structure Section212ThirtyYearRetirement (p : Person) (c : ComplaintText) : Prop where
  regularCorpsMember : IsMemberOfRegularCorps p c
  applied : AppliedForRetirement p c
  service : CompletedThirtyYearsActiveService p c



structure Section212EarlyRetirement (p : Person) (c : ComplaintText) : Prop where
  regularCorpsMember : IsMemberOfRegularCorps p c
  underThirty : ¬ CompletedThirtyYearsActiveService p c
  twentyYears : CompletedTwentyYearsActiveService p c
  tenCommissioned : CompletedTenYearsCommissionedService p c
  ordered : SecretaryOrderedRetirement p c


structure Section212SurgeonGeneralVoluntaryRetirement (p : Person) (c : ComplaintText) : Prop where
  regularCorpsMember : IsMemberOfRegularCorps p c
  office : ServedAsSurgeonGeneralDeputyOrAssistant p c
  officeYears : CompletedFourYearsInSurgeonGeneralPositions p c
  corpsYears : CompletedTwentyFiveYearsInRegularCorps p c
  presidentApproval : PresidentApprovedVoluntaryRetirement p c



inductive Section212RetirementEntitlement (p : Person) (c : ComplaintText) : Prop where
  | onAge (h : Section212AgeRetirementOnApplication p c)
  | onThirtyYears (h : Section212ThirtyYearRetirement p c)
  | asSurgeonGeneral (h : Section212SurgeonGeneralVoluntaryRetirement p c)


structure Section212RetirementDeniedClaim (p : Person) (c : ComplaintText) : Prop where
  entitlement : Section212RetirementEntitlement p c
  denied : RetirementDenied p c




structure Section212AgeBasedInvoluntaryRetirementClaim (p : Person) (c : ComplaintText) : Prop where
  regularCorpsMember : IsMemberOfRegularCorps p c
  involuntaryForAge : RetiredInvoluntarilyBecauseOfAge p c


inductive Section212RecallAuthority (p : Person) (c : ComplaintText) : Prop where
  | involuntaryWartime
      (hRegular : IsMemberOfRegularCorps p c)
      (hPay : EntitledToRetiredPayUnderSection212 p c)
      (hBranch : CommissionedCorpsConstitutesBranchOfLandOrNavalForces c)
  | consensual (h : ConsentedToRecallToActiveDuty p c)





structure Section212UnlawfulRecallClaim (p : Person) (c : ComplaintText) : Prop where
  recalled : RecalledToActiveDuty p c
  noAuthority : ¬ Section212RecallAuthority p c
  notSeniorGradeFailure : ¬ RetiredForFailureOfPromotionToSeniorGrade p c




inductive Section213Claimant (p : Person) (c : ComplaintText) : Prop where
  | officer (h : IsCommissionedOfficerOfService p c)
  | survivingBeneficiary (h : IsSurvivingBeneficiaryOfCommissionedOfficer p c)



inductive Section213QualifyingActiveService (p : Person) (c : ComplaintText) : Prop where
  | timeOfWar (h : ActiveServicePerformedInTimeOfWar p c)
  | detailWithArmedForces (h : ActiveServicePerformedOnDetailWithArmedForces p c)
  | partOfMilitaryForces (h : ActiveServicePerformedWhileServicePartOfMilitaryForces p c)



structure Section213MilitaryBenefitsClaim (p : Person) (c : ComplaintText) : Prop where
  claimant : Section213Claimant p c
  service : Section213QualifyingActiveService p c
  notExcepted : ¬ BenefitClaimedIsRetiredPayOrUniformAllowance c
  denied : DeniedArmyOfficerRightPrivilegeImmunityOrBenefit p c



structure Section213VeteransBenefitsDeeming (p : Person) (c : ComplaintText) : Prop where
  officer : IsCommissionedOfficerOfService p c
  claim : ClaimUnderLawAdministeredBySecretaryOfVeteransAffairs c
  notIndemnityAct : ¬ ClaimUnderServicemensIndemnityActOf1951 c



structure Section213ScraDeeming (p : Person) (c : ComplaintText) : Prop where
  officer : IsCommissionedOfficerOfService p c
  claim : ClaimUnderServicemembersCivilReliefAct c



structure Section213AntidiscriminationDeeming (p : Person) (c : ComplaintText) : Prop where
  officer : IsCommissionedOfficerOfService p c
  claim : ClaimUnderLawProhibitingEnumeratedDiscrimination c






structure Section213aEntitlement (p : Person) (c : ComplaintText) : Prop where
  claimant : Section213Claimant p c
  enumerated : BenefitEnumeratedInSection213aList c
  chapter61Carve :
    ClaimUnderChapter61Sections1201To1203 c → ¬ OrderedToActiveDutyForTrainingMoreThanThirtyDays p c
  chapter69Carve : ¬ ClaimUnderExceptedChapter69Provision c
  formulaCarve : ¬ ClaimUnderExceptedRetiredPayFormula c
  militaryClaimsCondition :
    ClaimUnderChapter163MilitaryClaims c → EntitledToMilitaryBenefitsUnderSection213 p c



structure Section213aDenialClaim (p : Person) (c : ComplaintText) : Prop where
  entitlement : Section213aEntitlement p c
  denied : DeniedTitle10RightBenefitPrivilegeOrImmunity p c



structure Section213aWrongAuthorityClaim (p : Person) (c : ComplaintText) : Prop where
  entitlement : Section213aEntitlement p c
  wrongAuthority : ¬ AuthorityExercisedBySecretaryOfHhsOrDesignee c




structure Section214FlagEntitlement (p : Person) (c : ComplaintText) : Prop where
  officer : IsCommissionedOfficerOfService p c
  released : ReleasedFromActiveCommissionedServiceForRetirement p c
  notPreviouslyPresented : ¬ PreviouslyPresentedUnitedStatesFlagOnRetirement p c


inductive Section214ViolationTheory (p : Person) (c : ComplaintText) : Prop where
  | notPresented (h : ¬ UnitedStatesFlagPresentedBySecretary p c)
  | chargedCost (h : ChargedCostForFlagPresentation p c)


structure Section214FlagClaim (p : Person) (c : ComplaintText) : Prop where
  entitlement : Section214FlagEntitlement p c
  theory : Section214ViolationTheory p c




structure Section215ExecutiveDepartmentDetail
    (p : Person) (fe : FederalEntity) (c : ComplaintText) : Prop where
  personnel : IsOfficerOrEmployeeOfService p c
  request : HeadOfExecutiveDepartmentRequestedDetail fe c
  agreement : DetailAgreedUponBySecretaryAndDepartmentHead p fe c
  relatedWork : DetailForWorkRelatedToDepartmentOrServiceFunctions p fe c


structure Section215StateDetail (p : Person) (c : ComplaintText) : Prop where
  personnel : IsOfficerOrEmployeeOfService p c
  request : StateHealthOrMentalHealthAuthorityRequestedDetail c
  detailed : DetailedBySurgeonGeneralToAssistStateOrSubdivision p c



structure Section215SpecialStudyDetail (p : Person) (c : ComplaintText) : Prop where
  personnel : IsOfficerOrEmployeeOfService p c
  detailed : DetailedToCongressionalCommitteeOrNonprofitInstitution p c
  purpose : DetailForSpecialStudiesOrDisseminationOfInformation p c


inductive Section215CreditableDetail (p : Person) (c : ComplaintText) : Prop where
  | stateDetail (h : Section215StateDetail p c)
  | specialStudyDetail (h : Section215SpecialStudyDetail p c)




structure Section215ServiceCreditDeniedClaim (p : Person) (c : ComplaintText) : Prop where
  detail : Section215CreditableDetail p c
  notCredited : ¬ DetailServiceCreditedForPayPromotionRetirementAndBenefits p c



structure Section215UnlawfulDeploymentClaim (p : Person) (c : ComplaintText) : Prop where
  officer : IsCommissionedOfficerOfService p c
  assignedOutside : AssignedToEntityOutsideDepartmentOfHealthAndHumanServices p c
  notCoastGuardOrDefense : ¬ AssignedToCoastGuardOrDepartmentOfDefense p c
  noNegotiatedAgreement : ¬ NegotiatedAgencyAgreementGovernsDeployment c
  deployedByOther : DeployedByEntityOtherThanSecretary p c





inductive Section217UtilizationTrigger (c : ComplaintText) : Prop where
  | war (h : TimeOfWar c)
  | proclaimedEmergency (h : EmergencyProclaimedByPresident c)



inductive Section217DeclarationTrigger (c : ComplaintText) : Prop where
  | war (h : TimeOfWar c)
  | nationalDefenseEmergency (h : EmergencyInvolvingNationalDefenseProclaimedByPresident c)



structure Section217MilitaryServiceDeclaration (c : ComplaintText) : Prop where
  trigger : Section217DeclarationTrigger c
  executiveOrder : PresidentDeclaredCorpsMilitaryServiceByExecutiveOrder c
  withinPeriod : WithinPeriodPrescribedByPresident c



structure Section217UcmjJurisdiction (p : Person) (c : ComplaintText) : Prop where
  officer : IsCommissionedOfficerOfService p c
  declaration : Section217MilitaryServiceDeclaration c
  prescribedByRegulation : SubjectToUcmjUnderPresidentialRegulations p c


inductive Section217UcmjJurisdictionDefect (p : Person) (c : ComplaintText) : Prop where
  | noDeclaration (h : ¬ Section217MilitaryServiceDeclaration c)
  | notPrescribed (h : ¬ SubjectToUcmjUnderPresidentialRegulations p c)





structure Section217UcmjJurisdictionChallenge (p : Person) (c : ComplaintText) : Prop where
  officer : IsCommissionedOfficerOfService p c
  defect : Section217UcmjJurisdictionDefect p c




structure Section217aAppointment
    (p : Person) (ab : AdvisoryBody) (c : ComplaintText) : Prop where
  appointed : AppointedToAdvisoryBodyBySecretary p ab c
  notCompetitiveService : AppointedWithoutRegardToCompetitiveServiceProvisions p c
  advisoryPurpose : AdvisoryBodyAdvisesSecretaryInConnectionWithHisFunctions ab c



structure Section217aCompensationEntitlement
    (p : Person) (ab : AdvisoryBody) (c : ComplaintText) : Prop where
  appointment : Section217aAppointment p ab c
  notFullTimeEmployee : ¬ IsRegularFullTimeEmployeeOfUnitedStates p c
  service : AttendedAdvisoryBodyMeetingOrEngagedOnItsBusiness p ab c
  withinCap : WithinGs18DailyEquivalentCap p c



structure Section217aDelegation (ab : AdvisoryBody) (c : ComplaintText) : Prop where
  delegated : AdvisoryFunctionsDelegatedBySecretary ab c
  grantsInAid : DelegatedFunctionsRelateToResearchOrTrainingGrantsInAid ab c
  appropriate : SecretaryDeterminedDelegationAppropriate ab c






inductive Section217a1CoveredCommittee (ab : AdvisoryBody) (c : ComplaintText) : Prop where
  | publicHealthServiceAct (h : IsAdvisoryCommitteeImplementingPublicHealthServiceAct ab c)
  | alcoholAbuseAct (h : IsAdvisoryCommitteeImplementingAlcoholAbuseAct ab c)



structure Section217a1PoliticalAffiliationClaim
    (p : Person) (ab : AdvisoryBody) (c : ComplaintText) : Prop where
  covered : Section217a1CoveredCommittee ab c
  considered : PoliticalAffiliationConsideredInAppointment p ab c

end Proving.USC.T42.Ch6ASchI.Reearn.Elements
