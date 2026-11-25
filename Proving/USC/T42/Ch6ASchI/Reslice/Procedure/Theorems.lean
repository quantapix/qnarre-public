















import Proving.USC.T42.Ch6ASchI.Reslice.Procedure.Types
import Proving.USC.T42.Ch6ASchI.Reslice.Procedure.Predicates
import Proving.USC.T42.Ch6ASchI.Reslice.Procedure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reslice.Procedure

open Proving.USC.Common





theorem councilOrganizedWithinOneHundredTwentyDays_of_days
    {co : AdvisoryCouncil} {c : ComplaintText} {n : Nat}
    (h : daysFromJuly291975ToCouncilOrganization co c = n) (hle : n ≤ 120) :
    CouncilOrganizedWithinOneHundredTwentyDays co c := by
  have hgoal : daysFromJuly291975ToCouncilOrganization co c ≤ 120 := by omega
  exact hgoal



theorem councilCompositionQuotasSatisfied_of_counts
    {co : AdvisoryCouncil} {c : ComplaintText}
    (h1 : councilMemberCount co c = 15)
    (h2 : 12 ≤ councilGoverningBoardMemberCount co c)
    (h3 : 9 ≤ councilBoardMembersServedByCenterCount co c)
    (h4 : councilHealthQualifiedMemberCount co c = 3) :
    CouncilCompositionQuotasSatisfied co c :=
  ⟨h1, h2, h3, h4⟩


theorem section218CouncilConstitution_intro
    {co : AdvisoryCouncil} {c : ComplaintText}
    (hAppointed : SecretaryAppointedMigrantHealthCouncil co c)
    (hTimely : CouncilOrganizedWithinOneHundredTwentyDays co c)
    (hComposition : CouncilCompositionQuotasSatisfied co c) :
    Section218CouncilConstitution co c :=
  ⟨hAppointed, hTimely, hComposition⟩



theorem vacancyTermRunsToPredecessorExpiration_of_days
    {m : CouncilMember} {c : ComplaintText} {d : Nat}
    (h1 : vacancyAppointeeTermExpirationDay m c = d)
    (h2 : predecessorTermExpirationDay m c = d) :
    VacancyTermRunsToPredecessorExpiration m c := by
  have hgoal : vacancyAppointeeTermExpirationDay m c
      = predecessorTermExpirationDay m c := by omega
  exact hgoal


theorem section218VacancyAppointment_intro
    {m : CouncilMember} {c : ComplaintText}
    (hVacancy : CouncilMemberAppointedToFillVacancy m c)
    (hRemainder : VacancyTermRunsToPredecessorExpiration m c) :
    Section218VacancyAppointment m c :=
  ⟨hVacancy, hRemainder⟩




theorem centralServiceAuthorizationComplete_intro
    {t : ServiceAndSupplyTransaction} {c : ComplaintText}
    (hDetermined : SurgeonGeneralDeterminedCentralService t c)
    (hApproved : SecretaryApprovedCentralServiceDetermination t c) :
    CentralServiceAuthorizationComplete t c :=
  ⟨hDetermined, hApproved⟩


theorem section231ReimbursementOccasion_onPerformance_intro
    {t : ServiceAndSupplyTransaction} {c : ComplaintText}
    (hPerformed : ServicesPerformedOrStockFurnished t c)
    (hReimbursed : ServiceAndSupplyFundReimbursed t c) :
    Section231ReimbursementOccasion t c :=
  .onPerformance hPerformed hReimbursed


theorem section231ReimbursementOccasion_inAdvance_intro
    {t : ServiceAndSupplyTransaction} {c : ComplaintText}
    (hAdvance : ReimbursementMadeInAdvanceOfPerformance t c)
    (hReimbursed : ServiceAndSupplyFundReimbursed t c) :
    Section231ReimbursementOccasion t c :=
  .inAdvance hAdvance hReimbursed


theorem section231ReimbursementProper_intro
    {t : ServiceAndSupplyTransaction} {c : ComplaintText}
    (hAuthorized : CentralServiceAuthorizationComplete t c)
    (hOccasion : Section231ReimbursementOccasion t c)
    (hRate : ReimbursementRateCoversStatutoryCostComponents t c) :
    Section231ReimbursementProper t c :=
  ⟨hAuthorized, hOccasion, hRate⟩





