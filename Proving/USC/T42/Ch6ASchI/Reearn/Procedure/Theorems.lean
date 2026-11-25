







import Proving.USC.Common.Types
import Proving.USC.T42.Ch6ASchI.Reearn.Procedure.Types
import Proving.USC.T42.Ch6ASchI.Reearn.Procedure.Predicates
import Proving.USC.T42.Ch6ASchI.Reearn.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reearn.Procedure

open Proving.USC.Common



theorem timelyHemophiliaSettlementRelease_intro
    {r : SettlementRelease} {c : ComplaintText}
    (hLieu : ReleaseEnteredInLieuOfClassSettlement r c)
    (hSigned : ReleaseSignedByAllAffectedParties r c)
    (hWindow : WithinReleaseSigningWindow r) :
    TimelyHemophiliaSettlementRelease r c :=
  ⟨hLieu, hSigned, hWindow⟩



theorem validOrganizationalUnitChange_intro
    {u : OrganizationalChange} {c : ComplaintText}
    (hProposed : OrganizationalUnitChangeProposed u c)
    (hApproved : SecretaryApprovedOrganizationalUnitChange u c) :
    ValidOrganizationalUnitChange u c :=
  ⟨hProposed, hApproved⟩



theorem validCorpsAppointment_intro
    {n : Nominee} {d : EmergencyDeclaration} {c : ComplaintText}
    (hCitizen : IsUnitedStatesCitizen n c)
    (hPresident : AppointedByPresident n c)
    (hExam : AppointmentExaminationPassed n c)
    (hAge : AgeFortyFourBarCleared n ∨
            SurgeonGeneralFoundExceptionalQualifications n c ∨
            CommissionedCorpsDeclaredMilitaryService d c)
    (hSeal : CommissionIssuedBySecretaryUnderDepartmentSeal n c) :
    ValidCorpsAppointment n d c :=
  ⟨hCitizen, hPresident, hExam, hAge, hSeal⟩

theorem validRegularCorpsOriginalAppointment_intro
    {n : Nominee} {e : ExaminationRecord} {c : ComplaintText}
    (hTrack : OriginalAppointmentToRegularCorps n c)
    (hRegs : ExaminationGivenUnderPresidentialRegulations e c)
    (hExam : AppointmentExaminationPassed n c) :
    ValidRegularCorpsOriginalAppointment n e c :=
  ⟨hTrack, hRegs, hExam⟩

theorem withinOriginalAppointmentQuota_intro
    {n : Nominee} {y : AppointmentCycle} {c : ComplaintText}
    (hCharged : NominationTransmittedToSenateInFiscalYear n y c)
    (hQuota : WithinTenPerCentumAboveSeniorAssistantLimit y) :
    WithinOriginalAppointmentQuota n y c :=
  ⟨hCharged, hQuota⟩

theorem validOsteopathyGraduateAppointment_intro
    {n : Nominee} {d : EmergencyDeclaration} {c : ComplaintText}
    (hGrad : EligibleOsteopathyGraduate n c)
    (hAppt : ValidCorpsAppointment n d c) :
    ValidOsteopathyGraduateAppointment n d c :=
  ⟨hGrad, hAppt⟩

theorem timelyReappointmentWithoutExamination_intro
    {n : Nominee} {c : ComplaintText}
    (hFiled : FormerOfficerReappointmentApplicationFiled n c)
    (hWithin : ReappointmentApplicationWithinTwoYears n)
    (hStandards : MeetsSecretaryPrescribedReappointmentStandards n c) :
    TimelyReappointmentWithoutExamination n c :=
  ⟨hFiled, hWithin, hStandards⟩

theorem validReadyReserveActivation_intro
    {n : Nominee} {o : CorpsOfficer} {c : ComplaintText}
    (hReserve : OriginalAppointmentToReadyReserveCorps n c)
    (hCalled : CalledToActiveDutyBySurgeonGeneral o c) :
    ValidReadyReserveActivation n o c :=
  ⟨hReserve, hCalled⟩



