














import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch6ASchI.Reearn.Deontic.Types
import Proving.USC.T42.Ch6ASchI.Reearn.Deontic.Predicates
import Proving.USC.T42.Ch6ASchI.Reearn.Deontic.Statute

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reearn.Deontic

open Proving.USC.Common



theorem prohibition201Violated_intro {pm : Payment} {c : ComplaintText}
    (hDescribed : PaymentIsHemophiliaSettlementPayment pm c)
    (hContext : DeterminingMedicaidOrSsiEligibility pm c)
    (hAct : PaymentCountedAsIncomeOrResource pm c) :
    Prohibition201Violated pm c :=
  ⟨⟨hDescribed, hContext⟩, hAct⟩



theorem obligation203AssignmentBreached_intro {c : ComplaintText}
    (hNoAssignment : ¬ SecretaryAssignedServiceFunctions c) :
    Obligation203AssignmentBreached c :=
  hNoAssignment

theorem prohibition203DivisionChangeViolated_intro {c : ComplaintText}
    (hAct : DivisionEstablishedAbolishedOrTransferred c)
    (hNoApproval : ¬ SecretaryApprovedDivisionChange c) :
    Prohibition203DivisionChangeViolated c :=
  ⟨⟨hAct⟩, hNoApproval⟩



theorem secretaryApproval_precludes_divisionViolation {c : ComplaintText}
    (hApproved : SecretaryApprovedDivisionChange c) :
    ¬ Prohibition203DivisionChangeViolated c :=
  fun h => h.2 hApproved



theorem obligation204a2CitizenshipBreached_intro {p : Person} {cc : CorpsComponent}
    {c : ComplaintText}
    (hAddressee : IsAppointedCommissionedOfficer p cc c)
    (hNotCitizen : ¬ IsCitizenOfUnitedStates p c) :
    Obligation204a2CitizenshipBreached p cc c :=
  ⟨⟨hAddressee⟩, hNotCitizen⟩

theorem obligation204c2ReadyReserveBreached_intro {cc : CorpsComponent}
    {c : ComplaintText}
    (hAddressee : IsReadyReserveCorps cc c)
    (hFailure : ¬ ReadyReserveParticipatedInRoutineTraining c ∨
                ¬ ReadyReserveAvailableForInvoluntaryCall c) :
    Obligation204c2ReadyReserveBreached cc c :=
  ⟨⟨hAddressee⟩, hFailure⟩



theorem obligation204aA1Breached_intro {c : ComplaintText}
    (h : ¬ ReadinessRequirementsEstablished c) : Obligation204aA1Breached c := h

theorem obligation204aA2Breached_intro {p : Person} {c : ComplaintText}
    (h : ¬ AnnualReadinessDeterminationMade p c) :
    Obligation204aA2Breached p c := h

theorem obligation204aA3Breached_intro {p : Person} {c : ComplaintText}
    (hRequirements : ReadinessRequirementsEstablished c)
    (hFailure : ¬ MemberMeetsReadinessRequirements p c ∨
                ¬ MemberCompliedWithDeploymentOrders p c)
    (hNoWaiver : ¬ ReadinessRequirementWaived p c) :
    Obligation204aA3Breached p c :=
  ⟨⟨hRequirements⟩, hFailure, hNoWaiver⟩





theorem readinessWaiver_precludes_breach {p : Person} {c : ComplaintText}
    (hWaived : ReadinessRequirementWaived p c) :
    ¬ Obligation204aA3Breached p c :=
  fun h => h.2.2 hWaived

theorem power204aA4Waiver_intro {p : Person} {c : ComplaintText}
    (hWaived : ReadinessRequirementWaived p c)
    (hRegs : WaiverRegulationsPromulgated c) : Power204aA4Waiver p c :=
  ⟨hWaived, hRegs⟩

theorem obligation204aA4BBreached_intro {c : ComplaintText}
    (h : ¬ WaiverRegulationsPromulgated c) : Obligation204aA4BBreached c := h