theorem processDeliveredWithinPrescribedTime_of_days
    {a : CivilAction} {c : ComplaintText} {d w : Nat}
    (hd : daysFromServiceOfProcessToDelivery a c = d)
    (hw : attorneyGeneralPrescribedDeliveryDays a c = w)
    (hle : d ≤ w) : ProcessDeliveredWithinPrescribedTime a c := by
  have hgoal : daysFromServiceOfProcessToDelivery a c
      ≤ attorneyGeneralPrescribedDeliveryDays a c := by omega
  exact hgoal


theorem section233ProcessTransmittal_intro
    {a : CivilAction} {c : ComplaintText}
    (hSuit : CivilActionBroughtAgainstDeemedPerson a c)
    (hDelivered : ProcessDeliveredToImmediateSuperiorOrDesignee a c)
    (hWindow : ProcessDeliveredWithinPrescribedTime a c)
    (hCopies : CopiesOfPleadingFurnishedToFederalOfficers a c) :
    Section233ProcessTransmittal a c :=
  ⟨hSuit, hDelivered, hWindow, hCopies⟩


theorem section233FederalDefense_intro
    {a : CivilAction} {c : ComplaintText}
    (hTransmittal : Section233ProcessTransmittal a c)
    (hDefended : AttorneyGeneralDefendedAction a c) :
    Section233FederalDefense a c :=
  ⟨hTransmittal, hDefended⟩



theorem removalOccurredBeforeTrial_of_days
    {a : CivilAction} {c : ComplaintText} {r t : Nat}
    (hr : removalFilingDay a c = r) (ht : trialCommencementDay a c = t)
    (hlt : r < t) : RemovalOccurredBeforeTrial a c := by
  have hgoal : removalFilingDay a c < trialCommencementDay a c := by omega
  exact hgoal


theorem section233RemovalProper_intro
    {a : CivilAction} {c : ComplaintText}
    (hState : ActionCommencedInStateCourt a c)
    (hCert : AttorneyGeneralCertifiedScopeOfEmployment a c)
    (hBefore : RemovalOccurredBeforeTrial a c)
    (hBond : RemovalEffectedWithoutBond a c) :
    Section233RemovalProper a c :=
  ⟨hState, hCert, hBefore, hBond⟩



theorem compensationClaimTimelyAfterSuspension_of_days
    {a : CivilAction} {c : ComplaintText} {base pend filed : Nat}
    (hb : compensationClaimLimitationsDeadlineDay a c = base)
    (hp : civilActionPendencyDays a c = pend)
    (hf : compensationClaimFilingDay a c = filed)
    (hle : filed ≤ base + pend) :
    CompensationClaimTimelyAfterSuspension a c := by
  have hgoal : compensationClaimFilingDay a c
      ≤ compensationClaimLimitationsDeadlineDay a c
        + civilActionPendencyDays a c := by omega
  exact hgoal


theorem section233PostRemovalDisposition_retained_intro
    {a : CivilAction} {c : ComplaintText}
    (hRemedy : FtcaRemedyAvailableAgainstUnitedStates a c) :
    Section233PostRemovalDisposition a c :=
  .retainedAsFederalTortAction hRemedy


theorem section233PostRemovalDisposition_remanded_intro
    {a : CivilAction} {c : ComplaintText}
    (hHearing : RemandMotionHeardBeforeTrialOnMerits a c)
    (hNoRemedy : ¬ FtcaRemedyAvailableAgainstUnitedStates a c)
    (hNoPreclusion : ¬ AlternativeCompensationRemedyPrecludesSuit a c) :
    Section233PostRemovalDisposition a c :=
  .remandedToStateCourt hHearing hNoRemedy hNoPreclusion



theorem section233PostRemovalDisposition_dismissed_intro
    {a : CivilAction} {c : ComplaintText}
    (hHearing : RemandMotionHeardBeforeTrialOnMerits a c)
    (hNoRemedy : ¬ FtcaRemedyAvailableAgainstUnitedStates a c)
    (hPreclusion : AlternativeCompensationRemedyPrecludesSuit a c)
    (hSuspended : CompensationClaimTimelyAfterSuspension a c) :
    Section233PostRemovalDisposition a c :=
  .dismissedWithLimitationsSuspended hHearing hNoRemedy hPreclusion hSuspended


theorem secretaryDeterminedWithinThirtyDays_of_days
    {ap : DeemingApplication} {c : ComplaintText} {n : Nat}
    (h : daysFromDeemingApplicationReceiptToDetermination ap c = n)
    (hle : n ≤ 30) : SecretaryDeterminedWithinThirtyDays ap c := by
  have hgoal : daysFromDeemingApplicationReceiptToDetermination ap c ≤ 30 := by
    omega
  exact hgoal


