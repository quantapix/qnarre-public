import Proving.USC.T42.Ch6ASchI.Reslice.Elements.Types

set_option autoImplicit false










namespace Proving.USC.T42.Ch6ASchI.Reslice.Elements

open Proving.USC.Common




axiom SecretaryAppointedAndOrganizedCouncil (council : AdvisoryCouncil) (c : ComplaintText): Prop


axiom daysFromJuly291975ToCouncilOrganization (council : AdvisoryCouncil) (c : ComplaintText): Nat


axiom CouncilAdvisesOnMigrantHealthCenterMatters (council : AdvisoryCouncil) (c : ComplaintText): Prop


axiom councilMemberCount (council : AdvisoryCouncil) (c : ComplaintText): Nat


axiom governingBoardMemberCount (council : AdvisoryCouncil) (c : ComplaintText): Nat


axiom patientGoverningBoardMemberCount (council : AdvisoryCouncil) (c : ComplaintText): Nat


axiom professionallyQualifiedMemberCount (council : AdvisoryCouncil) (c : ComplaintText): Nat


axiom MemberHoldsFourYearTerm (p : Person) (council : AdvisoryCouncil) (c : ComplaintText): Prop


axiom VacancyAppointeeServesRemainderOfTerm (p : Person) (council : AdvisoryCouncil) (c : ComplaintText): Prop


axiom FirstTermsStaggeredAsDesignated (council : AdvisoryCouncil) (c : ComplaintText): Prop


axiom FederalAdvisoryCommitteeTerminationInapplicable (council : AdvisoryCouncil) (c : ComplaintText): Prop




axiom ServiceAndSupplyFundEstablished (f : Fund) (c : ComplaintText): Prop


axiom fundAuthorizedAmountDollars (f : Fund) (c : ComplaintText): Nat


axiom FundWithoutFiscalYearLimitation (f : Fund) (c : ComplaintText): Prop


axiom ExpenseIsSalaryTravelOrOtherNecessaryExpense (x : Expenditure) (f : Fund) (c : ComplaintText): Prop


axiom SupportsSupplyServiceOperations (x : Expenditure) (f : Fund) (c : ComplaintText): Prop


axiom SupportsCentralServiceDeterminedBySurgeonGeneral (x : Expenditure) (f : Fund) (c : ComplaintText): Prop


axiom SecretaryApprovedCentralServiceDetermination (x : Expenditure) (f : Fund) (c : ComplaintText): Prop


axiom FundReimbursedFromApplicableAppropriations (x : Expenditure) (f : Fund) (c : ComplaintText): Prop


axiom ReimbursementRatesIncludeEnumeratedCharges (x : Expenditure) (f : Fund) (c : ComplaintText): Prop




axiom ClaimIsForPersonalInjuryOrDeathDamage (act : ActOrOmission) (c : ComplaintText): Prop


axiom InjuryResultsFromMedicalOrRelatedFunctions (act : ActOrOmission) (c : ComplaintText): Prop


axiom IsCommissionedOfficerOrEmployeeOfPHS (p : Person) (c : ComplaintText): Prop


axiom ActedWithinScopeOfOfficeOrEmployment (p : Person) (c : ComplaintText): Prop


axiom FederalTortRemedyOrAlternativeBenefitsAvailable (p : Person) (act : ActOrOmission) (c : ComplaintText): Prop


axiom SameSubjectMatterAsFederalRemedy (a : CivilAction) (act : ActOrOmission) (c : ComplaintText): Prop


axiom CivilActionBroughtAgainstCoveredPerson (a : CivilAction) (p : Person) (c : ComplaintText): Prop


axiom AttorneyGeneralDefendedAction (a : CivilAction) (c : ComplaintText): Prop


axiom DefendantDeliveredProcessToSuperiorOrDesignee (p : Person) (a : CivilAction) (c : ComplaintText): Prop


axiom daysFromServiceToProcessDelivery (p : Person) (a : CivilAction) (c : ComplaintText): Nat


