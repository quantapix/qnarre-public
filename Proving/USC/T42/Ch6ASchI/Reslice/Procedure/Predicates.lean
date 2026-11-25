

















import Proving.USC.T42.Ch6ASchI.Reslice.Procedure.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reslice.Procedure

open Proving.USC.Common





axiom SecretaryAppointedMigrantHealthCouncil (co : AdvisoryCouncil) (c : ComplaintText) : Prop



axiom daysFromJuly291975ToCouncilOrganization (co : AdvisoryCouncil) (c : ComplaintText) : Nat



axiom councilMemberCount (co : AdvisoryCouncil) (c : ComplaintText) : Nat



axiom councilGoverningBoardMemberCount (co : AdvisoryCouncil) (c : ComplaintText) : Nat



axiom councilBoardMembersServedByCenterCount (co : AdvisoryCouncil) (c : ComplaintText) : Nat



axiom councilHealthQualifiedMemberCount (co : AdvisoryCouncil) (c : ComplaintText) : Nat



axiom CouncilMemberAppointedToFillVacancy (m : CouncilMember) (c : ComplaintText) : Prop



axiom vacancyAppointeeTermExpirationDay (m : CouncilMember) (c : ComplaintText) : Nat



axiom predecessorTermExpirationDay (m : CouncilMember) (c : ComplaintText) : Nat





axiom SurgeonGeneralDeterminedCentralService (t : ServiceAndSupplyTransaction) (c : ComplaintText) : Prop



axiom SecretaryApprovedCentralServiceDetermination (t : ServiceAndSupplyTransaction) (c : ComplaintText) : Prop



axiom ServicesPerformedOrStockFurnished (t : ServiceAndSupplyTransaction) (c : ComplaintText) : Prop



axiom ReimbursementMadeInAdvanceOfPerformance (t : ServiceAndSupplyTransaction) (c : ComplaintText) : Prop



axiom ServiceAndSupplyFundReimbursed (t : ServiceAndSupplyTransaction) (c : ComplaintText) : Prop



axiom ReimbursementRateCoversStatutoryCostComponents (t : ServiceAndSupplyTransaction) (c : ComplaintText) : Prop





axiom CivilActionBroughtAgainstDeemedPerson (a : CivilAction) (c : ComplaintText) : Prop



axiom ActionCommencedInStateCourt (a : CivilAction) (c : ComplaintText) : Prop



axiom ProcessDeliveredToImmediateSuperiorOrDesignee (a : CivilAction) (c : ComplaintText) : Prop



axiom daysFromServiceOfProcessToDelivery (a : CivilAction) (c : ComplaintText) : Nat



axiom attorneyGeneralPrescribedDeliveryDays (a : CivilAction) (c : ComplaintText) : Nat



axiom CopiesOfPleadingFurnishedToFederalOfficers (a : CivilAction) (c : ComplaintText) : Prop



axiom AttorneyGeneralDefendedAction (a : CivilAction) (c : ComplaintText) : Prop



axiom AttorneyGeneralCertifiedScopeOfEmployment (a : CivilAction) (c : ComplaintText) : Prop



axiom removalFilingDay (a : CivilAction) (c : ComplaintText) : Nat



axiom trialCommencementDay (a : CivilAction) (c : ComplaintText) : Nat



axiom RemovalEffectedWithoutBond (a : CivilAction) (c : ComplaintText) : Prop



axiom RemandMotionHeardBeforeTrialOnMerits (a : CivilAction) (c : ComplaintText) : Prop



axiom FtcaRemedyAvailableAgainstUnitedStates (a : CivilAction) (c : ComplaintText) : Prop



axiom AlternativeCompensationRemedyPrecludesSuit (a : CivilAction) (c : ComplaintText) : Prop



axiom civilActionPendencyDays (a : CivilAction) (c : ComplaintText) : Nat



axiom compensationClaimLimitationsDeadlineDay (a : CivilAction) (c : ComplaintText) : Nat



axiom compensationClaimFilingDay (a : CivilAction) (c : ComplaintText) : Nat



axiom DeemingApplicationSubmittedToSecretary (ap : DeemingApplication) (c : ComplaintText) : Prop



