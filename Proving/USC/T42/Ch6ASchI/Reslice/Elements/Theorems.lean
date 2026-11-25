import Proving.USC.T42.Ch6ASchI.Reslice.Elements.Statute

set_option autoImplicit false










namespace Proving.USC.T42.Ch6ASchI.Reslice.Elements

open Proving.USC.Common


theorem councilComposition218b_intro {council : AdvisoryCouncil} {c : ComplaintText}
    (h0 : councilMemberCount council c = 15) (h1 : 12 ≤ governingBoardMemberCount council c)
    (h2 : 9 ≤ patientGoverningBoardMemberCount council c)
    (h3 : professionallyQualifiedMemberCount council c = 3) : CouncilComposition218b council c :=
  ⟨h0, h1, h2, h3⟩


theorem memberTerm218c_intro_fullTerm {p : Person} {council : AdvisoryCouncil} {c : ComplaintText}
    (h : MemberHoldsFourYearTerm p council c) : MemberTerm218c p council c :=
  .fullTerm h


theorem memberTerm218c_intro_vacancyRemainder {p : Person} {council : AdvisoryCouncil} {c : ComplaintText}
    (h : VacancyAppointeeServesRemainderOfTerm p council c) : MemberTerm218c p council c :=
  .vacancyRemainder h


theorem section218_intro {council : AdvisoryCouncil} {c : ComplaintText}
    (h0 : SecretaryAppointedAndOrganizedCouncil council c)
    (h1 : daysFromJuly291975ToCouncilOrganization council c ≤ 120)
    (h2 : CouncilAdvisesOnMigrantHealthCenterMatters council c)
    (h3 : CouncilComposition218b council c) (h4 : FirstTermsStaggeredAsDesignated council c)
    (h5 : FederalAdvisoryCommitteeTerminationInapplicable council c) : Section218 council c :=
  ⟨h0, h1, h2, h3, h4, h5⟩


theorem authorizedFundUse231_intro_supplyService {x : Expenditure} {f : Fund} {c : ComplaintText}
    (h : SupportsSupplyServiceOperations x f c) : AuthorizedFundUse231 x f c :=
  .supplyService h


theorem authorizedFundUse231_intro_centralService {x : Expenditure} {f : Fund} {c : ComplaintText}
    (h : SupportsCentralServiceDeterminedBySurgeonGeneral x f c)
    (approval : SecretaryApprovedCentralServiceDetermination x f c) : AuthorizedFundUse231 x f c :=
  .centralService h approval


theorem section231_intro {x : Expenditure} {f : Fund} {c : ComplaintText}
    (h0 : ServiceAndSupplyFundEstablished f c)
    (h1 : fundAuthorizedAmountDollars f c = 250000)
    (h2 : FundWithoutFiscalYearLimitation f c)
    (h3 : ExpenseIsSalaryTravelOrOtherNecessaryExpense x f c)
    (h4 : AuthorizedFundUse231 x f c) (h5 : FundReimbursedFromApplicableAppropriations x f c)
    (h6 : ReimbursementRatesIncludeEnumeratedCharges x f c) : Section231 x f c :=
  ⟨h0, h1, h2, h3, h4, h5, h6⟩


theorem section233a_intro {p : Person} {act : ActOrOmission} {c : ComplaintText}
    (h0 : ClaimIsForPersonalInjuryOrDeathDamage act c)
    (h1 : InjuryResultsFromMedicalOrRelatedFunctions act c)
    (h2 : IsCommissionedOfficerOrEmployeeOfPHS p c)
    (h3 : ActedWithinScopeOfOfficeOrEmployment p c)
    (h4 : FederalTortRemedyOrAlternativeBenefitsAvailable p act c) : Section233a p act c :=
  ⟨h0, h1, h2, h3, h4⟩


theorem exclusiveRemedy233a_intro {p : Person} {act : ActOrOmission} {a : CivilAction} {c : ComplaintText}
    (h0 : Section233a p act c) (h1 : SameSubjectMatterAsFederalRemedy a act c) : ExclusiveRemedy233a p act a c :=
  ⟨h0, h1⟩


theorem section233b_intro {p : Person} {a : CivilAction} {c : ComplaintText}
    (h0 : CivilActionBroughtAgainstCoveredPerson a p c)
    (h1 : AttorneyGeneralDefendedAction a c)
    (h2 : DefendantDeliveredProcessToSuperiorOrDesignee p a c)
    (h3 : daysFromServiceToProcessDelivery p a c ≤ deliveryDeadlineDaysSetByAttorneyGeneral p a c)
    (h4 : ProcessCopiesFurnishedToUSAttorneyAGAndSecretary p a c) : Section233b p a c :=
  ⟨h0, h1, h2, h3, h4⟩


theorem section233cRemoval_intro {p : Person} {a : CivilAction} {c : ComplaintText}
    (h0 : ActionCommencedInStateCourt a c)
    (h1 : AttorneyGeneralCertifiedScopeOfEmployment p a c)
    (h2 : RemovalSoughtBeforeTrial a c) (h3 : RemovedToDistrictEmbracingPlaceOfPendency a c) : Section233cRemoval p a c :=
  ⟨h0, h1, h2, h3⟩


theorem section233cRemand_intro {a : CivilAction} {act : ActOrOmission} {c : ComplaintText}
    (h0 : ActionCommencedInStateCourt a c)
    (h1 : ¬ RemedyUnderSubsectionAAvailableAgainstUS a act c)
    (h2 : ¬ RemedyPrecludedByAvailabilityOfCompensationBenefits a act c) : Section233cRemand a act c :=
  ⟨h0, h1, h2⟩


