










import Proving.USC.Common.Types
import Proving.USC.T42.Ch6ASchI.Reslice.Ontology.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reslice.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  deriving Repr






def defEdges : List DefEdge :=

  [ { defined := "National Advisory Council on Migrant Health",
      dependsOn := "migrant health center or other assisted entity",
      citeDefine := "42 USC § 218(a)" },
    { defined := "Council member",
      dependsOn := "governing board of an assisted migrant health entity",
      citeDefine := "42 USC § 218(b)" },
    { defined := "Council member",
      dependsOn := "[EXTERNAL] migratory agricultural worker",
      citeDefine := "42 USC § 218(b)" },
    { defined := "Council member",
      dependsOn := "[EXTERNAL] seasonal agricultural worker",
      citeDefine := "42 USC § 218(b)" },
    { defined := "migrant health center or other assisted entity",
      dependsOn := "[EXTERNAL] health center grant program (§ 254b)",
      citeDefine := "42 USC § 218(a)" },

    { defined := "service and supply fund",
      dependsOn := "supply service",
      citeDefine := "42 USC § 231" },
    { defined := "service and supply fund",
      dependsOn := "central services",
      citeDefine := "42 USC § 231" },
    { defined := "central services",
      dependsOn := "determination of the Surgeon General with the Secretary's approval",
      citeDefine := "42 USC § 231" },

    { defined := "exclusive remedy subject (§ 233(a))",
      dependsOn := "officer or employee of the Public Health Service",
      citeDefine := "42 USC § 233(a)" },
    { defined := "exclusive remedy subject (§ 233(a))",
      dependsOn := "medical, surgical, dental, or related functions",
      citeDefine := "42 USC § 233(a)" },
    { defined := "exclusive remedy subject (§ 233(a))",
      dependsOn := "damage for personal injury, including death",
      citeDefine := "42 USC § 233(a)" },
    { defined := "exclusive remedy subject (§ 233(a))",
      dependsOn := "[EXTERNAL] remedy under 28 U.S.C. §§ 1346(b), 2672",
      citeDefine := "42 USC § 233(a)" },
    { defined := "entity described in subsection (g)(4)",
      dependsOn := "public or non-profit private entity",
      citeDefine := "42 USC § 233(g)(4)" },
    { defined := "entity described in subsection (g)(4)",
      dependsOn := "[EXTERNAL] Federal funds under § 254b",
      citeDefine := "42 USC § 233(g)(4)" },
    { defined := "contractor of an entity",
      dependsOn := "entity described in subsection (g)(4)",
      citeDefine := "42 USC § 233(g)(5)" },
    { defined := "deemed employee of the Public Health Service",
      dependsOn := "entity described in subsection (g)(4)",
      citeDefine := "42 USC § 233(g)(1)(A)" },
    { defined := "deemed employee of the Public Health Service",
      dependsOn := "contractor of an entity",
      citeDefine := "42 USC § 233(g)(1)(A)" },
    { defined := "deemed employee of the Public Health Service",
      dependsOn := "approved deeming application",
      citeDefine := "42 USC § 233(g)(1)(D)" },
    { defined := "approved deeming application",
      dependsOn := "entity meeting the subsection (h) requirements",
      citeDefine := "42 USC § 233(g)(1)(D)" },
    { defined := "scope of deeming as to non-patients",
      dependsOn := "patient of the entity",
      citeDefine := "42 USC § 233(g)(1)(B)" },
    { defined := "managed care plan",
      dependsOn := "health maintenance organization or similar entity",
      citeDefine := "42 USC § 233(m)(3)" },
    { defined := "managed care plan",
      dependsOn := "entity described in subsection (g)(4)",
      citeDefine := "42 USC § 233(m)(3)" },
    { defined := "free clinic",
      dependsOn := "nonprofit private entity",
      citeDefine := "42 USC § 233(o)(3)(A)" },
    { defined := "qualifying health service",
      dependsOn := "[EXTERNAL] medical assistance under title XIX of the Social Security Act",
      citeDefine := "42 USC § 233(o)(4)" },
    { defined := "free clinic health professional",
      dependsOn := "free clinic",
      citeDefine := "42 USC § 233(o)(2)" },
    { defined := "free clinic health professional",
      dependsOn := "qualifying health service",
      citeDefine := "42 USC § 233(o)(2)(C)" },
    { defined := "free clinic health professional",
      dependsOn := "approved deeming application",
      citeDefine := "42 USC § 233(o)(5)(C)" },
    { defined := "health professional volunteer",
      dependsOn := "entity described in subsection (g)(4)",
      citeDefine := "42 USC § 233(q)(2)" },
    { defined := "health professional volunteer",
      dependsOn := "approved deeming application",
      citeDefine := "42 USC § 233(q)(3)(B)" },
    { defined := "covered countermeasure",
      dependsOn := "declaration of the Secretary under subsection (p)(2)",
      citeDefine := "42 USC § 233(p)(7)(A)" },
    { defined := "covered person",
      dependsOn := "covered countermeasure",
      citeDefine := "42 USC § 233(p)(7)(B)" },
    { defined := "covered person",
      dependsOn := "qualified person",
      citeDefine := "42 USC § 233(p)(7)(B)(iii)" },
    { defined := "qualified person",
      dependsOn := "covered countermeasure",
      citeDefine := "42 USC § 233(p)(7)(C)" },
    { defined := "arising out of administration of a covered countermeasure",
      dependsOn := "covered countermeasure",
      citeDefine := "42 USC § 233(p)(7)(D)" },

    { defined := "health care professional",
      dependsOn := "health care services",
      citeDefine := "42 USC § 234(d)(1)" },
    { defined := "health care services",
      dependsOn := "health care professional",
      citeDefine := "42 USC § 234(d)(2)" },
    { defined := "covered emergency health professional",
      dependsOn := "health care professional",
      citeDefine := "42 USC § 234(a)" },
    { defined := "covered emergency health professional",
      dependsOn := "[EXTERNAL] Medical Reserve Corps (§ 300hh-15)",
      citeDefine := "42 USC § 234(a)" },
    { defined := "covered emergency health professional",
      dependsOn := "[EXTERNAL] Emergency System for Advance Registration of Volunteer Health Professionals (§ 247d-7b)",
      citeDefine := "42 USC § 234(a)" },

    { defined := "single administrative unit",
      dependsOn := "program covered by § 235",
      citeDefine := "42 USC § 235(1)" },
    { defined := "multigrant project",
      dependsOn := "program covered by § 235",
      citeDefine := "42 USC § 235" },

    { defined := "Orphan Products Board",
      dependsOn := "drug (including biologics) or device (including diagnostic products)",
      citeDefine := "42 USC § 236(a)" },
    { defined := "Orphan Products Board",
      dependsOn := "[EXTERNAL] rare disease or condition (FDCA § 526)",
      citeDefine := "42 USC § 236(a)" },

    { defined := "the Service (§ 237)",
      dependsOn := "member of the Service",
      citeDefine := "42 USC § 237(a)(1)" },
    { defined := "member of the Service",
      dependsOn := "[EXTERNAL] GS-15 qualification standards of the Office of Personnel Management",
      citeDefine := "42 USC § 237(b)" },
    { defined := "pay of a member of the Service",
      dependsOn := "[EXTERNAL] compensation specified in 3 U.S.C. § 102",
      citeDefine := "42 USC § 237(d)(2)" },

    { defined := "Office on Women's Health",
      dependsOn := "Deputy Assistant Secretary for Women's Health",
      citeDefine := "42 USC § 237a(a)" },
    { defined := "Coordinating Committee on Women's Health",
      dependsOn := "Deputy Assistant Secretary for Women's Health",
      citeDefine := "42 USC § 237a(b)(4)" },
    { defined := "National Women's Health Information Center",
      dependsOn := "Office on Women's Health",
      citeDefine := "42 USC § 237a(b)(5)" },

    { defined := "reimbursable cost of an immigration station hospital",
      dependsOn := "expense of physical upkeep (excluded)",
      citeDefine := "42 USC § 238a" },
    { defined := "reimbursable care of a detained person",
      dependsOn := "[EXTERNAL] entitlement to care under § 249(a)",
      citeDefine := "42 USC § 238a" },

    { defined := "recovery entitlement",
      dependsOn := "[EXTERNAL] facility funded under the Community Mental Health Centers Act",
      citeDefine := "42 USC § 238l(a)" },
    { defined := "recovery entitlement",
      dependsOn := "[EXTERNAL] comprehensive mental health services",
      citeDefine := "42 USC § 238l(a)(2)" },
    { defined := "base amount",
      dependsOn := "[EXTERNAL] approved project",
      citeDefine := "42 USC § 238l(c)(1)" },
    { defined := "interest accrual period",
      dependsOn := "notice under subsection (b)",
      citeDefine := "42 USC § 238l(c)(2)(B)" },

    { defined := "fiscal agent",
      dependsOn := "[EXTERNAL] carrier described in § 1395u(f)(1)",
      citeDefine := "42 USC § 238m(e)" },
    { defined := "fiscal agent",
      dependsOn := "[EXTERNAL] Indian Self-Determination Act contract",
      citeDefine := "42 USC § 238m(e)" },
    { defined := "fiscal agent payment function",
      dependsOn := "[EXTERNAL] eligible Indians",
      citeDefine := "42 USC § 238m(a)(1)(A)" } ]






