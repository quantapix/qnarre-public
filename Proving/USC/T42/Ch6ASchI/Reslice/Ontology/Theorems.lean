







import Proving.USC.Common.Types
import Proving.USC.T42.Ch6ASchI.Reslice.Ontology.Statute

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reslice.Ontology

open Proving.USC.Common



theorem councilMemberQualification_intro_governingBoardServedAndFamiliar
    {m : CouncilMember} {c : ComplaintText}
    (board : IsGoverningBoardMemberOfMigrantHealthEntity m c)
    (served : IsServedByMigrantHealthCenter m c)
    (fam : IsFamiliarWithMigrantHealthCareDelivery m c)
    : CouncilMemberQualification m c :=
  .governingBoardServedAndFamiliar board served fam

theorem councilMemberQualification_intro_governingBoardMember
    {m : CouncilMember} {c : ComplaintText}
    (board : IsGoverningBoardMemberOfMigrantHealthEntity m c)
    : CouncilMemberQualification m c :=
  .governingBoardMember board

theorem councilMemberQualification_intro_qualifiedByTrainingAndExperience
    {m : CouncilMember} {c : ComplaintText}
    (qual : IsQualifiedByTrainingInMedicalSciencesOrHealthAdministration m c)
    : CouncilMemberQualification m c :=
  .qualifiedByTrainingAndExperience qual

theorem councilComposition_intro {co : Council} {m : CouncilMember}
    {c : ComplaintText}
    (council : IsNationalAdvisoryCouncilOnMigrantHealth co c)
    (seat : CouncilMemberQualification m c)
    : CouncilComposition co m c := ⟨council, seat⟩



theorem authorizedFundService_intro_supplyService {s : FundService}
    {c : ComplaintText} (h : IsSupplyServiceActivity s c)
    : AuthorizedFundService s c := .supplyService h

theorem authorizedFundService_intro_centralService {s : FundService}
    {c : ComplaintText} (h : IsCentralServiceDeterminedBySurgeonGeneral s c)
    : AuthorizedFundService s c := .centralService h

theorem serviceAndSupplyFundDefinition_intro {f : SupplyFund} {s : FundService}
    {c : ComplaintText}
    (fund : IsServiceAndSupplyFund f c)
    (use : AuthorizedFundService s c)
    (reimb : IsCostBasedReimbursementRate f c)
    : ServiceAndSupplyFundDefinition f s c := ⟨fund, use, reimb⟩



theorem exclusiveRemedySubject_intro {p : Person} {fn : MedicalFunction}
    {d : Damage} {c : ComplaintText}
    (officer : IsPublicHealthServiceOfficerOrEmployee p c)
    (scope : ActsWithinScopeOfOfficeOrEmployment p c)
    (fun_ : IsMedicalSurgicalDentalOrRelatedFunction fn c)
    (injury : IsPersonalInjuryDamage d c)
    : ExclusiveRemedySubject p fn d c := ⟨officer, scope, fun_, injury⟩

theorem coveredEntityDefinition_intro {e : Entity} {c : ComplaintText}
    (nonprofit : IsPublicOrNonprofitPrivateEntity e c)
    (funded : ReceivesFederalFundsUnderHealthCenterProgram e c)
    : CoveredEntityDefinition e c := ⟨nonprofit, funded⟩

theorem contractorOfEntity_intro_fullTimeHours {p : Person} {c : ComplaintText}
    (h : PerformsAtLeastThirtyTwoAndOneHalfHoursPerWeek p c)
    : ContractorOfEntity p c := .fullTimeHours h

theorem contractorOfEntity_intro_partTimeDesignatedField {p : Person}
    {c : ComplaintText} (h : IsLicensedProviderInDesignatedPrimaryCareField p c)
    : ContractorOfEntity p c := .partTimeDesignatedField h

theorem nonPatientServiceBasis_intro_communityBenefit {s : HealthService}
    {c : ComplaintText} (h : ServiceBenefitsPatientsAndCommunityPopulations s c)
    : NonPatientServiceBasis s c := .communityBenefit h

