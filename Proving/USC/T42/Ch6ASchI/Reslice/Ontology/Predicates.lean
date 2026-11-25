






import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch6ASchI.Reslice.Ontology.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reslice.Ontology

open Proving.USC.Common





axiom IsNationalAdvisoryCouncilOnMigrantHealth (co : Council) (c : ComplaintText) : Prop



axiom IsAssistedMigrantHealthEntity (e : Entity) (c : ComplaintText) : Prop



axiom IsGoverningBoardMemberOfMigrantHealthEntity (m : CouncilMember) (c : ComplaintText) : Prop



axiom IsServedByMigrantHealthCenter (m : CouncilMember) (c : ComplaintText) : Prop



axiom IsFamiliarWithMigrantHealthCareDelivery (m : CouncilMember) (c : ComplaintText) : Prop



axiom IsQualifiedByTrainingInMedicalSciencesOrHealthAdministration (m : CouncilMember) (c : ComplaintText) : Prop





axiom IsServiceAndSupplyFund (f : SupplyFund) (c : ComplaintText) : Prop



axiom IsSupplyServiceActivity (s : FundService) (c : ComplaintText) : Prop



axiom IsCentralServiceDeterminedBySurgeonGeneral (s : FundService) (c : ComplaintText) : Prop



axiom IsCostBasedReimbursementRate (f : SupplyFund) (c : ComplaintText) : Prop





axiom IsPublicHealthServiceOfficerOrEmployee (p : Person) (c : ComplaintText) : Prop



axiom ActsWithinScopeOfOfficeOrEmployment (p : Person) (c : ComplaintText) : Prop



axiom IsMedicalSurgicalDentalOrRelatedFunction (fn : MedicalFunction) (c : ComplaintText) : Prop



axiom IsPersonalInjuryDamage (d : Damage) (c : ComplaintText) : Prop



axiom IsPublicOrNonprofitPrivateEntity (e : Entity) (c : ComplaintText) : Prop



axiom ReceivesFederalFundsUnderHealthCenterProgram (e : Entity) (c : ComplaintText) : Prop



axiom IsOfficerGoverningBoardMemberOrEmployeeOfEntity (p : Person) (c : ComplaintText) : Prop



axiom PerformsAtLeastThirtyTwoAndOneHalfHoursPerWeek (p : Person) (c : ComplaintText) : Prop



axiom IsLicensedProviderInDesignatedPrimaryCareField (p : Person) (c : ComplaintText) : Prop



axiom IsDeemedPublicHealthServiceEmployee (p : Person) (c : ComplaintText) : Prop



axiom SecretaryApprovedDeemingApplication (e : Entity) (c : ComplaintText) : Prop



axiom IsPatientOfEntity (p : Person) (c : ComplaintText) : Prop



axiom ServiceBenefitsPatientsAndCommunityPopulations (s : HealthService) (c : ComplaintText) : Prop



axiom ServiceFacilitatesProvisionToPatients (s : HealthService) (c : ComplaintText) : Prop



axiom ServiceRequiredUnderEmploymentContract (s : HealthService) (c : ComplaintText) : Prop



axiom HasMalpracticeRiskReductionPolicies (e : Entity) (c : ComplaintText) : Prop



axiom HasVerifiedPractitionerCredentials (e : Entity) (c : ComplaintText) : Prop



axiom HasNoAdverseClaimsHistoryOrHasCooperated (e : Entity) (c : ComplaintText) : Prop



axiom WillCooperateWithAttorneyGeneralOnEstimates (e : Entity) (c : ComplaintText) : Prop



axiom IsHealthMaintenanceOrganizationOrSimilarEntity (pl : ManagedCarePlan) (c : ComplaintText) : Prop



axiom ContractsAtRiskWithPayorsForHealthServices (pl : ManagedCarePlan) (c : ComplaintText) : Prop



axiom ContractsWithProvidersForDeliveryToEnrollees (pl : ManagedCarePlan) (c : ComplaintText) : Prop



axiom IsOperatedByNonprofitPrivateEntity (fc : FreeClinic) (c : ComplaintText) : Prop



