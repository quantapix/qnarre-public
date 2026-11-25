






import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch6ASchI.Reearn.Deontic.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reearn.Deontic

open Proving.USC.Common






axiom IsCitizenOfUnitedStates (p : Person) (c : ComplaintText) : Prop





axiom FiledWithinStatutoryPeriod (p : Person) (c : ComplaintText) : Prop




axiom PresidentialEmergencyProclaimed (c : ComplaintText) : Prop





axiom TakenInAccordanceWithRegulations (r : Regulation) (c : ComplaintText) : Prop




axiom PoliticalAffiliationConsidered (p : Person) (c : ComplaintText) : Prop







axiom PaymentIsHemophiliaSettlementPayment (pm : Payment) (c : ComplaintText) : Prop




axiom PaymentCountedAsIncomeOrResource (pm : Payment) (c : ComplaintText) : Prop




axiom DeterminingMedicaidOrSsiEligibility (pm : Payment) (c : ComplaintText) : Prop







axiom SecretaryAssignedServiceFunctions (c : ComplaintText) : Prop




axiom DivisionEstablishedAbolishedOrTransferred (c : ComplaintText) : Prop




axiom SecretaryApprovedDivisionChange (c : ComplaintText) : Prop






axiom IsAppointedCommissionedOfficer (p : Person) (cc : CorpsComponent) (c : ComplaintText) : Prop




axiom IsReadyReserveCorps (cc : CorpsComponent) (c : ComplaintText) : Prop





axiom ReadyReserveParticipatedInRoutineTraining (c : ComplaintText) : Prop





axiom ReadyReserveAvailableForInvoluntaryCall (c : ComplaintText) : Prop







axiom ReadinessRequirementsEstablished (c : ComplaintText) : Prop




axiom AnnualReadinessDeterminationMade (p : Person) (c : ComplaintText) : Prop




axiom MemberMeetsReadinessRequirements (p : Person) (c : ComplaintText) : Prop




axiom MemberCompliedWithDeploymentOrders (p : Person) (c : ComplaintText) : Prop





axiom ReadinessRequirementWaived (p : Person) (c : ComplaintText) : Prop




axiom WaiverRegulationsPromulgated (c : ComplaintText) : Prop




axiom CorpsOrganizedIntoRapidDeploymentUnits (c : ComplaintText) : Prop




axiom IsUrgentOrEmergencyPublicHealthCareNeed (c : ComplaintText) : Prop






axiom IsMemberOfRegularCorps (p : Person) (c : ComplaintText) : Prop




axiom HasPublicHealthTrainingOrExperience (p : Person) (c : ComplaintText) : Prop




axiom AppointedSurgeonGeneralWithSenateConsent (p : Person) (c : ComplaintText) : Prop




axiom SurgeonGeneralTermExpiredWithoutReappointment (p : Person) (c : ComplaintText) : Prop





axiom RevertedToFormerGradeOnExpiration (p : Person) (c : ComplaintText) : Prop







axiom DeputySurgeonGeneralAssigned (c : ComplaintText) : Prop




axiom EightAssistantSurgeonsGeneralAssigned (c : ComplaintText) : Prop





axiom ActingSurgeonGeneralDesignated (c : ComplaintText) : Prop




axiom temporaryAssistantSurgeonGeneralPositions (c : ComplaintText) : Nat






axiom activeDutyOfficerCapBase (c : ComplaintText) : Nat






axiom ReadyReserveTitlesCarryReserveSuffix (c : ComplaintText) : Prop




axiom GradeMaximaPrescribedByRegulation (c : ComplaintText) : Prop




axiom PrescribedMaximumExceedsAppropriationLimit (c : ComplaintText) : Prop




axiom MaximaRequireSeparationOrGradeReduction (c : ComplaintText) : Prop






axiom OriginalAppointmentMade (p : Person) (g : Grade) (c : ComplaintText) : Prop



axiom IsGradeAboveJuniorAssistant (g : Grade) (c : ComplaintText) : Prop




axiom PromotionExaminationPassed (p : Person) (c : ComplaintText) : Prop




axiom HasAttainedAgeFortyFour (p : Person) (c : ComplaintText) : Prop






axiom AgeFortyFourExceptionApplies (p : Person) (c : ComplaintText) : Prop




axiom CalledToActiveDutyExceedingOneYear (p : Person) (c : ComplaintText) : Prop




axiom IsFormerRegularCorpsOfficer (p : Person) (c : ComplaintText) : Prop




axiom MeetsReappointmentStandards (p : Person) (c : ComplaintText) : Prop




axiom EmployedAsSpecialConsultantOrFellow (p : Person) (c : ComplaintText) : Prop






axiom OtherActProhibitsAlienEmployment (p : Person) (c : ComplaintText) : Prop




axiom OtherLawSpecificallyProvidesOtherwise (p : Person) (c : ComplaintText) : Prop







axiom IsOsteopathyGraduateFromRecognizedCollege (p : Person) (c : ComplaintText) : Prop







axiom IsOnActiveDutyOrEntitledToRetiredPay (p : Person) (c : ComplaintText) : Prop




axiom councilMemberDailyCompensationRate (c : ComplaintText) : Nat




axiom gs18DailyEquivalentRate (c : ComplaintText) : Nat





