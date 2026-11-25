







import Proving.USC.T42.Ch6ASchI.Reearn.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reearn.Elements

open Proving.USC.Common





axiom IsCommissionedOfficerOfService (p : Person) (c : ComplaintText) : Prop



axiom IsMemberOfRegularCorps (p : Person) (c : ComplaintText) : Prop



axiom IsMemberOfReadyReserveCorps (p : Person) (c : ComplaintText) : Prop




axiom IsMemberOfCommissionedCorps (p : Person) (c : ComplaintText) : Prop



axiom IsOnActiveDuty (p : Person) (c : ComplaintText) : Prop



axiom IsRetiredOfficerEntitledToRetiredPay (p : Person) (c : ComplaintText) : Prop



axiom IsSurvivingBeneficiaryOfCommissionedOfficer (p : Person) (c : ComplaintText) : Prop



axiom IsCivilianEmployeeOfService (p : Person) (c : ComplaintText) : Prop



axiom IsOfficerOrEmployeeOfService (p : Person) (c : ComplaintText) : Prop



axiom IsUnitedStatesCitizen (p : Person) (c : ComplaintText) : Prop






axiom PaymentFromWalkerClassSettlementFund (pay : Payment) (c : ComplaintText) : Prop




axiom PaymentUnderReleaseInLieuOfClassSettlement (pay : Payment) (c : ComplaintText) : Prop



axiom ReleaseSignedByAllAffectedParties (pay : Payment) (c : ComplaintText) : Prop



axiom ReleaseSignedOnOrBeforeDecember31_1997 (pay : Payment) (c : ComplaintText) : Prop





axiom daysFromReleaseFirstSentToSigning (pay : Payment) (c : ComplaintText) : Nat



axiom PaymentFromSection101Fund (pay : Payment) (c : ComplaintText) : Prop




axiom DeterminationOfMedicaidEligibilityOrAmount (c : ComplaintText) : Prop




axiom DeterminationOfSsiEligibilityOrAmount (c : ComplaintText) : Prop




axiom PaymentCountedAsIncomeOrResources (pay : Payment) (c : ComplaintText) : Prop








axiom IsEnumeratedServiceComponent (sc : ServiceComponent) (c : ComplaintText) : Prop



axiom IsDivisionEstablishmentAbolitionTransferOrConsolidation (a : AgencyAction) (c : ComplaintText) : Prop


axiom SecretaryApprovedDivisionAction (a : AgencyAction) (c : ComplaintText) : Prop



axiom ActionTakenUnderSecretarialDelegation (a : AgencyAction) (c : ComplaintText) : Prop



axiom DelegatedActionIsMakingOfRegulations (a : AgencyAction) (c : ComplaintText) : Prop




axiom AppointedByPresident (p : Person) (c : ComplaintText) : Prop



axiom AppointedToRegularCorps (p : Person) (c : ComplaintText) : Prop



axiom AppointedToReadyReserveCorps (p : Person) (c : ComplaintText) : Prop




axiom AppointedWithoutRegardToCivilServiceLaws (p : Person) (c : ComplaintText) : Prop



axiom SubjectToCallToActiveDutyBySurgeonGeneral (p : Person) (c : ComplaintText) : Prop




axiom AppointedAsWarrantOfficerForHealthDeliverySupport (p : Person) (c : ComplaintText) : Prop



axiom ClassifiedAsReserveCorpsOfficerBeforeMarch23_2010 (p : Person) (c : ComplaintText) : Prop



axiom ServingOnActiveDutyOnMarch23_2010 (p : Person) (c : ComplaintText) : Prop





axiom ReadinessRequirementsEstablishedBySecretary (c : ComplaintText) : Prop



axiom FailedToMeetOrMaintainReadinessRequirements (p : Person) (c : ComplaintText) : Prop



axiom FailedToComplyWithDeploymentOrders (p : Person) (c : ComplaintText) : Prop



axiom SecretaryGrantedReadinessWaiver (p : Person) (c : ComplaintText) : Prop



axiom UnableToMeetRequirementsBecauseOfDisability (p : Person) (c : ComplaintText) : Prop



axiom UnableToMeetRequirementsBecauseOfTemporaryMedicalCondition (p : Person) (c : ComplaintText) : Prop



axiom SecretaryDeterminedExtraordinaryLimitation (p : Person) (c : ComplaintText) : Prop



axiom DisciplinaryActionImposed (p : Person) (c : ComplaintText) : Prop