theorem nonPatientServiceBasis_intro_facilitatesPatientCare {s : HealthService}
    {c : ComplaintText} (h : ServiceFacilitatesProvisionToPatients s c)
    : NonPatientServiceBasis s c := .facilitatesPatientCare h

theorem nonPatientServiceBasis_intro_requiredByContract {s : HealthService}
    {c : ComplaintText} (h : ServiceRequiredUnderEmploymentContract s c)
    : NonPatientServiceBasis s c := .requiredByContract h

theorem deemingEligibleEntity_intro {e : Entity} {c : ComplaintText}
    (risk : HasMalpracticeRiskReductionPolicies e c)
    (creds : HasVerifiedPractitionerCredentials e c)
    (claims : HasNoAdverseClaimsHistoryOrHasCooperated e c)
    (coop : WillCooperateWithAttorneyGeneralOnEstimates e c)
    : DeemingEligibleEntity e c := ⟨risk, creds, claims, coop⟩

theorem approvedDeemedEntity_intro {e : Entity} {c : ComplaintText}
    (described : CoveredEntityDefinition e c)
    (eligible : DeemingEligibleEntity e c)
    (approved : SecretaryApprovedDeemingApplication e c)
    : ApprovedDeemedEntity e c := ⟨described, eligible, approved⟩

theorem deemedEntityPersonnel_intro {e : Entity} {p pat : Person}
    {c : ComplaintText}
    (entity : ApprovedDeemedEntity e c)
    (rel : IsOfficerGoverningBoardMemberOrEmployeeOfEntity p c)
    (deemed : IsDeemedPublicHealthServiceEmployee p c)
    (patient : IsPatientOfEntity pat c)
    : DeemedEntityPersonnel e p pat c := ⟨entity, rel, deemed, patient⟩

theorem managedCarePlanDefinition_intro {pl : ManagedCarePlan} {c : ComplaintText}
    (hmo : IsHealthMaintenanceOrganizationOrSimilarEntity pl c)
    (risk : ContractsAtRiskWithPayorsForHealthServices pl c)
    (providers : ContractsWithProvidersForDeliveryToEnrollees pl c)
    : ManagedCarePlanDefinition pl c := ⟨hmo, risk, providers⟩

theorem freeClinicDefinition_intro {fc : FreeClinic} {c : ComplaintText}
    (nonprofit : IsOperatedByNonprofitPrivateEntity fc c)
    (noPayor : AcceptsNoThirdPartyPayorReimbursement fc c)
    (charges : ImposesNoChargeOrAbilityToPayCharge fc c)
    (licensed : IsLicensedOrCertifiedHealthFacility fc c)
    : FreeClinicDefinition fc c := ⟨nonprofit, noPayor, charges, licensed⟩

theorem freeClinicHealthProfessional_intro {hp : HealthCarePractitioner}
    {fc : FreeClinic} {s : HealthService} {c : ComplaintText}
    (clinic : FreeClinicDefinition fc c)
    (situs : ServiceProvidedAtFreeClinicOrOffsiteProgram s c)
    (sponsored : IsSponsoredByFreeClinic hp c)
    (qualifying : IsMedicalAssistanceUnderTitleXIX s c)
    (uncompensated : ReceivesNoCompensationForService hp c)
    (notice : GivesWrittenNoticeOfLimitedLiability hp c)
    (licensed : IsLicensedOrCertifiedAtTimeOfService hp c)
    : FreeClinicHealthProfessional hp fc s c :=
  ⟨clinic, situs, sponsored, qualifying, uncompensated, notice, licensed⟩