inductive CouncilMemberQualification (m : CouncilMember) (c : ComplaintText) : Prop where
  | governingBoardServedAndFamiliar
      (board  : IsGoverningBoardMemberOfMigrantHealthEntity m c)
      (served : IsServedByMigrantHealthCenter m c)
      (fam    : IsFamiliarWithMigrantHealthCareDelivery m c)
  | governingBoardMember
      (board : IsGoverningBoardMemberOfMigrantHealthEntity m c)
  | qualifiedByTrainingAndExperience
      (qual : IsQualifiedByTrainingInMedicalSciencesOrHealthAdministration m c)



structure CouncilComposition (co : Council) (m : CouncilMember)
    (c : ComplaintText) : Prop where
  council : IsNationalAdvisoryCouncilOnMigrantHealth co c
  seat    : CouncilMemberQualification m c




inductive AuthorizedFundService (s : FundService) (c : ComplaintText) : Prop where
  | supplyService  (h : IsSupplyServiceActivity s c)
  | centralService (h : IsCentralServiceDeterminedBySurgeonGeneral s c)



structure ServiceAndSupplyFundDefinition (f : SupplyFund) (s : FundService)
    (c : ComplaintText) : Prop where
  fund          : IsServiceAndSupplyFund f c
  authorizedUse : AuthorizedFundService s c
  reimbursement : IsCostBasedReimbursementRate f c






