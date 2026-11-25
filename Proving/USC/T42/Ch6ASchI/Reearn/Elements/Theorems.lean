







import Proving.USC.T42.Ch6ASchI.Reearn.Elements.Types
import Proving.USC.T42.Ch6ASchI.Reearn.Elements.Predicates
import Proving.USC.T42.Ch6ASchI.Reearn.Elements.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reearn.Elements

open Proving.USC.Common



theorem releaseTimelySigned_intro_byCalendarDeadline {pay : Payment} {c : ComplaintText}
    (h : ReleaseSignedOnOrBeforeDecember31_1997 pay c) : ReleaseTimelySigned pay c :=
  .byCalendarDeadline h

theorem releaseTimelySigned_intro_within270Days {pay : Payment} {c : ComplaintText}
    (h : ReleaseSignedWithin270Days pay c) : ReleaseTimelySigned pay c :=
  .within270Days h

theorem releaseInLieuPayment_intro {pay : Payment} {c : ComplaintText}
    (hInLieu : PaymentUnderReleaseInLieuOfClassSettlement pay c)
    (hParties : ReleaseSignedByAllAffectedParties pay c)
    (hTimely : ReleaseTimelySigned pay c) : ReleaseInLieuPayment pay c :=
  ⟨hInLieu, hParties, hTimely⟩

theorem subsectionACoveredPayment_intro_classSettlement {pay : Payment} {c : ComplaintText}
    (h : PaymentFromWalkerClassSettlementFund pay c) : SubsectionACoveredPayment pay c :=
  .classSettlement h

theorem subsectionACoveredPayment_intro_releaseInLieu {pay : Payment} {c : ComplaintText}
    (h : ReleaseInLieuPayment pay c) : SubsectionACoveredPayment pay c :=
  .releaseInLieu h

theorem subsectionACoveredDetermination_intro_medicaid {c : ComplaintText}
    (h : DeterminationOfMedicaidEligibilityOrAmount c) : SubsectionACoveredDetermination c :=
  .medicaid h

theorem subsectionACoveredDetermination_intro_ssi {c : ComplaintText}
    (h : DeterminationOfSsiEligibilityOrAmount c) : SubsectionACoveredDetermination c :=
  .ssi h

theorem subsectionAExclusionApplies_intro {pay : Payment} {c : ComplaintText}
    (hPay : SubsectionACoveredPayment pay c) (hDet : SubsectionACoveredDetermination c) :
    SubsectionAExclusionApplies pay c :=
  ⟨hPay, hDet⟩

theorem subsectionBExclusionApplies_intro {pay : Payment} {c : ComplaintText}
    (hPay : PaymentFromSection101Fund pay c)
    (hDet : DeterminationOfSsiEligibilityOrAmount c) : SubsectionBExclusionApplies pay c :=
  ⟨hPay, hDet⟩

theorem section201ExclusionApplies_intro_subsectionA {pay : Payment} {c : ComplaintText}
    (h : SubsectionAExclusionApplies pay c) : Section201ExclusionApplies pay c :=
  .subsectionA h

theorem section201ExclusionApplies_intro_subsectionB {pay : Payment} {c : ComplaintText}
    (h : SubsectionBExclusionApplies pay c) : Section201ExclusionApplies pay c :=
  .subsectionB h

theorem section201ExclusionViolated_intro {pay : Payment} {c : ComplaintText}
    (hExcl : Section201ExclusionApplies pay c)
    (hCounted : PaymentCountedAsIncomeOrResources pay c) : Section201ExclusionViolated pay c :=
  ⟨hExcl, hCounted⟩



theorem section203DivisionActionUnauthorized_intro {a : AgencyAction} {c : ComplaintText}
    (hAction : IsDivisionEstablishmentAbolitionTransferOrConsolidation a c)
    (hNoApproval : ¬ SecretaryApprovedDivisionAction a c) :
    Section203DivisionActionUnauthorized a c :=
  ⟨hAction, hNoApproval⟩

theorem section203DelegationUltraVires_intro
    {p : Person} {a : AgencyAction} {c : ComplaintText}
    (hDelegate : IsOfficerOrEmployeeOfService p c)
    (hDelegation : ActionTakenUnderSecretarialDelegation a c)
    (hRegs : DelegatedActionIsMakingOfRegulations a c) : Section203DelegationUltraVires p a c :=
  ⟨hDelegate, hDelegation, hRegs⟩



theorem section204RegularCorpsAppointment_intro {p : Person} {c : ComplaintText}
    (hCitizen : IsUnitedStatesCitizen p c) (hPresident : AppointedByPresident p c)
    (hCorps : AppointedToRegularCorps p c)
    (hNotCivil : AppointedWithoutRegardToCivilServiceLaws p c) :
    Section204RegularCorpsAppointment p c :=
  ⟨hCitizen, hPresident, hCorps, hNotCivil⟩

theorem section204ReadyReserveAppointment_intro {p : Person} {c : ComplaintText}
    (hCitizen : IsUnitedStatesCitizen p c) (hPresident : AppointedByPresident p c)
    (hCorps : AppointedToReadyReserveCorps p c)
    (hNotCivil : AppointedWithoutRegardToCivilServiceLaws p c)
    (hCall : SubjectToCallToActiveDutyBySurgeonGeneral p c) :
    Section204ReadyReserveAppointment p c :=
  ⟨hCitizen, hPresident, hCorps, hNotCivil, hCall⟩

theorem section204WarrantOfficerDeemedCommissioned_intro {p : Person} {c : ComplaintText}
    (hCitizen : IsUnitedStatesCitizen p c)
    (hWarrant : AppointedAsWarrantOfficerForHealthDeliverySupport p c) :
    Section204WarrantOfficerDeemedCommissioned p c :=
  ⟨hCitizen, hWarrant⟩

theorem section204ReserveOfficerDeemedRegular_intro {p : Person} {c : ComplaintText}
    (hPrior : ClassifiedAsReserveCorpsOfficerBeforeMarch23_2010 p c)
    (hActive : ServingOnActiveDutyOnMarch23_2010 p c) :
    Section204ReserveOfficerDeemedRegular p c :=
  ⟨hPrior, hActive⟩

theorem section204CommissionedOfficerStatus_intro_regular {p : Person} {c : ComplaintText}
    (h : Section204RegularCorpsAppointment p c) : Section204CommissionedOfficerStatus p c :=
  .regular h

theorem section204CommissionedOfficerStatus_intro_readyReserve {p : Person} {c : ComplaintText}
    (h : Section204ReadyReserveAppointment p c) : Section204CommissionedOfficerStatus p c :=
  .readyReserve h

theorem section204CommissionedOfficerStatus_intro_warrant {p : Person} {c : ComplaintText}
    (h : Section204WarrantOfficerDeemedCommissioned p c) :
    Section204CommissionedOfficerStatus p c :=
  .warrant h

theorem section204CommissionedOfficerStatus_intro_deemedRegular {p : Person} {c : ComplaintText}
    (h : Section204ReserveOfficerDeemedRegular p c) : Section204CommissionedOfficerStatus p c :=
  .deemedRegular h



theorem urgentOrEmergencyPublicHealthCareNeed_intro_nationalEmergency
    {e : Emergency} {c : ComplaintText}
    (h : NationalEmergencyDeclaredByPresident e c) : UrgentOrEmergencyPublicHealthCareNeed e c :=
  .nationalEmergency h