theorem obligation204aB1Breached_intro {c : ComplaintText}
    (h : ¬ CorpsOrganizedIntoRapidDeploymentUnits c) :
    Obligation204aB1Breached c := h



theorem obligation205QualificationsBreached_intro {p : Person} {c : ComplaintText}
    (hAppointed : AppointedSurgeonGeneralWithSenateConsent p c)
    (hDefect : ¬ IsMemberOfRegularCorps p c ∨
               ¬ HasPublicHealthTrainingOrExperience p c) :
    Obligation205QualificationsBreached p c :=
  ⟨⟨hAppointed⟩, hDefect⟩

theorem obligation205ReversionBreached_intro {p : Person} {c : ComplaintText}
    (hExpired : SurgeonGeneralTermExpiredWithoutReappointment p c)
    (hNoReversion : ¬ RevertedToFormerGradeOnExpiration p c) :
    Obligation205ReversionBreached p c :=
  ⟨hExpired, hNoReversion⟩



theorem obligation206aDeputyBreached_intro {c : ComplaintText}
    (h : ¬ DeputySurgeonGeneralAssigned c) : Obligation206aDeputyBreached c := h

theorem obligation206bAssistantsBreached_intro {c : ComplaintText}
    (h : ¬ EightAssistantSurgeonsGeneralAssigned c) :
    Obligation206bAssistantsBreached c := h

theorem obligation206dActingBreached_intro {c : ComplaintText}
    (h : ¬ ActingSurgeonGeneralDesignated c) : Obligation206dActingBreached c := h

theorem prohibition206c2CapViolated_intro {c : ComplaintText}
    (h : 100 * temporaryAssistantSurgeonGeneralPositions c >
         activeDutyOfficerCapBase c) :
    Prohibition206c2CapViolated c := h



theorem obligation207bSuffixBreached_intro {c : ComplaintText}
    (h : ¬ ReadyReserveTitlesCarryReserveSuffix c) :
    Obligation207bSuffixBreached c := h

theorem obligation207dMaximaBreached_intro {c : ComplaintText}
    (h : ¬ GradeMaximaPrescribedByRegulation c) :
    Obligation207dMaximaBreached c := h

theorem prohibition207dAppropriationLimitViolated_intro {c : ComplaintText}
    (h : PrescribedMaximumExceedsAppropriationLimit c) :
    Prohibition207dAppropriationLimitViolated c := h

theorem prohibition207dNoForcedSeparationViolated_intro {c : ComplaintText}
    (h : MaximaRequireSeparationOrGradeReduction c) :
    Prohibition207dNoForcedSeparationViolated c := h



theorem prohibition209a1ExaminationViolated_intro {p : Person} {g : Grade}
    {c : ComplaintText}
    (hAct : OriginalAppointmentMade p g c)
    (hAbove : IsGradeAboveJuniorAssistant g c)
    (hNoExam : ¬ PromotionExaminationPassed p c) :
    Prohibition209a1ExaminationViolated p g c :=
  ⟨⟨hAct, hAbove⟩, hNoExam⟩

theorem prohibition209a3AgeFortyFourViolated_intro {p : Person} {g : Grade}
    {c : ComplaintText}
    (hAge : HasAttainedAgeFortyFour p c)
    (hAct : OriginalAppointmentMade p g c ∨ CalledToActiveDutyExceedingOneYear p c)
    (hNoException : ¬ AgeFortyFourExceptionApplies p c) :
    Prohibition209a3AgeFortyFourViolated p g c :=
  ⟨⟨hAge⟩, hAct, hNoException⟩



theorem ageFortyFourException_precludes_violation {p : Person} {g : Grade}
    {c : ComplaintText} (hException : AgeFortyFourExceptionApplies p c) :
    ¬ Prohibition209a3AgeFortyFourViolated p g c :=
  fun h => h.2.2 hException