axiom DisciplinaryActionFollowedSecretaryEstablishedProcedures (p : Person) (c : ComplaintText) : Prop



axiom NationalEmergencyDeclaredByPresident (e : Emergency) (c : ComplaintText) : Prop




axiom StaffordActEmergencyOrMajorDisasterDeclared (e : Emergency) (c : ComplaintText) : Prop



axiom PublicHealthEmergencyDeclaredBySecretary (e : Emergency) (c : ComplaintText) : Prop



axiom SecretaryJudgedEmergencyAppropriateForCorpsDeployment (e : Emergency) (c : ComplaintText) : Prop



axiom OfficerDetailedOrAssignedToFederalEntity (p : Person) (fe : FederalEntity) (c : ComplaintText) : Prop



axiom DeployedBySecretaryInResponseToUrgentNeed (p : Person) (e : Emergency) (c : ComplaintText) : Prop





axiom HasSpecializedTrainingOrExperienceInPublicHealthPrograms (p : Person) (c : ComplaintText) : Prop



axiom AppointedByPresidentWithSenateAdviceAndConsent (p : Person) (c : ComplaintText) : Prop



axiom AppointedForFourYearTermAsSurgeonGeneral (p : Person) (c : ComplaintText) : Prop


axiom SurgeonGeneralTermExpired (p : Person) (c : ComplaintText) : Prop


axiom ReappointedAsSurgeonGeneral (p : Person) (c : ComplaintText) : Prop




axiom RevertedToPriorGradeAndNumber (p : Person) (c : ComplaintText) : Prop




axiom AssignedBySurgeonGeneral (p : Person) (c : ComplaintText) : Prop




axiom AssignedToAdministerOfficeOfSurgeonGeneral (p : Person) (c : ComplaintText) : Prop



axiom AssignedToEnumeratedAssistantSurgeonGeneralPosition (p : Person) (c : ComplaintText) : Prop




axiom AssignedFromRegularOrReadyReserveCorps (p : Person) (c : ComplaintText) : Prop



axiom SecretaryApprovedSpecialTemporaryPosition (p : Person) (c : ComplaintText) : Prop



axiom TemporaryPositionNecessaryForProperStaffing (p : Person) (c : ComplaintText) : Prop




axiom DesignatedToServeAsSurgeonGeneralDuringVacancy (p : Person) (c : ComplaintText) : Prop




axiom numberOfSpecialTemporaryAssistantSurgeonGeneralPositions (c : ComplaintText) : Nat




axiom peakActiveDutyOfficerCountPrecedingNinetyDays (c : ComplaintText) : Nat





axiom HoldsAssistantSurgeonGeneralGradeAboveBrigadierGeneral (p : Person) (c : ComplaintText) : Prop




axiom SeparationOrGradeReductionRequiredSolelyByGradeMaxima (p : Person) (c : ComplaintText) : Prop



axiom ActionTakenPursuantToOtherProvisionOfChapter (p : Person) (c : ComplaintText) : Prop



axiom AssignedToDutyInDepartmentOfDefense (p : Person) (c : ComplaintText) : Prop



axiom ServingInPolicymakingPositionInDepartmentOfDefense (p : Person) (c : ComplaintText) : Prop



axiom numberOfAssistantSurgeonsGeneralAboveBrigadierGrade (c : ComplaintText) : Nat



axiom numberOfAssistantSurgeonGeneralPositions (c : ComplaintText) : Nat



axiom numberPrescribedForGrade (g : Grade) (c : ComplaintText) : Nat



axiom appropriationActLimitForGrade (g : Grade) (c : ComplaintText) : Nat




axiom numberOfExcludedGeneralGradeOfficersInDefensePolicymaking (c : ComplaintText) : Nat






axiom AppointedToEligibleOriginalRegularCorpsGrade (p : Person) (c : ComplaintText) : Prop



axiom AppointmentAboveJuniorAssistantGrade (p : Person) (c : ComplaintText) : Prop





axiom PassedPrescribedAppointmentExamination (p : Person) (c : ComplaintText) : Prop



axiom AppointedToReadyReserveGradeNotAboveDirector (p : Person) (c : ComplaintText) : Prop



axiom ReserveCommissionForIndefinitePeriod (p : Person) (c : ComplaintText) : Prop



axiom CalledToActiveDutyInReadyReserveForMoreThanOneYear (p : Person) (c : ComplaintText) : Prop