axiom deliveryDeadlineDaysSetByAttorneyGeneral (p : Person) (a : CivilAction) (c : ComplaintText): Nat


axiom ProcessCopiesFurnishedToUSAttorneyAGAndSecretary (p : Person) (a : CivilAction) (c : ComplaintText): Prop


axiom ActionCommencedInStateCourt (a : CivilAction) (c : ComplaintText): Prop


axiom AttorneyGeneralCertifiedScopeOfEmployment (p : Person) (a : CivilAction) (c : ComplaintText): Prop


axiom RemovalSoughtBeforeTrial (a : CivilAction) (c : ComplaintText): Prop


axiom RemovedToDistrictEmbracingPlaceOfPendency (a : CivilAction) (c : ComplaintText): Prop


axiom RemedyUnderSubsectionAAvailableAgainstUS (a : CivilAction) (act : ActOrOmission) (c : ComplaintText): Prop


axiom RemedyPrecludedByAvailabilityOfCompensationBenefits (a : CivilAction) (act : ActOrOmission) (c : ComplaintText): Prop


axiom LimitationPeriodSuspendedDuringPendency (a : CivilAction) (c : ComplaintText): Prop


axiom AttorneyGeneralCompromisedOrSettledClaim (a : CivilAction) (c : ComplaintText): Prop


axiom SettlementFollowsSection2677Procedure (a : CivilAction) (c : ComplaintText): Prop


axiom ClaimIsForAssaultOrBattery (act : ActOrOmission) (c : ComplaintText): Prop


axiom AssaultOrBatteryArisesOutOfNegligenceInMedicalFunctions (act : ActOrOmission) (c : ComplaintText): Prop


axiom InjuryNegligentlyCausedByOfficerOrEmployee (p : Person) (act : ActOrOmission) (c : ComplaintText): Prop


axiom AssignedToForeignCountry (p : Person) (c : ComplaintText): Prop


axiom DetailedToStateOrPoliticalSubdivision (p : Person) (c : ComplaintText): Prop


axiom DetailedToNonProfitInstitution (p : Person) (c : ComplaintText): Prop


axiom CircumstancesLikelyToPrecludeSection2679bRemedies (p : Person) (act : ActOrOmission) (c : ComplaintText): Prop


axiom SecretaryHeldHarmlessOrProvidedLiabilityInsurance (p : Person) (c : ComplaintText): Prop


axiom IsPublicOrNonProfitPrivateEntity (e : CoveredEntity) (c : ComplaintText): Prop


axiom ReceivesFederalFundsUnderSection254b (e : CoveredEntity) (c : ComplaintText): Prop


axiom DeemingApplicationSubmittedInPrescribedForm (app : DeemingApplication) (e : CoveredEntity) (c : ComplaintText): Prop


axiom ApplicationVerifiesCoverageAndScopeRequirements (app : DeemingApplication) (e : CoveredEntity) (c : ComplaintText): Prop


axiom SecretaryApprovedDeemingApplication (app : DeemingApplication) (e : CoveredEntity) (c : ComplaintText): Prop


axiom daysFromApplicationToSecretaryDetermination (app : DeemingApplication) (e : CoveredEntity) (c : ComplaintText): Nat


axiom SecretaryDeterminationFinalAndBinding (e : CoveredEntity) (c : ComplaintText): Prop


axiom TransferMadeUnderSubsectionK3ForFiscalYear (e : CoveredEntity) (c : ComplaintText): Prop


axiom ServicesProvidedInDeemedCalendarYear (svc : HealthService) (e : CoveredEntity) (c : ComplaintText): Prop


axiom IsOfficerGoverningBoardMemberOrEmployeeOfEntity (p : Person) (e : CoveredEntity) (c : ComplaintText): Prop


axiom IsPhysicianOrLicensedHealthCarePractitionerContractor (p : Person) (e : CoveredEntity) (c : ComplaintText): Prop


axiom contractorHalfHoursPerWeek (p : Person) (e : CoveredEntity) (c : ComplaintText): Nat