theorem healthProfessionalVolunteer_intro {hp : HealthCarePractitioner}
    {e : Entity} {s : HealthService} {c : ComplaintText}
    (entity : CoveredEntityDefinition e c)
    (situs : ServiceProvidedAtDeemedEntityFacilityOrOffsite s c)
    (sponsored : IsSponsoredByDeemedEntity hp c)
    (fundable : IsServiceEligibleForHealthCenterFunding s c)
    (uncompensated : ReceivesNoCompensationForService hp c)
    (posted : PostsConspicuousLiabilityNoticeAtSite hp c)
    (licensed : IsLicensedOrCertifiedAtTimeOfService hp c)
    (documented : EntityMaintainsVolunteerCertifyingDocumentation hp c)
    : HealthProfessionalVolunteer hp e s c :=
  ⟨entity, situs, sponsored, fundable, uncompensated, posted, licensed, documented⟩

theorem countermeasurePurpose_intro_preventOrTreatSmallpox {cm : Countermeasure}
    {c : ComplaintText} (h : UsedToPreventOrTreatSmallpox cm c)
    : CountermeasurePurpose cm c := .preventOrTreatSmallpox h

theorem countermeasurePurpose_intro_treatVacciniaAdverseEffect
    {cm : Countermeasure} {c : ComplaintText}
    (h : UsedToControlOrTreatAdverseEffectsOfVaccinia cm c)
    : CountermeasurePurpose cm c := .treatVacciniaAdverseEffect h

theorem coveredCountermeasureDefinition_intro {cm : Countermeasure}
    {c : ComplaintText}
    (purpose : CountermeasurePurpose cm c)
    (declared : SpecifiedInSecretarialDeclaration cm c)
    : CoveredCountermeasureDefinition cm c := ⟨purpose, declared⟩

theorem qualifiedPersonAuthorization_intro_stateLawAuthorized {p : Person}
    {c : ComplaintText} (h : IsAuthorizedToAdministerUnderStateLaw p c)
    : QualifiedPersonAuthorization p c := .stateLawAuthorized h

theorem qualifiedPersonAuthorization_intro_secretaryAuthorized {p : Person}
    {c : ComplaintText} (h : IsOtherwiseAuthorizedBySecretaryToAdminister p c)
    : QualifiedPersonAuthorization p c := .secretaryAuthorized h

theorem coveredPersonClass_intro_manufacturerOrDistributor {p : Person}
    {c : ComplaintText} (h : IsManufacturerOrDistributorOfCountermeasure p c)
    : CoveredPersonClass p c := .manufacturerOrDistributor h

theorem coveredPersonClass_intro_healthCareEntityAuspices {p : Person}
    {c : ComplaintText}
    (h : IsHealthCareEntityUnderWhoseAuspicesCountermeasureAdministered p c)
    : CoveredPersonClass p c := .healthCareEntityAuspices h

theorem coveredPersonClass_intro_qualifiedAdministrator {p : Person}
    {c : ComplaintText} (h : QualifiedPersonAuthorization p c)
    : CoveredPersonClass p c := .qualifiedAdministrator h

theorem coveredPersonClass_intro_stateOrSubdivision {p : Person}
    {c : ComplaintText} (h : IsStateOrPoliticalSubdivisionSupervisingProgram p c)
    : CoveredPersonClass p c := .stateOrSubdivision h

theorem coveredPersonClass_intro_allegedTransmitter {p : Person}
    {c : ComplaintText} (h : IsAllegedVacciniaTransmitter p c)
    : CoveredPersonClass p c := .allegedTransmitter h

theorem coveredPersonClass_intro_transmitterEmployerOrCredentialer {p : Person}
    {c : ComplaintText} (h : IsEmployerOrCredentialingEntityOfTransmitter p c)
    : CoveredPersonClass p c := .transmitterEmployerOrCredentialer h

theorem coveredPersonClass_intro_officialAgentOrEmployee {p : Person}
    {c : ComplaintText} (h : IsOfficialAgentOrEmployeeOfCoveredPerson p c)
    : CoveredPersonClass p c := .officialAgentOrEmployee h

theorem coveredPersonClass_intro_contractorOrVolunteer {p : Person}
    {c : ComplaintText} (h : IsContractorOrVolunteerPerformingCoveredFunction p c)
    : CoveredPersonClass p c := .contractorOrVolunteer h