axiom SurgeonGeneralDeterminedExceptionalQualifications (p : Person) (c : ComplaintText) : Prop



axiom CommissionedCorpsDeclaredMilitaryServiceByPresident (c : ComplaintText) : Prop



axiom AppointmentAboveSeniorAssistantGrade (p : Person) (c : ComplaintText) : Prop



axiom AppointmentAboveDirectorGrade (p : Person) (c : ComplaintText) : Prop



axiom MeetsPresidentiallyPrescribedAppointmentStandards (p : Person) (c : ComplaintText) : Prop



axiom CommissionIssuedBySecretaryUnderDepartmentSeal (p : Person) (c : ComplaintText) : Prop




axiom OnActiveDutyContinuouslyOneYearBeforeAppointment (p : Person) (c : ComplaintText) : Prop




axiom monthsOfContinuousPostJune1960ActiveDutyBeforeApplication (p : Person) (c : ComplaintText) : Nat



axiom HeldPriorRegularCorpsCommission (p : Person) (c : ComplaintText) : Prop



axiom AppliedForReappointmentWithinTwoYearsOfTermination (p : Person) (c : ComplaintText) : Prop




axiom ReappointedToPriorPermanentOrNextHigherGrade (p : Person) (c : ComplaintText) : Prop



axiom MeetsSecretaryPrescribedReappointmentStandards (p : Person) (c : ComplaintText) : Prop




axiom EmployedAsSpecialConsultantUnderRegulations (p : Person) (c : ComplaintText) : Prop



axiom DesignatedBySurgeonGeneralToReceiveFellowship (p : Person) (c : ComplaintText) : Prop



axiom IsNotCommissionedOfficerOfService (p : Person) (c : ComplaintText) : Prop



axiom AppointmentMadeInAccordanceWithCivilServiceLaws (p : Person) (c : ComplaintText) : Prop



axiom AppointmentMadeBySecretary (p : Person) (c : ComplaintText) : Prop




axiom ageAtAppointment (p : Person) (c : ComplaintText) : Nat



axiom yearsOfActiveServiceAtAppointment (p : Person) (c : ComplaintText) : Nat



axiom numberOfOriginalAppointmentsAboveSeniorAssistantGrade (c : ComplaintText) : Nat




axiom numberOfOriginalAppointmentsAuthorized (c : ComplaintText) : Nat






axiom GraduateOfOsteopathyCollegeLicensableInMajorityOfStates (p : Person) (c : ComplaintText) : Prop



axiom GraduateOfOsteopathyCollegeApprovedByAcceptableBody (p : Person) (c : ComplaintText) : Prop



axiom SatisfiesOtherAppointmentProvisionsOfAct (p : Person) (c : ComplaintText) : Prop






axiom DeniedSupplyPurchaseAtOfficerPrice (p : Person) (c : ComplaintText) : Prop




axiom IsMemberOfNationalAdvisoryOrReviewCouncil (p : Person) (ab : AdvisoryBody) (c : ComplaintText) : Prop



axiom IsExOfficioMemberOfCouncil (p : Person) (ab : AdvisoryBody) (c : ComplaintText) : Prop



axiom AttendedCouncilMeetingOrServedAtSecretaryRequest (p : Person) (ab : AdvisoryBody) (c : ComplaintText) : Prop



axiom IsFieldEmployeeRenderingPartTimeDuty (p : Person) (c : ComplaintText) : Prop



axiom SubjectToCallForServicesBeyondRegularPartTimeEmployment (p : Person) (c : ComplaintText) : Prop



axiom EmployedOnPerDiemOrFeeBasis (p : Person) (c : ComplaintText) : Prop



axiom EmployedAtGillisLongCenterOnApril7_1986 (p : Person) (c : ComplaintText) : Prop



axiom RemainsEmployedAtGillisLongCenter (p : Person) (c : ComplaintText) : Prop



axiom dailyCompensationRateCents (p : Person) (c : ComplaintText) : Nat



axiom grade18DailyEquivalentRateCents (c : ComplaintText) : Nat



axiom totalFiscalYearCompensationDollars (p : Person) (c : ComplaintText) : Nat



axiom minimumAnnualSalaryRateForGradeDollars (p : Person) (c : ComplaintText) : Nat





axiom LeaveGrantedInAccordanceWithPresidentialRegulations (p : Person) (c : ComplaintText) : Prop