theorem section233cDismissalWithTolling_intro {a : CivilAction} {act : ActOrOmission} {c : ComplaintText}
    (h0 : ActionCommencedInStateCourt a c)
    (h1 : ¬ RemedyUnderSubsectionAAvailableAgainstUS a act c)
    (h2 : RemedyPrecludedByAvailabilityOfCompensationBenefits a act c)
    (h3 : LimitationPeriodSuspendedDuringPendency a c) : Section233cDismissalWithTolling a act c :=
  ⟨h0, h1, h2, h3⟩


theorem section233d_intro {a : CivilAction} {c : ComplaintText}
    (h0 : AttorneyGeneralCompromisedOrSettledClaim a c)
    (h1 : SettlementFollowsSection2677Procedure a c) : Section233d a c :=
  ⟨h0, h1⟩


theorem section233e_intro {act : ActOrOmission} {c : ComplaintText}
    (h0 : ClaimIsForAssaultOrBattery act c)
    (h1 : AssaultOrBatteryArisesOutOfNegligenceInMedicalFunctions act c) : Section233e act c :=
  ⟨h0, h1⟩


theorem qualifyingDetail233f_intro_foreignCountry {p : Person} {c : ComplaintText}
    (h : AssignedToForeignCountry p c) : QualifyingDetail233f p c :=
  .foreignCountry h


theorem qualifyingDetail233f_intro_stateOrSubdivision {p : Person} {c : ComplaintText}
    (h : DetailedToStateOrPoliticalSubdivision p c) : QualifyingDetail233f p c :=
  .stateOrSubdivision h


theorem qualifyingDetail233f_intro_nonProfitInstitution {p : Person} {c : ComplaintText}
    (h : DetailedToNonProfitInstitution p c) : QualifyingDetail233f p c :=
  .nonProfitInstitution h


theorem section233f_intro {p : Person} {act : ActOrOmission} {c : ComplaintText}
    (h0 : IsCommissionedOfficerOrEmployeeOfPHS p c)
    (h1 : InjuryNegligentlyCausedByOfficerOrEmployee p act c)
    (h2 : ActedWithinScopeOfOfficeOrEmployment p c)
    (h3 : InjuryResultsFromMedicalOrRelatedFunctions act c) (h4 : QualifyingDetail233f p c)
    (h5 : CircumstancesLikelyToPrecludeSection2679bRemedies p act c)
    (h6 : SecretaryHeldHarmlessOrProvidedLiabilityInsurance p c) : Section233f p act c :=
  ⟨h0, h1, h2, h3, h4, h5, h6⟩


theorem entityDescribed233g4_intro {e : CoveredEntity} {c : ComplaintText}
    (h0 : IsPublicOrNonProfitPrivateEntity e c)
    (h1 : ReceivesFederalFundsUnderSection254b e c) : EntityDescribed233g4 e c :=
  ⟨h0, h1⟩


theorem secretaryApprovalPrerequisites233h_intro {e : CoveredEntity} {c : ComplaintText}
    (h0 : HasMalpracticeRiskReductionPolicies e c)
    (h1 : HasVerifiedPractitionerCredentials e c)
    (h2 : NoAdverseClaimsHistoryOrFullCooperation e c)
    (h3 : WillCooperateOnClaimsEstimates e c) : SecretaryApprovalPrerequisites233h e c :=
  ⟨h0, h1, h2, h3⟩


theorem deemingApplicationApproved233g1_intro {app : DeemingApplication} {e : CoveredEntity} {c : ComplaintText}
    (h0 : DeemingApplicationSubmittedInPrescribedForm app e c)
    (h1 : ApplicationVerifiesCoverageAndScopeRequirements app e c)
    (h2 : SecretaryApprovalPrerequisites233h e c)
    (h3 : SecretaryApprovedDeemingApplication app e c)
    (h4 : daysFromApplicationToSecretaryDetermination app e c ≤ 30) : DeemingApplicationApproved233g1 app e c :=
  ⟨h0, h1, h2, h3, h4⟩


theorem qualifyingContractor233g5_intro_fullTime {p : Person} {e : CoveredEntity} {c : ComplaintText}
    (h : IsPhysicianOrLicensedHealthCarePractitionerContractor p e c)
    (hours : 65 ≤ contractorHalfHoursPerWeek p e c) : QualifyingContractor233g5 p e c :=
  .fullTime h hours


theorem qualifyingContractor233g5_intro_listedSpecialty {p : Person} {e : CoveredEntity} {c : ComplaintText}
    (h : IsPhysicianOrLicensedHealthCarePractitionerContractor p e c)
    (hours : contractorHalfHoursPerWeek p e c < 65)
    (specialty : IsListedSpecialtyProvider p e c) : QualifyingContractor233g5 p e c :=
  .listedSpecialty h hours specialty


theorem coveredIndividual233g1_intro_insider {p : Person} {e : CoveredEntity} {c : ComplaintText}
    (h : IsOfficerGoverningBoardMemberOrEmployeeOfEntity p e c) : CoveredIndividual233g1 p e c :=
  .insider h


theorem coveredIndividual233g1_intro_contractor {p : Person} {e : CoveredEntity} {c : ComplaintText}
    (h : QualifyingContractor233g5 p e c) : CoveredIndividual233g1 p e c :=
  .contractor h


theorem nonPatientJustification233g1C_intro_communityWide {svc : HealthService} {e : CoveredEntity} {c : ComplaintText}
    (h : ServiceBenefitsPatientsAndCommunityWide svc e c) : NonPatientJustification233g1C svc e c :=
  .communityWide h


theorem nonPatientJustification233g1C_intro_facilitatesPatientCare {svc : HealthService} {e : CoveredEntity} {c : ComplaintText}
    (h : ServiceFacilitatesProvisionToPatients svc e c) : NonPatientJustification233g1C svc e c :=
  .facilitatesPatientCare h