axiom positionsEstablishedUnderSection210g (c : ComplaintText) : Nat








axiom LeaveGrantedWithoutPayDeduction (p : Person) (c : ComplaintText) : Prop




axiom accumulatedAnnualLeaveDaysAuthorized (c : ComplaintText) : Nat






axiom ProfessionalCategoriesEstablishedByRegulation (c : ComplaintText) : Prop





axiom OfficerAssignedToProfessionalCategory (p : Person) (c : ComplaintText) : Prop




axiom CategoryAssignmentChanged (p : Person) (c : ComplaintText) : Prop






axiom ReassignmentFindingSupportsChange (p : Person) (c : ComplaintText) : Prop




axiom CategoryGradeMaximaDetermined (c : ComplaintText) : Prop






axiom PermanentPromotionMade (p : Person) (g : Grade) (c : ComplaintText) : Prop




axiom HasOneYearInNextLowerGrade (p : Person) (c : ComplaintText) : Prop




axiom IsRestrictedOrDirectorGrade (g : Grade) (c : ComplaintText) : Prop




axiom TwiceExaminedAndNotPromoted (p : Person) (c : ComplaintText) : Prop





axiom FailureForPhysicalDisability (p : Person) (c : ComplaintText) : Prop




axiom SeparatedFromService (p : Person) (c : ComplaintText) : Prop







axiom CompletedMedicalInternshipAtAppointment (p : Person) (c : ComplaintText) : Prop





axiom SimilarInternshipCreditUnderOtherLaw (p : Person) (c : ComplaintText) : Prop




axiom OneYearPromotionCreditGranted (p : Person) (c : ComplaintText) : Prop






axiom AttainedAgeSixtyFour (p : Person) (c : ComplaintText) : Prop



axiom AppliedForRetirement (p : Person) (c : ComplaintText) : Prop




axiom RetiredOnOrAfterFirstDayOfFollowingMonth (p : Person) (c : ComplaintText) : Prop




axiom InvoluntaryRetirementForAgeImposed (p : Person) (c : ComplaintText) : Prop






axiom RetirementAuthorityRestsOnOtherProvision (p : Person) (c : ComplaintText) : Prop





axiom retiredPayPercentOfBasicPay (p : Person) (c : ComplaintText) : Nat







axiom PerformedQualifyingActiveService (p : Person) (c : ComplaintText) : Prop





axiom BenefitClaimedIsRetiredPayOrUniformAllowance (p : Person) (c : ComplaintText) : Prop






axiom IsOfficerOrSurvivingBeneficiary (p : Person) (c : ComplaintText) : Prop





axiom OrderedToActiveDutyForTrainingOverThirtyDays (p : Person) (c : ComplaintText) : Prop






axiom Title10AuthorityExercisedByHhsSecretary (c : ComplaintText) : Prop






axiom ReleasedFromActiveServiceForRetirement (p : Person) (c : ComplaintText) : Prop




axiom UnitedStatesFlagPresented (p : Person) (c : ComplaintText) : Prop





axiom PreviouslyPresentedRetirementFlag (p : Person) (c : ComplaintText) : Prop




axiom FlagPresentedAtCostToRecipient (p : Person) (c : ComplaintText) : Prop






axiom ExecutiveDepartmentHeadRequestedDetail (c : ComplaintText) : Prop




axiom IsDetailedUnderSection215 (p : Person) (c : ComplaintText) : Prop




axiom DetailedPersonnelPaidFromServiceAppropriations (p : Person) (c : ComplaintText) : Prop





axiom PlacedOnLeaveWithoutPayAndPaidByHost (p : Person) (c : ComplaintText) : Prop






axiom DeployedByOtherThanSecretary (p : Person) (c : ComplaintText) : Prop





axiom DeploymentAuthorityExclusionApplies (p : Person) (c : ComplaintText) : Prop





axiom IsTimeOfWar (c : ComplaintText) : Prop





axiom CommissionedCorpsDeclaredMilitaryService (c : ComplaintText) : Prop





axiom CorpsSubjectToUniformCodeOfMilitaryJustice (c : ComplaintText) : Prop






axiom AdvisoryBodyAppointedBySecretary (ab : AdvisoryBody) (c : ComplaintText) : Prop




axiom IsMemberOfAdvisoryBody (p : Person) (ab : AdvisoryBody) (c : ComplaintText) : Prop





axiom IsRegularFullTimeFederalEmployee (p : Person) (c : ComplaintText) : Prop





axiom AdvisoryMemberCompensatedUnderSection210c (p : Person) (c : ComplaintText) : Prop








axiom IsAppointmentToCoveredAdvisoryCommittee (p : Person) (c : ComplaintText) : Prop



















axiom s209h_alien_employment_prohibition_disapplied
    (p : Person) (c : ComplaintText) :
    EmployedAsSpecialConsultantOrFellow p c →
    ¬ OtherLawSpecificallyProvidesOtherwise p c →
    ¬ OtherActProhibitsAlienEmployment p c












axiom s212a1_involuntary_age_retirement_not_authorized
    (p : Person) (c : ComplaintText) :
    InvoluntaryRetirementForAgeImposed p c →
    ¬ RetirementAuthorityRestsOnOtherProvision p c →
    ¬ AppliedForRetirement p c

end Proving.USC.T42.Ch6ASchI.Reearn.Deontic