theorem subsectionHPrerequisitesMet_intro
    {ap : DeemingApplication} {c : ComplaintText}
    (hPolicies : EntityRiskManagementPoliciesImplemented ap c)
    (hCredentials : EntityProfessionalCredentialsVerified ap c)
    (hHistory : EntityClaimsHistoryAcceptable ap c)
    (hCooperate : EntityWillCooperateWithAttorneyGeneral ap c) :
    SubsectionHPrerequisitesMet ap c :=
  ⟨hPolicies, hCredentials, hHistory, hCooperate⟩


theorem section233DeemingDetermination_intro
    {ap : DeemingApplication} {c : ComplaintText}
    (hApplied : DeemingApplicationSubmittedToSecretary ap c)
    (hPrereq : SubsectionHPrerequisitesMet ap c)
    (hTimely : SecretaryDeterminedWithinThirtyDays ap c)
    (hApproved : SecretaryApprovedDeemingApplication ap c) :
    Section233DeemingDetermination ap c :=
  ⟨hApplied, hPrereq, hTimely, hApproved⟩


theorem section233ExclusionGround_policyNoncompliance_intro
    {x : Person} {c : ComplaintText}
    (h : PractitionerNoncompliantWithEntityPolicies x c) :
    Section233ExclusionGround x c :=
  .policyNoncompliance h


theorem section233ExclusionGround_claimsHistory_intro
    {x : Person} {c : ComplaintText}
    (h : PractitionerClaimsHistoryOutsideNorm x c) :
    Section233ExclusionGround x c :=
  .claimsHistory h


theorem section233ExclusionGround_refusalToCooperate_intro
    {x : Person} {c : ComplaintText}
    (h : PractitionerRefusedToCooperateInDefense x c) :
    Section233ExclusionGround x c :=
  .refusalToCooperate h


theorem section233ExclusionGround_falseInformation_intro
    {x : Person} {c : ComplaintText}
    (h : PractitionerProvidedFalseInformation x c) :
    Section233ExclusionGround x c :=
  .falseInformation h


theorem section233ExclusionGround_disciplinaryAction_intro
    {x : Person} {c : ComplaintText}
    (h : PractitionerSubjectToDisciplinaryAction x c) :
    Section233ExclusionGround x c :=
  .disciplinaryAction h


theorem section233IndividualExclusion_intro
    {x : Person} {c : ComplaintText}
    (hRecord : ExclusionDeterminationMadeOnTheRecord x c)
    (hHearing : NoticeAndFullAndFairHearingAfforded x c)
    (hGround : Section233ExclusionGround x c)
    (hNotice : ExclusionNoticeReceivedByEntity x c) :
    Section233IndividualExclusion x c :=
  ⟨hRecord, hHearing, hGround, hNotice⟩



theorem exclusionReachesActOrOmission_of_days
    {x : Person} {c : ComplaintText} {n d : Nat}
    (hn : exclusionNoticeReceiptDay x c = n)
    (hd : challengedActOrOmissionDay x c = d)
    (hlt : n < d) : ExclusionReachesActOrOmission x c := by
  have hgoal : exclusionNoticeReceiptDay x c
      < challengedActOrOmissionDay x c := by omega
  exact hgoal


theorem section233ExclusionEffective_intro
    {x : Person} {c : ComplaintText}
    (hDetermined : Section233IndividualExclusion x c)
    (hProspective : ExclusionReachesActOrOmission x c) :
    Section233ExclusionEffective x c :=
  ⟨hDetermined, hProspective⟩



theorem attorneyGeneralAppearanceTimely_of_days
    {a : CivilAction} {c : ComplaintText} {n : Nat}
    (hAppeared : AttorneyGeneralAppearedInStateCourt a c)
    (h : daysFromStateCourtNotificationToAppearance a c = n)
    (hle : n ≤ 15) : AttorneyGeneralAppearanceTimely a c := by
  refine ⟨hAppeared, ?_⟩
  omega




theorem attorneyGeneralFailedToAppearTimely_of_days
    {a : CivilAction} {c : ComplaintText} {n : Nat}
    (h : daysFromStateCourtNotificationToAppearance a c = n)
    (hgt : 15 < n) : AttorneyGeneralFailedToAppearTimely a c :=
  Or.inr (by omega)



theorem attorneyGeneralFailedToAppearTimely_of_absence
    {a : CivilAction} {c : ComplaintText}
    (h : ¬ AttorneyGeneralAppearedInStateCourt a c) :
    AttorneyGeneralFailedToAppearTimely a c :=
  Or.inl h