theorem urgentOrEmergencyPublicHealthCareNeed_intro_staffordDeclaration
    {e : Emergency} {c : ComplaintText}
    (h : StaffordActEmergencyOrMajorDisasterDeclared e c) :
    UrgentOrEmergencyPublicHealthCareNeed e c :=
  .staffordDeclaration h

theorem urgentOrEmergencyPublicHealthCareNeed_intro_publicHealthEmergency
    {e : Emergency} {c : ComplaintText}
    (h : PublicHealthEmergencyDeclaredBySecretary e c) :
    UrgentOrEmergencyPublicHealthCareNeed e c :=
  .publicHealthEmergency h

theorem urgentOrEmergencyPublicHealthCareNeed_intro_secretaryJudgment
    {e : Emergency} {c : ComplaintText}
    (h : SecretaryJudgedEmergencyAppropriateForCorpsDeployment e c) :
    UrgentOrEmergencyPublicHealthCareNeed e c :=
  .secretaryJudgment h

theorem readinessFailure_intro_requirements {p : Person} {c : ComplaintText}
    (h : FailedToMeetOrMaintainReadinessRequirements p c) : ReadinessFailure p c :=
  .requirements h

theorem readinessFailure_intro_orders {p : Person} {c : ComplaintText}
    (h : FailedToComplyWithDeploymentOrders p c) : ReadinessFailure p c :=
  .orders h

theorem readinessWaiverGround_intro_disability {p : Person} {c : ComplaintText}
    (h : UnableToMeetRequirementsBecauseOfDisability p c) : ReadinessWaiverGround p c :=
  .disability h

theorem readinessWaiverGround_intro_temporaryCondition {p : Person} {c : ComplaintText}
    (h : UnableToMeetRequirementsBecauseOfTemporaryMedicalCondition p c) :
    ReadinessWaiverGround p c :=
  .temporaryCondition h

theorem readinessWaiverGround_intro_extraordinaryLimitation {p : Person} {c : ComplaintText}
    (h : SecretaryDeterminedExtraordinaryLimitation p c) : ReadinessWaiverGround p c :=
  .extraordinaryLimitation h

theorem section204aDisciplinaryExposure_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfCommissionedCorps p c)
    (hReqs : ReadinessRequirementsEstablishedBySecretary c)
    (hFailure : ReadinessFailure p c)
    (hNoWaiver : ¬ SecretaryGrantedReadinessWaiver p c) :
    Section204aDisciplinaryExposure p c :=
  ⟨hMember, hReqs, hFailure, hNoWaiver⟩

theorem section204aWaiverEligibility_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfCommissionedCorps p c) (hGround : ReadinessWaiverGround p c) :
    Section204aWaiverEligibility p c :=
  ⟨hMember, hGround⟩

theorem section204aUnlawfulDisciplineTheory_intro_waived {p : Person} {c : ComplaintText}
    (h : SecretaryGrantedReadinessWaiver p c) : Section204aUnlawfulDisciplineTheory p c :=
  .waived h

theorem section204aUnlawfulDisciplineTheory_intro_noFailure {p : Person} {c : ComplaintText}
    (h : ¬ ReadinessFailure p c) : Section204aUnlawfulDisciplineTheory p c :=
  .noFailure h

theorem section204aUnlawfulDisciplineTheory_intro_procedureViolated
    {p : Person} {c : ComplaintText}
    (h : ¬ DisciplinaryActionFollowedSecretaryEstablishedProcedures p c) :
    Section204aUnlawfulDisciplineTheory p c :=
  .procedureViolated h

theorem section204aUnlawfulDisciplineClaim_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfCommissionedCorps p c) (hImposed : DisciplinaryActionImposed p c)
    (hTheory : Section204aUnlawfulDisciplineTheory p c) :
    Section204aUnlawfulDisciplineClaim p c :=
  ⟨hMember, hImposed, hTheory⟩

theorem section204aDeploymentDeemedAuthorized_intro
    {p : Person} {fe : FederalEntity} {e : Emergency} {c : ComplaintText}
    (hOfficer : IsCommissionedOfficerOfService p c)
    (hDetailed : OfficerDetailedOrAssignedToFederalEntity p fe c)
    (hNeed : UrgentOrEmergencyPublicHealthCareNeed e c)
    (hDeployed : DeployedBySecretaryInResponseToUrgentNeed p e c) :
    Section204aDeploymentDeemedAuthorized p fe e c :=
  ⟨hOfficer, hDetailed, hNeed, hDeployed⟩



theorem section205SurgeonGeneralAppointment_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c)
    (hQuals : HasSpecializedTrainingOrExperienceInPublicHealthPrograms p c)
    (hSenate : AppointedByPresidentWithSenateAdviceAndConsent p c)
    (hTerm : AppointedForFourYearTermAsSurgeonGeneral p c) :
    Section205SurgeonGeneralAppointment p c :=
  ⟨hMember, hQuals, hSenate, hTerm⟩

theorem section205ReversionEntitlement_intro {p : Person} {c : ComplaintText}
    (hAppt : Section205SurgeonGeneralAppointment p c)
    (hExpired : SurgeonGeneralTermExpired p c)
    (hNotReappointed : ¬ ReappointedAsSurgeonGeneral p c) :
    Section205ReversionEntitlement p c :=
  ⟨hAppt, hExpired, hNotReappointed⟩

theorem section205ReversionDenied_intro {p : Person} {c : ComplaintText}
    (hEnt : Section205ReversionEntitlement p c)
    (hNotReverted : ¬ RevertedToPriorGradeAndNumber p c) : Section205ReversionDenied p c :=
  ⟨hEnt, hNotReverted⟩



theorem section206DeputySurgeonGeneralAssignment_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c) (hAssigned : AssignedBySurgeonGeneral p c)
    (hAdmin : AssignedToAdministerOfficeOfSurgeonGeneral p c) :
    Section206DeputySurgeonGeneralAssignment p c :=
  ⟨hMember, hAssigned, hAdmin⟩

theorem section206AssistantSurgeonGeneralAssignment_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c) (hAssigned : AssignedBySurgeonGeneral p c)
    (hPosition : AssignedToEnumeratedAssistantSurgeonGeneralPosition p c) :
    Section206AssistantSurgeonGeneralAssignment p c :=
  ⟨hMember, hAssigned, hPosition⟩

theorem section206TemporaryAssistantSurgeonGeneralAssignment_intro
    {p : Person} {c : ComplaintText}
    (hAssigned : AssignedBySurgeonGeneral p c)
    (hApproval : SecretaryApprovedSpecialTemporaryPosition p c)
    (hNecessary : TemporaryPositionNecessaryForProperStaffing p c)
    (hCorps : AssignedFromRegularOrReadyReserveCorps p c)
    (hCap : WithinOnePercentTemporaryPositionCap c) :
    Section206TemporaryAssistantSurgeonGeneralAssignment p c :=
  ⟨hAssigned, hApproval, hNecessary, hCorps, hCap⟩

theorem section206AssistantSurgeonGeneralTitle_intro_statutory {p : Person} {c : ComplaintText}
    (h : Section206AssistantSurgeonGeneralAssignment p c) :
    Section206AssistantSurgeonGeneralTitle p c :=
  .statutory h