theorem permission209e1Reappointment_intro {p : Person} {c : ComplaintText}
    (hFormer : IsFormerRegularCorpsOfficer p c)
    (hTimely : FiledWithinStatutoryPeriod p c)
    (hStandards : MeetsReappointmentStandards p c) :
    Permission209e1Reappointment p c :=
  ⟨hFormer, hTimely, hStandards⟩

theorem permission209fgAlienEmployment_intro {p : Person} {c : ComplaintText}
    (hEmployed : EmployedAsSpecialConsultantOrFellow p c)
    (hNoBar : ¬ OtherActProhibitsAlienEmployment p c) :
    Permission209fgAlienEmployment p c :=
  ⟨hEmployed, hNoBar⟩




theorem s209h_permission_holds_absent_contrary_law {p : Person} {c : ComplaintText}
    (hEmployed : EmployedAsSpecialConsultantOrFellow p c)
    (hNoContrary : ¬ OtherLawSpecificallyProvidesOtherwise p c) :
    Permission209fgAlienEmployment p c :=
  ⟨hEmployed, s209h_alien_employment_prohibition_disapplied p c hEmployed hNoContrary⟩




theorem otherActBar_reachable_under_escape {p : Person} {c : ComplaintText}
    (_hEscape : OtherLawSpecificallyProvidesOtherwise p c)
    (hBar : OtherActProhibitsAlienEmployment p c) :
    ¬ Permission209fgAlienEmployment p c :=
  fun h => h.2 hBar



theorem permission209dOsteopath_intro {p : Person} {c : ComplaintText}
    (h : IsOsteopathyGraduateFromRecognizedCollege p c) :
    Permission209dOsteopath p c := h



theorem permission210bPurchase_intro {p : Person} {c : ComplaintText}
    (h : IsOnActiveDutyOrEntitledToRetiredPay p c) :
    Permission210bPurchase p c := h

theorem prohibition210cRateCapViolated_intro {c : ComplaintText}
    (h : councilMemberDailyCompensationRate c > gs18DailyEquivalentRate c) :
    Prohibition210cRateCapViolated c := h

theorem prohibition210gPositionCapViolated_intro {c : ComplaintText}
    (h : positionsEstablishedUnderSection210g c > 179) :
    Prohibition210gPositionCapViolated c := h



theorem permission210_1aLeave_intro {p : Person} {r : Regulation} {c : ComplaintText}
    (hRegs : TakenInAccordanceWithRegulations r c)
    (hGranted : LeaveGrantedWithoutPayDeduction p c) :
    Permission210_1aLeave p r c :=
  ⟨hRegs, hGranted⟩

theorem prohibition210_1bLeaveCapViolated_intro {c : ComplaintText}
    (h : accumulatedAnnualLeaveDaysAuthorized c > 120) :
    Prohibition210_1bLeaveCapViolated c := h



theorem obligation210bACategoriesBreached_intro {c : ComplaintText}
    (h : ¬ ProfessionalCategoriesEstablishedByRegulation c) :
    Obligation210bACategoriesBreached c := h

theorem obligation210bBAssignmentBreached_intro {p : Person} {c : ComplaintText}
    (hEstablished : ProfessionalCategoriesEstablishedByRegulation c)
    (hUnassigned : ¬ OfficerAssignedToProfessionalCategory p c) :
    Obligation210bBAssignmentBreached p c :=
  ⟨hEstablished, hUnassigned⟩

theorem prohibition210bBReassignmentViolated_intro {p : Person} {c : ComplaintText}
    (hAct : CategoryAssignmentChanged p c)
    (hNoFinding : ¬ ReassignmentFindingSupportsChange p c) :
    Prohibition210bBReassignmentViolated p c :=
  ⟨⟨hAct⟩, hNoFinding⟩