theorem coveredPersonClass_intro_privilegedIndividual {p : Person}
    {c : ComplaintText} (h : HasPrivilegesUnderAuspicesOfCoveredEntity p c)
    : CoveredPersonClass p c := .privilegedIndividual h

theorem arisingOutOfAdministration_intro_administrationDecision {cl : Claim}
    {c : ComplaintText} (h : ClaimConcernsAdministrationDecision cl c)
    : ArisingOutOfAdministration cl c := .administrationDecision h

theorem arisingOutOfAdministration_intro_informedConsent {cl : Claim}
    {c : ComplaintText} (h : ClaimConcernsInformedConsent cl c)
    : ArisingOutOfAdministration cl c := .informedConsent h

theorem arisingOutOfAdministration_intro_siteOrEffectiveness {cl : Claim}
    {c : ComplaintText}
    (h : ClaimConcernsSiteMonitoringOrEffectivenessEvaluation cl c)
    : ArisingOutOfAdministration cl c := .siteOrEffectiveness h

theorem arisingOutOfAdministration_intro_vacciniaTransmission {cl : Claim}
    {c : ComplaintText} (h : ClaimConcernsVacciniaTransmission cl c)
    : ArisingOutOfAdministration cl c := .vacciniaTransmission h

theorem smallpoxCountermeasureDeemedPerson_intro {p : Person}
    {cm : Countermeasure} {cl : Claim} {c : ComplaintText}
    (person : CoveredPersonClass p c)
    (counter : CoveredCountermeasureDefinition cm c)
    (liability : ArisingOutOfAdministration cl c)
    : SmallpoxCountermeasureDeemedPerson p cm cl c := ⟨person, counter, liability⟩



theorem healthCareServicePurpose_intro_diagnosisPreventionTreatment
    {s : HealthService} {c : ComplaintText}
    (h : RelatesToDiagnosisPreventionOrTreatmentOfDisease s c)
    : HealthCareServicePurpose s c := .diagnosisPreventionTreatment h

theorem healthCareServicePurpose_intro_assessmentOrCare {s : HealthService}
    {c : ComplaintText} (h : RelatesToAssessmentOrCareOfHumanHealth s c)
    : HealthCareServicePurpose s c := .assessmentOrCare h

theorem healthCareServicesDefinition_intro {s : HealthService} {c : ComplaintText}
    (provider : IsProvidedByOrUnderSupervisionOfHealthCareProfessional s c)
    (purpose : HealthCareServicePurpose s c)
    : HealthCareServicesDefinition s c := ⟨provider, purpose⟩

theorem healthCareProfessionalDefinition_intro {hp : HealthCarePractitioner}
    {s : HealthService} {c : ComplaintText}
    (cred : IsLicensedRegisteredOrCertifiedToProvideHealthCareServices hp c)
    (services : HealthCareServicesDefinition s c)
    : HealthCareProfessionalDefinition hp s c := ⟨cred, services⟩

theorem emergencyRegistryMembership_intro_medicalReserveCorps
    {hp : HealthCarePractitioner} {c : ComplaintText}
    (h : IsMedicalReserveCorpsMember hp c)
    : EmergencyRegistryMembership hp c := .medicalReserveCorps h

theorem emergencyRegistryMembership_intro_volunteerRegistry
    {hp : HealthCarePractitioner} {c : ComplaintText}
    (h : IsEsarVhpRegisteredVolunteerHealthProfessional hp c)
    : EmergencyRegistryMembership hp c := .volunteerRegistry h

theorem emergencyResponseTrigger_intro_publicHealthEmergency
    {hp : HealthCarePractitioner} {c : ComplaintText}
    (h : RespondsToDeterminedPublicHealthEmergency hp c)
    : EmergencyResponseTrigger hp c := .publicHealthEmergency h

theorem emergencyResponseTrigger_intro_presidentialDeclaration
    {hp : HealthCarePractitioner} {c : ComplaintText}
    (h : RespondsToPresidentiallyDeclaredMajorDisasterOrEmergency hp c)
    : EmergencyResponseTrigger hp c := .presidentialDeclaration h