theorem section233AdviceSatisfiesCertification_intro
    {a : CivilAction} {c : ComplaintText}
    (hTimely : AttorneyGeneralAppearanceTimely a c)
    (hCert : AttorneyGeneralCertifiedScopeOfEmployment a c) :
    Section233AdviceSatisfiesCertification a c :=
  ⟨hTimely, hCert⟩


theorem section233RemovalOnPetition_intro
    {a : CivilAction} {c : ComplaintText}
    (hFailure : AttorneyGeneralFailedToAppearTimely a c)
    (hPetition : PetitionForRemovalFiledByNamedParty a c)
    (hStayed : ProceedingStayedPendingForumDetermination a c)
    (hOrder : CourtIssuedForumDeterminationOrder a c) :
    Section233RemovalOnPetition a c :=
  ⟨hFailure, hPetition, hStayed, hOrder⟩


theorem secretaryLapsedTwoHundredFortyDays_of_days
    {r : CompensationRequest} {c : ComplaintText} {n : Nat}
    (h : daysFromCompensationRequestToFinalDetermination r c = n)
    (hgt : 240 < n) : SecretaryLapsedTwoHundredFortyDays r c := by
  have hgoal : 240 < daysFromCompensationRequestToFinalDetermination r c := by
    omega
  exact hgoal


theorem section233ClaimGateway_byExhaustion_intro
    {r : CompensationRequest} {c : ComplaintText}
    (hExhausted : PartCAdministrativeRemediesExhausted r c)
    (hDetermined : SecretaryMadeFinalDeterminationOnCompensationRequest r c) :
    Section233ClaimGateway r c :=
  .byExhaustion hExhausted hDetermined


theorem section233ClaimGateway_byLapse_intro
    {r : CompensationRequest} {c : ComplaintText}
    (hLapse : SecretaryLapsedTwoHundredFortyDays r c)
    (hNoDetermination :
      ¬ SecretaryMadeFinalDeterminationOnCompensationRequest r c) :
    Section233ClaimGateway r c :=
  .byTwoHundredFortyDayLapse hLapse hNoDetermination



theorem smallpoxClaimFiledWithinTolledPeriod_of_days
    {r : CompensationRequest} {c : ComplaintText} {base pend filed : Nat}
    (hb : smallpoxClaimBaseDeadlineDay r c = base)
    (hp : compensationRequestPendencyDays r c = pend)
    (hf : smallpoxClaimFilingDay r c = filed)
    (hle : filed ≤ base + pend) :
    SmallpoxClaimFiledWithinTolledPeriod r c := by
  have hgoal : smallpoxClaimFilingDay r c
      ≤ smallpoxClaimBaseDeadlineDay r c
        + compensationRequestPendencyDays r c := by omega
  exact hgoal


theorem section233ClaimProcedurallyOpen_intro
    {r : CompensationRequest} {a : CivilAction} {c : ComplaintText}
    (hGateway : Section233ClaimGateway r c)
    (hTolled : SmallpoxClaimFiledWithinTolledPeriod r c)
    (hFtca : FtcaAdministrativeExhaustionSatisfied a c) :
    Section233ClaimProcedurallyOpen r a c :=
  ⟨hGateway, hTolled, hFtca⟩


theorem section233SubstitutionForNoncooperation_intro
    {a : CivilAction} {x : Person} {c : ComplaintText}
    (hNoCooperation : ¬ CoveredPersonCooperatedInDefense x c)
    (hFound : CourtFoundFailureToCooperate a c)
    (hSubstituted : CoveredPersonSubstitutedAsPartyDefendant a c) :
    Section233SubstitutionForNoncooperation a x c :=
  ⟨hNoCooperation, hFound, hSubstituted⟩


theorem section233RemandAfterSubstitution_intro
    {a : CivilAction} {x : Person} {c : ComplaintText}
    (hSubstitution : Section233SubstitutionForNoncooperation a x c)
    (hNoJurisdiction : CourtLacksSubjectMatterJurisdiction a c) :
    Section233RemandAfterSubstitution a x c :=
  ⟨hSubstitution, hNoJurisdiction⟩


theorem fundTransferredByDecemberThirtyFirst_of_days
    {fc : FiscalCycle} {c : ComplaintText} {t d : Nat}
    (ht : fiscalTransferDay fc c = t)
    (hd : decemberThirtyFirstDeadlineDay fc c = d)
    (hle : t ≤ d) : FundTransferredByDecemberThirtyFirst fc c := by
  have hgoal : fiscalTransferDay fc c
      ≤ decemberThirtyFirstDeadlineDay fc c := by omega
  exact hgoal