theorem reassignmentFinding_precludes_violation {p : Person} {c : ComplaintText}
    (hFinding : ReassignmentFindingSupportsChange p c) :
    ¬ Prohibition210bBReassignmentViolated p c :=
  fun h => h.2 hFinding

theorem obligation210bCMaximaBreached_intro {c : ComplaintText}
    (h : ¬ CategoryGradeMaximaDetermined c) :
    Obligation210bCMaximaBreached c := h



theorem prohibition211aUnexaminedPromotionViolated_intro {p : Person} {g : Grade}
    {c : ComplaintText}
    (hAct : PermanentPromotionMade p g c)
    (hNoExam : ¬ PromotionExaminationPassed p c) :
    Prohibition211aUnexaminedPromotionViolated p g c :=
  ⟨⟨hAct⟩, hNoExam⟩

theorem prohibition211eRestrictedGradeViolated_intro {p : Person} {g : Grade}
    {c : ComplaintText}
    (hAct : PermanentPromotionMade p g c)
    (hRestricted : IsRestrictedOrDirectorGrade g c)
    (hNoYear : ¬ HasOneYearInNextLowerGrade p c) :
    Prohibition211eRestrictedGradeViolated p g c :=
  ⟨⟨hAct, hRestricted⟩, hNoYear⟩

theorem obligation211gSeparationBreached_intro {p : Person} {c : ComplaintText}
    (hTwice : TwiceExaminedAndNotPromoted p c)
    (hNotDisability : ¬ FailureForPhysicalDisability p c)
    (hNotSeparated : ¬ SeparatedFromService p c) :
    Obligation211gSeparationBreached p c :=
  ⟨⟨hTwice⟩, hNotDisability, hNotSeparated⟩


theorem physicalDisability_precludes_separationBreach {p : Person} {c : ComplaintText}
    (hDisability : FailureForPhysicalDisability p c) :
    ¬ Obligation211gSeparationBreached p c :=
  fun h => h.2.1 hDisability



theorem obligation211cCreditBreached_intro {p : Person} {c : ComplaintText}
    (hInternship : CompletedMedicalInternshipAtAppointment p c)
    (hNoOtherCredit : ¬ SimilarInternshipCreditUnderOtherLaw p c)
    (hNoCredit : ¬ OneYearPromotionCreditGranted p c) :
    Obligation211cCreditBreached p c :=
  ⟨⟨hInternship⟩, hNoOtherCredit, hNoCredit⟩


theorem otherLawCredit_precludes_creditBreach {p : Person} {c : ComplaintText}
    (hOther : SimilarInternshipCreditUnderOtherLaw p c) :
    ¬ Obligation211cCreditBreached p c :=
  fun h => h.2.1 hOther



theorem permission212a1Retirement_intro {p : Person} {c : ComplaintText}
    (hAge : AttainedAgeSixtyFour p c) (hApplied : AppliedForRetirement p c) :
    Permission212a1Retirement p c :=
  ⟨hAge, hApplied⟩

theorem obligation212a1RetireBreached_intro {p : Person} {c : ComplaintText}
    (hAge : AttainedAgeSixtyFour p c) (hApplied : AppliedForRetirement p c)
    (hNotRetired : ¬ RetiredOnOrAfterFirstDayOfFollowingMonth p c) :
    Obligation212a1RetireBreached p c :=
  ⟨⟨hAge, hApplied⟩, hNotRetired⟩





theorem s212a1_involuntary_precludes_permission {p : Person} {c : ComplaintText}
    (hInvoluntary : InvoluntaryRetirementForAgeImposed p c)
    (hNoOtherSource : ¬ RetirementAuthorityRestsOnOtherProvision p c) :
    ¬ Permission212a1Retirement p c :=
  fun h => s212a1_involuntary_age_retirement_not_authorized p c hInvoluntary
    hNoOtherSource h.2




theorem permission212a1_reachable_under_escape {p : Person} {c : ComplaintText}
    (_hEscape : RetirementAuthorityRestsOnOtherProvision p c)
    (hAge : AttainedAgeSixtyFour p c) (hApplied : AppliedForRetirement p c) :
    Permission212a1Retirement p c :=
  ⟨hAge, hApplied⟩