axiom AcceptsNoThirdPartyPayorReimbursement (fc : FreeClinic) (c : ComplaintText) : Prop



axiom ImposesNoChargeOrAbilityToPayCharge (fc : FreeClinic) (c : ComplaintText) : Prop



axiom IsLicensedOrCertifiedHealthFacility (fc : FreeClinic) (c : ComplaintText) : Prop



axiom IsMedicalAssistanceUnderTitleXIX (s : HealthService) (c : ComplaintText) : Prop



axiom ServiceProvidedAtFreeClinicOrOffsiteProgram (s : HealthService) (c : ComplaintText) : Prop



axiom IsSponsoredByFreeClinic (hp : HealthCarePractitioner) (c : ComplaintText) : Prop



axiom ReceivesNoCompensationForService (hp : HealthCarePractitioner) (c : ComplaintText) : Prop



axiom GivesWrittenNoticeOfLimitedLiability (hp : HealthCarePractitioner) (c : ComplaintText) : Prop



axiom IsLicensedOrCertifiedAtTimeOfService (hp : HealthCarePractitioner) (c : ComplaintText) : Prop



axiom ServiceProvidedAtDeemedEntityFacilityOrOffsite (s : HealthService) (c : ComplaintText) : Prop



axiom IsSponsoredByDeemedEntity (hp : HealthCarePractitioner) (c : ComplaintText) : Prop



axiom PostsConspicuousLiabilityNoticeAtSite (hp : HealthCarePractitioner) (c : ComplaintText) : Prop



axiom EntityMaintainsVolunteerCertifyingDocumentation (hp : HealthCarePractitioner) (c : ComplaintText) : Prop



axiom IsServiceEligibleForHealthCenterFunding (s : HealthService) (c : ComplaintText) : Prop



axiom UsedToPreventOrTreatSmallpox (cm : Countermeasure) (c : ComplaintText) : Prop



axiom UsedToControlOrTreatAdverseEffectsOfVaccinia (cm : Countermeasure) (c : ComplaintText) : Prop



axiom SpecifiedInSecretarialDeclaration (cm : Countermeasure) (c : ComplaintText) : Prop



axiom IsManufacturerOrDistributorOfCountermeasure (p : Person) (c : ComplaintText) : Prop



axiom IsHealthCareEntityUnderWhoseAuspicesCountermeasureAdministered (p : Person) (c : ComplaintText) : Prop



axiom IsAuthorizedToAdministerUnderStateLaw (p : Person) (c : ComplaintText) : Prop



axiom IsOtherwiseAuthorizedBySecretaryToAdminister (p : Person) (c : ComplaintText) : Prop



axiom IsStateOrPoliticalSubdivisionSupervisingProgram (p : Person) (c : ComplaintText) : Prop



axiom IsAllegedVacciniaTransmitter (p : Person) (c : ComplaintText) : Prop



axiom IsEmployerOrCredentialingEntityOfTransmitter (p : Person) (c : ComplaintText) : Prop



axiom IsOfficialAgentOrEmployeeOfCoveredPerson (p : Person) (c : ComplaintText) : Prop



axiom IsContractorOrVolunteerPerformingCoveredFunction (p : Person) (c : ComplaintText) : Prop



axiom HasPrivilegesUnderAuspicesOfCoveredEntity (p : Person) (c : ComplaintText) : Prop



axiom ClaimConcernsAdministrationDecision (cl : Claim) (c : ComplaintText) : Prop



axiom ClaimConcernsInformedConsent (cl : Claim) (c : ComplaintText) : Prop



axiom ClaimConcernsSiteMonitoringOrEffectivenessEvaluation (cl : Claim) (c : ComplaintText) : Prop



axiom ClaimConcernsVacciniaTransmission (cl : Claim) (c : ComplaintText) : Prop





axiom IsLicensedRegisteredOrCertifiedToProvideHealthCareServices (hp : HealthCarePractitioner) (c : ComplaintText) : Prop



axiom IsProvidedByOrUnderSupervisionOfHealthCareProfessional (s : HealthService) (c : ComplaintText) : Prop