structure ExclusiveRemedySubject (p : Person) (fn : MedicalFunction)
    (d : Damage) (c : ComplaintText) : Prop where
  officerOrEmployee : IsPublicHealthServiceOfficerOrEmployee p c
  withinScope       : ActsWithinScopeOfOfficeOrEmployment p c
  coveredFunction   : IsMedicalSurgicalDentalOrRelatedFunction fn c
  personalInjury    : IsPersonalInjuryDamage d c



structure CoveredEntityDefinition (e : Entity) (c : ComplaintText) : Prop where
  publicOrNonprofit : IsPublicOrNonprofitPrivateEntity e c
  federallyFunded   : ReceivesFederalFundsUnderHealthCenterProgram e c




inductive ContractorOfEntity (p : Person) (c : ComplaintText) : Prop where
  | fullTimeHours
      (h : PerformsAtLeastThirtyTwoAndOneHalfHoursPerWeek p c)
  | partTimeDesignatedField
      (h : IsLicensedProviderInDesignatedPrimaryCareField p c)



inductive NonPatientServiceBasis (s : HealthService) (c : ComplaintText) : Prop where
  | communityBenefit        (h : ServiceBenefitsPatientsAndCommunityPopulations s c)
  | facilitatesPatientCare  (h : ServiceFacilitatesProvisionToPatients s c)
  | requiredByContract      (h : ServiceRequiredUnderEmploymentContract s c)