axiom IsListedSpecialtyProvider (p : Person) (e : CoveredEntity) (c : ComplaintText): Prop


axiom ServiceProvidedToPatientOfEntity (svc : HealthService) (e : CoveredEntity) (c : ComplaintText): Prop


axiom ServiceProvidedToNonPatient (svc : HealthService) (e : CoveredEntity) (c : ComplaintText): Prop


axiom SecretaryDeterminedNonPatientCoverage (svc : HealthService) (e : CoveredEntity) (c : ComplaintText): Prop


axiom ServiceBenefitsPatientsAndCommunityWide (svc : HealthService) (e : CoveredEntity) (c : ComplaintText): Prop


axiom ServiceFacilitatesProvisionToPatients (svc : HealthService) (e : CoveredEntity) (c : ComplaintText): Prop


axiom ServiceRequiredUnderEmploymentContract (svc : HealthService) (e : CoveredEntity) (c : ComplaintText): Prop


axiom EntityTerminatedDeemingByWrittenNotice (e : CoveredEntity) (c : ComplaintText): Prop


axiom ActOrOmissionOnOrAfterJanuaryFirst1993 (act : ActOrOmission) (c : ComplaintText): Prop


axiom InsuranceClaimSubrogatedToUnitedStates (e : CoveredEntity) (c : ComplaintText): Prop


axiom HasMalpracticeRiskReductionPolicies (e : CoveredEntity) (c : ComplaintText): Prop


axiom HasVerifiedPractitionerCredentials (e : CoveredEntity) (c : ComplaintText): Prop


axiom NoAdverseClaimsHistoryOrFullCooperation (e : CoveredEntity) (c : ComplaintText): Prop


axiom WillCooperateOnClaimsEstimates (e : CoveredEntity) (c : ComplaintText): Prop


axiom AttorneyGeneralDeterminedOnTheRecord (p : Person) (e : CoveredEntity) (c : ComplaintText): Prop


axiom NoticeAndFullAndFairHearingProvided (p : Person) (e : CoveredEntity) (c : ComplaintText): Prop


axiom TreatingIndividualAsEmployeeExposesGovernmentToUnreasonableRisk (p : Person) (e : CoveredEntity) (c : ComplaintText): Prop


axiom FailedToComplyWithEntityRiskPolicies (p : Person) (e : CoveredEntity) (c : ComplaintText): Prop


axiom ClaimsHistoryOutsideSpecialtyNorm (p : Person) (e : CoveredEntity) (c : ComplaintText): Prop


axiom RefusedToCooperateInDefense (p : Person) (e : CoveredEntity) (c : ComplaintText): Prop


axiom ProvidedFalseInformationRelevantToDuties (p : Person) (e : CoveredEntity) (c : ComplaintText): Prop


axiom SubjectOfStateOrProfessionalDisciplinaryAction (p : Person) (e : CoveredEntity) (c : ComplaintText): Prop


axiom DeDeemingAppliesOnlyProspectivelyAfterNotice (p : Person) (e : CoveredEntity) (c : ComplaintText): Prop


axiom NationalHealthServiceCorpsProtectionApplies (p : Person) (e : CoveredEntity) (c : ComplaintText): Prop


axiom AttorneyGeneralEstimatedExpectedClaims (e : CoveredEntity) (c : ComplaintText): Prop


axiom fundAmountDollars233k2 (e : CoveredEntity) (c : ComplaintText): Nat


axiom FundTransferredByDecember31 (e : CoveredEntity) (c : ComplaintText): Prop


axiom daysFromNotificationToAttorneyGeneralAppearance (a : CivilAction) (c : ComplaintText): Nat


axiom AttorneyGeneralAdvisedStateCourtOfDeemingStatus (a : CivilAction) (e : CoveredEntity) (c : ComplaintText): Prop


axiom ActionRemovedOnPetitionAfterAttorneyGeneralFailure (a : CivilAction) (c : ComplaintText): Prop