theorem prohibition212a4dPayCapViolated_intro {p : Person} {c : ComplaintText}
    (h : retiredPayPercentOfBasicPay p c > 75) :
    Prohibition212a4dPayCapViolated p c := h



theorem permission213aMilitaryBenefits_intro {p : Person} {c : ComplaintText}
    (hService : PerformedQualifyingActiveService p c)
    (hNotExcepted : ¬ BenefitClaimedIsRetiredPayOrUniformAllowance p c) :
    Permission213aMilitaryBenefits p c :=
  ⟨hService, hNotExcepted⟩



theorem retiredPayOrUniform_precludes_benefit {p : Person} {c : ComplaintText}
    (hExcepted : BenefitClaimedIsRetiredPayOrUniformAllowance p c) :
    ¬ Permission213aMilitaryBenefits p c :=
  fun h => h.2 hExcepted



theorem permission213aTitle10Rights_intro {p : Person} {c : ComplaintText}
    (hOfficer : IsOfficerOrSurvivingBeneficiary p c)
    (hNotTraining : ¬ OrderedToActiveDutyForTrainingOverThirtyDays p c) :
    Permission213aTitle10Rights p c :=
  ⟨hOfficer, hNotTraining⟩

theorem obligation213aBAuthorityBreached_intro {c : ComplaintText}
    (h : ¬ Title10AuthorityExercisedByHhsSecretary c) :
    Obligation213aBAuthorityBreached c := h



theorem obligation214aFlagBreached_intro {p : Person} {c : ComplaintText}
    (hReleased : ReleasedFromActiveServiceForRetirement p c)
    (hNotPrevious : ¬ PreviouslyPresentedRetirementFlag p c)
    (hNotPresented : ¬ UnitedStatesFlagPresented p c) :
    Obligation214aFlagBreached p c :=
  ⟨⟨hReleased⟩, hNotPrevious, hNotPresented⟩


theorem previousFlag_precludes_flagBreach {p : Person} {c : ComplaintText}
    (hPrevious : PreviouslyPresentedRetirementFlag p c) :
    ¬ Obligation214aFlagBreached p c :=
  fun h => h.2.1 hPrevious

theorem prohibition214cNoCostViolated_intro {p : Person} {c : ComplaintText}
    (h : FlagPresentedAtCostToRecipient p c) :
    Prohibition214cNoCostViolated p c := h



theorem power215aDetail_intro {c : ComplaintText}
    (h : ExecutiveDepartmentHeadRequestedDetail c) : Power215aDetail c := h

theorem obligation215dPayBreached_intro {p : Person} {c : ComplaintText}
    (hDetailed : IsDetailedUnderSection215 p c)
    (hNotHostPaid : ¬ PlacedOnLeaveWithoutPayAndPaidByHost p c)
    (hNotServicePaid : ¬ DetailedPersonnelPaidFromServiceAppropriations p c) :
    Obligation215dPayBreached p c :=
  ⟨⟨hDetailed⟩, hNotHostPaid, hNotServicePaid⟩


theorem hostPay_precludes_detailPayBreach {p : Person} {c : ComplaintText}
    (hHostPaid : PlacedOnLeaveWithoutPayAndPaidByHost p c) :
    ¬ Obligation215dPayBreached p c :=
  fun h => h.2.1 hHostPaid

theorem prohibition215eSoleAuthorityViolated_intro {p : Person} {c : ComplaintText}
    (hAct : DeployedByOtherThanSecretary p c)
    (hNeed : IsUrgentOrEmergencyPublicHealthCareNeed c)
    (hNoExclusion : ¬ DeploymentAuthorityExclusionApplies p c) :
    Prohibition215eSoleAuthorityViolated p c :=
  ⟨⟨hAct, hNeed⟩, hNoExclusion⟩