structure DeemingEligibleEntity (e : Entity) (c : ComplaintText) : Prop where
  riskPolicies       : HasMalpracticeRiskReductionPolicies e c
  credentialsChecked : HasVerifiedPractitionerCredentials e c
  claimsHistory      : HasNoAdverseClaimsHistoryOrHasCooperated e c
  willCooperate      : WillCooperateWithAttorneyGeneralOnEstimates e c




structure ApprovedDeemedEntity (e : Entity) (c : ComplaintText) : Prop where
  described : CoveredEntityDefinition e c
  eligible  : DeemingEligibleEntity e c
  approved  : SecretaryApprovedDeemingApplication e c




structure DeemedEntityPersonnel (e : Entity) (p : Person) (pat : Person)
    (c : ComplaintText) : Prop where
  entity       : ApprovedDeemedEntity e c
  relationship : IsOfficerGoverningBoardMemberOrEmployeeOfEntity p c
  deemed       : IsDeemedPublicHealthServiceEmployee p c
  patient      : IsPatientOfEntity pat c


structure ManagedCarePlanDefinition (pl : ManagedCarePlan)
    (c : ComplaintText) : Prop where
  hmoOrSimilar        : IsHealthMaintenanceOrganizationOrSimilarEntity pl c
  atRiskWithPayors    : ContractsAtRiskWithPayorsForHealthServices pl c
  contractsProviders  : ContractsWithProvidersForDeliveryToEnrollees pl c



structure FreeClinicDefinition (fc : FreeClinic) (c : ComplaintText) : Prop where
  nonprofitOperated       : IsOperatedByNonprofitPrivateEntity fc c
  noThirdPartyPayment     : AcceptsNoThirdPartyPayorReimbursement fc c
  noChargeOrSlidingScale  : ImposesNoChargeOrAbilityToPayCharge fc c
  licensedOrCertified     : IsLicensedOrCertifiedHealthFacility fc c



structure FreeClinicHealthProfessional (hp : HealthCarePractitioner)
    (fc : FreeClinic) (s : HealthService) (c : ComplaintText) : Prop where
  clinic          : FreeClinicDefinition fc c
  situs           : ServiceProvidedAtFreeClinicOrOffsiteProgram s c
  sponsored       : IsSponsoredByFreeClinic hp c
  qualifying      : IsMedicalAssistanceUnderTitleXIX s c
  uncompensated   : ReceivesNoCompensationForService hp c
  writtenNotice   : GivesWrittenNoticeOfLimitedLiability hp c
  licensedAtTime  : IsLicensedOrCertifiedAtTimeOfService hp c



structure HealthProfessionalVolunteer (hp : HealthCarePractitioner) (e : Entity)
    (s : HealthService) (c : ComplaintText) : Prop where
  entity          : CoveredEntityDefinition e c
  situs           : ServiceProvidedAtDeemedEntityFacilityOrOffsite s c
  sponsored       : IsSponsoredByDeemedEntity hp c
  fundingEligible : IsServiceEligibleForHealthCenterFunding s c
  uncompensated   : ReceivesNoCompensationForService hp c
  postedNotice    : PostsConspicuousLiabilityNoticeAtSite hp c
  licensedAtTime  : IsLicensedOrCertifiedAtTimeOfService hp c
  documented      : EntityMaintainsVolunteerCertifyingDocumentation hp c



inductive CountermeasurePurpose (cm : Countermeasure) (c : ComplaintText) : Prop where
  | preventOrTreatSmallpox     (h : UsedToPreventOrTreatSmallpox cm c)
  | treatVacciniaAdverseEffect (h : UsedToControlOrTreatAdverseEffectsOfVaccinia cm c)



structure CoveredCountermeasureDefinition (cm : Countermeasure)
    (c : ComplaintText) : Prop where
  purpose  : CountermeasurePurpose cm c
  declared : SpecifiedInSecretarialDeclaration cm c