axiom ActionStayedPendingForumDetermination (a : CivilAction) (c : ComplaintText): Prop


axiom EntityContractsWithManagedCarePlan (e : CoveredEntity) (plan : ManagedCarePlan) (c : ComplaintText): Prop


axiom ServiceProvidedToManagedCarePlanEnrollee (svc : HealthService) (plan : ManagedCarePlan) (c : ComplaintText): Prop


axiom PlanIsAtRiskContractingHealthOrganization (plan : ManagedCarePlan) (c : ComplaintText): Prop


axiom PlanDeemedEntityToMeetMalpracticeCoverageRequirements (plan : ManagedCarePlan) (e : CoveredEntity) (c : ComplaintText): Prop


axiom PlanFoundOnTheRecordToHaveViolatedSubsectionM (plan : ManagedCarePlan) (c : ComplaintText): Prop


axiom PlanIneligibleForTitleXVIIIAndXIXFunds (plan : ManagedCarePlan) (c : ComplaintText): Prop


axiom ServiceProvidedAtFreeClinicOrOffsiteProgram (svc : HealthService) (fc : FreeClinic) (c : ComplaintText): Prop


axiom FreeClinicSponsorsPractitioner (p : Person) (fc : FreeClinic) (c : ComplaintText): Prop


axiom ServiceIsQualifyingHealthService (svc : HealthService) (c : ComplaintText): Prop


axiom NoCompensationReceivedFromIndividualOrThirdPartyPayor (p : Person) (fc : FreeClinic) (svc : HealthService) (c : ComplaintText): Prop


axiom WrittenLiabilityLimitationNoticeGivenBeforeService (p : Person) (fc : FreeClinic) (svc : HealthService) (c : ComplaintText): Prop


axiom PractitionerLicensedAtTimeOfService (p : Person) (c : ComplaintText): Prop


axiom FreeClinicOperatedByNonprofitPrivateEntity (fc : FreeClinic) (c : ComplaintText): Prop


axiom FreeClinicAcceptsNoThirdPartyReimbursement (fc : FreeClinic) (c : ComplaintText): Prop


axiom FreeClinicChargesNothingOrSlidingScale (fc : FreeClinic) (c : ComplaintText): Prop


axiom FreeClinicLicensedOrCertified (fc : FreeClinic) (c : ComplaintText): Prop


axiom FreeClinicTransferMadeUnderSubsectionO6D (fc : FreeClinic) (c : ComplaintText): Prop


axiom ActOrOmissionAfterFreeClinicDeemingDetermination (act : ActOrOmission) (p : Person) (c : ComplaintText): Prop


axiom IsCoveredPersonForCountermeasure (p : Person) (cm : Countermeasure) (c : ComplaintText): Prop


axiom IsCoveredCountermeasureAgainstSmallpox (cm : Countermeasure) (decl : Declaration) (c : ComplaintText): Prop


axiom SecretaryIssuedAndPublishedDeclaration (decl : Declaration) (c : ComplaintText): Prop


axiom CountermeasureAdministeredByQualifiedPerson (p : Person) (cm : Countermeasure) (c : ComplaintText): Prop


axiom AdministeredForDeclaredPurposeDuringEffectivePeriod (cm : Countermeasure) (decl : Declaration) (c : ComplaintText): Prop


axiom RecipientWithinDeclaredCategory (cm : Countermeasure) (decl : Declaration) (c : ComplaintText): Prop


axiom QualifiedPersonHadReasonableGroundsToBelieveCategory (p : Person) (cm : Countermeasure) (decl : Declaration) (c : ComplaintText): Prop


axiom ClaimArisesOutOfAdministrationOfCountermeasure (act : ActOrOmission) (cm : Countermeasure) (c : ComplaintText): Prop


axiom VacciniaContractedWithinPresumptionWindow (p : Person) (decl : Declaration) (c : ComplaintText): Prop


axiom VacciniaTransmissionPresumptionRebutted (p : Person) (c : ComplaintText): Prop