axiom RelatesToDiagnosisPreventionOrTreatmentOfDisease (s : HealthService) (c : ComplaintText) : Prop



axiom RelatesToAssessmentOrCareOfHumanHealth (s : HealthService) (c : ComplaintText) : Prop



axiom IsMedicalReserveCorpsMember (hp : HealthCarePractitioner) (c : ComplaintText) : Prop



axiom IsEsarVhpRegisteredVolunteerHealthProfessional (hp : HealthCarePractitioner) (c : ComplaintText) : Prop



axiom RespondsToDeterminedPublicHealthEmergency (hp : HealthCarePractitioner) (c : ComplaintText) : Prop



axiom RespondsToPresidentiallyDeclaredMajorDisasterOrEmergency (hp : HealthCarePractitioner) (c : ComplaintText) : Prop



axiom ActOrOmissionWithinInitialPeriodAndEmergencyRelated (hp : HealthCarePractitioner) (c : ComplaintText) : Prop



axiom ActOrOmissionInDeterminationOrDeclarationState (hp : HealthCarePractitioner) (c : ComplaintText) : Prop



axiom ActedInCorpsOrRegistryCapacity (hp : HealthCarePractitioner) (c : ComplaintText) : Prop



axiom ActedWithinScopeOfLicenseRegistrationOrCertification (hp : HealthCarePractitioner) (c : ComplaintText) : Prop



axiom HadPriorStateDeploymentAuthorization (hp : HealthCarePractitioner) (c : ComplaintText) : Prop





axiom IsProgramCoveredByMultigrantAdministration (pg : GrantProgram) (c : ComplaintText) : Prop



axiom IsSingleProjectWithGrantsUnderTwoOrMorePrograms (pr : Project) (c : ComplaintText) : Prop



axiom IsUnitChargedWithAdministrationOfCoveredProgram (u : AdministrativeUnit) (c : ComplaintText) : Prop



axiom IsUnitSupervisingTwoOrMoreCoveredPrograms (u : AdministrativeUnit) (c : ComplaintText) : Prop



axiom IsRequirementImposedByLawOrRequiredRegulation (pg : GrantProgram) (c : ComplaintText) : Prop





axiom IsOrphanProductsBoard (b : OrphanProductsBoard) (c : ComplaintText) : Prop



axiom IsDrugIncludingBiologic (a : Article) (c : ComplaintText) : Prop



axiom IsDeviceIncludingDiagnosticProduct (a : Article) (c : ComplaintText) : Prop



axiom IsForRareDiseaseOrCondition (a : Article) (c : ComplaintText) : Prop



axiom IsAssistantSecretaryForHealth (m : BoardMember) (c : ComplaintText) : Prop



axiom IsRepresentativeOfNamedHealthAgency (m : BoardMember) (c : ComplaintText) : Prop



axiom IsRepresentativeOfSecretaryDesignatedAgency (m : BoardMember) (c : ComplaintText) : Prop





axiom IsSeniorBiomedicalResearchAndProductAssessmentService (sv : BiomedicalService) (c : ComplaintText) : Prop



axiom IsOutstandingInBiomedicalOrProductAssessmentField (m : ServiceMember) (c : ComplaintText) : Prop



axiom HoldsDoctoralDegreeInBiomedicineOrRelatedField (m : ServiceMember) (c : ComplaintText) : Prop



axiom HoldsDoctoralOrMastersDegreeInEngineeringOrBioinformatics (m : ServiceMember) (c : ComplaintText) : Prop



axiom MeetsGradeFifteenQualificationStandards (m : ServiceMember) (c : ComplaintText) : Prop



axiom ProvidesSystematicPerformanceAppraisal (sv : BiomedicalService) (c : ComplaintText) : Prop



axiom EncouragesExcellenceInPerformance (sv : BiomedicalService) (c : ComplaintText) : Prop



axiom membersInService (sv : BiomedicalService) (c : ComplaintText) : Nat



axiom annualPayOfServiceMember (m : ServiceMember) (c : ComplaintText) : Nat



axiom minimumGradeFifteenRate (c : ComplaintText) : Nat