theorem section233FiscalTransferTimely_intro
    {fc : FiscalCycle} {c : ComplaintText}
    (hTransferred : FundTransferredToTreasuryAccounts fc c)
    (hDeadline : FundTransferredByDecemberThirtyFirst fc c) :
    Section233FiscalTransferTimely fc c :=
  ⟨hTransferred, hDeadline⟩


theorem section233Reachable_commenced_intro
    {a : CivilAction} {c : ComplaintText}
    (h : ActionCommencedInStateCourt a c) :
    Section233Reachable a c Stage.commencedInStateCourt :=
  .commenced h


theorem section233Reachable_transmitted_intro
    {a : CivilAction} {c : ComplaintText}
    (hPrev : Section233Reachable a c Stage.commencedInStateCourt)
    (h : Section233ProcessTransmittal a c) :
    Section233Reachable a c Stage.processTransmitted :=
  .transmitted hPrev h


theorem section233Reachable_removedByCertification_intro
    {a : CivilAction} {c : ComplaintText}
    (hPrev : Section233Reachable a c Stage.processTransmitted)
    (h : Section233RemovalProper a c) :
    Section233Reachable a c Stage.removedToDistrictCourt :=
  .removedByCertification hPrev h


theorem section233Reachable_removedOnPetition_intro
    {a : CivilAction} {c : ComplaintText}
    (hPrev : Section233Reachable a c Stage.commencedInStateCourt)
    (h : Section233RemovalOnPetition a c) :
    Section233Reachable a c Stage.removedToDistrictCourt :=
  .removedOnPetition hPrev h


theorem section233Reachable_remanded_intro
    {a : CivilAction} {c : ComplaintText}
    (hPrev : Section233Reachable a c Stage.removedToDistrictCourt)
    (hHearing : RemandMotionHeardBeforeTrialOnMerits a c)
    (hNoRemedy : ¬ FtcaRemedyAvailableAgainstUnitedStates a c)
    (hNoPreclusion : ¬ AlternativeCompensationRemedyPrecludesSuit a c) :
    Section233Reachable a c Stage.remandedToStateCourt :=
  .remanded hPrev hHearing hNoRemedy hNoPreclusion


theorem section233Reachable_dismissed_intro
    {a : CivilAction} {c : ComplaintText}
    (hPrev : Section233Reachable a c Stage.removedToDistrictCourt)
    (hHearing : RemandMotionHeardBeforeTrialOnMerits a c)
    (hNoRemedy : ¬ FtcaRemedyAvailableAgainstUnitedStates a c)
    (hPreclusion : AlternativeCompensationRemedyPrecludesSuit a c)
    (hSuspended : CompensationClaimTimelyAfterSuspension a c) :
    Section233Reachable a c Stage.dismissedForAlternativeRemedy :=
  .dismissed hPrev hHearing hNoRemedy hPreclusion hSuspended





theorem emergencyInitialPeriodWithinNinetyDays_of_days
    {e : EmergencyResponse} {c : ComplaintText} {n : Nat}
    (h : emergencyInitialPeriodDays e c = n) (hle : n ≤ 90) :
    EmergencyInitialPeriodWithinNinetyDays e c := by
  have hgoal : emergencyInitialPeriodDays e c ≤ 90 := by omega
  exact hgoal


theorem section234EmergencyBasis_publicHealthEmergency_intro
    {e : EmergencyResponse} {c : ComplaintText}
    (hDetermination : PublicHealthEmergencyDeterminationInEffect e c)
    (hCap : EmergencyInitialPeriodWithinNinetyDays e c) :
    Section234EmergencyBasis e c :=
  .publicHealthEmergency hDetermination hCap


theorem section234EmergencyBasis_presidentialDeclaration_intro
    {e : EmergencyResponse} {c : ComplaintText}
    (hDeclared : MajorDisasterOrPresidentialEmergencyDeclared e c) :
    Section234EmergencyBasis e c :=
  .presidentialDeclaration hDeclared



theorem actOrOmissionWithinInitialPeriod_of_days
    {e : EmergencyResponse} {c : ComplaintText} {s d f : Nat}
    (hs : emergencyInitialPeriodStartDay e c = s)
    (hd : responderActOrOmissionDay e c = d)
    (hf : emergencyInitialPeriodEndDay e c = f)
    (hlo : s ≤ d) (hhi : d ≤ f) : ActOrOmissionWithinInitialPeriod e c := by
  refine ⟨?_, ?_⟩ <;> omega