axiom TransmittingIndividualDeemedWithinScope (p : Person) (c : ComplaintText): Prop


axiom ExhaustedPartCRemedies (p : Person) (c : ComplaintText): Prop


axiom daysFromPartCRequestToFinalDetermination (p : Person) (c : ComplaintText): Nat


axiom PartCCompensationOffsetAgainstAward (p : Person) (c : ComplaintText): Prop


axiom CoveredPersonCooperatedInDefense (p : Person) (c : ComplaintText): Prop


axiom UnitedStatesMadePaymentToClaimant (p : Person) (c : ComplaintText): Prop


axiom FailedToCarryOutContractualObligationToUnitedStates (p : Person) (c : ComplaintText): Prop


axiom EngagedInGrosslyNegligentRecklessOrIllegalConduct (p : Person) (c : ComplaintText): Prop


axiom ServiceProvidedAtDeemedEntityFacilityOrOffsite (svc : HealthService) (e : CoveredEntity) (c : ComplaintText): Prop


axiom EntitySponsorsVolunteerPractitioner (p : Person) (e : CoveredEntity) (c : ComplaintText): Prop


axiom VolunteerReceivesNoCompensationBeyondExpenseRepayment (p : Person) (e : CoveredEntity) (svc : HealthService) (c : ComplaintText): Prop


axiom ClearAndConspicuousLiabilityNoticePosted (p : Person) (e : CoveredEntity) (svc : HealthService) (c : ComplaintText): Prop


axiom PractitionerLicensedUnderFederalAndStateLaw (p : Person) (c : ComplaintText): Prop


axiom EntityMaintainsCertifyingDocumentation (p : Person) (e : CoveredEntity) (c : ComplaintText): Prop


axiom ServiceEligibleForFundingUnderSection254b (svc : HealthService) (c : ComplaintText): Prop


axiom VolunteerTransferMadeUnderSubsectionQ4C (e : CoveredEntity) (c : ComplaintText): Prop


axiom ActOrOmissionAfterVolunteerDeemingDetermination (act : ActOrOmission) (p : Person) (c : ComplaintText): Prop




axiom IsLicensedHealthCareProfessional (p : Person) (c : ComplaintText): Prop


axiom IsMedicalReserveCorpsMember (p : Person) (c : ComplaintText): Prop


axiom IsESARVHPRegisteredProfessional (p : Person) (c : ComplaintText): Prop


axiom RespondingToDeclaredPublicHealthEmergency (p : Person) (ed : EmergencyDeclaration) (c : ComplaintText): Prop


axiom daysFromEmergencyDeterminationToActOrOmission (act : ActOrOmission) (ed : EmergencyDeclaration) (c : ComplaintText): Nat


axiom RespondingToPresidentiallyDeclaredMajorDisasterOrEmergency (p : Person) (ed : EmergencyDeclaration) (c : ComplaintText): Prop


axiom ActOrOmissionDuringInitialDeclarationPeriod (act : ActOrOmission) (ed : EmergencyDeclaration) (c : ComplaintText): Prop


axiom ActOrOmissionRelatedToEmergencyTreatment (act : ActOrOmission) (ed : EmergencyDeclaration) (c : ComplaintText): Prop


axiom ActOrOmissionInDeclaredState (act : ActOrOmission) (ed : EmergencyDeclaration) (c : ComplaintText): Prop


axiom ActedInMedicalReserveCorpsOrESARVHPCapacity (p : Person) (act : ActOrOmission) (c : ComplaintText): Prop


axiom ServicesWithinScopeOfStateLicensure (p : Person) (act : ActOrOmission) (c : ComplaintText): Prop


axiom StateAuthorizedDeploymentPriorToActOrOmission (p : Person) (ed : EmergencyDeclaration) (c : ComplaintText): Prop


axiom ProvidesDiagnosisPreventionOrTreatmentServices (act : ActOrOmission) (c : ComplaintText): Prop


axiom ProvidesHealthAssessmentOrCareServices (act : ActOrOmission) (c : ComplaintText): Prop


