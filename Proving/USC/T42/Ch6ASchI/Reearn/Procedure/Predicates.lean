







import Proving.USC.Common.Types
import Proving.USC.T42.Ch6ASchI.Reearn.Procedure.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reearn.Procedure

open Proving.USC.Common








axiom ReleaseEnteredInLieuOfClassSettlement (r : SettlementRelease) (c : ComplaintText) : Prop




axiom ReleaseSignedByAllAffectedParties (r : SettlementRelease) (c : ComplaintText) : Prop




axiom releaseFirstSentDay (r : SettlementRelease) : Nat




axiom releaseAllPartiesSignedDay (r : SettlementRelease) : Nat




axiom statutoryFloorDayDecemberThirtyFirstNineteenNinetySeven : Nat








axiom OrganizationalUnitChangeProposed (u : OrganizationalChange) (c : ComplaintText) : Prop





axiom SecretaryApprovedOrganizationalUnitChange (u : OrganizationalChange) (c : ComplaintText) : Prop




axiom DelegationExcludesRulemaking (p : Person) (c : ComplaintText) : Prop







axiom AppointedByPresident (n : Nominee) (c : ComplaintText) : Prop



axiom IsUnitedStatesCitizen (n : Nominee) (c : ComplaintText) : Prop




axiom CalledToActiveDutyBySurgeonGeneral (o : CorpsOfficer) (c : ComplaintText) : Prop








axiom ReadinessRequirementsEstablishedBySecretary (k : ReadinessCycle) (c : ComplaintText) : Prop




axiom AnnualReadinessDeterminationMade (o : CorpsOfficer) (k : ReadinessCycle) (c : ComplaintText) : Prop




axiom MeetsReadinessRequirements (o : CorpsOfficer) (k : ReadinessCycle) (c : ComplaintText) : Prop




axiom FailedToComplyWithDeploymentOrder (o : CorpsOfficer) (c : ComplaintText) : Prop