theorem deploymentExclusion_precludes_violation {p : Person} {c : ComplaintText}
    (hExclusion : DeploymentAuthorityExclusionApplies p c) :
    ¬ Prohibition215eSoleAuthorityViolated p c :=
  fun h => h.2 hExclusion



theorem power217Declaration_intro {c : ComplaintText}
    (hTrigger : IsTimeOfWar c ∨ PresidentialEmergencyProclaimed c)
    (hDeclared : CommissionedCorpsDeclaredMilitaryService c) :
    Power217Declaration c :=
  ⟨hTrigger, hDeclared⟩

theorem obligation217UcmjBreached_intro {c : ComplaintText}
    (hDeclaration : Power217Declaration c)
    (hNotSubject : ¬ CorpsSubjectToUniformCodeOfMilitaryJustice c) :
    Obligation217UcmjBreached c :=
  ⟨hDeclaration, hNotSubject⟩



theorem power217aAppointment_intro {ab : AdvisoryBody} {c : ComplaintText}
    (h : AdvisoryBodyAppointedBySecretary ab c) : Power217aAppointment ab c := h

theorem obligation217aBCompensationBreached_intro {p : Person} {ab : AdvisoryBody}
    {c : ComplaintText}
    (hAppointed : AdvisoryBodyAppointedBySecretary ab c)
    (hMember : IsMemberOfAdvisoryBody p ab c)
    (hNotEmployee : ¬ IsRegularFullTimeFederalEmployee p c)
    (hNotPaid : ¬ AdvisoryMemberCompensatedUnderSection210c p c) :
    Obligation217aBCompensationBreached p ab c :=
  ⟨⟨hAppointed, hMember⟩, hNotEmployee, hNotPaid⟩


theorem fullTimeEmployee_precludes_compensationBreach {p : Person}
    {ab : AdvisoryBody} {c : ComplaintText}
    (hEmployee : IsRegularFullTimeFederalEmployee p c) :
    ¬ Obligation217aBCompensationBreached p ab c :=
  fun h => h.2.1 hEmployee



theorem prohibition217a1PoliticalAffiliationViolated_intro {p : Person}
    {c : ComplaintText}
    (hCovered : IsAppointmentToCoveredAdvisoryCommittee p c)
    (hConsidered : PoliticalAffiliationConsidered p c) :
    Prohibition217a1PoliticalAffiliationViolated p c :=
  ⟨⟨hCovered⟩, hConsidered⟩



theorem ch6ASchIDeonticTransgression_intro_politicalAffiliation {p : Person}
    {c : ComplaintText} (h : Prohibition217a1PoliticalAffiliationViolated p c) :
    Ch6ASchIDeonticTransgression p c :=
  .politicalAffiliation h

theorem ch6ASchIDeonticTransgression_intro_readinessBreach {p : Person}
    {c : ComplaintText} (h : Obligation204aA3Breached p c) :
    Ch6ASchIDeonticTransgression p c :=
  .readinessBreach h

theorem ch6ASchIDeonticTransgression_intro_ageFortyFour {p : Person} {g : Grade}
    {c : ComplaintText} (h : Prohibition209a3AgeFortyFourViolated p g c) :
    Ch6ASchIDeonticTransgression p c :=
  .ageFortyFour g h

theorem ch6ASchIDeonticTransgression_intro_flagNotPresented {p : Person}
    {c : ComplaintText} (h : Obligation214aFlagBreached p c) :
    Ch6ASchIDeonticTransgression p c :=
  .flagNotPresented h

theorem ch6ASchIDeonticTransgression_intro_deploymentAuthority {p : Person}
    {c : ComplaintText} (h : Prohibition215eSoleAuthorityViolated p c) :
    Ch6ASchIDeonticTransgression p c :=
  .deploymentAuthority h

end Proving.USC.T42.Ch6ASchI.Reearn.Deontic