axiom ActOrOmissionOnOrAfterSection234EffectiveDate (act : ActOrOmission) (c : ComplaintText): Prop


axiom SubjectOnlyToStateLiabilityLawsOfSitusState (p : Person) (act : ActOrOmission) (c : ComplaintText): Prop


axiom LicensureRegistrationAndCertificationExcepted (p : Person) (c : ComplaintText): Prop




axiom GrantsSoughtOrMadeUnderTwoOrMorePrograms (proj : Project) (c : ComplaintText): Prop


axiom GrantsRelateToSingleProject (proj : Project) (c : ComplaintText): Prop


axiom RegulationFacilitatesAdministrationOrExpeditesPurposes (reg : Regulation) (proj : Project) (c : ComplaintText): Prop


axiom RegulationConsolidatesAdministrativeFunctionsInSingleUnit (reg : Regulation) (proj : Project) (c : ComplaintText): Prop


axiom RegulationReducesAndUniformizesApplicationRequirements (reg : Regulation) (proj : Project) (c : ComplaintText): Prop


axiom RegulationRevisesInconsistentOrDuplicativeRequirements (reg : Regulation) (proj : Project) (c : ComplaintText): Prop


axiom RegulationWaivesOrSuspendsStatutoryRequirement (reg : Regulation) (proj : Project) (c : ComplaintText): Prop




axiom OrphanProductsBoardEstablishedInDepartment (bd : Board) (c : ComplaintText): Prop


axiom BoardIncludesRequiredAgencyRepresentatives (bd : Board) (c : ComplaintText): Prop


axiom BoardChairedByAssistantSecretaryForHealth (bd : Board) (c : ComplaintText): Prop


axiom BoardPromotesRareDiseaseProductDevelopmentAndCoordination (bd : Board) (c : ComplaintText): Prop


axiom BoardEvaluatedOrphanDrugActEffectAndImplementation (bd : Board) (c : ComplaintText): Prop


axiom BoardEvaluatedNIHDrugDevelopmentActivities (bd : Board) (c : ComplaintText): Prop


axiom BoardAssuredInteragencyDevelopmentCoordination (bd : Board) (c : ComplaintText): Prop


axiom BoardAssuredCoordinationWithManufacturersAndPatientGroups (bd : Board) (c : ComplaintText): Prop


axiom BoardInformedPhysiciansAndPublicWithSponsorConsent (bd : Board) (c : ComplaintText): Prop


axiom BoardSoughtSponsorsInvestigatorsAndDistributors (bd : Board) (c : ComplaintText): Prop


axiom BoardRecognizedRareDiseaseDevelopmentEfforts (bd : Board) (c : ComplaintText): Prop


axiom BoardConsultedInterestedPersonsWithOralViewOpportunity (bd : Board) (c : ComplaintText): Prop


axiom AnnualReportContainsRequiredContents (bd : Board) (c : ComplaintText): Prop


axiom AnnualReportIncludesComponentAgencyReports (bd : Board) (c : ComplaintText): Prop


axiom AnnualReportSubmittedByJune1 (bd : Board) (c : ComplaintText): Prop




axiom ConteServiceEstablishedInPublicHealthService (s : ExpertService) (c : ComplaintText): Prop


axiom serviceMemberCount (s : ExpertService) (c : ComplaintText): Nat


axiom ServicePurposeIsRecruitAndRetainExperts (s : ExpertService) (c : ComplaintText): Prop


axiom SecretaryAssignedExpertsAccordingToAgencyNeed (s : ExpertService) (c : ComplaintText): Prop


axiom AppointedBySecretaryWithoutRegardToTitle5 (p : Person) (s : ExpertService) (c : ComplaintText): Prop


axiom IsOutstandingInBiomedicalOrProductAssessmentField (p : Person) (c : ComplaintText): Prop


axiom HoldsDoctoralDegreeInBiomedicineOrRelatedField (p : Person) (c : ComplaintText): Prop