axiom ReadinessRequirementWaiverGranted (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom WaiverRegulationsPromulgated (c : ComplaintText) : Prop




axiom DisciplinaryProceduresEstablishedBySecretary (c : ComplaintText) : Prop




axiom UrgentOrEmergencyPublicHealthCareNeedExists (c : ComplaintText) : Prop




axiom daysSincePriorReadinessDetermination (o : CorpsOfficer) : Nat




axiom RapidDeploymentUnitsOrganized (c : ComplaintText) : Prop







axiom SurgeonGeneralNominatedByPresident (n : Nominee) (c : ComplaintText) : Prop



axiom SenateAdviceAndConsentGiven (n : Nominee) (c : ComplaintText) : Prop



axiom AppointedFromRegularCorps (n : Nominee) (c : ComplaintText) : Prop




axiom HasSpecializedPublicHealthTrainingOrExperience (n : Nominee) (c : ComplaintText) : Prop



axiom SurgeonGeneralReappointed (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom RevertedToPriorGradeAndNumber (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom daysSinceSurgeonGeneralAppointment (o : CorpsOfficer) : Nat








axiom DeputySurgeonGeneralAssigned (o : CorpsOfficer) (c : ComplaintText) : Prop





axiom ActingSurgeonGeneralDesignated (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom SpecialTemporaryPositionCreatedWithSecretaryApproval (t : PositionRoster) (c : ComplaintText) : Prop




axiom specialTemporaryPositionCount (t : PositionRoster) : Nat





axiom highestActiveDutyOfficerCountInPrecedingNinetyDays (t : PositionRoster) : Nat




axiom daysSinceOnePerCentumExceedance (t : PositionRoster) : Nat




axiom TemporaryPositionReducedOnlyByAttrition (t : PositionRoster) (c : ComplaintText) : Prop








axiom AppropriationActFixingAuthorizedStrengthEnacted (a : AppropriationAct) (c : ComplaintText) : Prop




axiom GradeMaximaRegulationsPrescribed (a : AppropriationAct) (c : ComplaintText) : Prop




axiom assistantSurgeonGeneralPositionCount (t : PositionRoster) : Nat




axiom assistantSurgeonGeneralAboveBrigadierGeneralCount (t : PositionRoster) : Nat







axiom OriginalAppointmentToRegularCorps (n : Nominee) (c : ComplaintText) : Prop




axiom OriginalAppointmentToReadyReserveCorps (n : Nominee) (c : ComplaintText) : Prop




axiom AppointmentExaminationPassed (n : Nominee) (c : ComplaintText) : Prop




axiom ExaminationGivenUnderPresidentialRegulations (e : ExaminationRecord) (c : ComplaintText) : Prop




axiom ageAtAppointmentYears (n : Nominee) : Nat




axiom yearsOfActiveServiceAtAppointment (n : Nominee) : Nat




axiom SurgeonGeneralFoundExceptionalQualifications (n : Nominee) (c : ComplaintText) : Prop




axiom CommissionedCorpsDeclaredMilitaryService (d : EmergencyDeclaration) (c : ComplaintText) : Prop




axiom originalAppointmentsAuthorizedForFiscalYear (y : AppointmentCycle) : Nat




axiom originalAppointmentsAboveSeniorAssistantGrade (y : AppointmentCycle) : Nat




axiom NominationTransmittedToSenateInFiscalYear (n : Nominee) (y : AppointmentCycle) (c : ComplaintText) : Prop




axiom CommissionIssuedBySecretaryUnderDepartmentSeal (n : Nominee) (c : ComplaintText) : Prop




axiom FormerOfficerReappointmentApplicationFiled (n : Nominee) (c : ComplaintText) : Prop




axiom daysFromPriorCommissionTerminationToReappointmentApplication (n : Nominee) : Nat




axiom MeetsSecretaryPrescribedReappointmentStandards (n : Nominee) (c : ComplaintText) : Prop





axiom EligibleOsteopathyGraduate (n : Nominee) (c : ComplaintText) : Prop




axiom AppointedWithoutRegardToPoliticalAffiliation (n : Nominee) (c : ComplaintText) : Prop




axiom OfficeOfPersonnelManagementApprovedQualifications (n : Nominee) (c : ComplaintText) : Prop








axiom LeaveGrantedUnderPresidentialRegulations (l : LeaveAccount) (c : ComplaintText) : Prop




axiom accumulatedAnnualLeaveDays (l : LeaveAccount) : Nat




axiom ProfessionalCategoryAssignmentMade (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom CategoryAssignmentFoundErroneous (o : CorpsOfficer) (c : ComplaintText) : Prop





axiom EquallyQualifiedForRequestedCategoryTransfer (o : CorpsOfficer) (c : ComplaintText) : Prop







axiom PermanentPromotionMadeByPresident (m : PromotionAction) (c : ComplaintText) : Prop



axiom PromotionToNextHigherGrade (m : PromotionAction) (c : ComplaintText) : Prop



axiom PromotionExaminationPassed (m : PromotionAction) (c : ComplaintText) : Prop




axiom GradeIsRestricted (m : PromotionAction) (c : ComplaintText) : Prop



axiom VacancyExistsInGrade (m : PromotionAction) (c : ComplaintText) : Prop



axiom officersExaminedForPromotion (e : ExaminationRecord) : Nat




axiom officersRecommendedForPromotion (e : ExaminationRecord) : Nat




axiom PromotionExaminationIsCompetitive (e : ExaminationRecord) (c : ComplaintText) : Prop





axiom ExaminationForLengthOfServiceOrUnrestrictedVacancy (e : ExaminationRecord) (c : ComplaintText) : Prop




axiom yearsOfServiceAboveJuniorAssistantGrade (o : CorpsOfficer) : Nat



axiom HoldsAssistantGrade (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom HoldsSeniorAssistantGrade (o : CorpsOfficer) (c : ComplaintText) : Prop



axiom HoldsFullGrade (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom yearsInNextLowerGrade (o : CorpsOfficer) : Nat




axiom timesExaminedForPromotion (o : CorpsOfficer) : Nat




axiom FailedToBePromoted (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom RefusedToTakePromotionExamination (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom yearsSinceOriginalAppointment (o : CorpsOfficer) : Nat




axiom ThreeYearRecordReviewConducted (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom FoundNotQualifiedForFurtherService (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom SeparationPayTendered (s : SeparationAction) (c : ComplaintText) : Prop




axiom PromotionExpresslyDeclined (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom CompletedMedicalInternshipOnAppointmentDate (o : CorpsOfficer) (c : ComplaintText) : Prop





axiom SimilarInternshipCreditReceivedUnderOtherLaw (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom ContinuousServiceSinceAppointment (o : CorpsOfficer) (c : ComplaintText) : Prop







axiom RetirementApplicationFiled (r : RetirementAction) (c : ComplaintText) : Prop




axiom RetirementOrderedBySecretary (r : RetirementAction) (c : ComplaintText) : Prop




axiom RetirementEffectiveFirstDayOfMonth (r : RetirementAction) (c : ComplaintText) : Prop



axiom ageYearsAtRetirement (o : CorpsOfficer) : Nat




axiom yearsOfActiveService (o : CorpsOfficer) : Nat




axiom yearsOfActiveCommissionedService (o : CorpsOfficer) : Nat




axiom yearsInSurgeonGeneralOrAssistantSurgeonGeneralService (o : CorpsOfficer) : Nat



axiom PresidentialApprovalOfVoluntaryRetirement (r : RetirementAction) (c : ComplaintText) : Prop




axiom RecalledToActiveDutyWithConsent (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom RetiredForFailureOfPromotionToSeniorGrade (o : CorpsOfficer) (c : ComplaintText) : Prop



axiom ServedInTimeOfWar (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom DetailedForDutyWithArmedForces (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom ServicePartOfMilitaryForcesByExecutiveOrder (d : EmergencyDeclaration) (c : ComplaintText) : Prop





axiom SecretaryOrDesigneeExercisedTitleTenAuthority (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom ReleasedFromActiveCommissionedServiceForRetirement (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom FlagPreviouslyPresented (o : CorpsOfficer) (c : ComplaintText) : Prop




axiom FlagPresentedBySecretary (f : FlagPresentation) (c : ComplaintText) : Prop



axiom FlagPresentedAtNoCostToRecipient (f : FlagPresentation) (c : ComplaintText) : Prop







axiom DetailRequestedByExecutiveDepartmentHead (d : DetailAssignment) (c : ComplaintText) : Prop




axiom DetailRequestedByStateHealthAuthority (d : DetailAssignment) (c : ComplaintText) : Prop




axiom DetailTermsAgreedBySecretaryAndRequester (d : DetailAssignment) (c : ComplaintText) : Prop




axiom DetaileeSubjectToLawsOfReceivingService (d : DetailAssignment) (c : ComplaintText) : Prop




axiom ReimbursementAgreementExecuted (d : DetailAssignment) (c : ComplaintText) : Prop





axiom SecretaryExercisedSoleDeploymentAuthority (d : DetailAssignment) (c : ComplaintText) : Prop





axiom DeploymentAuthorityExceptionApplies (d : DetailAssignment) (c : ComplaintText) : Prop




axiom WarOrProclaimedEmergencyInEffect (d : EmergencyDeclaration) (c : ComplaintText) : Prop




axiom ExecutiveOrderDeclaringMilitaryServiceIssued (d : EmergencyDeclaration) (c : ComplaintText) : Prop




axiom WithinPeriodPrescribedByPresident (d : EmergencyDeclaration) (c : ComplaintText) : Prop




axiom SubjectToUniformCodeOfMilitaryJustice (o : CorpsOfficer) (d : EmergencyDeclaration) (c : ComplaintText) : Prop



axiom AdvisoryCouncilAppointedBySecretary (b : AdvisoryBody) (c : ComplaintText) : Prop




axiom AdvisoryCouncilPeriodCommencementDateSpecified (b : AdvisoryBody) (c : ComplaintText) : Prop




axiom AdvisoryFunctionsDelegated (b : AdvisoryBody) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Reearn.Procedure