theorem deploymentAuthorizationPrecededActOrOmission_of_days
    {e : EmergencyResponse} {c : ComplaintText} {u d : Nat}
    (hu : stateDeploymentAuthorizationDay e c = u)
    (hd : responderActOrOmissionDay e c = d)
    (hle : u ≤ d) : DeploymentAuthorizationPrecededActOrOmission e c := by
  have hgoal : stateDeploymentAuthorizationDay e c
      ≤ responderActOrOmissionDay e c := by omega
  exact hgoal


theorem claimWithinSectionTemporalScope_of_days
    {e : EmergencyResponse} {c : ComplaintText} {n : Nat}
    (h : daysFromJune242019ToActOrOmission e c = n) (hge : 90 ≤ n) :
    ClaimWithinSectionTemporalScope e c := by
  have hgoal : 90 ≤ daysFromJune242019ToActOrOmission e c := by omega
  exact hgoal


theorem section234StateLawExclusivity_intro
    {e : EmergencyResponse} {c : ComplaintText}
    (hEnrolled : ProfessionalEnrolledInReserveCorpsOrEsarVhp e c)
    (hBasis : Section234EmergencyBasis e c)
    (hWithinPeriod : ActOrOmissionWithinInitialPeriod e c)
    (hRelated : ActOrOmissionRelatedToEmergencyTreatment e c)
    (hState : ActOrOmissionOccurredInCoveredState e c)
    (hCapacity : ActedInReserveCorpsOrEsarVhpCapacity e c)
    (hScope : ServicesWithinScopeOfLicensure e c)
    (hAuthorized : StateAuthorizedDeploymentOfVolunteerSystem e c)
    (hFirst : DeploymentAuthorizationPrecededActOrOmission e c)
    (hTemporal : ClaimWithinSectionTemporalScope e c) :
    Section234StateLawExclusivity e c :=
  ⟨hEnrolled, hBasis, hWithinPeriod, hRelated, hState, hCapacity, hScope,
   hAuthorized, hFirst, hTemporal⟩




theorem section235ConsolidatedAdministration_intro
    {pr : MultigrantProject} {c : ComplaintText}
    (hMultigrant : GrantsSoughtUnderTwoOrMorePrograms pr c)
    (hRegulations : ConsolidationRegulationsPromulgated pr c)
    (hSingleUnit : SingleAdministrativeUnitPerformsFunctions pr c)
    (hBurden : ApplicationAndReportingBurdenReduced pr c)
    (hUniform : DuplicativeRequirementsMadeUniform pr c)
    (hNoWaiver : ¬ StatutoryRequirementWaivedOrSuspended pr c) :
    Section235ConsolidatedAdministration pr c :=
  ⟨hMultigrant, hRegulations, hSingleUnit, hBurden, hUniform, hNoWaiver⟩





theorem annualReportSubmittedByJuneFirst_of_days
    {b : OrphanProductsBoard} {c : ComplaintText} {s j : Nat}
    (hs : annualReportSubmissionDayOfYear b c = s)
    (hj : juneFirstDayOfYear b c = j)
    (hle : s ≤ j) : AnnualReportSubmittedByJuneFirst b c := by
  have hgoal : annualReportSubmissionDayOfYear b c
      ≤ juneFirstDayOfYear b c := by omega
  exact hgoal


theorem section236AnnualReporting_intro
    {b : OrphanProductsBoard} {c : ComplaintText}
    (hConstituted : OrphanProductsBoardConstituted b c)
    (hConsulted : BoardAffordedOpportunityForOralViews b c)
    (hSubmitted : AnnualReportSubmittedToCongressionalCommittees b c)
    (hDeadline : AnnualReportSubmittedByJuneFirst b c)
    (hPreceding : AnnualReportCoversPrecedingCalendarYear b c)
    (hComponents : ComponentAgencyReportsFurnishedForInclusion b c)
    (hContents : AnnualReportContainsStatutoryContents b c) :
    Section236AnnualReporting b c :=
  ⟨hConstituted, hConsulted, hSubmitted, hDeadline, hPreceding, hComponents,
   hContents⟩




theorem conteServiceSizeWithinCap_of_count
    {s : ServiceAppointment} {c : ComplaintText} {n : Nat}
    (h : conteServiceMemberCount s c = n) (hle : n ≤ 2000) :
    ConteServiceSizeWithinCap s c := by
  have hgoal : conteServiceMemberCount s c ≤ 2000 := by omega
  exact hgoal


theorem conteAppointmentEligibilityMet_intro
    {s : ServiceAppointment} {c : ComplaintText}
    (hDegree : AppointeeHoldsQualifyingDoctoralOrMastersDegree s c)
    (hStandards : AppointeeMeetsGeneralScheduleFifteenQualificationStandards s c) :
    ConteAppointmentEligibilityMet s c :=
  ⟨hDegree, hStandards⟩