theorem nonPatientJustification233g1C_intro_contractRequired {svc : HealthService} {e : CoveredEntity} {c : ComplaintText}
    (h : ServiceRequiredUnderEmploymentContract svc e c) : NonPatientJustification233g1C svc e c :=
  .contractRequired h


theorem deemedServiceScope233g1B_intro_patient {svc : HealthService} {e : CoveredEntity} {c : ComplaintText}
    (h : ServiceProvidedToPatientOfEntity svc e c) : DeemedServiceScope233g1B svc e c :=
  .patient h


theorem deemedServiceScope233g1B_intro_nonPatient {svc : HealthService} {e : CoveredEntity} {c : ComplaintText}
    (h : ServiceProvidedToNonPatient svc e c)
    (determination : SecretaryDeterminedNonPatientCoverage svc e c)
    (justification : NonPatientJustification233g1C svc e c) : DeemedServiceScope233g1B svc e c :=
  .nonPatient h determination justification


theorem deemedEmployee233g1_intro {p : Person} {e : CoveredEntity} {app : DeemingApplication} {svc : HealthService} {act : ActOrOmission} {c : ComplaintText}
    (h0 : EntityDescribed233g4 e c) (h1 : DeemingApplicationApproved233g1 app e c)
    (h2 : TransferMadeUnderSubsectionK3ForFiscalYear e c)
    (h3 : ServicesProvidedInDeemedCalendarYear svc e c) (h4 : CoveredIndividual233g1 p e c)
    (h5 : DeemedServiceScope233g1B svc e c)
    (h6 : ActOrOmissionOnOrAfterJanuaryFirst1993 act c)
    (h7 : ¬ EntityTerminatedDeemingByWrittenNotice e c) : DeemedEmployee233g1 p e app svc act c :=
  ⟨h0, h1, h2, h3, h4, h5, h6, h7⟩


theorem deemingConsequences233g_intro {p : Person} {e : CoveredEntity} {c : ComplaintText}
    (h0 : SecretaryDeterminationFinalAndBinding e c)
    (h1 : InsuranceClaimSubrogatedToUnitedStates e c)
    (h2 : NationalHealthServiceCorpsProtectionApplies p e c) : DeemingConsequences233g p e c :=
  ⟨h0, h1, h2⟩


theorem deDeemingGround233i1_intro_policyNoncompliance {p : Person} {e : CoveredEntity} {c : ComplaintText}
    (h : FailedToComplyWithEntityRiskPolicies p e c) : DeDeemingGround233i1 p e c :=
  .policyNoncompliance h


theorem deDeemingGround233i1_intro_outlierClaimsHistory {p : Person} {e : CoveredEntity} {c : ComplaintText}
    (h : ClaimsHistoryOutsideSpecialtyNorm p e c) : DeDeemingGround233i1 p e c :=
  .outlierClaimsHistory h


theorem deDeemingGround233i1_intro_refusalToCooperate {p : Person} {e : CoveredEntity} {c : ComplaintText}
    (h : RefusedToCooperateInDefense p e c) : DeDeemingGround233i1 p e c :=
  .refusalToCooperate h


theorem deDeemingGround233i1_intro_falseInformation {p : Person} {e : CoveredEntity} {c : ComplaintText}
    (h : ProvidedFalseInformationRelevantToDuties p e c) : DeDeemingGround233i1 p e c :=
  .falseInformation h


theorem deDeemingGround233i1_intro_disciplinaryAction {p : Person} {e : CoveredEntity} {c : ComplaintText}
    (h : SubjectOfStateOrProfessionalDisciplinaryAction p e c) : DeDeemingGround233i1 p e c :=
  .disciplinaryAction h


theorem section233i_intro {p : Person} {e : CoveredEntity} {c : ComplaintText}
    (h0 : AttorneyGeneralDeterminedOnTheRecord p e c)
    (h1 : NoticeAndFullAndFairHearingProvided p e c)
    (h2 : TreatingIndividualAsEmployeeExposesGovernmentToUnreasonableRisk p e c)
    (h3 : DeDeemingGround233i1 p e c)
    (h4 : DeDeemingAppliesOnlyProspectivelyAfterNotice p e c) : Section233i p e c :=
  ⟨h0, h1, h2, h3, h4⟩


theorem section233k_intro {e : CoveredEntity} {c : ComplaintText}
    (h0 : AttorneyGeneralEstimatedExpectedClaims e c)
    (h1 : fundAmountDollars233k2 e c ≤ 10000000) (h2 : FundTransferredByDecember31 e c) : Section233k e c :=
  ⟨h0, h1, h2⟩


theorem section233l1_intro {a : CivilAction} {e : CoveredEntity} {c : ComplaintText}
    (h0 : daysFromNotificationToAttorneyGeneralAppearance a c ≤ 15)
    (h1 : AttorneyGeneralAdvisedStateCourtOfDeemingStatus a e c) : Section233l1 a e c :=
  ⟨h0, h1⟩


theorem section233l2_intro {a : CivilAction} {c : ComplaintText}
    (h0 : 15 < daysFromNotificationToAttorneyGeneralAppearance a c)
    (h1 : ActionRemovedOnPetitionAfterAttorneyGeneralFailure a c)
    (h2 : ActionStayedPendingForumDetermination a c) : Section233l2 a c :=
  ⟨h0, h1, h2⟩


theorem section233m1_intro {e : CoveredEntity} {plan : ManagedCarePlan} {svc : HealthService} {c : ComplaintText}
    (h0 : PlanIsAtRiskContractingHealthOrganization plan c)
    (h1 : EntityContractsWithManagedCarePlan e plan c)
    (h2 : ServiceProvidedToManagedCarePlanEnrollee svc plan c) : Section233m1 e plan svc c :=
  ⟨h0, h1, h2⟩