theorem readinessComplianceCycle_intro
    {o : CorpsOfficer} {k : ReadinessCycle} {c : ComplaintText}
    (hReqs : ReadinessRequirementsEstablishedBySecretary k c)
    (hDet : AnnualReadinessDeterminationMade o k c)
    (hCycle : WithinAnnualReadinessCycle o)
    (hMeets : MeetsReadinessRequirements o k c) :
    ReadinessComplianceCycle o k c :=
  ⟨hReqs, hDet, hCycle, hMeets⟩

theorem subjectToReadinessDiscipline_intro
    {o : CorpsOfficer} {k : ReadinessCycle} {c : ComplaintText}
    (hReqs : ReadinessRequirementsEstablishedBySecretary k c)
    (hDefault : ¬ MeetsReadinessRequirements o k c ∨ FailedToComplyWithDeploymentOrder o c)
    (hNoWaiver : ¬ ReadinessRequirementWaiverGranted o c)
    (hProcedures : DisciplinaryProceduresEstablishedBySecretary c) :
    SubjectToReadinessDiscipline o k c :=
  ⟨hReqs, hDefault, hNoWaiver, hProcedures⟩

theorem deploymentMachineryEstablished_intro
    {p : Person} {c : ComplaintText}
    (hUnits : RapidDeploymentUnitsOrganized c)
    (hRegs : WaiverRegulationsPromulgated c)
    (hDelegation : DelegationExcludesRulemaking p c) :
    DeploymentMachineryEstablished p c :=
  ⟨hUnits, hRegs, hDelegation⟩



theorem validSurgeonGeneralAppointment_intro
    {n : Nominee} {c : ComplaintText}
    (hNom : SurgeonGeneralNominatedByPresident n c)
    (hConsent : SenateAdviceAndConsentGiven n c)
    (hRegular : AppointedFromRegularCorps n c)
    (hQualified : HasSpecializedPublicHealthTrainingOrExperience n c) :
    ValidSurgeonGeneralAppointment n c :=
  ⟨hNom, hConsent, hRegular, hQualified⟩

theorem surgeonGeneralReversion_intro
    {o : CorpsOfficer} {c : ComplaintText}
    (hExpired : SurgeonGeneralTermExpired o)
    (hNotReappointed : ¬ SurgeonGeneralReappointed o c)
    (hReverted : RevertedToPriorGradeAndNumber o c) :
    SurgeonGeneralReversion o c :=
  ⟨hExpired, hNotReappointed, hReverted⟩

theorem surgeonGeneralSuccessionChainEstablished_intro
    {o : CorpsOfficer} {c : ComplaintText}
    (hDeputy : DeputySurgeonGeneralAssigned o c)
    (hActing : ActingSurgeonGeneralDesignated o c) :
    SurgeonGeneralSuccessionChainEstablished o c :=
  ⟨hDeputy, hActing⟩

theorem validSpecialTemporaryPositionCreation_intro
    {t : PositionRoster} {c : ComplaintText}
    (hCreated : SpecialTemporaryPositionCreatedWithSecretaryApproval t c)
    (hCeiling : WithinOnePerCentumTemporaryPositionLimit t) :
    ValidSpecialTemporaryPositionCreation t c :=
  ⟨hCreated, hCeiling⟩

theorem lawfulTemporaryPositionOverage_intro
    {t : PositionRoster} {c : ComplaintText}
    (hOver : ¬ WithinOnePerCentumTemporaryPositionLimit t)
    (hCure : WithinOneYearTemporaryPositionReductionPeriod t)
    (hAttrition : TemporaryPositionReducedOnlyByAttrition t c) :
    LawfulTemporaryPositionOverage t c :=
  ⟨hOver, hCure, hAttrition⟩

theorem validGradeMaximaRegulation_intro
    {a : AppropriationAct} {t : PositionRoster} {c : ComplaintText}
    (hAppropriation : AppropriationActFixingAuthorizedStrengthEnacted a c)
    (hRegs : GradeMaximaRegulationsPrescribed a c)
    (hLimit : WithinOneHalfMajorGeneralLimit t) :
    ValidGradeMaximaRegulation a t c :=
  ⟨hAppropriation, hRegs, hLimit⟩