theorem coveredEmergencyHealthProfessional_intro {hp : HealthCarePractitioner}
    {s : HealthService} {c : ComplaintText}
    (professional : HealthCareProfessionalDefinition hp s c)
    (registry : EmergencyRegistryMembership hp c)
    (responding : EmergencyResponseTrigger hp c)
    (timely : ActOrOmissionWithinInitialPeriodAndEmergencyRelated hp c)
    (inState : ActOrOmissionInDeterminationOrDeclarationState hp c)
    (capacity : ActedInCorpsOrRegistryCapacity hp c)
    (scope : ActedWithinScopeOfLicenseRegistrationOrCertification hp c)
    (auth : HadPriorStateDeploymentAuthorization hp c)
    : CoveredEmergencyHealthProfessional hp s c :=
  ⟨professional, registry, responding, timely, inState, capacity, scope, auth⟩



theorem singleAdministrativeUnitBasis_intro_administersCoveredProgram
    {u : AdministrativeUnit} {c : ComplaintText}
    (h : IsUnitChargedWithAdministrationOfCoveredProgram u c)
    : SingleAdministrativeUnitBasis u c := .administersCoveredProgram h

theorem singleAdministrativeUnitBasis_intro_supervisesTwoOrMore
    {u : AdministrativeUnit} {c : ComplaintText}
    (h : IsUnitSupervisingTwoOrMoreCoveredPrograms u c)
    : SingleAdministrativeUnitBasis u c := .supervisesTwoOrMore h

theorem multigrantProjectAdministration_intro {pr : Project} {pg : GrantProgram}
    {u : AdministrativeUnit} {c : ComplaintText}
    (program : IsProgramCoveredByMultigrantAdministration pg c)
    (project : IsSingleProjectWithGrantsUnderTwoOrMorePrograms pr c)
    (unit : SingleAdministrativeUnitBasis u c)
    : MultigrantProjectAdministration pr pg u c := ⟨program, project, unit⟩



theorem orphanArticle_intro_drugIncludingBiologic {a : Article}
    {c : ComplaintText} (h : IsDrugIncludingBiologic a c)
    : OrphanArticle a c := .drugIncludingBiologic h

theorem orphanArticle_intro_deviceIncludingDiagnostic {a : Article}
    {c : ComplaintText} (h : IsDeviceIncludingDiagnosticProduct a c)
    : OrphanArticle a c := .deviceIncludingDiagnostic h

theorem orphanProductSubject_intro {a : Article} {c : ComplaintText}
    (article : OrphanArticle a c)
    (rare : IsForRareDiseaseOrCondition a c)
    : OrphanProductSubject a c := ⟨article, rare⟩

theorem orphanProductsBoardMember_intro_assistantSecretaryForHealth
    {m : BoardMember} {c : ComplaintText} (h : IsAssistantSecretaryForHealth m c)
    : OrphanProductsBoardMember m c := .assistantSecretaryForHealth h

theorem orphanProductsBoardMember_intro_namedAgencyRepresentative
    {m : BoardMember} {c : ComplaintText}
    (h : IsRepresentativeOfNamedHealthAgency m c)
    : OrphanProductsBoardMember m c := .namedAgencyRepresentative h

theorem orphanProductsBoardMember_intro_designatedAgencyRepresentative
    {m : BoardMember} {c : ComplaintText}
    (h : IsRepresentativeOfSecretaryDesignatedAgency m c)
    : OrphanProductsBoardMember m c := .designatedAgencyRepresentative h

theorem orphanProductsBoardComposition_intro {b : OrphanProductsBoard}
    {m : BoardMember} {c : ComplaintText}
    (board : IsOrphanProductsBoard b c)
    (seat : OrphanProductsBoardMember m c)
    : OrphanProductsBoardComposition b m c := ⟨board, seat⟩