theorem section233m2Compliance_intro {plan : ManagedCarePlan} {e : CoveredEntity} {c : ComplaintText}
    (h0 : PlanIsAtRiskContractingHealthOrganization plan c)
    (h1 : PlanDeemedEntityToMeetMalpracticeCoverageRequirements plan e c) : Section233m2Compliance plan e c :=
  ⟨h0, h1⟩


theorem section233m2Sanction_intro {plan : ManagedCarePlan} {e : CoveredEntity} {c : ComplaintText}
    (h0 : PlanIsAtRiskContractingHealthOrganization plan c)
    (h1 : ¬ PlanDeemedEntityToMeetMalpracticeCoverageRequirements plan e c)
    (h2 : PlanFoundOnTheRecordToHaveViolatedSubsectionM plan c)
    (h3 : PlanIneligibleForTitleXVIIIAndXIXFunds plan c) : Section233m2Sanction plan e c :=
  ⟨h0, h1, h2, h3⟩


theorem freeClinic233o3_intro {fc : FreeClinic} {c : ComplaintText}
    (h0 : FreeClinicOperatedByNonprofitPrivateEntity fc c)
    (h1 : FreeClinicAcceptsNoThirdPartyReimbursement fc c)
    (h2 : FreeClinicChargesNothingOrSlidingScale fc c)
    (h3 : FreeClinicLicensedOrCertified fc c) : FreeClinic233o3 fc c :=
  ⟨h0, h1, h2, h3⟩


theorem freeClinicHealthProfessional233o2_intro {p : Person} {fc : FreeClinic} {svc : HealthService} {c : ComplaintText}
    (h0 : ServiceProvidedAtFreeClinicOrOffsiteProgram svc fc c)
    (h1 : FreeClinicSponsorsPractitioner p fc c)
    (h2 : ServiceIsQualifyingHealthService svc c)
    (h3 : NoCompensationReceivedFromIndividualOrThirdPartyPayor p fc svc c)
    (h4 : WrittenLiabilityLimitationNoticeGivenBeforeService p fc svc c)
    (h5 : PractitionerLicensedAtTimeOfService p c) : FreeClinicHealthProfessional233o2 p fc svc c :=
  ⟨h0, h1, h2, h3, h4, h5⟩


theorem section233o_intro {p : Person} {fc : FreeClinic} {svc : HealthService} {act : ActOrOmission} {c : ComplaintText}
    (h0 : FreeClinic233o3 fc c) (h1 : FreeClinicHealthProfessional233o2 p fc svc c)
    (h2 : FreeClinicTransferMadeUnderSubsectionO6D fc c)
    (h3 : ActOrOmissionAfterFreeClinicDeemingDetermination act p c) : Section233o p fc svc act c :=
  ⟨h0, h1, h2, h3⟩


theorem declaredCategoryCoverage233p2B_intro_withinCategory {p : Person} {cm : Countermeasure} {decl : Declaration} {c : ComplaintText}
    (h : RecipientWithinDeclaredCategory cm decl c) : DeclaredCategoryCoverage233p2B p cm decl c :=
  .withinCategory h


theorem declaredCategoryCoverage233p2B_intro_reasonableBelief {p : Person} {cm : Countermeasure} {decl : Declaration} {c : ComplaintText}
    (h : QualifiedPersonHadReasonableGroundsToBelieveCategory p cm decl c) : DeclaredCategoryCoverage233p2B p cm decl c :=
  .reasonableBelief h


theorem countermeasureAdministration233p2B_intro {p : Person} {cm : Countermeasure} {decl : Declaration} {c : ComplaintText}
    (h0 : SecretaryIssuedAndPublishedDeclaration decl c)
    (h1 : IsCoveredCountermeasureAgainstSmallpox cm decl c)
    (h2 : CountermeasureAdministeredByQualifiedPerson p cm c)
    (h3 : AdministeredForDeclaredPurposeDuringEffectivePeriod cm decl c)
    (h4 : DeclaredCategoryCoverage233p2B p cm decl c) : CountermeasureAdministration233p2B p cm decl c :=
  ⟨h0, h1, h2, h3, h4⟩


theorem vacciniaTransmissionPresumption233p2C_intro {p : Person} {decl : Declaration} {c : ComplaintText}
    (h0 : VacciniaContractedWithinPresumptionWindow p decl c)
    (h1 : ¬ VacciniaTransmissionPresumptionRebutted p c) : VacciniaTransmissionPresumption233p2C p decl c :=
  ⟨h0, h1⟩


theorem vacciniaTransmissionScope233p2D_intro {p : Person} {decl : Declaration} {c : ComplaintText}
    (h0 : VacciniaTransmissionPresumption233p2C p decl c)
    (h1 : TransmittingIndividualDeemedWithinScope p c) : VacciniaTransmissionScope233p2D p decl c :=
  ⟨h0, h1⟩


theorem partCExhaustion233p3A_intro_exhausted {p : Person} {c : ComplaintText}
    (h : ExhaustedPartCRemedies p c) : PartCExhaustion233p3A p c :=
  .exhausted h


theorem partCExhaustion233p3A_intro_secretaryDelay {p : Person} {c : ComplaintText}
    (h : 240 < daysFromPartCRequestToFinalDetermination p c) : PartCExhaustion233p3A p c :=
  .secretaryDelay h


theorem section233p_intro {p : Person} {cm : Countermeasure} {decl : Declaration} {act : ActOrOmission} {c : ComplaintText}
    (h0 : IsCoveredPersonForCountermeasure p cm c)
    (h1 : CountermeasureAdministration233p2B p cm decl c)
    (h2 : ClaimArisesOutOfAdministrationOfCountermeasure act cm c)
    (h3 : PartCExhaustion233p3A p c) (h4 : WithinLimitations p c)
    (h5 : CoveredPersonCooperatedInDefense p c)
    (h6 : PartCCompensationOffsetAgainstAward p c) : Section233p p cm decl act c :=
  ⟨h0, h1, h2, h3, h4, h5, h6⟩