theorem validNoncompetitiveResearchAppointment_intro
    {n : Nominee} {c : ComplaintText}
    (hOpm : OfficeOfPersonnelManagementApprovedQualifications n c) :
    ValidNoncompetitiveResearchAppointment n c :=
  ⟨hOpm⟩

theorem validLeaveGrant_intro
    {l : LeaveAccount} {c : ComplaintText}
    (hRegs : LeaveGrantedUnderPresidentialRegulations l c)
    (hCap : WithinAccumulatedAnnualLeaveCap l) :
    ValidLeaveGrant l c :=
  ⟨hRegs, hCap⟩

theorem validCategoryReassignment_originalErroneous_intro
    {o : CorpsOfficer} {c : ComplaintText}
    (hAssigned : ProfessionalCategoryAssignmentMade o c)
    (hErroneous : CategoryAssignmentFoundErroneous o c) :
    ValidCategoryReassignment o c :=
  ValidCategoryReassignment.originalErroneous hAssigned hErroneous

theorem validCategoryReassignment_qualifiedTransferRequest_intro
    {o : CorpsOfficer} {c : ComplaintText}
    (hAssigned : ProfessionalCategoryAssignmentMade o c)
    (hQualified : EquallyQualifiedForRequestedCategoryTransfer o c) :
    ValidCategoryReassignment o c :=
  ValidCategoryReassignment.qualifiedTransferRequest hAssigned hQualified



theorem validLengthOfServicePromotion_intro
    {o : CorpsOfficer} {m : PromotionAction} {e : ExaminationRecord} {c : ComplaintText}
    (hPresident : PermanentPromotionMadeByPresident m c)
    (hNext : PromotionToNextHigherGrade m c)
    (hRegs : ExaminationGivenUnderPresidentialRegulations e c)
    (hExam : PromotionExaminationPassed m c)
    (hRipe : LengthOfServicePromotionRipe o c) :
    ValidLengthOfServicePromotion o m e c :=
  ⟨hPresident, hNext, hRegs, hExam, hRipe⟩

theorem compliantCompetitiveExamination_intro
    {e : ExaminationRecord} {c : ComplaintText}
    (hCompetitive : PromotionExaminationIsCompetitive e c)
    (hCovered : ExaminationForLengthOfServiceOrUnrestrictedVacancy e c)
    (hFloor : WithinEightyPerCentumRecommendationFloor e) :
    CompliantCompetitiveExamination e c :=
  ⟨hCompetitive, hCovered, hFloor⟩

theorem validRestrictedGradePromotion_intro
    {o : CorpsOfficer} {m : PromotionAction} {c : ComplaintText}
    (hRestricted : GradeIsRestricted m c)
    (hVacancy : VacancyExistsInGrade m c)
    (hOneYear : OneYearInNextLowerGradeSatisfied o) :
    ValidRestrictedGradePromotion o m c :=
  ⟨hRestricted, hVacancy, hOneYear⟩

theorem promotionDeemedAccepted_intro
    {o : CorpsOfficer} {m : PromotionAction} {c : ComplaintText}
    (hPromoted : PermanentPromotionMadeByPresident m c)
    (hNotDeclined : ¬ PromotionExpresslyDeclined o c) :
    PromotionDeemedAccepted o m c :=
  ⟨hPromoted, hNotDeclined⟩

theorem separationForPromotionFailure_twiceExamined_intro
    {o : CorpsOfficer} {s : SeparationAction} {c : ComplaintText}
    (hTwice : TwiceExamined o)
    (hFailed : FailedToBePromoted o c)
    (hPay : SeparationPayTendered s c) :
    SeparationForPromotionFailure o s c :=
  SeparationForPromotionFailure.twiceExaminedAndPassedOver hTwice hFailed hPay

theorem separationForPromotionFailure_refusedExamination_intro
    {o : CorpsOfficer} {s : SeparationAction} {c : ComplaintText}
    (hRefused : RefusedToTakePromotionExamination o c) :
    SeparationForPromotionFailure o s c :=
  SeparationForPromotionFailure.refusedExamination hRefused