theorem section206AssistantSurgeonGeneralTitle_intro_temporary {p : Person} {c : ComplaintText}
    (h : Section206TemporaryAssistantSurgeonGeneralAssignment p c) :
    Section206AssistantSurgeonGeneralTitle p c :=
  .temporary h

theorem section206ActingSurgeonGeneralDesignation_intro {p : Person} {c : ComplaintText}
    (hTitle : Section206AssistantSurgeonGeneralTitle p c)
    (hDesignated : DesignatedToServeAsSurgeonGeneralDuringVacancy p c) :
    Section206ActingSurgeonGeneralDesignation p c :=
  ⟨hTitle, hDesignated⟩



theorem section207HigherGradeCapExceeded_intro {p : Person} {c : ComplaintText}
    (hGrade : HoldsAssistantSurgeonGeneralGradeAboveBrigadierGeneral p c)
    (hOver : ¬ WithinAssistantSurgeonGeneralHigherGradeCap c) :
    Section207HigherGradeCapExceeded p c :=
  ⟨hGrade, hOver⟩

theorem section207SeparationShieldClaim_intro {p : Person} {c : ComplaintText}
    (hOfficer : IsCommissionedOfficerOfService p c)
    (hMaxima : SeparationOrGradeReductionRequiredSolelyByGradeMaxima p c)
    (hNotOther : ¬ ActionTakenPursuantToOtherProvisionOfChapter p c) :
    Section207SeparationShieldClaim p c :=
  ⟨hOfficer, hMaxima, hNotOther⟩

theorem section207DefensePolicymakingExclusion_intro {p : Person} {c : ComplaintText}
    (hGrade : HoldsAssistantSurgeonGeneralGradeAboveBrigadierGeneral p c)
    (hAssigned : AssignedToDutyInDepartmentOfDefense p c)
    (hPolicy : ServingInPolicymakingPositionInDepartmentOfDefense p c)
    (hCap : WithinDefensePolicymakingExclusionCap c) :
    Section207DefensePolicymakingExclusion p c :=
  ⟨hGrade, hAssigned, hPolicy, hCap⟩



theorem section209AgeBarOvercome_intro_belowThreshold {p : Person} {c : ComplaintText}
    (h : ¬ AgeThresholdReached p c) : Section209AgeBarOvercome p c :=
  .belowThreshold h

theorem section209AgeBarOvercome_intro_serviceOffset {p : Person} {c : ComplaintText}
    (h : ServiceOffsetSatisfied p c) : Section209AgeBarOvercome p c :=
  .serviceOffset h

theorem section209AgeBarOvercome_intro_exceptionalQualifications {p : Person} {c : ComplaintText}
    (h : SurgeonGeneralDeterminedExceptionalQualifications p c) : Section209AgeBarOvercome p c :=
  .exceptionalQualifications h

theorem section209AgeBarOvercome_intro_militaryServiceDeclared {p : Person} {c : ComplaintText}
    (hReserve : IsMemberOfReadyReserveCorps p c)
    (hDeclared : CommissionedCorpsDeclaredMilitaryServiceByPresident c) :
    Section209AgeBarOvercome p c :=
  .militaryServiceDeclared hReserve hDeclared

theorem section209RegularCorpsOriginalAppointment_intro {p : Person} {c : ComplaintText}
    (hCitizen : IsUnitedStatesCitizen p c) (hPresident : AppointedByPresident p c)
    (hGrade : AppointedToEligibleOriginalRegularCorpsGrade p c)
    (hExam : AppointmentAboveJuniorAssistantGrade p c → PassedPrescribedAppointmentExamination p c)
    (hAge : Section209AgeBarOvercome p c)
    (hCommission : CommissionIssuedBySecretaryUnderDepartmentSeal p c) :
    Section209RegularCorpsOriginalAppointment p c :=
  ⟨hCitizen, hPresident, hGrade, hExam, hAge, hCommission⟩

theorem section209ReadyReserveOriginalAppointment_intro {p : Person} {c : ComplaintText}
    (hCitizen : IsUnitedStatesCitizen p c) (hPresident : AppointedByPresident p c)
    (hGrade : AppointedToReadyReserveGradeNotAboveDirector p c)
    (hExam : PassedPrescribedAppointmentExamination p c)
    (hIndefinite : ReserveCommissionForIndefinitePeriod p c)
    (hAge : CalledToActiveDutyInReadyReserveForMoreThanOneYear p c → Section209AgeBarOvercome p c)
    (hCommission : CommissionIssuedBySecretaryUnderDepartmentSeal p c) :
    Section209ReadyReserveOriginalAppointment p c :=
  ⟨hCitizen, hPresident, hGrade, hExam, hIndefinite, hAge, hCommission⟩

theorem section209AboveSeniorAssistantAppointment_intro {p : Person} {c : ComplaintText}
    (hAbove : AppointmentAboveSeniorAssistantGrade p c)
    (hNotAboveDirector : ¬ AppointmentAboveDirectorGrade p c)
    (hCap : WithinTenPercentAboveSeniorAssistantCap c)
    (hStandards : MeetsPresidentiallyPrescribedAppointmentStandards p c)
    (hCommission : CommissionIssuedBySecretaryUnderDepartmentSeal p c) :
    Section209AboveSeniorAssistantAppointment p c :=
  ⟨hAbove, hNotAboveDirector, hCap, hStandards, hCommission⟩

theorem section209ReadyReserveTransferAppointment_intro {p : Person} {c : ComplaintText}
    (hAbove : AppointmentAboveSeniorAssistantGrade p c)
    (hNotAboveDirector : ¬ AppointmentAboveDirectorGrade p c)
    (hYear : OnActiveDutyContinuouslyOneYearBeforeAppointment p c)
    (hLimit : WithinThreeAndOneHalfYearActiveDutyLimit p c)
    (hStandards : MeetsPresidentiallyPrescribedAppointmentStandards p c) :
    Section209ReadyReserveTransferAppointment p c :=
  ⟨hAbove, hNotAboveDirector, hYear, hLimit, hStandards⟩

theorem section209Reappointment_intro {p : Person} {c : ComplaintText}
    (hPrior : HeldPriorRegularCorpsCommission p c)
    (hTimely : AppliedForReappointmentWithinTwoYearsOfTermination p c)
    (hGrade : ReappointedToPriorPermanentOrNextHigherGrade p c)
    (hStandards : MeetsSecretaryPrescribedReappointmentStandards p c) :
    Section209Reappointment p c :=
  ⟨hPrior, hTimely, hGrade, hStandards⟩

theorem section209SpecialConsultant_intro {p : Person} {c : ComplaintText}
    (hConsultant : EmployedAsSpecialConsultantUnderRegulations p c)
    (hNotCivil : AppointedWithoutRegardToCivilServiceLaws p c) : Section209SpecialConsultant p c :=
  ⟨hConsultant, hNotCivil⟩

theorem section209Fellowship_intro {p : Person} {c : ComplaintText}
    (hDesignated : DesignatedBySurgeonGeneralToReceiveFellowship p c)
    (hNotCommissioned : IsNotCommissionedOfficerOfService p c)
    (hNotCivil : AppointedWithoutRegardToCivilServiceLaws p c) : Section209Fellowship p c :=
  ⟨hDesignated, hNotCommissioned, hNotCivil⟩