axiom daysFromDeemingApplicationReceiptToDetermination (ap : DeemingApplication) (c : ComplaintText) : Nat



axiom SecretaryApprovedDeemingApplication (ap : DeemingApplication) (c : ComplaintText) : Prop



axiom EntityRiskManagementPoliciesImplemented (ap : DeemingApplication) (c : ComplaintText) : Prop



axiom EntityProfessionalCredentialsVerified (ap : DeemingApplication) (c : ComplaintText) : Prop



axiom EntityClaimsHistoryAcceptable (ap : DeemingApplication) (c : ComplaintText) : Prop



axiom EntityWillCooperateWithAttorneyGeneral (ap : DeemingApplication) (c : ComplaintText) : Prop



axiom NoticeAndFullAndFairHearingAfforded (x : Person) (c : ComplaintText) : Prop



axiom ExclusionDeterminationMadeOnTheRecord (x : Person) (c : ComplaintText) : Prop



axiom PractitionerNoncompliantWithEntityPolicies (x : Person) (c : ComplaintText) : Prop



axiom PractitionerClaimsHistoryOutsideNorm (x : Person) (c : ComplaintText) : Prop



axiom PractitionerRefusedToCooperateInDefense (x : Person) (c : ComplaintText) : Prop



axiom PractitionerProvidedFalseInformation (x : Person) (c : ComplaintText) : Prop



axiom PractitionerSubjectToDisciplinaryAction (x : Person) (c : ComplaintText) : Prop



axiom ExclusionNoticeReceivedByEntity (x : Person) (c : ComplaintText) : Prop



axiom exclusionNoticeReceiptDay (x : Person) (c : ComplaintText) : Nat



axiom challengedActOrOmissionDay (x : Person) (c : ComplaintText) : Nat



axiom AttorneyGeneralAppearedInStateCourt (a : CivilAction) (c : ComplaintText) : Prop



axiom daysFromStateCourtNotificationToAppearance (a : CivilAction) (c : ComplaintText) : Nat



axiom PetitionForRemovalFiledByNamedParty (a : CivilAction) (c : ComplaintText) : Prop



axiom ProceedingStayedPendingForumDetermination (a : CivilAction) (c : ComplaintText) : Prop



axiom CourtIssuedForumDeterminationOrder (a : CivilAction) (c : ComplaintText) : Prop



axiom PartCAdministrativeRemediesExhausted (r : CompensationRequest) (c : ComplaintText) : Prop



axiom SecretaryMadeFinalDeterminationOnCompensationRequest (r : CompensationRequest) (c : ComplaintText) : Prop



axiom daysFromCompensationRequestToFinalDetermination (r : CompensationRequest) (c : ComplaintText) : Nat



axiom compensationRequestPendencyDays (r : CompensationRequest) (c : ComplaintText) : Nat



axiom smallpoxClaimBaseDeadlineDay (r : CompensationRequest) (c : ComplaintText) : Nat



axiom smallpoxClaimFilingDay (r : CompensationRequest) (c : ComplaintText) : Nat



axiom FtcaAdministrativeExhaustionSatisfied (a : CivilAction) (c : ComplaintText) : Prop



axiom CoveredPersonCooperatedInDefense (x : Person) (c : ComplaintText) : Prop



axiom CourtFoundFailureToCooperate (a : CivilAction) (c : ComplaintText) : Prop



axiom CoveredPersonSubstitutedAsPartyDefendant (a : CivilAction) (c : ComplaintText) : Prop



axiom CourtLacksSubjectMatterJurisdiction (a : CivilAction) (c : ComplaintText) : Prop



axiom FundTransferredToTreasuryAccounts (fc : FiscalCycle) (c : ComplaintText) : Prop



axiom fiscalTransferDay (fc : FiscalCycle) (c : ComplaintText) : Nat



axiom decemberThirtyFirstDeadlineDay (fc : FiscalCycle) (c : ComplaintText) : Nat





axiom ProfessionalEnrolledInReserveCorpsOrEsarVhp (e : EmergencyResponse) (c : ComplaintText) : Prop