theorem culpableConduct233p6A_intro_contractBreach {p : Person} {c : ComplaintText}
    (h : FailedToCarryOutContractualObligationToUnitedStates p c) : CulpableConduct233p6A p c :=
  .contractBreach h


theorem culpableConduct233p6A_intro_grossFault {p : Person} {c : ComplaintText}
    (h : EngagedInGrosslyNegligentRecklessOrIllegalConduct p c) : CulpableConduct233p6A p c :=
  .grossFault h


theorem culpableConduct233p6A_intro_willfulMisconduct {p : Person} {c : ComplaintText}
    (h : ActedWithScienter p c) : CulpableConduct233p6A p c :=
  .willfulMisconduct h


theorem unitedStatesRecovery233p6_intro {p : Person} {c : ComplaintText}
    (h0 : UnitedStatesMadePaymentToClaimant p c) (h1 : CulpableConduct233p6A p c) : UnitedStatesRecovery233p6 p c :=
  ⟨h0, h1⟩


theorem healthProfessionalVolunteer233q2_intro {p : Person} {e : CoveredEntity} {svc : HealthService} {c : ComplaintText}
    (h0 : ServiceProvidedAtDeemedEntityFacilityOrOffsite svc e c)
    (h1 : EntitySponsorsVolunteerPractitioner p e c)
    (h2 : VolunteerReceivesNoCompensationBeyondExpenseRepayment p e svc c)
    (h3 : ClearAndConspicuousLiabilityNoticePosted p e svc c)
    (h4 : PractitionerLicensedUnderFederalAndStateLaw p c)
    (h5 : EntityMaintainsCertifyingDocumentation p e c) : HealthProfessionalVolunteer233q2 p e svc c :=
  ⟨h0, h1, h2, h3, h4, h5⟩


theorem section233q_intro {p : Person} {e : CoveredEntity} {svc : HealthService} {act : ActOrOmission} {c : ComplaintText}
    (h0 : EntityDescribed233g4 e c) (h1 : HealthProfessionalVolunteer233q2 p e svc c)
    (h2 : ServiceEligibleForFundingUnderSection254b svc c)
    (h3 : VolunteerTransferMadeUnderSubsectionQ4C e c)
    (h4 : ActOrOmissionAfterVolunteerDeemingDetermination act p c) : Section233q p e svc act c :=
  ⟨h0, h1, h2, h3, h4⟩


theorem validSection233Claim_intro {p : Person} {act : ActOrOmission} {a : CivilAction} {c : ComplaintText}
    (h0 : Section233a p act c) (h1 : ExclusiveRemedy233a p act a c) (h2 : ProximateCause p c)
    (h3 : WithinLimitations p c) : ValidSection233Claim p act a c :=
  ⟨h0, h1, h2, h3⟩


theorem qualifyingCorpsMembership234_intro_medicalReserveCorps {p : Person} {c : ComplaintText}
    (h : IsMedicalReserveCorpsMember p c) : QualifyingCorpsMembership234 p c :=
  .medicalReserveCorps h


theorem qualifyingCorpsMembership234_intro_emergencyRegistrySystem {p : Person} {c : ComplaintText}
    (h : IsESARVHPRegisteredProfessional p c) : QualifyingCorpsMembership234 p c :=
  .emergencyRegistrySystem h


theorem qualifyingEmergencyResponse234_intro_publicHealthEmergency {p : Person} {act : ActOrOmission} {ed : EmergencyDeclaration} {c : ComplaintText}
    (h : RespondingToDeclaredPublicHealthEmergency p ed c)
    (window : daysFromEmergencyDeterminationToActOrOmission act ed c ≤ 90) : QualifyingEmergencyResponse234 p act ed c :=
  .publicHealthEmergency h window


theorem qualifyingEmergencyResponse234_intro_presidentialDeclaration {p : Person} {act : ActOrOmission} {ed : EmergencyDeclaration} {c : ComplaintText}
    (h : RespondingToPresidentiallyDeclaredMajorDisasterOrEmergency p ed c) : QualifyingEmergencyResponse234 p act ed c :=
  .presidentialDeclaration h


theorem healthCareServices234d2_intro_diagnosisPreventionTreatment {act : ActOrOmission} {c : ComplaintText}
    (h : ProvidesDiagnosisPreventionOrTreatmentServices act c) : HealthCareServices234d2 act c :=
  .diagnosisPreventionTreatment h


theorem healthCareServices234d2_intro_assessmentOrCare {act : ActOrOmission} {c : ComplaintText}
    (h : ProvidesHealthAssessmentOrCareServices act c) : HealthCareServices234d2 act c :=
  .assessmentOrCare h


theorem section234_intro {p : Person} {act : ActOrOmission} {ed : EmergencyDeclaration} {c : ComplaintText}
    (h0 : IsLicensedHealthCareProfessional p c) (h1 : QualifyingCorpsMembership234 p c)
    (h2 : QualifyingEmergencyResponse234 p act ed c)
    (h3 : ActOrOmissionDuringInitialDeclarationPeriod act ed c)
    (h4 : ActOrOmissionRelatedToEmergencyTreatment act ed c)
    (h5 : ActOrOmissionInDeclaredState act ed c)
    (h6 : ActedInMedicalReserveCorpsOrESARVHPCapacity p act c)
    (h7 : ServicesWithinScopeOfStateLicensure p act c)
    (h8 : StateAuthorizedDeploymentPriorToActOrOmission p ed c)
    (h9 : HealthCareServices234d2 act c)
    (h10 : ActOrOmissionOnOrAfterSection234EffectiveDate act c) : Section234 p act ed c :=
  ⟨h0, h1, h2, h3, h4, h5, h6, h7, h8, h9, h10⟩