axiom DeductionMadeFromPayAndAllowancesForLeave (p : Person) (c : ComplaintText) : Prop




axiom accumulatedAnnualLeaveDays (p : Person) (c : ComplaintText) : Nat





axiom ProfessionalCategoriesEstablishedByRegulation (c : ComplaintText) : Prop




axiom CategoryBasedOnSection209ExaminationSubject (pc : ProfessionalCategory) (c : ComplaintText) : Prop



axiom AssignedToCategoryOnBasisOfTrainingAndExperience (p : Person) (pc : ProfessionalCategory) (c : ComplaintText) : Prop


axiom CategoryAssignmentChanged (p : Person) (c : ComplaintText) : Prop



axiom CategoryRegulationsAmended (c : ComplaintText) : Prop



axiom OriginalCategoryAssignmentErroneous (p : Person) (c : ComplaintText) : Prop


axiom RequestedTransferToCategory (p : Person) (pc : ProfessionalCategory) (c : ComplaintText) : Prop



axiom EquallyWellQualifiedToServeInCategory (p : Person) (pc : ProfessionalCategory) (c : ComplaintText) : Prop



axiom TransferInInterestsOfService (p : Person) (pc : ProfessionalCategory) (c : ComplaintText) : Prop



axiom maximumOfficersFixedForGradeInCategory (g : Grade) (pc : ProfessionalCategory) (c : ComplaintText) : Nat




axiom officersOnActiveDutyInGradeInCategory (g : Grade) (pc : ProfessionalCategory) (c : ComplaintText) : Nat




axiom PermanentPromotionMadeByPresident (p : Person) (c : ComplaintText) : Prop


axiom PromotionToNextHigherGrade (p : Person) (c : ComplaintText) : Prop



axiom PassedPromotionExamination (p : Person) (c : ComplaintText) : Prop



axiom PromotionExaminationNoncompetitive (p : Person) (c : ComplaintText) : Prop



axiom PromotionToAssistantOrSeniorAssistantGrade (p : Person) (c : ComplaintText) : Prop




axiom IsRestrictedGrade (g : Grade) (c : ComplaintText) : Prop



axiom FoundQualifiedForPromotion (p : Person) (c : ComplaintText) : Prop



axiom HoldsPermanentRankInAssistantGrade (p : Person) (c : ComplaintText) : Prop



axiom HoldsPermanentRankInSeniorAssistantGrade (p : Person) (c : ComplaintText) : Prop


axiom HoldsPermanentRankInFullGrade (p : Person) (c : ComplaintText) : Prop



axiom ReceivedLengthOfServicePromotion (p : Person) (c : ComplaintText) : Prop



axiom TwiceExaminedForPromotion (p : Person) (c : ComplaintText) : Prop



axiom NonPromotionForPhysicalDisability (p : Person) (c : ComplaintText) : Prop



axiom HoldsWarrantOfficerW1OrJuniorAssistantGrade (p : Person) (c : ComplaintText) : Prop



axiom HoldsChiefWarrantW2OrAssistantGrade (p : Person) (c : ComplaintText) : Prop



axiom HoldsChiefWarrantW3OrSeniorAssistantGrade (p : Person) (c : ComplaintText) : Prop


axiom SeparatedFromService (p : Person) (c : ComplaintText) : Prop



axiom PaidSeveranceBasicPayAndAllowances (p : Person) (c : ComplaintText) : Prop



axiom RetiredFromServiceWithRetiredPay (p : Person) (c : ComplaintText) : Prop



axiom RefusedToTakePromotionExamination (p : Person) (c : ComplaintText) : Prop



axiom RecordReviewedAtEndOfFirstThreeYears (p : Person) (c : ComplaintText) : Prop



axiom FoundNotQualifiedForFurtherService (p : Person) (c : ComplaintText) : Prop



axiom OriginallyAppointedToSeniorAssistantGradeOrAbove (p : Person) (c : ComplaintText) : Prop



axiom RecommendedForTemporaryPromotionToHigherGrade (p : Person) (c : ComplaintText) : Prop


axiom PromotedToHigherGrade (p : Person) (c : ComplaintText) : Prop


axiom ExpresslyDeclinedPromotion (p : Person) (c : ComplaintText) : Prop




axiom yearsOfServiceAboveJuniorAssistantGrade (p : Person) (c : ComplaintText) : Nat




axiom numberOfOfficersToBeRecommendedForPromotion (c : ComplaintText) : Nat