theorem section209NonCitizenRoute_intro_consultant {p : Person} {c : ComplaintText}
    (h : Section209SpecialConsultant p c) : Section209NonCitizenRoute p c :=
  .consultant h

theorem section209NonCitizenRoute_intro_fellowship {p : Person} {c : ComplaintText}
    (h : Section209Fellowship p c) : Section209NonCitizenRoute p c :=
  .fellowship h

theorem section209NonCitizenEngagement_intro {p : Person} {c : ComplaintText}
    (hNotCitizen : ¬ IsUnitedStatesCitizen p c) (hRoute : Section209NonCitizenRoute p c) :
    Section209NonCitizenEngagement p c :=
  ⟨hNotCitizen, hRoute⟩

theorem section209CivilServiceAppointment_intro {p : Person} {c : ComplaintText}
    (hLaws : AppointmentMadeInAccordanceWithCivilServiceLaws p c)
    (hSecretary : AppointmentMadeBySecretary p c) : Section209CivilServiceAppointment p c :=
  ⟨hLaws, hSecretary⟩

theorem section209ValidServiceAppointment_intro_regularOriginal {p : Person} {c : ComplaintText}
    (h : Section209RegularCorpsOriginalAppointment p c) : Section209ValidServiceAppointment p c :=
  .regularOriginal h

theorem section209ValidServiceAppointment_intro_readyReserveOriginal
    {p : Person} {c : ComplaintText}
    (h : Section209ReadyReserveOriginalAppointment p c) : Section209ValidServiceAppointment p c :=
  .readyReserveOriginal h

theorem section209ValidServiceAppointment_intro_aboveSeniorAssistant
    {p : Person} {c : ComplaintText}
    (h : Section209AboveSeniorAssistantAppointment p c) : Section209ValidServiceAppointment p c :=
  .aboveSeniorAssistant h

theorem section209ValidServiceAppointment_intro_readyReserveTransfer
    {p : Person} {c : ComplaintText}
    (h : Section209ReadyReserveTransferAppointment p c) : Section209ValidServiceAppointment p c :=
  .readyReserveTransfer h

theorem section209ValidServiceAppointment_intro_reappointment {p : Person} {c : ComplaintText}
    (h : Section209Reappointment p c) : Section209ValidServiceAppointment p c :=
  .reappointment h

theorem section209ValidServiceAppointment_intro_consultant {p : Person} {c : ComplaintText}
    (h : Section209SpecialConsultant p c) : Section209ValidServiceAppointment p c :=
  .consultant h

theorem section209ValidServiceAppointment_intro_fellowship {p : Person} {c : ComplaintText}
    (h : Section209Fellowship p c) : Section209ValidServiceAppointment p c :=
  .fellowship h

theorem section209ValidServiceAppointment_intro_civilService {p : Person} {c : ComplaintText}
    (h : Section209CivilServiceAppointment p c) : Section209ValidServiceAppointment p c :=
  .civilService h



theorem osteopathyCollegeQualification_intro_majorityStateLicensure
    {p : Person} {c : ComplaintText}
    (h : GraduateOfOsteopathyCollegeLicensableInMajorityOfStates p c) :
    OsteopathyCollegeQualification p c :=
  .majorityStateLicensure h

theorem osteopathyCollegeQualification_intro_secretaryAcceptableApproval
    {p : Person} {c : ComplaintText}
    (h : GraduateOfOsteopathyCollegeApprovedByAcceptableBody p c) :
    OsteopathyCollegeQualification p c :=
  .secretaryAcceptableApproval h

theorem section209dAppointmentEligibility_intro {p : Person} {c : ComplaintText}
    (hQual : OsteopathyCollegeQualification p c)
    (hOther : SatisfiesOtherAppointmentProvisionsOfAct p c) :
    Section209dAppointmentEligibility p c :=
  ⟨hQual, hOther⟩



theorem section210SupplyPurchaseClass_intro_activeDuty {p : Person} {c : ComplaintText}
    (hOfficer : IsCommissionedOfficerOfService p c) (hActive : IsOnActiveDuty p c) :
    Section210SupplyPurchaseClass p c :=
  .activeDuty hOfficer hActive

theorem section210SupplyPurchaseClass_intro_retired {p : Person} {c : ComplaintText}
    (h : IsRetiredOfficerEntitledToRetiredPay p c) : Section210SupplyPurchaseClass p c :=
  .retired h

theorem section210SupplyPurchaseClaim_intro {p : Person} {c : ComplaintText}
    (hClass : Section210SupplyPurchaseClass p c)
    (hDenied : DeniedSupplyPurchaseAtOfficerPrice p c) : Section210SupplyPurchaseClaim p c :=
  ⟨hClass, hDenied⟩

theorem section210AdvisoryCompensationEntitlement_intro
    {p : Person} {ab : AdvisoryBody} {c : ComplaintText}
    (hMember : IsMemberOfNationalAdvisoryOrReviewCouncil p ab c)
    (hNotExOfficio : ¬ IsExOfficioMemberOfCouncil p ab c)
    (hService : AttendedCouncilMeetingOrServedAtSecretaryRequest p ab c)
    (hCap : WithinGs18DailyEquivalentCap p c) :
    Section210AdvisoryCompensationEntitlement p ab c :=
  ⟨hMember, hNotExOfficio, hService, hCap⟩

theorem section210PartTimeFieldCompensation_intro {p : Person} {c : ComplaintText}
    (hField : IsFieldEmployeeRenderingPartTimeDuty p c)
    (hNotPerDiem : ¬ EmployedOnPerDiemOrFeeBasis p c)
    (hCall : SubjectToCallForServicesBeyondRegularPartTimeEmployment p c)
    (hCap : WithinPartTimeAnnualCompensationCap p c) :
    Section210PartTimeFieldCompensation p c :=
  ⟨hField, hNotPerDiem, hCall, hCap⟩

theorem section210HansensCenterSupplement_intro {p : Person} {c : ComplaintText}
    (hCivilian : IsCivilianEmployeeOfService p c)
    (hOnDate : EmployedAtGillisLongCenterOnApril7_1986 p c)
    (hStill : RemainsEmployedAtGillisLongCenter p c) : Section210HansensCenterSupplement p c :=
  ⟨hCivilian, hOnDate, hStill⟩



theorem section210_1EligibleOfficer_intro_regular {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c) (hActive : IsOnActiveDuty p c) :
    Section210_1EligibleOfficer p c :=
  .regular hMember hActive

theorem section210_1EligibleOfficer_intro_readyReserve {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfReadyReserveCorps p c) (hActive : IsOnActiveDuty p c) :
    Section210_1EligibleOfficer p c :=
  .readyReserve hMember hActive

theorem section210_1LeaveEntitlement_intro {p : Person} {c : ComplaintText}
    (hEligible : Section210_1EligibleOfficer p c)
    (hRegs : LeaveGrantedInAccordanceWithPresidentialRegulations p c)
    (hNoDeduction : ¬ DeductionMadeFromPayAndAllowancesForLeave p c)
    (hCap : WithinAccumulatedAnnualLeaveCap p c) : Section210_1LeaveEntitlement p c :=
  ⟨hEligible, hRegs, hNoDeduction, hCap⟩