theorem section234LiabilityRule_intro {p : Person} {act : ActOrOmission} {ed : EmergencyDeclaration} {c : ComplaintText}
    (h0 : Section234 p act ed c) (h1 : SubjectOnlyToStateLiabilityLawsOfSitusState p act c)
    (h2 : LicensureRegistrationAndCertificationExcepted p c) : Section234LiabilityRule p act ed c :=
  ⟨h0, h1, h2⟩


theorem authorizedRegulationRoute235_intro_singleAdministrativeUnit {reg : Regulation} {proj : Project} {c : ComplaintText}
    (h : RegulationConsolidatesAdministrativeFunctionsInSingleUnit reg proj c) : AuthorizedRegulationRoute235 reg proj c :=
  .singleAdministrativeUnit h


theorem authorizedRegulationRoute235_intro_reducedUniformRequirements {reg : Regulation} {proj : Project} {c : ComplaintText}
    (h : RegulationReducesAndUniformizesApplicationRequirements reg proj c) : AuthorizedRegulationRoute235 reg proj c :=
  .reducedUniformRequirements h


theorem authorizedRegulationRoute235_intro_revisedInconsistentRequirements {reg : Regulation} {proj : Project} {c : ComplaintText}
    (h : RegulationRevisesInconsistentOrDuplicativeRequirements reg proj c) : AuthorizedRegulationRoute235 reg proj c :=
  .revisedInconsistentRequirements h


theorem section235_intro {reg : Regulation} {proj : Project} {c : ComplaintText}
    (h0 : GrantsSoughtOrMadeUnderTwoOrMorePrograms proj c)
    (h1 : GrantsRelateToSingleProject proj c)
    (h2 : RegulationFacilitatesAdministrationOrExpeditesPurposes reg proj c)
    (h3 : AuthorizedRegulationRoute235 reg proj c)
    (h4 : ¬ RegulationWaivesOrSuspendsStatutoryRequirement reg proj c) : Section235 reg proj c :=
  ⟨h0, h1, h2, h3, h4⟩


theorem boardConstitution236a_intro {bd : Board} {c : ComplaintText}
    (h0 : OrphanProductsBoardEstablishedInDepartment bd c)
    (h1 : BoardIncludesRequiredAgencyRepresentatives bd c)
    (h2 : BoardChairedByAssistantSecretaryForHealth bd c) : BoardConstitution236a bd c :=
  ⟨h0, h1, h2⟩


theorem boardDrugDuties236c_intro {bd : Board} {c : ComplaintText}
    (h0 : BoardEvaluatedOrphanDrugActEffectAndImplementation bd c)
    (h1 : BoardEvaluatedNIHDrugDevelopmentActivities bd c)
    (h2 : BoardAssuredInteragencyDevelopmentCoordination bd c)
    (h3 : BoardAssuredCoordinationWithManufacturersAndPatientGroups bd c)
    (h4 : BoardInformedPhysiciansAndPublicWithSponsorConsent bd c)
    (h5 : BoardSoughtSponsorsInvestigatorsAndDistributors bd c)
    (h6 : BoardRecognizedRareDiseaseDevelopmentEfforts bd c) : BoardDrugDuties236c bd c :=
  ⟨h0, h1, h2, h3, h4, h5, h6⟩


theorem annualReport236e_intro {bd : Board} {c : ComplaintText}
    (h0 : AnnualReportContainsRequiredContents bd c)
    (h1 : AnnualReportIncludesComponentAgencyReports bd c)
    (h2 : AnnualReportSubmittedByJune1 bd c) : AnnualReport236e bd c :=
  ⟨h0, h1, h2⟩


theorem section236_intro {bd : Board} {c : ComplaintText}
    (h0 : BoardConstitution236a bd c)
    (h1 : BoardPromotesRareDiseaseProductDevelopmentAndCoordination bd c)
    (h2 : BoardDrugDuties236c bd c)
    (h3 : BoardConsultedInterestedPersonsWithOralViewOpportunity bd c)
    (h4 : AnnualReport236e bd c) : Section236 bd c :=
  ⟨h0, h1, h2, h3, h4⟩


theorem qualifyingDegree237b_intro_biomedicalDoctorate {p : Person} {c : ComplaintText}
    (h : HoldsDoctoralDegreeInBiomedicineOrRelatedField p c) : QualifyingDegree237b p c :=
  .biomedicalDoctorate h


theorem qualifyingDegree237b_intro_engineeringOrBioinformatics {p : Person} {c : ComplaintText}
    (h : HoldsDoctoralOrMastersDegreeInEngineeringOrBioinformatics p c) : QualifyingDegree237b p c :=
  .engineeringOrBioinformatics h


theorem serviceEstablishment237a_intro {s : ExpertService} {c : ComplaintText}
    (h0 : ConteServiceEstablishedInPublicHealthService s c)
    (h1 : serviceMemberCount s c ≤ 2000) (h2 : ServicePurposeIsRecruitAndRetainExperts s c)
    (h3 : SecretaryAssignedExpertsAccordingToAgencyNeed s c) : ServiceEstablishment237a s c :=
  ⟨h0, h1, h2, h3⟩


theorem memberAppointment237b_intro {p : Person} {s : ExpertService} {c : ComplaintText}
    (h0 : AppointedBySecretaryWithoutRegardToTitle5 p s c)
    (h1 : IsOutstandingInBiomedicalOrProductAssessmentField p c)
    (h2 : QualifyingDegree237b p c) (h3 : MeetsOPMQualificationStandardsForGS15 p c)
    (h4 : EnumeratedTitle5ChaptersInapplicableToMember p s c) : MemberAppointment237b p s c :=
  ⟨h0, h1, h2, h3, h4⟩