axiom numberOfOfficersToBeExaminedForPromotion (c : ComplaintText) : Nat





axiom IsMedicalOfficerOfRegularCorps (p : Person) (c : ComplaintText) : Prop



axiom AppointedToAssistantGradeInRegularCorps (p : Person) (c : ComplaintText) : Prop



axiom ServiceContinuousFromDateOfAppointment (p : Person) (c : ComplaintText) : Prop



axiom CompletedMedicalInternshipByDateOfAppointment (p : Person) (c : ComplaintText) : Prop



axiom ReceivedSimilarInternshipCreditUnderOtherLaw (p : Person) (c : ComplaintText) : Prop



axiom CreditedWithOneYearForPromotionAndSeniority (p : Person) (c : ComplaintText) : Prop




axiom AppliedForRetirement (p : Person) (c : ComplaintText) : Prop



axiom SecretaryOrderedRetirement (p : Person) (c : ComplaintText) : Prop



axiom RetiredInvoluntarilyBecauseOfAge (p : Person) (c : ComplaintText) : Prop



axiom ServedAsSurgeonGeneralDeputyOrAssistant (p : Person) (c : ComplaintText) : Prop



axiom PresidentApprovedVoluntaryRetirement (p : Person) (c : ComplaintText) : Prop



axiom RetirementDenied (p : Person) (c : ComplaintText) : Prop



axiom ActiveServiceInUniformedService (p : Person) (c : ComplaintText) : Prop




axiom NonCommissionedPhsServiceDeterminedComparable (p : Person) (c : ComplaintText) : Prop



axiom ServiceCreditableForUniformedServiceRetirement (p : Person) (c : ComplaintText) : Prop




axiom ServiceAsMemberOfSeniorBiomedicalResearchService (p : Person) (c : ComplaintText) : Prop



axiom RetiredForFailureOfPromotionToSeniorGrade (p : Person) (c : ComplaintText) : Prop



axiom EntitledToRetiredPayUnderSection212 (p : Person) (c : ComplaintText) : Prop



axiom CommissionedCorpsConstitutesBranchOfLandOrNavalForces (c : ComplaintText) : Prop



axiom ConsentedToRecallToActiveDuty (p : Person) (c : ComplaintText) : Prop


axiom RecalledToActiveDuty (p : Person) (c : ComplaintText) : Prop



axiom attainedAgeYears (p : Person) (c : ComplaintText) : Nat



axiom yearsOfActiveServiceForRetirement (p : Person) (c : ComplaintText) : Nat



axiom yearsOfActiveCommissionedServiceInUniformedServices (p : Person) (c : ComplaintText) : Nat



axiom yearsOfServiceInSurgeonGeneralPositions (p : Person) (c : ComplaintText) : Nat



axiom yearsOfActiveServiceInRegularCorps (p : Person) (c : ComplaintText) : Nat




axiom ActiveServicePerformedInTimeOfWar (p : Person) (c : ComplaintText) : Prop



axiom ActiveServicePerformedOnDetailWithArmedForces (p : Person) (c : ComplaintText) : Prop




axiom ActiveServicePerformedWhileServicePartOfMilitaryForces (p : Person) (c : ComplaintText) : Prop



axiom BenefitClaimedIsRetiredPayOrUniformAllowance (c : ComplaintText) : Prop




axiom DeniedArmyOfficerRightPrivilegeImmunityOrBenefit (p : Person) (c : ComplaintText) : Prop



axiom ClaimUnderLawAdministeredBySecretaryOfVeteransAffairs (c : ComplaintText) : Prop



axiom ClaimUnderServicemensIndemnityActOf1951 (c : ComplaintText) : Prop



axiom ClaimUnderServicemembersCivilReliefAct (c : ComplaintText) : Prop



axiom ClaimUnderLawProhibitingEnumeratedDiscrimination (c : ComplaintText) : Prop





axiom BenefitEnumeratedInSection213aList (c : ComplaintText) : Prop


axiom ClaimUnderChapter61Sections1201To1203 (c : ComplaintText) : Prop



axiom OrderedToActiveDutyForTrainingMoreThanThirtyDays (p : Person) (c : ComplaintText) : Prop



axiom ClaimUnderExceptedChapter69Provision (c : ComplaintText) : Prop



axiom ClaimUnderExceptedRetiredPayFormula (c : ComplaintText) : Prop



axiom ClaimUnderChapter163MilitaryClaims (c : ComplaintText) : Prop