axiom HoldsDoctoralOrMastersDegreeInEngineeringOrBioinformatics (p : Person) (c : ComplaintText): Prop


axiom MeetsOPMQualificationStandardsForGS15 (p : Person) (c : ComplaintText): Prop


axiom EnumeratedTitle5ChaptersInapplicableToMember (p : Person) (s : ExpertService) (c : ComplaintText): Prop


axiom PerformanceAppraisalSystemProvidesSystematicAppraisal (s : ExpertService) (c : ComplaintText): Prop


axiom PerformanceAppraisalSystemEncouragesExcellence (s : ExpertService) (c : ComplaintText): Prop


axiom memberAnnualPayDollars (p : Person) (s : ExpertService) (c : ComplaintText): Nat


axiom gs15MinimumAnnualRateDollars (s : ExpertService) (c : ComplaintText): Nat


axiom executiveCompensationCapDollars (s : ExpertService) (c : ComplaintText): Nat


axiom SeparatedInvoluntarilyAndWithoutCause (p : Person) (s : ExpertService) (c : ComplaintText): Prop


axiom WasCareerAppointeeBeforeServiceAppointment (p : Person) (c : ComplaintText): Prop


axiom ReappointedToCompetitiveServiceGS15CareerPosition (p : Person) (c : ComplaintText): Prop


axiom ReappointedToExceptedServiceForNotMoreThanTwoYears (p : Person) (c : ComplaintText): Prop


axiom SecretaryPromulgatedServiceAdministrationRegulations (s : ExpertService) (c : ComplaintText): Prop




axiom OfficeOnWomensHealthEstablishedWithinOfficeOfSecretary (o : Office) (c : ComplaintText): Prop


axiom OfficeHeadedByDeputyAssistantSecretaryForWomensHealth (o : Office) (c : ComplaintText): Prop


axiom EstablishedGoalsAndCoordinatedDepartmentalActivities (o : Office) (c : ComplaintText): Prop


axiom ProvidedExpertAdviceToSecretary (o : Office) (c : ComplaintText): Prop


axiom MonitoredDepartmentalWomensHealthActivities (o : Office) (c : ComplaintText): Prop


axiom EstablishedCoordinatingCommitteeOnWomensHealth (o : Office) (c : ComplaintText): Prop


axiom EstablishedNationalWomensHealthInformationCenter (o : Office) (c : ComplaintText): Prop


axiom CoordinatedPrivateSectorPromotionEfforts (o : Office) (c : ComplaintText): Prop


axiom ProvidedForExchangeOfInformationWithGranteesAndPublic (o : Office) (c : ComplaintText): Prop


axiom SecretaryMadeGrantsOrEnteredAgreements (o : Office) (c : ComplaintText): Prop


axiom ProvidedForProjectEvaluationsAndDissemination (o : Office) (c : ComplaintText): Prop


axiom BiennialReportSubmittedToCongress (o : Office) (c : ComplaintText): Prop


axiom AppropriationsAuthorizedForCoveredFiscalYears (o : Office) (c : ComplaintText): Prop




axiom HeadsOfConcernedDepartmentsAgreed (h : Hospital) (c : ComplaintText): Prop


axiom ImmigrationServicePermittedPHSUseOfStationHospital (h : Hospital) (c : ComplaintText): Prop


axiom UseIsForCareOfPublicHealthServicePatients (h : Hospital) (c : ComplaintText): Prop


axiom SurgeonGeneralReimbursedActualCostOfUtilitiesAndSupplies (h : Hospital) (c : ComplaintText): Prop


axiom ReimbursementCoveredIntoProperAppropriationOrWorkingFunds (h : Hospital) (c : ComplaintText): Prop


axiom ChargeMadeForPhysicalUpkeepOfHospitals (h : Hospital) (c : ComplaintText): Prop


axiom PersonDetainedAtImmigrationServiceRequest (p : Person) (h : Hospital) (c : ComplaintText): Prop


axiom ImmigrationServiceReimbursedForCareOfDetainedPersons (p : Person) (h : Hospital) (c : ComplaintText): Prop