inductive QualifiedPersonAuthorization (p : Person) (c : ComplaintText) : Prop where
  | stateLawAuthorized (h : IsAuthorizedToAdministerUnderStateLaw p c)
  | secretaryAuthorized (h : IsOtherwiseAuthorizedBySecretaryToAdminister p c)




inductive CoveredPersonClass (p : Person) (c : ComplaintText) : Prop where
  | manufacturerOrDistributor (h : IsManufacturerOrDistributorOfCountermeasure p c)
  | healthCareEntityAuspices
      (h : IsHealthCareEntityUnderWhoseAuspicesCountermeasureAdministered p c)
  | qualifiedAdministrator (h : QualifiedPersonAuthorization p c)
  | stateOrSubdivision (h : IsStateOrPoliticalSubdivisionSupervisingProgram p c)
  | allegedTransmitter (h : IsAllegedVacciniaTransmitter p c)
  | transmitterEmployerOrCredentialer (h : IsEmployerOrCredentialingEntityOfTransmitter p c)
  | officialAgentOrEmployee (h : IsOfficialAgentOrEmployeeOfCoveredPerson p c)
  | contractorOrVolunteer (h : IsContractorOrVolunteerPerformingCoveredFunction p c)
  | privilegedIndividual (h : HasPrivilegesUnderAuspicesOfCoveredEntity p c)



inductive ArisingOutOfAdministration (cl : Claim) (c : ComplaintText) : Prop where
  | administrationDecision (h : ClaimConcernsAdministrationDecision cl c)
  | informedConsent        (h : ClaimConcernsInformedConsent cl c)
  | siteOrEffectiveness    (h : ClaimConcernsSiteMonitoringOrEffectivenessEvaluation cl c)
  | vacciniaTransmission   (h : ClaimConcernsVacciniaTransmission cl c)




structure SmallpoxCountermeasureDeemedPerson (p : Person) (cm : Countermeasure)
    (cl : Claim) (c : ComplaintText) : Prop where
  coveredPerson  : CoveredPersonClass p c
  countermeasure : CoveredCountermeasureDefinition cm c
  liability      : ArisingOutOfAdministration cl c




inductive HealthCareServicePurpose (s : HealthService) (c : ComplaintText) : Prop where
  | diagnosisPreventionTreatment (h : RelatesToDiagnosisPreventionOrTreatmentOfDisease s c)
  | assessmentOrCare             (h : RelatesToAssessmentOrCareOfHumanHealth s c)




structure HealthCareServicesDefinition (s : HealthService)
    (c : ComplaintText) : Prop where
  provider : IsProvidedByOrUnderSupervisionOfHealthCareProfessional s c
  purpose  : HealthCareServicePurpose s c







structure HealthCareProfessionalDefinition (hp : HealthCarePractitioner)
    (s : HealthService) (c : ComplaintText) : Prop where
  credentialed : IsLicensedRegisteredOrCertifiedToProvideHealthCareServices hp c
  services     : HealthCareServicesDefinition s c


inductive EmergencyRegistryMembership (hp : HealthCarePractitioner)
    (c : ComplaintText) : Prop where
  | medicalReserveCorps (h : IsMedicalReserveCorpsMember hp c)
  | volunteerRegistry   (h : IsEsarVhpRegisteredVolunteerHealthProfessional hp c)


inductive EmergencyResponseTrigger (hp : HealthCarePractitioner)
    (c : ComplaintText) : Prop where
  | publicHealthEmergency (h : RespondsToDeterminedPublicHealthEmergency hp c)
  | presidentialDeclaration
      (h : RespondsToPresidentiallyDeclaredMajorDisasterOrEmergency hp c)