theorem exceptedAppointmentWithinTwoYearCap_of_years
    {s : ServiceAppointment} {c : ComplaintText} {n : Nat}
    (h : exceptedAppointmentYears s c = n) (hle : n ≤ 2) :
    ExceptedAppointmentWithinTwoYearCap s c := by
  have hgoal : exceptedAppointmentYears s c ≤ 2 := by omega
  exact hgoal


theorem section237ServiceAppointment_intro
    {s : ServiceAppointment} {c : ComplaintText}
    (hAppointed : SecretaryAppointedMemberToConteService s c)
    (hEligible : ConteAppointmentEligibilityMet s c)
    (hCap : ConteServiceSizeWithinCap s c)
    (hAppraisal : PerformanceAppraisalSystemEstablished s c) :
    Section237ServiceAppointment s c :=
  ⟨hAppointed, hEligible, hCap, hAppraisal⟩


theorem section237ReappointmentRoute_careerCompetitive_intro
    {s : ServiceAppointment} {c : ComplaintText}
    (hSeparated : MemberSeparatedInvoluntarilyWithoutCause s c)
    (hCareer : AppointeeWasCareerAppointeeBeforeService s c) :
    Section237ReappointmentRoute s c :=
  .careerCompetitive hSeparated hCareer


theorem section237ReappointmentRoute_exceptedCapped_intro
    {s : ServiceAppointment} {c : ComplaintText}
    (hSeparated : MemberSeparatedInvoluntarilyWithoutCause s c)
    (hNotCareer : ¬ AppointeeWasCareerAppointeeBeforeService s c)
    (hCap : ExceptedAppointmentWithinTwoYearCap s c) :
    Section237ReappointmentRoute s c :=
  .exceptedCapped hSeparated hNotCareer hCap





theorem firstReportWithinOneYear_of_months
    {o : WomensHealthOffice} {c : ComplaintText} {n : Nat}
    (h : monthsFromMarch232010ToFirstReport o c = n) (hle : n ≤ 12) :
    FirstReportWithinOneYear o c := by
  have hgoal : monthsFromMarch232010ToFirstReport o c ≤ 12 := by omega
  exact hgoal


theorem subsequentReportsBiennial_of_months
    {o : WomensHealthOffice} {c : ComplaintText} {n : Nat}
    (h : monthsBetweenConsecutiveReports o c = n) (hle : n ≤ 24) :
    SubsequentReportsBiennial o c := by
  have hgoal : monthsBetweenConsecutiveReports o c ≤ 24 := by omega
  exact hgoal


theorem section237aOfficeEstablished_intro
    {o : WomensHealthOffice} {c : ComplaintText}
    (hOffice : OfficeOnWomensHealthEstablishedUnderDeputyAssistantSecretary o c)
    (hCommittee : CoordinatingCommitteeEstablished o c)
    (hCenter : NationalWomensHealthInformationCenterEstablished o c) :
    Section237aOfficeEstablished o c :=
  ⟨hOffice, hCommittee, hCenter⟩


theorem section237aReportingCycle_intro
    {o : WomensHealthOffice} {c : ComplaintText}
    (hEstablished : Section237aOfficeEstablished o c)
    (hSubmitted : BiennialReportSubmittedToCongress o c)
    (hFirst : FirstReportWithinOneYear o c)
    (hBiennial : SubsequentReportsBiennial o c)
    (hEvaluations : GrantProjectEvaluationsProvided o c) :
    Section237aReportingCycle o c :=
  ⟨hEstablished, hSubmitted, hFirst, hBiennial, hEvaluations⟩





theorem section238aReimbursementObligations_intro
    {ag : HospitalUseAgreement} {c : ComplaintText}
    (hAgreement : InterdepartmentalAgreementPermitsHospitalUse ag c)
    (hUtilities : SurgeonGeneralReimbursedForUtilitiesAndSupplies ag c)
    (hNoUpkeep : NoChargeMadeForPhysicalUpkeep ag c)
    (hDetaineeCare : ImmigrationServiceReimbursedForDetaineeCare ag c)
    (hNoEntitlement : ¬ DetaineeEntitledToCareUnderSection249a ag c) :
    Section238aReimbursementObligations ag c :=
  ⟨hAgreement, hUtilities, hNoUpkeep, hDetaineeCare, hNoEntitlement⟩




theorem section238lTriggeringEvent_saleToUnqualified_intro
    {f : AssistedFacility} {c : ComplaintText}
    (h : FacilitySoldOrTransferredToUnqualifiedEntity f c) :
    Section238lTriggeringEvent f c :=
  .saleToUnqualified h