theorem qualifyingAdvancedDegree_intro_doctoralBiomedicine {m : ServiceMember}
    {c : ComplaintText} (h : HoldsDoctoralDegreeInBiomedicineOrRelatedField m c)
    : QualifyingAdvancedDegree m c := .doctoralBiomedicine h

theorem qualifyingAdvancedDegree_intro_engineeringOrBioinformatics
    {m : ServiceMember} {c : ComplaintText}
    (h : HoldsDoctoralOrMastersDegreeInEngineeringOrBioinformatics m c)
    : QualifyingAdvancedDegree m c := .engineeringOrBioinformatics h

theorem serviceMemberEligibility_intro {m : ServiceMember} {c : ComplaintText}
    (outstanding : IsOutstandingInBiomedicalOrProductAssessmentField m c)
    (degree : QualifyingAdvancedDegree m c)
    (standards : MeetsGradeFifteenQualificationStandards m c)
    : ServiceMemberEligibility m c := ⟨outstanding, degree, standards⟩

theorem serviceSizeWithinCeiling_intro {sv : BiomedicalService} {c : ComplaintText}
    (h : membersInService sv c ≤ 2000) : ServiceSizeWithinCeiling sv c := h

theorem payWithinStatutoryBounds_intro {m : ServiceMember} {c : ComplaintText}
    (floor : minimumGradeFifteenRate c ≤ annualPayOfServiceMember m c)
    (ceiling : annualPayOfServiceMember m c ≤ presidentialCompensationCap c)
    : PayWithinStatutoryBounds m c := ⟨floor, ceiling⟩

theorem conteServiceDefinition_intro {sv : BiomedicalService} {c : ComplaintText}
    (service : IsSeniorBiomedicalResearchAndProductAssessmentService sv c)
    (ceiling : ServiceSizeWithinCeiling sv c)
    (systematic : ProvidesSystematicPerformanceAppraisal sv c)
    (encourages : EncouragesExcellenceInPerformance sv c)
    : ConteServiceDefinition sv c := ⟨service, ceiling, systematic, encourages⟩



theorem womensHealthOfficeDefinition_intro {o : WomensHealthOffice}
    {c : ComplaintText}
    (office : IsOfficeOnWomensHealth o c)
    (headed : IsHeadedByDeputyAssistantSecretaryForWomensHealth o c)
    : WomensHealthOfficeDefinition o c := ⟨office, headed⟩

theorem coordinatingCommitteeDefinition_intro {cm : CoordinatingCommittee}
    {c : ComplaintText}
    (chaired : IsChairedByDeputyAssistantSecretaryForWomensHealth cm c)
    (composed : IsComposedOfSeniorDepartmentalRepresentatives cm c)
    : CoordinatingCommitteeDefinition cm c := ⟨chaired, composed⟩

theorem informationCenterDefinition_intro {ic : InformationCenter}
    {c : ComplaintText}
    (exchange : FacilitatesExchangeOfWomensHealthInformation ic c)
    (access : FacilitatesAccessToSuchInformation ic c)
    (analysis : AssistsInAnalysisOfWomensHealthIssues ic c)
    (technical : ProvidesTechnicalAssistanceForInformationExchange ic c)
    : InformationCenterDefinition ic c := ⟨exchange, access, analysis, technical⟩



theorem immigrationStationHospitalUse_intro {h : Hospital} {p : Person}
    {c : ComplaintText}
    (hosp : IsImmigrationStationHospital h c)
    (agreement : IsInterdepartmentalUseAgreement h c)
    (patient : IsPublicHealthServicePatient p c)
    : ImmigrationStationHospitalUse h p c := ⟨hosp, agreement, patient⟩

theorem reimbursableFacilityCost_intro {ci : CostItem} {c : ComplaintText}
    (utility : IsReimbursableUtilitySupplyOrServiceCost ci c)
    (notUpkeep : ¬ IsPhysicalUpkeepExpense ci c)
    : ReimbursableFacilityCost ci c := ⟨utility, notUpkeep⟩