axiom EntitledToMilitaryBenefitsUnderSection213 (p : Person) (c : ComplaintText) : Prop



axiom AuthorityExercisedBySecretaryOfHhsOrDesignee (c : ComplaintText) : Prop



axiom DeniedTitle10RightBenefitPrivilegeOrImmunity (p : Person) (c : ComplaintText) : Prop





axiom ReleasedFromActiveCommissionedServiceForRetirement (p : Person) (c : ComplaintText) : Prop




axiom PreviouslyPresentedUnitedStatesFlagOnRetirement (p : Person) (c : ComplaintText) : Prop



axiom UnitedStatesFlagPresentedBySecretary (p : Person) (c : ComplaintText) : Prop



axiom ChargedCostForFlagPresentation (p : Person) (c : ComplaintText) : Prop





axiom HeadOfExecutiveDepartmentRequestedDetail (fe : FederalEntity) (c : ComplaintText) : Prop



axiom DetailAgreedUponBySecretaryAndDepartmentHead (p : Person) (fe : FederalEntity) (c : ComplaintText) : Prop



axiom DetailForWorkRelatedToDepartmentOrServiceFunctions (p : Person) (fe : FederalEntity) (c : ComplaintText) : Prop



axiom StateHealthOrMentalHealthAuthorityRequestedDetail (c : ComplaintText) : Prop




axiom DetailedBySurgeonGeneralToAssistStateOrSubdivision (p : Person) (c : ComplaintText) : Prop




axiom DetailedToCongressionalCommitteeOrNonprofitInstitution (p : Person) (c : ComplaintText) : Prop



axiom DetailForSpecialStudiesOrDisseminationOfInformation (p : Person) (c : ComplaintText) : Prop




axiom DetailServiceCreditedForPayPromotionRetirementAndBenefits (p : Person) (c : ComplaintText) : Prop



axiom AssignedToEntityOutsideDepartmentOfHealthAndHumanServices (p : Person) (c : ComplaintText) : Prop




axiom AssignedToCoastGuardOrDepartmentOfDefense (p : Person) (c : ComplaintText) : Prop



axiom NegotiatedAgencyAgreementGovernsDeployment (c : ComplaintText) : Prop



axiom DeployedByEntityOtherThanSecretary (p : Person) (c : ComplaintText) : Prop




axiom TimeOfWar (c : ComplaintText) : Prop



axiom EmergencyProclaimedByPresident (c : ComplaintText) : Prop



axiom EmergencyInvolvingNationalDefenseProclaimedByPresident (c : ComplaintText) : Prop



axiom PresidentDeclaredCorpsMilitaryServiceByExecutiveOrder (c : ComplaintText) : Prop



axiom WithinPeriodPrescribedByPresident (c : ComplaintText) : Prop



axiom SubjectToUcmjUnderPresidentialRegulations (p : Person) (c : ComplaintText) : Prop





axiom AppointedToAdvisoryBodyBySecretary (p : Person) (ab : AdvisoryBody) (c : ComplaintText) : Prop




axiom AppointedWithoutRegardToCompetitiveServiceProvisions (p : Person) (c : ComplaintText) : Prop



axiom AdvisoryBodyAdvisesSecretaryInConnectionWithHisFunctions (ab : AdvisoryBody) (c : ComplaintText) : Prop



axiom IsRegularFullTimeEmployeeOfUnitedStates (p : Person) (c : ComplaintText) : Prop



axiom AttendedAdvisoryBodyMeetingOrEngagedOnItsBusiness (p : Person) (ab : AdvisoryBody) (c : ComplaintText) : Prop



axiom AdvisoryFunctionsDelegatedBySecretary (ab : AdvisoryBody) (c : ComplaintText) : Prop




axiom DelegatedFunctionsRelateToResearchOrTrainingGrantsInAid (ab : AdvisoryBody) (c : ComplaintText) : Prop



axiom SecretaryDeterminedDelegationAppropriate (ab : AdvisoryBody) (c : ComplaintText) : Prop





axiom IsAdvisoryCommitteeImplementingPublicHealthServiceAct (ab : AdvisoryBody) (c : ComplaintText) : Prop




axiom IsAdvisoryCommitteeImplementingAlcoholAbuseAct (ab : AdvisoryBody) (c : ComplaintText) : Prop



axiom PoliticalAffiliationConsideredInAppointment (p : Person) (ab : AdvisoryBody) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Reearn.Elements