theorem separationForPromotionFailure_threeYearReview_intro
    {o : CorpsOfficer} {s : SeparationAction} {c : ComplaintText}
    (hDue : ThreeYearRecordReviewDue o)
    (hConducted : ThreeYearRecordReviewConducted o c)
    (hNotQualified : FoundNotQualifiedForFurtherService o c)
    (hPay : SeparationPayTendered s c) :
    SeparationForPromotionFailure o s c :=
  SeparationForPromotionFailure.threeYearReviewFailure hDue hConducted hNotQualified hPay

theorem internshipPromotionCreditAllowed_intro
    {o : CorpsOfficer} {c : ComplaintText}
    (hInternship : CompletedMedicalInternshipOnAppointmentDate o c)
    (hContinuous : ContinuousServiceSinceAppointment o c)
    (hNoDuplicate : ¬ SimilarInternshipCreditReceivedUnderOtherLaw o c) :
    InternshipPromotionCreditAllowed o c :=
  ⟨hInternship, hContinuous, hNoDuplicate⟩



theorem retirementEligibility_ageSixtyFour_intro
    {o : CorpsOfficer} {c : ComplaintText}
    (h : AgeSixtyFourRetirementEligible o) : RetirementEligibility o c :=
  RetirementEligibility.ageSixtyFour h

theorem retirementEligibility_thirtyYears_intro
    {o : CorpsOfficer} {c : ComplaintText}
    (h : ThirtyYearRetirementEligible o) : RetirementEligibility o c :=
  RetirementEligibility.thirtyYears h

theorem retirementEligibility_twentyYears_intro
    {o : CorpsOfficer} {c : ComplaintText}
    (h : TwentyYearRetirementEligible o) : RetirementEligibility o c :=
  RetirementEligibility.twentyYears h

theorem retirementEligibility_seniorVoluntary_intro
    {o : CorpsOfficer} {c : ComplaintText}
    (h : SeniorOfficerVoluntaryRetirementEligible o) : RetirementEligibility o c :=
  RetirementEligibility.seniorVoluntary h

theorem validRetirementAction_intro
    {o : CorpsOfficer} {r : RetirementAction} {c : ComplaintText}
    (hEligible : RetirementEligibility o c)
    (hTrigger : RetirementApplicationFiled r c ∨ RetirementOrderedBySecretary r c)
    (hEffective : RetirementEffectiveFirstDayOfMonth r c) :
    ValidRetirementAction o r c :=
  ⟨hEligible, hTrigger, hEffective⟩

theorem validSeniorVoluntaryRetirement_intro
    {o : CorpsOfficer} {r : RetirementAction} {c : ComplaintText}
    (hEligible : SeniorOfficerVoluntaryRetirementEligible o)
    (hApproval : PresidentialApprovalOfVoluntaryRetirement r c) :
    ValidSeniorVoluntaryRetirement o r c :=
  ⟨hEligible, hApproval⟩

theorem validConsensualRecall_intro
    {o : CorpsOfficer} {c : ComplaintText}
    (hNotPassedOver : ¬ RetiredForFailureOfPromotionToSeniorGrade o c)
    (hConsent : RecalledToActiveDutyWithConsent o c) :
    ValidConsensualRecall o c :=
  ⟨hNotPassedOver, hConsent⟩

theorem militaryBenefitsEntitlement_intro
    {o : CorpsOfficer} {d : EmergencyDeclaration} {c : ComplaintText}
    (hService : ServedInTimeOfWar o c ∨ DetailedForDutyWithArmedForces o c ∨
                ServicePartOfMilitaryForcesByExecutiveOrder d c)
    (hAuthority : SecretaryOrDesigneeExercisedTitleTenAuthority o c) :
    MilitaryBenefitsEntitlement o d c :=
  ⟨hService, hAuthority⟩

theorem flagPresentationDue_intro
    {o : CorpsOfficer} {f : FlagPresentation} {c : ComplaintText}
    (hReleased : ReleasedFromActiveCommissionedServiceForRetirement o c)
    (hNotPrevious : ¬ FlagPreviouslyPresented o c)
    (hPresented : FlagPresentedBySecretary f c)
    (hNoCost : FlagPresentedAtNoCostToRecipient f c) :
    FlagPresentationDue o f c :=
  ⟨hReleased, hNotPrevious, hPresented, hNoCost⟩