theorem section238lTriggeringEvent_saleToDisapproved_intro
    {f : AssistedFacility} {c : ComplaintText}
    (h : TransfereeDisapprovedByStateMentalHealthAgency f c) :
    Section238lTriggeringEvent f c :=
  .saleToDisapproved h


theorem section238lTriggeringEvent_cessationOfUse_intro
    {f : AssistedFacility} {c : ComplaintText}
    (h : FacilityCeasedUseInComprehensiveMentalHealthServices f c) :
    Section238lTriggeringEvent f c :=
  .cessationOfUse h


theorem triggeringEventWithinTwentyYears_of_years
    {f : AssistedFacility} {c : ComplaintText} {n : Nat}
    (h : yearsFromCompletionOrAcquisitionToTriggeringEvent f c = n)
    (hle : n ≤ 20) : TriggeringEventWithinTwentyYears f c := by
  have hgoal : yearsFromCompletionOrAcquisitionToTriggeringEvent f c ≤ 20 := by
    omega
  exact hgoal


theorem noticeGivenAsPrescribed_tenDay_intro
    {f : AssistedFacility} {c : ComplaintText} {n : Nat}
    (hWritten : WrittenNoticeOfTriggeringEventProvidedToSecretary f c)
    (h : daysFromTriggeringEventToNotice f c = n) (hle : n ≤ 10) :
    NoticeGivenAsPrescribed f c :=
  have hten : daysFromTriggeringEventToNotice f c ≤ 10 := by omega
  ⟨hWritten, Or.inl hten⟩



theorem noticeGivenAsPrescribed_transitional_intro
    {f : AssistedFacility} {c : ComplaintText} {n : Nat}
    (hWritten : WrittenNoticeOfTriggeringEventProvidedToSecretary f c)
    (h : daysFromOctober221985ToNotice f c = n) (hle : n ≤ 30) :
    NoticeGivenAsPrescribed f c :=
  have hthirty : daysFromOctober221985ToNotice f c ≤ 30 := by omega
  ⟨hWritten, Or.inr hthirty⟩


theorem section238lRecoveryEntitlement_intro
    {f : AssistedFacility} {c : ComplaintText}
    (hFunds : FederalFundsPaidUnderCommunityMentalHealthCentersAct f c)
    (hEvent : Section238lTriggeringEvent f c)
    (hWithin : TriggeringEventWithinTwentyYears f c)
    (hValuation : RecoveryActionBroughtInDistrictWhereFacilitySituated f c)
    (hNoWaiver : ¬ SecretaryWaivedRecoveryRightsForGoodCause f c) :
    Section238lRecoveryEntitlement f c :=
  ⟨hFunds, hEvent, hWithin, hValuation, hNoWaiver⟩



theorem section238lInterestAccrual_afterPrescribedNotice_intro
    {f : AssistedFacility} {c : ComplaintText}
    (hNotice : NoticeGivenAsPrescribed f c)
    (hStart : interestPeriodStartDay f c = triggeringEventDay f c + 191)
    (hEnd : interestPeriodStartDay f c ≤ recoveryCollectionDay f c) :
    Section238lInterestAccrual f c :=
  .afterPrescribedNotice hNotice hStart hEnd



theorem section238lInterestAccrual_withoutPrescribedNotice_intro
    {f : AssistedFacility} {c : ComplaintText}
    (hNoNotice : ¬ NoticeGivenAsPrescribed f c)
    (hStart : interestPeriodStartDay f c = triggeringEventDay f c + 11)
    (hEnd : interestPeriodStartDay f c ≤ recoveryCollectionDay f c) :
    Section238lInterestAccrual f c :=
  .withoutPrescribedNotice hNoNotice hStart hEnd




theorem section238mFiscalAgentContract_intro
    {k : FiscalAgentContract} {c : ComplaintText}
    (hEfficiency : SecretaryFoundEntityWillPerformEfficientlyAndEffectively k c)
    (hResponsibility : SecretaryFoundEntityMeetsResponsibilityRequirements k c)
    (hContracted : FiscalAgentContractEntered k c)
    (hFunctions : FiscalAgentDeterminedAmountsPayable k c)
    (hAudits : FiscalAgentAuditedRecordsForPaymentPropriety k c) :
    Section238mFiscalAgentContract k c :=
  ⟨hEfficiency, hResponsibility, hContracted, hFunctions, hAudits⟩

end Proving.USC.T42.Ch6ASchI.Reslice.Procedure