axiom PublicHealthEmergencyDeterminationInEffect (e : EmergencyResponse) (c : ComplaintText) : Prop



axiom MajorDisasterOrPresidentialEmergencyDeclared (e : EmergencyResponse) (c : ComplaintText) : Prop



axiom emergencyInitialPeriodDays (e : EmergencyResponse) (c : ComplaintText) : Nat



axiom emergencyInitialPeriodStartDay (e : EmergencyResponse) (c : ComplaintText) : Nat



axiom emergencyInitialPeriodEndDay (e : EmergencyResponse) (c : ComplaintText) : Nat



axiom responderActOrOmissionDay (e : EmergencyResponse) (c : ComplaintText) : Nat



axiom stateDeploymentAuthorizationDay (e : EmergencyResponse) (c : ComplaintText) : Nat



axiom daysFromJune242019ToActOrOmission (e : EmergencyResponse) (c : ComplaintText) : Nat



axiom ActOrOmissionRelatedToEmergencyTreatment (e : EmergencyResponse) (c : ComplaintText) : Prop



axiom ActOrOmissionOccurredInCoveredState (e : EmergencyResponse) (c : ComplaintText) : Prop



axiom ActedInReserveCorpsOrEsarVhpCapacity (e : EmergencyResponse) (c : ComplaintText) : Prop



axiom ServicesWithinScopeOfLicensure (e : EmergencyResponse) (c : ComplaintText) : Prop



axiom StateAuthorizedDeploymentOfVolunteerSystem (e : EmergencyResponse) (c : ComplaintText) : Prop





axiom GrantsSoughtUnderTwoOrMorePrograms (pr : MultigrantProject) (c : ComplaintText) : Prop



axiom ConsolidationRegulationsPromulgated (pr : MultigrantProject) (c : ComplaintText) : Prop



axiom SingleAdministrativeUnitPerformsFunctions (pr : MultigrantProject) (c : ComplaintText) : Prop



axiom ApplicationAndReportingBurdenReduced (pr : MultigrantProject) (c : ComplaintText) : Prop



axiom DuplicativeRequirementsMadeUniform (pr : MultigrantProject) (c : ComplaintText) : Prop



axiom StatutoryRequirementWaivedOrSuspended (pr : MultigrantProject) (c : ComplaintText) : Prop





axiom OrphanProductsBoardConstituted (b : OrphanProductsBoard) (c : ComplaintText) : Prop



axiom BoardAffordedOpportunityForOralViews (b : OrphanProductsBoard) (c : ComplaintText) : Prop



axiom AnnualReportSubmittedToCongressionalCommittees (b : OrphanProductsBoard) (c : ComplaintText) : Prop



axiom annualReportSubmissionDayOfYear (b : OrphanProductsBoard) (c : ComplaintText) : Nat



axiom juneFirstDayOfYear (b : OrphanProductsBoard) (c : ComplaintText) : Nat



axiom AnnualReportCoversPrecedingCalendarYear (b : OrphanProductsBoard) (c : ComplaintText) : Prop



axiom ComponentAgencyReportsFurnishedForInclusion (b : OrphanProductsBoard) (c : ComplaintText) : Prop



axiom AnnualReportContainsStatutoryContents (b : OrphanProductsBoard) (c : ComplaintText) : Prop





axiom SecretaryAppointedMemberToConteService (s : ServiceAppointment) (c : ComplaintText) : Prop



axiom AppointeeHoldsQualifyingDoctoralOrMastersDegree (s : ServiceAppointment) (c : ComplaintText) : Prop



axiom AppointeeMeetsGeneralScheduleFifteenQualificationStandards (s : ServiceAppointment) (c : ComplaintText) : Prop



axiom conteServiceMemberCount (s : ServiceAppointment) (c : ComplaintText) : Nat



axiom PerformanceAppraisalSystemEstablished (s : ServiceAppointment) (c : ComplaintText) : Prop



axiom MemberSeparatedInvoluntarilyWithoutCause (s : ServiceAppointment) (c : ComplaintText) : Prop