theorem section210bCategoryAssignment_intro
    {p : Person} {pc : ProfessionalCategory} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c) (hActive : IsOnActiveDuty p c)
    (hEstablished : ProfessionalCategoriesEstablishedByRegulation c)
    (hBasis : CategoryBasedOnSection209ExaminationSubject pc c)
    (hAssignment : AssignedToCategoryOnBasisOfTrainingAndExperience p pc c) :
    Section210bCategoryAssignment p pc c :=
  ⟨hMember, hActive, hEstablished, hBasis, hAssignment⟩

theorem section210bQualifiedTransferRequest_intro
    {p : Person} {pc : ProfessionalCategory} {c : ComplaintText}
    (hRequested : RequestedTransferToCategory p pc c)
    (hQualified : EquallyWellQualifiedToServeInCategory p pc c)
    (hInterest : TransferInInterestsOfService p pc c) :
    Section210bQualifiedTransferRequest p pc c :=
  ⟨hRequested, hQualified, hInterest⟩

theorem section210bCategoryChangeAuthority_intro_regulationsAmended
    {p : Person} {pc : ProfessionalCategory} {c : ComplaintText}
    (h : CategoryRegulationsAmended c) : Section210bCategoryChangeAuthority p pc c :=
  .regulationsAmended h

theorem section210bCategoryChangeAuthority_intro_erroneousOriginal
    {p : Person} {pc : ProfessionalCategory} {c : ComplaintText}
    (h : OriginalCategoryAssignmentErroneous p c) : Section210bCategoryChangeAuthority p pc c :=
  .erroneousOriginal h

theorem section210bCategoryChangeAuthority_intro_qualifiedTransfer
    {p : Person} {pc : ProfessionalCategory} {c : ComplaintText}
    (h : Section210bQualifiedTransferRequest p pc c) :
    Section210bCategoryChangeAuthority p pc c :=
  .qualifiedTransfer h

theorem section210bUnlawfulCategoryChangeClaim_intro
    {p : Person} {pc : ProfessionalCategory} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c) (hActive : IsOnActiveDuty p c)
    (hChanged : CategoryAssignmentChanged p c)
    (hNoAuthority : ¬ Section210bCategoryChangeAuthority p pc c) :
    Section210bUnlawfulCategoryChangeClaim p pc c :=
  ⟨hMember, hActive, hChanged, hNoAuthority⟩



theorem section211PermanentPromotion_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c)
    (hPresident : PermanentPromotionMadeByPresident p c)
    (hNextGrade : PromotionToNextHigherGrade p c)
    (hExam : PassedPromotionExamination p c) : Section211PermanentPromotion p c :=
  ⟨hMember, hPresident, hNextGrade, hExam⟩

theorem section211NoncompetitiveExaminationRequired_intro {p : Person} {c : ComplaintText}
    (hLower : PromotionToAssistantOrSeniorAssistantGrade p c)
    (hNoncompetitive : PromotionExaminationNoncompetitive p c) :
    Section211NoncompetitiveExaminationRequired p c :=
  ⟨hLower, hNoncompetitive⟩

theorem section211LengthOfServiceEligibility_intro_fromAssistant {p : Person} {c : ComplaintText}
    (hRank : HoldsPermanentRankInAssistantGrade p c)
    (hYears : CompletedThreeYearsAboveJuniorAssistant p c) :
    Section211LengthOfServiceEligibility p c :=
  .fromAssistant hRank hYears

theorem section211LengthOfServiceEligibility_intro_fromSeniorAssistant
    {p : Person} {c : ComplaintText}
    (hRank : HoldsPermanentRankInSeniorAssistantGrade p c)
    (hYears : CompletedTenYearsAboveJuniorAssistant p c) :
    Section211LengthOfServiceEligibility p c :=
  .fromSeniorAssistant hRank hYears

theorem section211LengthOfServiceEligibility_intro_fromFull {p : Person} {c : ComplaintText}
    (hRank : HoldsPermanentRankInFullGrade p c)
    (hYears : CompletedSeventeenYearsAboveJuniorAssistant p c) :
    Section211LengthOfServiceEligibility p c :=
  .fromFull hRank hYears

theorem section211LengthOfServicePromotionDenied_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c)
    (hEligible : Section211LengthOfServiceEligibility p c)
    (hQualified : FoundQualifiedForPromotion p c)
    (hNotPromoted : ¬ ReceivedLengthOfServicePromotion p c) :
    Section211LengthOfServicePromotionDenied p c :=
  ⟨hMember, hEligible, hQualified, hNotPromoted⟩

theorem section211ReexaminationRight_intro {p : Person} {c : ComplaintText}
    (hEligible : Section211LengthOfServiceEligibility p c)
    (hMissed : ¬ ReceivedLengthOfServicePromotion p c)
    (hNotTwice : ¬ TwiceExaminedForPromotion p c) : Section211ReexaminationRight p c :=
  ⟨hEligible, hMissed, hNotTwice⟩

theorem section211NonPromotionConsequence_intro_separationJuniorGrades
    {p : Person} {c : ComplaintText}
    (hGrade : HoldsWarrantOfficerW1OrJuniorAssistantGrade p c)
    (hUnqualified : ¬ FoundQualifiedForPromotion p c)
    (hSeparated : SeparatedFromService p c) : Section211NonPromotionConsequence p c :=
  .separationJuniorGrades hGrade hUnqualified hSeparated

theorem section211NonPromotionConsequence_intro_separationSixMonthsPay
    {p : Person} {c : ComplaintText}
    (hGrade : HoldsChiefWarrantW2OrAssistantGrade p c)
    (hTwice : TwiceExaminedForPromotion p c) (hSeparated : SeparatedFromService p c)
    (hPaid : PaidSeveranceBasicPayAndAllowances p c) :
    Section211NonPromotionConsequence p c :=
  .separationSixMonthsPay hGrade hTwice hSeparated hPaid

theorem section211NonPromotionConsequence_intro_separationOneYearPay
    {p : Person} {c : ComplaintText}
    (hGrade : HoldsChiefWarrantW3OrSeniorAssistantGrade p c)
    (hTwice : TwiceExaminedForPromotion p c) (hSeparated : SeparatedFromService p c)
    (hPaid : PaidSeveranceBasicPayAndAllowances p c) :
    Section211NonPromotionConsequence p c :=
  .separationOneYearPay hGrade hTwice hSeparated hPaid

theorem section211NonPromotionConsequence_intro_retirementFromFullGrade
    {p : Person} {c : ComplaintText}
    (hGrade : HoldsPermanentRankInFullGrade p c)
    (hTwice : TwiceExaminedForPromotion p c)
    (hRetired : RetiredFromServiceWithRetiredPay p c) :
    Section211NonPromotionConsequence p c :=
  .retirementFromFullGrade hGrade hTwice hRetired

theorem section211DisabilityExclusionClaim_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c)
    (hConsequence : Section211NonPromotionConsequence p c)
    (hDisability : NonPromotionForPhysicalDisability p c) :
    Section211DisabilityExclusionClaim p c :=
  ⟨hMember, hConsequence, hDisability⟩