axiom presidentialCompensationCap (c : ComplaintText) : Nat





axiom IsOfficeOnWomensHealth (o : WomensHealthOffice) (c : ComplaintText) : Prop



axiom IsHeadedByDeputyAssistantSecretaryForWomensHealth (o : WomensHealthOffice) (c : ComplaintText) : Prop



axiom IsChairedByDeputyAssistantSecretaryForWomensHealth (cm : CoordinatingCommittee) (c : ComplaintText) : Prop



axiom IsComposedOfSeniorDepartmentalRepresentatives (cm : CoordinatingCommittee) (c : ComplaintText) : Prop



axiom FacilitatesExchangeOfWomensHealthInformation (ic : InformationCenter) (c : ComplaintText) : Prop



axiom FacilitatesAccessToSuchInformation (ic : InformationCenter) (c : ComplaintText) : Prop



axiom AssistsInAnalysisOfWomensHealthIssues (ic : InformationCenter) (c : ComplaintText) : Prop



axiom ProvidesTechnicalAssistanceForInformationExchange (ic : InformationCenter) (c : ComplaintText) : Prop





axiom IsImmigrationStationHospital (h : Hospital) (c : ComplaintText) : Prop



axiom IsInterdepartmentalUseAgreement (h : Hospital) (c : ComplaintText) : Prop



axiom IsPublicHealthServicePatient (p : Person) (c : ComplaintText) : Prop



axiom IsReimbursableUtilitySupplyOrServiceCost (ci : CostItem) (c : ComplaintText) : Prop



axiom IsPhysicalUpkeepExpense (ci : CostItem) (c : ComplaintText) : Prop



axiom IsDetainedInPublicHealthServiceHospitalAtImmigrationRequest (p : Person) (c : ComplaintText) : Prop



axiom IsEntitledToCareUnderSection249a (p : Person) (c : ComplaintText) : Prop





axiom IsCommunityMentalHealthCentersActFundedFacility (f : Facility) (c : ComplaintText) : Prop



axiom WithinTwentyYearPostCompletionOrAcquisitionPeriod (f : Facility) (c : ComplaintText) : Prop



axiom TransferredToEntityIneligibleUnderSection222 (f : Facility) (c : ComplaintText) : Prop



axiom TransfereeDisapprovedByStateMentalHealthAgency (f : Facility) (c : ComplaintText) : Prop



axiom CeasedUseForComprehensiveMentalHealthServices (f : Facility) (c : ComplaintText) : Prop



axiom GaveTimelyWrittenNoticeOfSaleTransferOrChange (f : Facility) (c : ComplaintText) : Prop



axiom SecretaryWaivedRecoveryForGoodCause (f : Facility) (c : ComplaintText) : Prop



axiom IsPreJudgmentRecoveryRight (f : Facility) (c : ComplaintText) : Prop



axiom ConstitutesLienOnFacility (f : Facility) (c : ComplaintText) : Prop



axiom thenValueOfApprovedProjectPortion (f : Facility) (c : ComplaintText) : Nat



axiom federalParticipationAmount (f : Facility) (c : ComplaintText) : Nat



axiom projectCostOfRemodelingConstructionOrAcquisition (f : Facility) (c : ComplaintText) : Nat





axiom IsMedicareCarrier (fa : FiscalAgent) (c : ComplaintText) : Prop



axiom IsIndianTribeOrTribalOrganizationUnderSelfDeterminationContract (fa : FiscalAgent) (c : ComplaintText) : Prop



axiom PerformsObligationsEfficientlyAndEffectively (fa : FiscalAgent) (c : ComplaintText) : Prop



axiom MeetsFinancialResponsibilityAndLegalAuthorityRequirements (fa : FiscalAgent) (c : ComplaintText) : Prop



axiom DeterminesAmountsPayableForIndianHealthServiceServices (ct : AgentContract) (c : ComplaintText) : Prop



axiom DeterminesAmountsPayableForPublicHealthServiceServices (ct : AgentContract) (c : ComplaintText) : Prop



axiom IsEligibleIndian (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Reslice.Ontology