axiom AppointeeWasCareerAppointeeBeforeService (s : ServiceAppointment) (c : ComplaintText) : Prop



axiom exceptedAppointmentYears (s : ServiceAppointment) (c : ComplaintText) : Nat





axiom OfficeOnWomensHealthEstablishedUnderDeputyAssistantSecretary (o : WomensHealthOffice) (c : ComplaintText) : Prop



axiom CoordinatingCommitteeEstablished (o : WomensHealthOffice) (c : ComplaintText) : Prop



axiom NationalWomensHealthInformationCenterEstablished (o : WomensHealthOffice) (c : ComplaintText) : Prop



axiom BiennialReportSubmittedToCongress (o : WomensHealthOffice) (c : ComplaintText) : Prop



axiom monthsFromMarch232010ToFirstReport (o : WomensHealthOffice) (c : ComplaintText) : Nat



axiom monthsBetweenConsecutiveReports (o : WomensHealthOffice) (c : ComplaintText) : Nat



axiom GrantProjectEvaluationsProvided (o : WomensHealthOffice) (c : ComplaintText) : Prop





axiom InterdepartmentalAgreementPermitsHospitalUse (ag : HospitalUseAgreement) (c : ComplaintText) : Prop



axiom SurgeonGeneralReimbursedForUtilitiesAndSupplies (ag : HospitalUseAgreement) (c : ComplaintText) : Prop



axiom NoChargeMadeForPhysicalUpkeep (ag : HospitalUseAgreement) (c : ComplaintText) : Prop



axiom DetaineeEntitledToCareUnderSection249a (ag : HospitalUseAgreement) (c : ComplaintText) : Prop



axiom ImmigrationServiceReimbursedForDetaineeCare (ag : HospitalUseAgreement) (c : ComplaintText) : Prop





axiom FederalFundsPaidUnderCommunityMentalHealthCentersAct (f : AssistedFacility) (c : ComplaintText) : Prop



axiom FacilitySoldOrTransferredToUnqualifiedEntity (f : AssistedFacility) (c : ComplaintText) : Prop



axiom TransfereeDisapprovedByStateMentalHealthAgency (f : AssistedFacility) (c : ComplaintText) : Prop



axiom FacilityCeasedUseInComprehensiveMentalHealthServices (f : AssistedFacility) (c : ComplaintText) : Prop



axiom yearsFromCompletionOrAcquisitionToTriggeringEvent (f : AssistedFacility) (c : ComplaintText) : Nat



axiom triggeringEventDay (f : AssistedFacility) (c : ComplaintText) : Nat



axiom WrittenNoticeOfTriggeringEventProvidedToSecretary (f : AssistedFacility) (c : ComplaintText) : Prop



axiom daysFromTriggeringEventToNotice (f : AssistedFacility) (c : ComplaintText) : Nat



axiom daysFromOctober221985ToNotice (f : AssistedFacility) (c : ComplaintText) : Nat



axiom interestPeriodStartDay (f : AssistedFacility) (c : ComplaintText) : Nat



axiom recoveryCollectionDay (f : AssistedFacility) (c : ComplaintText) : Nat



axiom SecretaryWaivedRecoveryRightsForGoodCause (f : AssistedFacility) (c : ComplaintText) : Prop



axiom RecoveryActionBroughtInDistrictWhereFacilitySituated (f : AssistedFacility) (c : ComplaintText) : Prop





axiom SecretaryFoundEntityWillPerformEfficientlyAndEffectively (k : FiscalAgentContract) (c : ComplaintText) : Prop



axiom SecretaryFoundEntityMeetsResponsibilityRequirements (k : FiscalAgentContract) (c : ComplaintText) : Prop



axiom FiscalAgentContractEntered (k : FiscalAgentContract) (c : ComplaintText) : Prop



axiom FiscalAgentDeterminedAmountsPayable (k : FiscalAgentContract) (c : ComplaintText) : Prop



axiom FiscalAgentAuditedRecordsForPaymentPropriety (k : FiscalAgentContract) (c : ComplaintText) : Prop



axiom AdvanceOfFundsProvidedUnderContract (k : FiscalAgentContract) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Reslice.Procedure