theorem section211RefusalSeparation_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c)
    (hRefused : RefusedToTakePromotionExamination p c)
    (hSeparated : SeparatedFromService p c) : Section211RefusalSeparation p c :=
  ⟨hMember, hRefused, hSeparated⟩

theorem section211ThreeYearReviewSeparation_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c)
    (hSenior : OriginallyAppointedToSeniorAssistantGradeOrAbove p c)
    (hReviewed : RecordReviewedAtEndOfFirstThreeYears p c)
    (hNotQualified : FoundNotQualifiedForFurtherService p c)
    (hSeparated : SeparatedFromService p c)
    (hPaid : PaidSeveranceBasicPayAndAllowances p c) :
    Section211ThreeYearReviewSeparation p c :=
  ⟨hMember, hSenior, hReviewed, hNotQualified, hSeparated, hPaid⟩

theorem section211ThreeYearReviewDefect_intro_noReview {p : Person} {c : ComplaintText}
    (h : ¬ RecordReviewedAtEndOfFirstThreeYears p c) : Section211ThreeYearReviewDefect p c :=
  .noReview h

theorem section211ThreeYearReviewDefect_intro_unpaid {p : Person} {c : ComplaintText}
    (h : ¬ PaidSeveranceBasicPayAndAllowances p c) : Section211ThreeYearReviewDefect p c :=
  .unpaid h

theorem section211TemporaryPromotion_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c)
    (hRecommended : RecommendedForTemporaryPromotionToHigherGrade p c)
    (hPromoted : PromotedToHigherGrade p c) : Section211TemporaryPromotion p c :=
  ⟨hMember, hRecommended, hPromoted⟩

theorem section211DeemedAcceptance_intro {p : Person} {c : ComplaintText}
    (hPromoted : PromotedToHigherGrade p c)
    (hNotDeclined : ¬ ExpresslyDeclinedPromotion p c) : Section211DeemedAcceptance p c :=
  ⟨hPromoted, hNotDeclined⟩



theorem section211cAppointmentRoute_intro_priorAppointment {p : Person} {c : ComplaintText}
    (hAppointed : AppointedToAssistantGradeInRegularCorps p c)
    (hContinuous : ServiceContinuousFromDateOfAppointment p c) :
    Section211cAppointmentRoute p c :=
  .priorAppointment hAppointed hContinuous

theorem section211cAppointmentRoute_intro_futureAppointment {p : Person} {c : ComplaintText}
    (h : AppointedToAssistantGradeInRegularCorps p c) : Section211cAppointmentRoute p c :=
  .futureAppointment h

theorem section211cCreditEntitlement_intro {p : Person} {c : ComplaintText}
    (hOfficer : IsMedicalOfficerOfRegularCorps p c)
    (hRoute : Section211cAppointmentRoute p c)
    (hInternship : CompletedMedicalInternshipByDateOfAppointment p c)
    (hNoDuplicate : ¬ ReceivedSimilarInternshipCreditUnderOtherLaw p c) :
    Section211cCreditEntitlement p c :=
  ⟨hOfficer, hRoute, hInternship, hNoDuplicate⟩

theorem section211cCreditDenied_intro {p : Person} {c : ComplaintText}
    (hEnt : Section211cCreditEntitlement p c)
    (hNotCredited : ¬ CreditedWithOneYearForPromotionAndSeniority p c) :
    Section211cCreditDenied p c :=
  ⟨hEnt, hNotCredited⟩



theorem section212ActiveService_intro_uniformedService {p : Person} {c : ComplaintText}
    (h : ActiveServiceInUniformedService p c) : Section212ActiveService p c :=
  .uniformedService h

theorem section212ActiveService_intro_comparablePhsService {p : Person} {c : ComplaintText}
    (h : NonCommissionedPhsServiceDeterminedComparable p c) : Section212ActiveService p c :=
  .comparablePhsService h

theorem section212ActiveService_intro_creditableService {p : Person} {c : ComplaintText}
    (h : ServiceCreditableForUniformedServiceRetirement p c) : Section212ActiveService p c :=
  .creditableService h

theorem section212ActiveService_intro_biomedicalResearchService {p : Person} {c : ComplaintText}
    (h : ServiceAsMemberOfSeniorBiomedicalResearchService p c) : Section212ActiveService p c :=
  .biomedicalResearchService h

theorem section212AgeRetirementOnApplication_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c) (hApplied : AppliedForRetirement p c)
    (hAge : AttainedAgeSixtyFour p c) : Section212AgeRetirementOnApplication p c :=
  ⟨hMember, hApplied, hAge⟩

theorem section212ThirtyYearRetirement_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c) (hApplied : AppliedForRetirement p c)
    (hService : CompletedThirtyYearsActiveService p c) : Section212ThirtyYearRetirement p c :=
  ⟨hMember, hApplied, hService⟩

theorem section212EarlyRetirement_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c)
    (hUnderThirty : ¬ CompletedThirtyYearsActiveService p c)
    (hTwenty : CompletedTwentyYearsActiveService p c)
    (hTenCommissioned : CompletedTenYearsCommissionedService p c)
    (hOrdered : SecretaryOrderedRetirement p c) : Section212EarlyRetirement p c :=
  ⟨hMember, hUnderThirty, hTwenty, hTenCommissioned, hOrdered⟩

theorem section212SurgeonGeneralVoluntaryRetirement_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c)
    (hOffice : ServedAsSurgeonGeneralDeputyOrAssistant p c)
    (hOfficeYears : CompletedFourYearsInSurgeonGeneralPositions p c)
    (hCorpsYears : CompletedTwentyFiveYearsInRegularCorps p c)
    (hApproval : PresidentApprovedVoluntaryRetirement p c) :
    Section212SurgeonGeneralVoluntaryRetirement p c :=
  ⟨hMember, hOffice, hOfficeYears, hCorpsYears, hApproval⟩

theorem section212RetirementEntitlement_intro_onAge {p : Person} {c : ComplaintText}
    (h : Section212AgeRetirementOnApplication p c) : Section212RetirementEntitlement p c :=
  .onAge h

theorem section212RetirementEntitlement_intro_onThirtyYears {p : Person} {c : ComplaintText}
    (h : Section212ThirtyYearRetirement p c) : Section212RetirementEntitlement p c :=
  .onThirtyYears h

theorem section212RetirementEntitlement_intro_asSurgeonGeneral {p : Person} {c : ComplaintText}
    (h : Section212SurgeonGeneralVoluntaryRetirement p c) : Section212RetirementEntitlement p c :=
  .asSurgeonGeneral h

theorem section212RetirementDeniedClaim_intro {p : Person} {c : ComplaintText}
    (hEnt : Section212RetirementEntitlement p c) (hDenied : RetirementDenied p c) :
    Section212RetirementDeniedClaim p c :=
  ⟨hEnt, hDenied⟩

theorem section212AgeBasedInvoluntaryRetirementClaim_intro {p : Person} {c : ComplaintText}
    (hMember : IsMemberOfRegularCorps p c)
    (hInvoluntary : RetiredInvoluntarilyBecauseOfAge p c) :
    Section212AgeBasedInvoluntaryRetirementClaim p c :=
  ⟨hMember, hInvoluntary⟩