structure CoveredEmergencyHealthProfessional (hp : HealthCarePractitioner)
    (s : HealthService) (c : ComplaintText) : Prop where
  professional  : HealthCareProfessionalDefinition hp s c
  registry      : EmergencyRegistryMembership hp c
  responding    : EmergencyResponseTrigger hp c
  timelyRelated : ActOrOmissionWithinInitialPeriodAndEmergencyRelated hp c
  inState       : ActOrOmissionInDeterminationOrDeclarationState hp c
  inCapacity    : ActedInCorpsOrRegistryCapacity hp c
  withinScope   : ActedWithinScopeOfLicenseRegistrationOrCertification hp c
  authorized    : HadPriorStateDeploymentAuthorization hp c




inductive SingleAdministrativeUnitBasis (u : AdministrativeUnit)
    (c : ComplaintText) : Prop where
  | administersCoveredProgram (h : IsUnitChargedWithAdministrationOfCoveredProgram u c)
  | supervisesTwoOrMore       (h : IsUnitSupervisingTwoOrMoreCoveredPrograms u c)



structure MultigrantProjectAdministration (pr : Project) (pg : GrantProgram)
    (u : AdministrativeUnit) (c : ComplaintText) : Prop where
  coveredProgram : IsProgramCoveredByMultigrantAdministration pg c
  singleProject  : IsSingleProjectWithGrantsUnderTwoOrMorePrograms pr c
  unit           : SingleAdministrativeUnitBasis u c




inductive OrphanArticle (a : Article) (c : ComplaintText) : Prop where
  | drugIncludingBiologic (h : IsDrugIncludingBiologic a c)
  | deviceIncludingDiagnostic (h : IsDeviceIncludingDiagnosticProduct a c)



structure OrphanProductSubject (a : Article) (c : ComplaintText) : Prop where
  article    : OrphanArticle a c
  rareTarget : IsForRareDiseaseOrCondition a c


inductive OrphanProductsBoardMember (m : BoardMember) (c : ComplaintText) : Prop where
  | assistantSecretaryForHealth (h : IsAssistantSecretaryForHealth m c)
  | namedAgencyRepresentative   (h : IsRepresentativeOfNamedHealthAgency m c)
  | designatedAgencyRepresentative (h : IsRepresentativeOfSecretaryDesignatedAgency m c)


structure OrphanProductsBoardComposition (b : OrphanProductsBoard)
    (m : BoardMember) (c : ComplaintText) : Prop where
  board : IsOrphanProductsBoard b c
  seat  : OrphanProductsBoardMember m c




inductive QualifyingAdvancedDegree (m : ServiceMember) (c : ComplaintText) : Prop where
  | doctoralBiomedicine
      (h : HoldsDoctoralDegreeInBiomedicineOrRelatedField m c)
  | engineeringOrBioinformatics
      (h : HoldsDoctoralOrMastersDegreeInEngineeringOrBioinformatics m c)


structure ServiceMemberEligibility (m : ServiceMember) (c : ComplaintText) : Prop where
  outstanding : IsOutstandingInBiomedicalOrProductAssessmentField m c
  degree      : QualifyingAdvancedDegree m c
  gsStandards : MeetsGradeFifteenQualificationStandards m c



def ServiceSizeWithinCeiling (sv : BiomedicalService) (c : ComplaintText) : Prop :=
  membersInService sv c ≤ 2000




def PayWithinStatutoryBounds (m : ServiceMember) (c : ComplaintText) : Prop :=
  minimumGradeFifteenRate c ≤ annualPayOfServiceMember m c ∧
    annualPayOfServiceMember m c ≤ presidentialCompensationCap c



structure ConteServiceDefinition (sv : BiomedicalService) (c : ComplaintText) : Prop where
  service     : IsSeniorBiomedicalResearchAndProductAssessmentService sv c
  ceiling     : ServiceSizeWithinCeiling sv c
  systematic  : ProvidesSystematicPerformanceAppraisal sv c
  encourages  : EncouragesExcellenceInPerformance sv c




structure WomensHealthOfficeDefinition (o : WomensHealthOffice)
    (c : ComplaintText) : Prop where
  office : IsOfficeOnWomensHealth o c
  headed : IsHeadedByDeputyAssistantSecretaryForWomensHealth o c