theorem validInterdepartmentalDetail_intro
    {d : DetailAssignment} {c : ComplaintText}
    (hRequested : DetailRequestedByExecutiveDepartmentHead d c)
    (hTerms : DetailTermsAgreedBySecretaryAndRequester d c)
    (hLaws : DetaileeSubjectToLawsOfReceivingService d c) :
    ValidInterdepartmentalDetail d c :=
  ⟨hRequested, hTerms, hLaws⟩

theorem validStateDetail_intro
    {d : DetailAssignment} {c : ComplaintText}
    (hRequested : DetailRequestedByStateHealthAuthority d c)
    (hReimbursement : ReimbursementAgreementExecuted d c) :
    ValidStateDetail d c :=
  ⟨hRequested, hReimbursement⟩

theorem validEmergencyDeploymentDirection_intro
    {d : DetailAssignment} {c : ComplaintText}
    (hNeed : UrgentOrEmergencyPublicHealthCareNeedExists c)
    (hAuthority : SecretaryExercisedSoleDeploymentAuthority d c ∨
                  DeploymentAuthorityExceptionApplies d c) :
    ValidEmergencyDeploymentDirection d c :=
  ⟨hNeed, hAuthority⟩

theorem militaryServiceDeclarationInEffect_intro
    {o : CorpsOfficer} {d : EmergencyDeclaration} {c : ComplaintText}
    (hWar : WarOrProclaimedEmergencyInEffect d c)
    (hOrder : ExecutiveOrderDeclaringMilitaryServiceIssued d c)
    (hPeriod : WithinPeriodPrescribedByPresident d c)
    (hUcmj : SubjectToUniformCodeOfMilitaryJustice o d c) :
    MilitaryServiceDeclarationInEffect o d c :=
  ⟨hWar, hOrder, hPeriod, hUcmj⟩

theorem validAdvisoryCouncilAppointment_intro
    {b : AdvisoryBody} {n : Nominee} {c : ComplaintText}
    (hAppointed : AdvisoryCouncilAppointedBySecretary b c)
    (hPeriod : AdvisoryCouncilPeriodCommencementDateSpecified b c)
    (hApolitical : AppointedWithoutRegardToPoliticalAffiliation n c) :
    ValidAdvisoryCouncilAppointment b n c :=
  ⟨hAppointed, hPeriod, hApolitical⟩

theorem validAdvisoryFunctionDelegation_intro
    {b : AdvisoryBody} {c : ComplaintText}
    (hAppointed : AdvisoryCouncilAppointedBySecretary b c)
    (hDelegated : AdvisoryFunctionsDelegated b c) :
    ValidAdvisoryFunctionDelegation b c :=
  ⟨hAppointed, hDelegated⟩



theorem commissionedCorpsCareerPath_reachable
    {n : Nominee} {o : CorpsOfficer} {m : PromotionAction} {e : ExaminationRecord}
    {r : RetirementAction} {d : EmergencyDeclaration} {c : ComplaintText}
    (hAppt : ValidCorpsAppointment n d c)
    (hActive : ValidReadyReserveActivation n o c)
    (hPromo : ValidLengthOfServicePromotion o m e c)
    (hRetire : ValidRetirementAction o r c) :
    ReachableVia (commissionedCorpsCareerPath n o m e r d c)
      CommissionStage.Nominated CommissionStage.Retired :=
  .cons rfl hAppt (.cons rfl hActive (.cons rfl hPromo (.cons rfl hRetire .nil)))

theorem separationPath_reachable
    {n : Nominee} {o : CorpsOfficer} {s : SeparationAction}
    {d : EmergencyDeclaration} {c : ComplaintText}
    (hAppt : ValidCorpsAppointment n d c)
    (hActive : ValidReadyReserveActivation n o c)
    (hSep : SeparationForPromotionFailure o s c) :
    ReachableVia (separationPath n o s d c)
      CommissionStage.Nominated CommissionStage.Separated :=
  .cons rfl hAppt (.cons rfl hActive (.cons rfl hSep .nil))

end Proving.USC.T42.Ch6ASchI.Reearn.Procedure