theorem section212RecallAuthority_intro_involuntaryWartime {p : Person} {c : ComplaintText}
    (hRegular : IsMemberOfRegularCorps p c)
    (hPay : EntitledToRetiredPayUnderSection212 p c)
    (hBranch : CommissionedCorpsConstitutesBranchOfLandOrNavalForces c) :
    Section212RecallAuthority p c :=
  .involuntaryWartime hRegular hPay hBranch

theorem section212RecallAuthority_intro_consensual {p : Person} {c : ComplaintText}
    (h : ConsentedToRecallToActiveDuty p c) : Section212RecallAuthority p c :=
  .consensual h

theorem section212UnlawfulRecallClaim_intro {p : Person} {c : ComplaintText}
    (hRecalled : RecalledToActiveDuty p c)
    (hNoAuthority : ¬ Section212RecallAuthority p c)
    (hNotSeniorFailure : ¬ RetiredForFailureOfPromotionToSeniorGrade p c) :
    Section212UnlawfulRecallClaim p c :=
  ⟨hRecalled, hNoAuthority, hNotSeniorFailure⟩



theorem section213Claimant_intro_officer {p : Person} {c : ComplaintText}
    (h : IsCommissionedOfficerOfService p c) : Section213Claimant p c :=
  .officer h

theorem section213Claimant_intro_survivingBeneficiary {p : Person} {c : ComplaintText}
    (h : IsSurvivingBeneficiaryOfCommissionedOfficer p c) : Section213Claimant p c :=
  .survivingBeneficiary h

theorem section213QualifyingActiveService_intro_timeOfWar {p : Person} {c : ComplaintText}
    (h : ActiveServicePerformedInTimeOfWar p c) : Section213QualifyingActiveService p c :=
  .timeOfWar h

theorem section213QualifyingActiveService_intro_detailWithArmedForces
    {p : Person} {c : ComplaintText}
    (h : ActiveServicePerformedOnDetailWithArmedForces p c) :
    Section213QualifyingActiveService p c :=
  .detailWithArmedForces h

theorem section213QualifyingActiveService_intro_partOfMilitaryForces
    {p : Person} {c : ComplaintText}
    (h : ActiveServicePerformedWhileServicePartOfMilitaryForces p c) :
    Section213QualifyingActiveService p c :=
  .partOfMilitaryForces h

theorem section213MilitaryBenefitsClaim_intro {p : Person} {c : ComplaintText}
    (hClaimant : Section213Claimant p c)
    (hService : Section213QualifyingActiveService p c)
    (hNotExcepted : ¬ BenefitClaimedIsRetiredPayOrUniformAllowance c)
    (hDenied : DeniedArmyOfficerRightPrivilegeImmunityOrBenefit p c) :
    Section213MilitaryBenefitsClaim p c :=
  ⟨hClaimant, hService, hNotExcepted, hDenied⟩

theorem section213VeteransBenefitsDeeming_intro {p : Person} {c : ComplaintText}
    (hOfficer : IsCommissionedOfficerOfService p c)
    (hClaim : ClaimUnderLawAdministeredBySecretaryOfVeteransAffairs c)
    (hNotIndemnity : ¬ ClaimUnderServicemensIndemnityActOf1951 c) :
    Section213VeteransBenefitsDeeming p c :=
  ⟨hOfficer, hClaim, hNotIndemnity⟩

theorem section213ScraDeeming_intro {p : Person} {c : ComplaintText}
    (hOfficer : IsCommissionedOfficerOfService p c)
    (hClaim : ClaimUnderServicemembersCivilReliefAct c) : Section213ScraDeeming p c :=
  ⟨hOfficer, hClaim⟩

theorem section213AntidiscriminationDeeming_intro {p : Person} {c : ComplaintText}
    (hOfficer : IsCommissionedOfficerOfService p c)
    (hClaim : ClaimUnderLawProhibitingEnumeratedDiscrimination c) :
    Section213AntidiscriminationDeeming p c :=
  ⟨hOfficer, hClaim⟩



theorem section213aEntitlement_intro {p : Person} {c : ComplaintText}
    (hClaimant : Section213Claimant p c)
    (hEnumerated : BenefitEnumeratedInSection213aList c)
    (hCh61 : ClaimUnderChapter61Sections1201To1203 c →
      ¬ OrderedToActiveDutyForTrainingMoreThanThirtyDays p c)
    (hCh69 : ¬ ClaimUnderExceptedChapter69Provision c)
    (hFormula : ¬ ClaimUnderExceptedRetiredPayFormula c)
    (hCh163 : ClaimUnderChapter163MilitaryClaims c →
      EntitledToMilitaryBenefitsUnderSection213 p c) : Section213aEntitlement p c :=
  ⟨hClaimant, hEnumerated, hCh61, hCh69, hFormula, hCh163⟩

theorem section213aDenialClaim_intro {p : Person} {c : ComplaintText}
    (hEnt : Section213aEntitlement p c)
    (hDenied : DeniedTitle10RightBenefitPrivilegeOrImmunity p c) :
    Section213aDenialClaim p c :=
  ⟨hEnt, hDenied⟩

theorem section213aWrongAuthorityClaim_intro {p : Person} {c : ComplaintText}
    (hEnt : Section213aEntitlement p c)
    (hWrong : ¬ AuthorityExercisedBySecretaryOfHhsOrDesignee c) :
    Section213aWrongAuthorityClaim p c :=
  ⟨hEnt, hWrong⟩



theorem section214FlagEntitlement_intro {p : Person} {c : ComplaintText}
    (hOfficer : IsCommissionedOfficerOfService p c)
    (hReleased : ReleasedFromActiveCommissionedServiceForRetirement p c)
    (hNotPrevious : ¬ PreviouslyPresentedUnitedStatesFlagOnRetirement p c) :
    Section214FlagEntitlement p c :=
  ⟨hOfficer, hReleased, hNotPrevious⟩

theorem section214ViolationTheory_intro_notPresented {p : Person} {c : ComplaintText}
    (h : ¬ UnitedStatesFlagPresentedBySecretary p c) : Section214ViolationTheory p c :=
  .notPresented h

theorem section214ViolationTheory_intro_chargedCost {p : Person} {c : ComplaintText}
    (h : ChargedCostForFlagPresentation p c) : Section214ViolationTheory p c :=
  .chargedCost h

theorem section214FlagClaim_intro {p : Person} {c : ComplaintText}
    (hEnt : Section214FlagEntitlement p c) (hTheory : Section214ViolationTheory p c) :
    Section214FlagClaim p c :=
  ⟨hEnt, hTheory⟩



theorem section215ExecutiveDepartmentDetail_intro
    {p : Person} {fe : FederalEntity} {c : ComplaintText}
    (hPersonnel : IsOfficerOrEmployeeOfService p c)
    (hRequest : HeadOfExecutiveDepartmentRequestedDetail fe c)
    (hAgreement : DetailAgreedUponBySecretaryAndDepartmentHead p fe c)
    (hWork : DetailForWorkRelatedToDepartmentOrServiceFunctions p fe c) :
    Section215ExecutiveDepartmentDetail p fe c :=
  ⟨hPersonnel, hRequest, hAgreement, hWork⟩

theorem section215StateDetail_intro {p : Person} {c : ComplaintText}
    (hPersonnel : IsOfficerOrEmployeeOfService p c)
    (hRequest : StateHealthOrMentalHealthAuthorityRequestedDetail c)
    (hDetailed : DetailedBySurgeonGeneralToAssistStateOrSubdivision p c) :
    Section215StateDetail p c :=
  ⟨hPersonnel, hRequest, hDetailed⟩