structure CoordinatingCommitteeDefinition (cm : CoordinatingCommittee)
    (c : ComplaintText) : Prop where
  chaired  : IsChairedByDeputyAssistantSecretaryForWomensHealth cm c
  composed : IsComposedOfSeniorDepartmentalRepresentatives cm c


structure InformationCenterDefinition (ic : InformationCenter)
    (c : ComplaintText) : Prop where
  exchange  : FacilitatesExchangeOfWomensHealthInformation ic c
  access    : FacilitatesAccessToSuchInformation ic c
  analysis  : AssistsInAnalysisOfWomensHealthIssues ic c
  technical : ProvidesTechnicalAssistanceForInformationExchange ic c





structure ImmigrationStationHospitalUse (h : Hospital) (p : Person)
    (c : ComplaintText) : Prop where
  hospital  : IsImmigrationStationHospital h c
  agreement : IsInterdepartmentalUseAgreement h c
  patient   : IsPublicHealthServicePatient p c





structure ReimbursableFacilityCost (ci : CostItem) (c : ComplaintText) : Prop where
  utilityCost : IsReimbursableUtilitySupplyOrServiceCost ci c
  notUpkeep   : ¬ IsPhysicalUpkeepExpense ci c





structure ReimbursableDetainedPersonCare (p : Person) (c : ComplaintText) : Prop where
  detainedAtRequest : IsDetainedInPublicHealthServiceHospitalAtImmigrationRequest p c
  notOtherwiseEntitled : ¬ IsEntitledToCareUnderSection249a p c





inductive RecoveryTriggeringEvent (f : Facility) (c : ComplaintText) : Prop where
  | transferToIneligible (h : TransferredToEntityIneligibleUnderSection222 f c)
  | transferToDisapproved (h : TransfereeDisapprovedByStateMentalHealthAgency f c)
  | cessationOfCenterUse (h : CeasedUseForComprehensiveMentalHealthServices f c)




noncomputable def baseAmountRecoverable (f : Facility) (c : ComplaintText) : Nat :=
  thenValueOfApprovedProjectPortion f c * federalParticipationAmount f c /
    projectCostOfRemodelingConstructionOrAcquisition f c



inductive InterestAccrualStart (f : Facility) (c : ComplaintText) : Prop where
  | noticeGiven    (h : GaveTimelyWrittenNoticeOfSaleTransferOrChange f c)
  | noticeNotGiven (h : ¬ GaveTimelyWrittenNoticeOfSaleTransferOrChange f c)





structure RecoveryEntitlement (f : Facility) (c : ComplaintText) : Prop where
  fundedFacility : IsCommunityMentalHealthCentersActFundedFacility f c
  withinWindow   : WithinTwentyYearPostCompletionOrAcquisitionPeriod f c
  trigger        : RecoveryTriggeringEvent f c
  notWaived      : ¬ SecretaryWaivedRecoveryForGoodCause f c



structure PreJudgmentNonLienStatus (f : Facility) (c : ComplaintText) : Prop where
  preJudgment : IsPreJudgmentRecoveryRight f c
  notALien    : ¬ ConstitutesLienOnFacility f c





inductive FiscalAgentClass (fa : FiscalAgent) (c : ComplaintText) : Prop where
  | medicareCarrier (h : IsMedicareCarrier fa c)
  | tribalOrganization
      (h : IsIndianTribeOrTribalOrganizationUnderSelfDeterminationContract fa c)


inductive FiscalAgentPaymentFunction (ct : AgentContract) (c : ComplaintText) : Prop where
  | indianHealthService (h : DeterminesAmountsPayableForIndianHealthServiceServices ct c)
  | publicHealthService (h : DeterminesAmountsPayableForPublicHealthServiceServices ct c)



structure FiscalAgentContractEligibility (fa : FiscalAgent)
    (c : ComplaintText) : Prop where
  agentClass  : FiscalAgentClass fa c
  efficient   : PerformsObligationsEfficientlyAndEffectively fa c
  responsible : MeetsFinancialResponsibilityAndLegalAuthorityRequirements fa c

end Proving.USC.T42.Ch6ASchI.Reslice.Ontology