theorem reimbursableDetainedPersonCare_intro {p : Person} {c : ComplaintText}
    (detained : IsDetainedInPublicHealthServiceHospitalAtImmigrationRequest p c)
    (notEntitled : ¬ IsEntitledToCareUnderSection249a p c)
    : ReimbursableDetainedPersonCare p c := ⟨detained, notEntitled⟩



theorem recoveryTriggeringEvent_intro_transferToIneligible {f : Facility}
    {c : ComplaintText} (h : TransferredToEntityIneligibleUnderSection222 f c)
    : RecoveryTriggeringEvent f c := .transferToIneligible h

theorem recoveryTriggeringEvent_intro_transferToDisapproved {f : Facility}
    {c : ComplaintText} (h : TransfereeDisapprovedByStateMentalHealthAgency f c)
    : RecoveryTriggeringEvent f c := .transferToDisapproved h

theorem recoveryTriggeringEvent_intro_cessationOfCenterUse {f : Facility}
    {c : ComplaintText} (h : CeasedUseForComprehensiveMentalHealthServices f c)
    : RecoveryTriggeringEvent f c := .cessationOfCenterUse h

theorem interestAccrualStart_intro_noticeGiven {f : Facility} {c : ComplaintText}
    (h : GaveTimelyWrittenNoticeOfSaleTransferOrChange f c)
    : InterestAccrualStart f c := .noticeGiven h

theorem interestAccrualStart_intro_noticeNotGiven {f : Facility}
    {c : ComplaintText} (h : ¬ GaveTimelyWrittenNoticeOfSaleTransferOrChange f c)
    : InterestAccrualStart f c := .noticeNotGiven h

theorem recoveryEntitlement_intro {f : Facility} {c : ComplaintText}
    (funded : IsCommunityMentalHealthCentersActFundedFacility f c)
    (window : WithinTwentyYearPostCompletionOrAcquisitionPeriod f c)
    (trigger : RecoveryTriggeringEvent f c)
    (notWaived : ¬ SecretaryWaivedRecoveryForGoodCause f c)
    : RecoveryEntitlement f c := ⟨funded, window, trigger, notWaived⟩

theorem preJudgmentNonLienStatus_intro {f : Facility} {c : ComplaintText}
    (pre : IsPreJudgmentRecoveryRight f c)
    (notLien : ¬ ConstitutesLienOnFacility f c)
    : PreJudgmentNonLienStatus f c := ⟨pre, notLien⟩



theorem fiscalAgentClass_intro_medicareCarrier {fa : FiscalAgent}
    {c : ComplaintText} (h : IsMedicareCarrier fa c)
    : FiscalAgentClass fa c := .medicareCarrier h

theorem fiscalAgentClass_intro_tribalOrganization {fa : FiscalAgent}
    {c : ComplaintText}
    (h : IsIndianTribeOrTribalOrganizationUnderSelfDeterminationContract fa c)
    : FiscalAgentClass fa c := .tribalOrganization h

theorem fiscalAgentPaymentFunction_intro_indianHealthService {ct : AgentContract}
    {c : ComplaintText}
    (h : DeterminesAmountsPayableForIndianHealthServiceServices ct c)
    : FiscalAgentPaymentFunction ct c := .indianHealthService h

theorem fiscalAgentPaymentFunction_intro_publicHealthService {ct : AgentContract}
    {c : ComplaintText}
    (h : DeterminesAmountsPayableForPublicHealthServiceServices ct c)
    : FiscalAgentPaymentFunction ct c := .publicHealthService h

theorem fiscalAgentContractEligibility_intro {fa : FiscalAgent} {c : ComplaintText}
    (agentClass : FiscalAgentClass fa c)
    (efficient : PerformsObligationsEfficientlyAndEffectively fa c)
    (responsible : MeetsFinancialResponsibilityAndLegalAuthorityRequirements fa c)
    : FiscalAgentContractEligibility fa c := ⟨agentClass, efficient, responsible⟩

end Proving.USC.T42.Ch6ASchI.Reslice.Ontology