theorem section215SpecialStudyDetail_intro {p : Person} {c : ComplaintText}
    (hPersonnel : IsOfficerOrEmployeeOfService p c)
    (hDetailed : DetailedToCongressionalCommitteeOrNonprofitInstitution p c)
    (hPurpose : DetailForSpecialStudiesOrDisseminationOfInformation p c) :
    Section215SpecialStudyDetail p c :=
  ⟨hPersonnel, hDetailed, hPurpose⟩

theorem section215CreditableDetail_intro_stateDetail {p : Person} {c : ComplaintText}
    (h : Section215StateDetail p c) : Section215CreditableDetail p c :=
  .stateDetail h

theorem section215CreditableDetail_intro_specialStudyDetail {p : Person} {c : ComplaintText}
    (h : Section215SpecialStudyDetail p c) : Section215CreditableDetail p c :=
  .specialStudyDetail h

theorem section215ServiceCreditDeniedClaim_intro {p : Person} {c : ComplaintText}
    (hDetail : Section215CreditableDetail p c)
    (hNotCredited : ¬ DetailServiceCreditedForPayPromotionRetirementAndBenefits p c) :
    Section215ServiceCreditDeniedClaim p c :=
  ⟨hDetail, hNotCredited⟩

theorem section215UnlawfulDeploymentClaim_intro {p : Person} {c : ComplaintText}
    (hOfficer : IsCommissionedOfficerOfService p c)
    (hOutside : AssignedToEntityOutsideDepartmentOfHealthAndHumanServices p c)
    (hNotExcepted : ¬ AssignedToCoastGuardOrDepartmentOfDefense p c)
    (hNoAgreement : ¬ NegotiatedAgencyAgreementGovernsDeployment c)
    (hDeployed : DeployedByEntityOtherThanSecretary p c) :
    Section215UnlawfulDeploymentClaim p c :=
  ⟨hOfficer, hOutside, hNotExcepted, hNoAgreement, hDeployed⟩



theorem section217UtilizationTrigger_intro_war {c : ComplaintText}
    (h : TimeOfWar c) : Section217UtilizationTrigger c :=
  .war h

theorem section217UtilizationTrigger_intro_proclaimedEmergency {c : ComplaintText}
    (h : EmergencyProclaimedByPresident c) : Section217UtilizationTrigger c :=
  .proclaimedEmergency h

theorem section217DeclarationTrigger_intro_war {c : ComplaintText}
    (h : TimeOfWar c) : Section217DeclarationTrigger c :=
  .war h

theorem section217DeclarationTrigger_intro_nationalDefenseEmergency {c : ComplaintText}
    (h : EmergencyInvolvingNationalDefenseProclaimedByPresident c) :
    Section217DeclarationTrigger c :=
  .nationalDefenseEmergency h

theorem section217MilitaryServiceDeclaration_intro {c : ComplaintText}
    (hTrigger : Section217DeclarationTrigger c)
    (hOrder : PresidentDeclaredCorpsMilitaryServiceByExecutiveOrder c)
    (hPeriod : WithinPeriodPrescribedByPresident c) : Section217MilitaryServiceDeclaration c :=
  ⟨hTrigger, hOrder, hPeriod⟩

theorem section217UcmjJurisdiction_intro {p : Person} {c : ComplaintText}
    (hOfficer : IsCommissionedOfficerOfService p c)
    (hDeclaration : Section217MilitaryServiceDeclaration c)
    (hRegs : SubjectToUcmjUnderPresidentialRegulations p c) : Section217UcmjJurisdiction p c :=
  ⟨hOfficer, hDeclaration, hRegs⟩

theorem section217UcmjJurisdictionDefect_intro_noDeclaration {p : Person} {c : ComplaintText}
    (h : ¬ Section217MilitaryServiceDeclaration c) : Section217UcmjJurisdictionDefect p c :=
  .noDeclaration h

theorem section217UcmjJurisdictionDefect_intro_notPrescribed {p : Person} {c : ComplaintText}
    (h : ¬ SubjectToUcmjUnderPresidentialRegulations p c) :
    Section217UcmjJurisdictionDefect p c :=
  .notPrescribed h

theorem section217UcmjJurisdictionChallenge_intro {p : Person} {c : ComplaintText}
    (hOfficer : IsCommissionedOfficerOfService p c)
    (hDefect : Section217UcmjJurisdictionDefect p c) :
    Section217UcmjJurisdictionChallenge p c :=
  ⟨hOfficer, hDefect⟩



theorem section217aAppointment_intro {p : Person} {ab : AdvisoryBody} {c : ComplaintText}
    (hAppointed : AppointedToAdvisoryBodyBySecretary p ab c)
    (hNotCompetitive : AppointedWithoutRegardToCompetitiveServiceProvisions p c)
    (hPurpose : AdvisoryBodyAdvisesSecretaryInConnectionWithHisFunctions ab c) :
    Section217aAppointment p ab c :=
  ⟨hAppointed, hNotCompetitive, hPurpose⟩

theorem section217aCompensationEntitlement_intro
    {p : Person} {ab : AdvisoryBody} {c : ComplaintText}
    (hAppt : Section217aAppointment p ab c)
    (hNotFullTime : ¬ IsRegularFullTimeEmployeeOfUnitedStates p c)
    (hService : AttendedAdvisoryBodyMeetingOrEngagedOnItsBusiness p ab c)
    (hCap : WithinGs18DailyEquivalentCap p c) : Section217aCompensationEntitlement p ab c :=
  ⟨hAppt, hNotFullTime, hService, hCap⟩

theorem section217aDelegation_intro {ab : AdvisoryBody} {c : ComplaintText}
    (hDelegated : AdvisoryFunctionsDelegatedBySecretary ab c)
    (hGrants : DelegatedFunctionsRelateToResearchOrTrainingGrantsInAid ab c)
    (hAppropriate : SecretaryDeterminedDelegationAppropriate ab c) :
    Section217aDelegation ab c :=
  ⟨hDelegated, hGrants, hAppropriate⟩



theorem section217a1CoveredCommittee_intro_publicHealthServiceAct
    {ab : AdvisoryBody} {c : ComplaintText}
    (h : IsAdvisoryCommitteeImplementingPublicHealthServiceAct ab c) :
    Section217a1CoveredCommittee ab c :=
  .publicHealthServiceAct h

theorem section217a1CoveredCommittee_intro_alcoholAbuseAct
    {ab : AdvisoryBody} {c : ComplaintText}
    (h : IsAdvisoryCommitteeImplementingAlcoholAbuseAct ab c) :
    Section217a1CoveredCommittee ab c :=
  .alcoholAbuseAct h

theorem section217a1PoliticalAffiliationClaim_intro
    {p : Person} {ab : AdvisoryBody} {c : ComplaintText}
    (hCovered : Section217a1CoveredCommittee ab c)
    (hConsidered : PoliticalAffiliationConsideredInAppointment p ab c) :
    Section217a1PoliticalAffiliationClaim p ab c :=
  ⟨hCovered, hConsidered⟩

end Proving.USC.T42.Ch6ASchI.Reearn.Elements