theorem performanceAppraisalSystem237c_intro {s : ExpertService} {c : ComplaintText}
    (h0 : PerformanceAppraisalSystemProvidesSystematicAppraisal s c)
    (h1 : PerformanceAppraisalSystemEncouragesExcellence s c) : PerformanceAppraisalSystem237c s c :=
  ⟨h0, h1⟩


theorem memberPayWithinBounds237d_intro {p : Person} {s : ExpertService} {c : ComplaintText}
    (h0 : gs15MinimumAnnualRateDollars s c ≤ memberAnnualPayDollars p s c)
    (h1 : memberAnnualPayDollars p s c ≤ executiveCompensationCapDollars s c) : MemberPayWithinBounds237d p s c :=
  ⟨h0, h1⟩


theorem postSeparationAppointment237e_intro_careerCompetitive {p : Person} {c : ComplaintText}
    (h : WasCareerAppointeeBeforeServiceAppointment p c)
    (appointment : ReappointedToCompetitiveServiceGS15CareerPosition p c) : PostSeparationAppointment237e p c :=
  .careerCompetitive h appointment


theorem postSeparationAppointment237e_intro_exceptedTwoYear {p : Person} {c : ComplaintText}
    (h : ¬ WasCareerAppointeeBeforeServiceAppointment p c)
    (appointment : ReappointedToExceptedServiceForNotMoreThanTwoYears p c) : PostSeparationAppointment237e p c :=
  .exceptedTwoYear h appointment


theorem section237eReappointment_intro {p : Person} {s : ExpertService} {c : ComplaintText}
    (h0 : SeparatedInvoluntarilyAndWithoutCause p s c)
    (h1 : PostSeparationAppointment237e p c) : Section237eReappointment p s c :=
  ⟨h0, h1⟩


theorem section237_intro {p : Person} {s : ExpertService} {c : ComplaintText}
    (h0 : ServiceEstablishment237a s c) (h1 : MemberAppointment237b p s c)
    (h2 : PerformanceAppraisalSystem237c s c) (h3 : MemberPayWithinBounds237d p s c)
    (h4 : SecretaryPromulgatedServiceAdministrationRegulations s c) : Section237 p s c :=
  ⟨h0, h1, h2, h3, h4⟩


theorem officeEstablishment237a_intro {o : Office} {c : ComplaintText}
    (h0 : OfficeOnWomensHealthEstablishedWithinOfficeOfSecretary o c)
    (h1 : OfficeHeadedByDeputyAssistantSecretaryForWomensHealth o c) : OfficeEstablishment237a o c :=
  ⟨h0, h1⟩


theorem officeDuties237b_intro {o : Office} {c : ComplaintText}
    (h0 : EstablishedGoalsAndCoordinatedDepartmentalActivities o c)
    (h1 : ProvidedExpertAdviceToSecretary o c)
    (h2 : MonitoredDepartmentalWomensHealthActivities o c)
    (h3 : EstablishedCoordinatingCommitteeOnWomensHealth o c)
    (h4 : EstablishedNationalWomensHealthInformationCenter o c)
    (h5 : CoordinatedPrivateSectorPromotionEfforts o c)
    (h6 : ProvidedForExchangeOfInformationWithGranteesAndPublic o c) : OfficeDuties237b o c :=
  ⟨h0, h1, h2, h3, h4, h5, h6⟩


theorem officeFundingAuthority237c_intro {o : Office} {c : ComplaintText}
    (h0 : SecretaryMadeGrantsOrEnteredAgreements o c)
    (h1 : ProvidedForProjectEvaluationsAndDissemination o c) : OfficeFundingAuthority237c o c :=
  ⟨h0, h1⟩


theorem section237a_intro {o : Office} {c : ComplaintText}
    (h0 : OfficeEstablishment237a o c) (h1 : OfficeDuties237b o c)
    (h2 : OfficeFundingAuthority237c o c) (h3 : BiennialReportSubmittedToCongress o c)
    (h4 : AppropriationsAuthorizedForCoveredFiscalYears o c) : Section237a o c :=
  ⟨h0, h1, h2, h3, h4⟩


theorem section238aUse_intro {h : Hospital} {c : ComplaintText}
    (h0 : HeadsOfConcernedDepartmentsAgreed h c)
    (h1 : ImmigrationServicePermittedPHSUseOfStationHospital h c)
    (h2 : UseIsForCareOfPublicHealthServicePatients h c)
    (h3 : SurgeonGeneralReimbursedActualCostOfUtilitiesAndSupplies h c)
    (h4 : ReimbursementCoveredIntoProperAppropriationOrWorkingFunds h c)
    (h5 : ¬ ChargeMadeForPhysicalUpkeepOfHospitals h c) : Section238aUse h c :=
  ⟨h0, h1, h2, h3, h4, h5⟩


theorem section238aDetaineeReimbursement_intro {p : Person} {h : Hospital} {c : ComplaintText}
    (h0 : PersonDetainedAtImmigrationServiceRequest p h c)
    (h1 : ImmigrationServiceReimbursedForCareOfDetainedPersons p h c)
    (h2 : ¬ DetainedPersonEntitledToCareUnderSection249a p c) : Section238aDetaineeReimbursement p h c :=
  ⟨h0, h1, h2⟩


theorem transferDisqualification238l_intro_unqualifiedTransferee {tr : Transfer} {c : ComplaintText}
    (h : TransfereeNotQualifiedToApplyUnderSection222 tr c) : TransferDisqualification238l tr c :=
  .unqualifiedTransferee h