axiom DetainedPersonEntitledToCareUnderSection249a (p : Person) (c : ComplaintText): Prop




axiom FacilityFundedUnderCommunityMentalHealthCentersAct (fac : Facility) (c : ComplaintText): Prop


axiom yearsFromCompletionOrAcquisitionToTriggeringEvent (fac : Facility) (c : ComplaintText): Nat


axiom FacilitySoldOrTransferred (fac : Facility) (tr : Transfer) (c : ComplaintText): Prop


axiom TransfereeNotQualifiedToApplyUnderSection222 (tr : Transfer) (c : ComplaintText): Prop


axiom TransfereeDisapprovedByStateMentalHealthAgency (tr : Transfer) (c : ComplaintText): Prop


axiom FacilityCeasedUseForComprehensiveMentalHealthServices (fac : Facility) (c : ComplaintText): Prop


axiom UnitedStatesEntitledToRecoverFromTransferorTransfereeOrOwner (fac : Facility) (c : ComplaintText): Prop


axiom WrittenNoticeProvidedToSecretary (fac : Facility) (c : ComplaintText): Prop


axiom daysFromTriggeringEventToNotice (fac : Facility) (c : ComplaintText): Nat


axiom facilityThenValueDollars (fac : Facility) (c : ComplaintText): Nat


axiom federalParticipationDollars (fac : Facility) (c : ComplaintText): Nat


axiom projectCostDollars (fac : Facility) (c : ComplaintText): Nat


axiom BaseAmountComputedAsProportionateShare (fac : Facility) (c : ComplaintText): Prop


axiom InterestComputedAtTreasuryBillRate (fac : Facility) (c : ComplaintText): Prop


axiom interestPeriodStartDaysAfterEvent (fac : Facility) (c : ComplaintText): Nat


axiom SecretaryWaivedRecoveryForGoodCause (fac : Facility) (c : ComplaintText): Prop


axiom RecoveryRightAssertedAsPreJudgmentLien (fac : Facility) (c : ComplaintText): Prop




axiom SecretaryEnteredContractWithFiscalAgent (k : FiscalAgentContract) (fa : FiscalAgent) (c : ComplaintText): Prop


axiom IsCarrierDescribedInSection1395uF1 (fa : FiscalAgent) (c : ComplaintText): Prop


axiom IsIndianTribeOrTribalOrganizationUnderSelfDeterminationAct (fa : FiscalAgent) (c : ComplaintText): Prop


axiom ContractDeterminesAmountsPayableForIndianHealthServiceCare (k : FiscalAgentContract) (c : ComplaintText): Prop


axiom ContractDeterminesAmountsPayableForPublicHealthServiceCare (k : FiscalAgentContract) (c : ComplaintText): Prop


axiom ContractProvidesForReceiptDisbursementAndAccounting (k : FiscalAgentContract) (c : ComplaintText): Prop


axiom ContractProvidesForAuditsOfRecords (k : FiscalAgentContract) (c : ComplaintText): Prop


axiom ContractProvidesForNecessaryAdditionalFunctions (k : FiscalAgentContract) (c : ComplaintText): Prop


axiom SecretaryFoundEntityWillPerformEfficientlyAndEffectively (fa : FiscalAgent) (k : FiscalAgentContract) (c : ComplaintText): Prop


axiom SecretaryFoundEntityMeetsFinancialAndLegalRequirements (fa : FiscalAgent) (k : FiscalAgentContract) (c : ComplaintText): Prop


axiom ContractEnteredWithoutRegardToCompetitionRequirements (k : FiscalAgentContract) (c : ComplaintText): Prop


axiom ContractProvidesForAdvancesOfFunds (k : FiscalAgentContract) (c : ComplaintText): Prop


axiom MedicareCarrierProvisionsAppliedToContract (k : FiscalAgentContract) (c : ComplaintText): Prop

end Proving.USC.T42.Ch6ASchI.Reslice.Elements