theorem transferDisqualification238l_intro_disapprovedTransferee {tr : Transfer} {c : ComplaintText}
    (h : TransfereeDisapprovedByStateMentalHealthAgency tr c) : TransferDisqualification238l tr c :=
  .disapprovedTransferee h


theorem recoveryTriggeringEvent238l_intro_saleOrTransfer {fac : Facility} {tr : Transfer} {c : ComplaintText}
    (h : FacilitySoldOrTransferred fac tr c)
    (disqualification : TransferDisqualification238l tr c) : RecoveryTriggeringEvent238l fac tr c :=
  .saleOrTransfer h disqualification


theorem recoveryTriggeringEvent238l_intro_cessationOfUse {fac : Facility} {tr : Transfer} {c : ComplaintText}
    (h : FacilityCeasedUseForComprehensiveMentalHealthServices fac c) : RecoveryTriggeringEvent238l fac tr c :=
  .cessationOfUse h


theorem interestPeriodStart238l_intro_noticeGiven {fac : Facility} {c : ComplaintText}
    (h : WrittenNoticeProvidedToSecretary fac c)
    (timely : daysFromTriggeringEventToNotice fac c ≤ 10)
    (start : interestPeriodStartDaysAfterEvent fac c = 191) : InterestPeriodStart238l fac c :=
  .noticeGiven h timely start


theorem interestPeriodStart238l_intro_noticeOmitted {fac : Facility} {c : ComplaintText}
    (h : ¬ WrittenNoticeProvidedToSecretary fac c)
    (start : interestPeriodStartDaysAfterEvent fac c = 11) : InterestPeriodStart238l fac c :=
  .noticeOmitted h start


theorem baseAmount238lc1_intro {fac : Facility} {c : ComplaintText}
    (h0 : 0 < projectCostDollars fac c)
    (h1 : federalParticipationDollars fac c ≤ projectCostDollars fac c)
    (h2 : 0 < facilityThenValueDollars fac c)
    (h3 : BaseAmountComputedAsProportionateShare fac c) : BaseAmount238lc1 fac c :=
  ⟨h0, h1, h2, h3⟩


theorem section238l_intro {fac : Facility} {tr : Transfer} {c : ComplaintText}
    (h0 : FacilityFundedUnderCommunityMentalHealthCentersAct fac c)
    (h1 : yearsFromCompletionOrAcquisitionToTriggeringEvent fac c < 20)
    (h2 : RecoveryTriggeringEvent238l fac tr c)
    (h3 : UnitedStatesEntitledToRecoverFromTransferorTransfereeOrOwner fac c)
    (h4 : BaseAmount238lc1 fac c) (h5 : InterestComputedAtTreasuryBillRate fac c)
    (h6 : InterestPeriodStart238l fac c) (h7 : ¬ SecretaryWaivedRecoveryForGoodCause fac c)
    (h8 : ¬ RecoveryRightAssertedAsPreJudgmentLien fac c) : Section238l fac tr c :=
  ⟨h0, h1, h2, h3, h4, h5, h6, h7, h8⟩


theorem fiscalAgentStatus238m_intro_medicareCarrier {fa : FiscalAgent} {c : ComplaintText}
    (h : IsCarrierDescribedInSection1395uF1 fa c) : FiscalAgentStatus238m fa c :=
  .medicareCarrier h


theorem fiscalAgentStatus238m_intro_tribalOrganization {fa : FiscalAgent} {c : ComplaintText}
    (h : IsIndianTribeOrTribalOrganizationUnderSelfDeterminationAct fa c) : FiscalAgentStatus238m fa c :=
  .tribalOrganization h


theorem paymentDeterminationFunction238m_intro_indianHealthService {k : FiscalAgentContract} {c : ComplaintText}
    (h : ContractDeterminesAmountsPayableForIndianHealthServiceCare k c) : PaymentDeterminationFunction238m k c :=
  .indianHealthService h


theorem paymentDeterminationFunction238m_intro_publicHealthService {k : FiscalAgentContract} {c : ComplaintText}
    (h : ContractDeterminesAmountsPayableForPublicHealthServiceCare k c) : PaymentDeterminationFunction238m k c :=
  .publicHealthService h


theorem contractFunctions238ma_intro {k : FiscalAgentContract} {c : ComplaintText}
    (h0 : PaymentDeterminationFunction238m k c)
    (h1 : ContractProvidesForReceiptDisbursementAndAccounting k c)
    (h2 : ContractProvidesForAuditsOfRecords k c)
    (h3 : ContractProvidesForNecessaryAdditionalFunctions k c) : ContractFunctions238ma k c :=
  ⟨h0, h1, h2, h3⟩


theorem secretaryFindings238mb2_intro {fa : FiscalAgent} {k : FiscalAgentContract} {c : ComplaintText}
    (h0 : SecretaryFoundEntityWillPerformEfficientlyAndEffectively fa k c)
    (h1 : SecretaryFoundEntityMeetsFinancialAndLegalRequirements fa k c) : SecretaryFindings238mb2 fa k c :=
  ⟨h0, h1⟩


theorem section238m_intro {k : FiscalAgentContract} {fa : FiscalAgent} {c : ComplaintText}
    (h0 : SecretaryEnteredContractWithFiscalAgent k fa c) (h1 : FiscalAgentStatus238m fa c)
    (h2 : ContractFunctions238ma k c) (h3 : SecretaryFindings238mb2 fa k c)
    (h4 : ContractEnteredWithoutRegardToCompetitionRequirements k c)
    (h5 : ContractProvidesForAdvancesOfFunds k c)
    (h6 : MedicareCarrierProvisionsAppliedToContract k c) : Section238m k fa c :=
  ⟨h0, h1, h2, h3, h4, h5, h6⟩

end Proving.USC.T42.Ch6ASchI.Reslice.Elements
