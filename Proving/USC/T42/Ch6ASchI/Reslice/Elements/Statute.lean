import Proving.USC.T42.Ch6ASchI.Reslice.Elements.Predicates
import Proving.USC.Common.Predicates

set_option autoImplicit false










namespace Proving.USC.T42.Ch6ASchI.Reslice.Elements

open Proving.USC.Common





structure CouncilComposition218b (council : AdvisoryCouncil) (c : ComplaintText) : Prop where
  totalMembers : councilMemberCount council c = 15
  governingBoardMembers : 12 ≤ governingBoardMemberCount council c
  patientGoverningBoardMembers : 9 ≤ patientGoverningBoardMemberCount council c
  professionallyQualifiedMembers : professionallyQualifiedMemberCount council c = 3



inductive MemberTerm218c (p : Person) (council : AdvisoryCouncil) (c : ComplaintText) : Prop where
  | fullTerm (h : MemberHoldsFourYearTerm p council c)
  | vacancyRemainder (h : VacancyAppointeeServesRemainderOfTerm p council c)


structure Section218 (council : AdvisoryCouncil) (c : ComplaintText) : Prop where
  appointedAndOrganized : SecretaryAppointedAndOrganizedCouncil council c
  withinOneHundredTwentyDays : daysFromJuly291975ToCouncilOrganization council c ≤ 120
  advisoryFunction : CouncilAdvisesOnMigrantHealthCenterMatters council c
  composition : CouncilComposition218b council c
  staggeredFirstTerms : FirstTermsStaggeredAsDesignated council c
  advisoryCommitteeActInapplicable : FederalAdvisoryCommitteeTerminationInapplicable council c




inductive AuthorizedFundUse231 (x : Expenditure) (f : Fund) (c : ComplaintText) : Prop where
  | supplyService (h : SupportsSupplyServiceOperations x f c)
  | centralService (h : SupportsCentralServiceDeterminedBySurgeonGeneral x f c)
      (approval : SecretaryApprovedCentralServiceDetermination x f c)



structure Section231 (x : Expenditure) (f : Fund) (c : ComplaintText) : Prop where
  fundEstablished : ServiceAndSupplyFundEstablished f c
  authorizedCorpus : fundAuthorizedAmountDollars f c = 250000
  noFiscalYearLimitation : FundWithoutFiscalYearLimitation f c
  necessaryExpense : ExpenseIsSalaryTravelOrOtherNecessaryExpense x f c
  authorizedUse : AuthorizedFundUse231 x f c
  reimbursed : FundReimbursedFromApplicableAppropriations x f c
  ratesProperlyComputed : ReimbursementRatesIncludeEnumeratedCharges x f c




structure Section233a (p : Person) (act : ActOrOmission) (c : ComplaintText) : Prop where
  personalInjuryDamage : ClaimIsForPersonalInjuryOrDeathDamage act c
  medicalFunctionCausation : InjuryResultsFromMedicalOrRelatedFunctions act c
  phsOfficerOrEmployee : IsCommissionedOfficerOrEmployeeOfPHS p c
  withinScope : ActedWithinScopeOfOfficeOrEmployment p c
  federalRemedyAvailable : FederalTortRemedyOrAlternativeBenefitsAvailable p act c



structure ExclusiveRemedy233a (p : Person) (act : ActOrOmission) (a : CivilAction)
    (c : ComplaintText) : Prop where
  coveredClaim : Section233a p act c
  sameSubjectMatter : SameSubjectMatterAsFederalRemedy a act c




structure Section233b (p : Person) (a : CivilAction) (c : ComplaintText) : Prop where
  actionAgainstCoveredPerson : CivilActionBroughtAgainstCoveredPerson a p c
  attorneyGeneralDefends : AttorneyGeneralDefendedAction a c
  processDelivered : DefendantDeliveredProcessToSuperiorOrDesignee p a c
  timelyDelivery :
    daysFromServiceToProcessDelivery p a c ≤ deliveryDeadlineDaysSetByAttorneyGeneral p a c
  copiesFurnished : ProcessCopiesFurnishedToUSAttorneyAGAndSecretary p a c



structure Section233cRemoval (p : Person) (a : CivilAction) (c : ComplaintText) : Prop where
  stateCourtAction : ActionCommencedInStateCourt a c
  scopeCertification : AttorneyGeneralCertifiedScopeOfEmployment p a c
  beforeTrial : RemovalSoughtBeforeTrial a c
  properVenue : RemovedToDistrictEmbracingPlaceOfPendency a c



structure Section233cRemand (a : CivilAction) (act : ActOrOmission)
    (c : ComplaintText) : Prop where
  stateCourtAction : ActionCommencedInStateCourt a c
  noFederalRemedy : ¬ RemedyUnderSubsectionAAvailableAgainstUS a act c
  notBenefitsPreclusion : ¬ RemedyPrecludedByAvailabilityOfCompensationBenefits a act c





structure Section233cDismissalWithTolling (a : CivilAction) (act : ActOrOmission)
    (c : ComplaintText) : Prop where
  stateCourtAction : ActionCommencedInStateCourt a c
  noFederalRemedy : ¬ RemedyUnderSubsectionAAvailableAgainstUS a act c
  benefitsPreclusion : RemedyPrecludedByAvailabilityOfCompensationBenefits a act c
  limitationsSuspended : LimitationPeriodSuspendedDuringPendency a c



structure Section233d (a : CivilAction) (c : ComplaintText) : Prop where
  compromisedOrSettled : AttorneyGeneralCompromisedOrSettledClaim a c
  section2677Manner : SettlementFollowsSection2677Procedure a c



structure Section233e (act : ActOrOmission) (c : ComplaintText) : Prop where
  assaultOrBattery : ClaimIsForAssaultOrBattery act c
  negligenceInMedicalFunctions : AssaultOrBatteryArisesOutOfNegligenceInMedicalFunctions act c


inductive QualifyingDetail233f (p : Person) (c : ComplaintText) : Prop where
  | foreignCountry (h : AssignedToForeignCountry p c)
  | stateOrSubdivision (h : DetailedToStateOrPoliticalSubdivision p c)
  | nonProfitInstitution (h : DetailedToNonProfitInstitution p c)


structure Section233f (p : Person) (act : ActOrOmission) (c : ComplaintText) : Prop where
  phsOfficerOrEmployee : IsCommissionedOfficerOrEmployeeOfPHS p c
  negligentlyCaused : InjuryNegligentlyCausedByOfficerOrEmployee p act c
  withinScope : ActedWithinScopeOfOfficeOrEmployment p c
  medicalFunctions : InjuryResultsFromMedicalOrRelatedFunctions act c
  qualifyingDetail : QualifyingDetail233f p c
  preclusionLikely : CircumstancesLikelyToPrecludeSection2679bRemedies p act c
  coverageProvided : SecretaryHeldHarmlessOrProvidedLiabilityInsurance p c




structure EntityDescribed233g4 (e : CoveredEntity) (c : ComplaintText) : Prop where
  organizationalForm : IsPublicOrNonProfitPrivateEntity e c
  federalFunding : ReceivesFederalFundsUnderSection254b e c



structure SecretaryApprovalPrerequisites233h (e : CoveredEntity) (c : ComplaintText) : Prop where
  riskReductionPolicies : HasMalpracticeRiskReductionPolicies e c
  credentialVerification : HasVerifiedPractitionerCredentials e c
  claimsHistory : NoAdverseClaimsHistoryOrFullCooperation e c
  estimateCooperation : WillCooperateOnClaimsEstimates e c



structure DeemingApplicationApproved233g1 (app : DeemingApplication) (e : CoveredEntity)
    (c : ComplaintText) : Prop where
  submitted : DeemingApplicationSubmittedInPrescribedForm app e c
  verifies : ApplicationVerifiesCoverageAndScopeRequirements app e c
  entityQualifies : SecretaryApprovalPrerequisites233h e c
  approved : SecretaryApprovedDeemingApplication app e c
  timelyDetermination : daysFromApplicationToSecretaryDetermination app e c ≤ 30



inductive QualifyingContractor233g5 (p : Person) (e : CoveredEntity)
    (c : ComplaintText) : Prop where
  | fullTime (h : IsPhysicianOrLicensedHealthCarePractitionerContractor p e c)
      (hours : 65 ≤ contractorHalfHoursPerWeek p e c)
  | listedSpecialty (h : IsPhysicianOrLicensedHealthCarePractitionerContractor p e c)
      (hours : contractorHalfHoursPerWeek p e c < 65)
      (specialty : IsListedSpecialtyProvider p e c)


inductive CoveredIndividual233g1 (p : Person) (e : CoveredEntity)
    (c : ComplaintText) : Prop where
  | insider (h : IsOfficerGoverningBoardMemberOrEmployeeOfEntity p e c)
  | contractor (h : QualifyingContractor233g5 p e c)



inductive NonPatientJustification233g1C (svc : HealthService) (e : CoveredEntity)
    (c : ComplaintText) : Prop where
  | communityWide (h : ServiceBenefitsPatientsAndCommunityWide svc e c)
  | facilitatesPatientCare (h : ServiceFacilitatesProvisionToPatients svc e c)
  | contractRequired (h : ServiceRequiredUnderEmploymentContract svc e c)



inductive DeemedServiceScope233g1B (svc : HealthService) (e : CoveredEntity)
    (c : ComplaintText) : Prop where
  | patient (h : ServiceProvidedToPatientOfEntity svc e c)
  | nonPatient (h : ServiceProvidedToNonPatient svc e c)
      (determination : SecretaryDeterminedNonPatientCoverage svc e c)
      (justification : NonPatientJustification233g1C svc e c)




structure DeemedEmployee233g1 (p : Person) (e : CoveredEntity) (app : DeemingApplication)
    (svc : HealthService) (act : ActOrOmission) (c : ComplaintText) : Prop where
  entityDescribed : EntityDescribed233g4 e c
  applicationApproved : DeemingApplicationApproved233g1 app e c
  transferMade : TransferMadeUnderSubsectionK3ForFiscalYear e c
  withinDeemedYear : ServicesProvidedInDeemedCalendarYear svc e c
  coveredIndividual : CoveredIndividual233g1 p e c
  serviceScope : DeemedServiceScope233g1B svc e c
  temporalReach : ActOrOmissionOnOrAfterJanuaryFirst1993 act c
  noTermination : ¬ EntityTerminatedDeemingByWrittenNotice e c



structure DeemingConsequences233g (p : Person) (e : CoveredEntity)
    (c : ComplaintText) : Prop where
  determinationBinding : SecretaryDeterminationFinalAndBinding e c
  insuranceSubrogated : InsuranceClaimSubrogatedToUnitedStates e c
  corpsParity : NationalHealthServiceCorpsProtectionApplies p e c



inductive DeDeemingGround233i1 (p : Person) (e : CoveredEntity)
    (c : ComplaintText) : Prop where
  | policyNoncompliance (h : FailedToComplyWithEntityRiskPolicies p e c)
  | outlierClaimsHistory (h : ClaimsHistoryOutsideSpecialtyNorm p e c)
  | refusalToCooperate (h : RefusedToCooperateInDefense p e c)
  | falseInformation (h : ProvidedFalseInformationRelevantToDuties p e c)
  | disciplinaryAction (h : SubjectOfStateOrProfessionalDisciplinaryAction p e c)


structure Section233i (p : Person) (e : CoveredEntity) (c : ComplaintText) : Prop where
  onTheRecord : AttorneyGeneralDeterminedOnTheRecord p e c
  noticeAndHearing : NoticeAndFullAndFairHearingProvided p e c
  unreasonableRisk : TreatingIndividualAsEmployeeExposesGovernmentToUnreasonableRisk p e c
  ground : DeDeemingGround233i1 p e c
  prospectiveOnly : DeDeemingAppliesOnlyProspectivelyAfterNotice p e c



structure Section233k (e : CoveredEntity) (c : ComplaintText) : Prop where
  estimateMade : AttorneyGeneralEstimatedExpectedClaims e c
  fundWithinCap : fundAmountDollars233k2 e c ≤ 10000000
  transferred : FundTransferredByDecember31 e c



structure Section233l1 (a : CivilAction) (e : CoveredEntity) (c : ComplaintText) : Prop where
  timelyAppearance : daysFromNotificationToAttorneyGeneralAppearance a c ≤ 15
  advisedCourt : AttorneyGeneralAdvisedStateCourtOfDeemingStatus a e c




structure Section233l2 (a : CivilAction) (c : ComplaintText) : Prop where
  untimelyAppearance : 15 < daysFromNotificationToAttorneyGeneralAppearance a c
  removedOnPetition : ActionRemovedOnPetitionAfterAttorneyGeneralFailure a c
  stayedForForumDetermination : ActionStayedPendingForumDetermination a c





structure Section233m1 (e : CoveredEntity) (plan : ManagedCarePlan) (svc : HealthService)
    (c : ComplaintText) : Prop where
  planIsManagedCare : PlanIsAtRiskContractingHealthOrganization plan c
  entityContracts : EntityContractsWithManagedCarePlan e plan c
  enrolleeService : ServiceProvidedToManagedCarePlanEnrollee svc plan c



structure Section233m2Compliance (plan : ManagedCarePlan) (e : CoveredEntity)
    (c : ComplaintText) : Prop where
  planIsManagedCare : PlanIsAtRiskContractingHealthOrganization plan c
  deemsCoverageSatisfied : PlanDeemedEntityToMeetMalpracticeCoverageRequirements plan e c



structure Section233m2Sanction (plan : ManagedCarePlan) (e : CoveredEntity)
    (c : ComplaintText) : Prop where
  planIsManagedCare : PlanIsAtRiskContractingHealthOrganization plan c
  breach : ¬ PlanDeemedEntityToMeetMalpracticeCoverageRequirements plan e c
  foundOnTheRecord : PlanFoundOnTheRecordToHaveViolatedSubsectionM plan c
  fundingIneligibility : PlanIneligibleForTitleXVIIIAndXIXFunds plan c




structure FreeClinic233o3 (fc : FreeClinic) (c : ComplaintText) : Prop where
  nonprofitOperator : FreeClinicOperatedByNonprofitPrivateEntity fc c
  noThirdPartyReimbursement : FreeClinicAcceptsNoThirdPartyReimbursement fc c
  noChargeOrSlidingScale : FreeClinicChargesNothingOrSlidingScale fc c
  licensed : FreeClinicLicensedOrCertified fc c



structure FreeClinicHealthProfessional233o2 (p : Person) (fc : FreeClinic)
    (svc : HealthService) (c : ComplaintText) : Prop where
  atClinicOrOffsite : ServiceProvidedAtFreeClinicOrOffsiteProgram svc fc c
  sponsored : FreeClinicSponsorsPractitioner p fc c
  qualifyingService : ServiceIsQualifyingHealthService svc c
  noCompensation : NoCompensationReceivedFromIndividualOrThirdPartyPayor p fc svc c
  writtenNotice : WrittenLiabilityLimitationNoticeGivenBeforeService p fc svc c
  licensed : PractitionerLicensedAtTimeOfService p c



structure Section233o (p : Person) (fc : FreeClinic) (svc : HealthService)
    (act : ActOrOmission) (c : ComplaintText) : Prop where
  clinicQualifies : FreeClinic233o3 fc c
  professionalQualifies : FreeClinicHealthProfessional233o2 p fc svc c
  transferMade : FreeClinicTransferMadeUnderSubsectionO6D fc c
  temporalReach : ActOrOmissionAfterFreeClinicDeemingDetermination act p c





inductive DeclaredCategoryCoverage233p2B (p : Person) (cm : Countermeasure)
    (decl : Declaration) (c : ComplaintText) : Prop where
  | withinCategory (h : RecipientWithinDeclaredCategory cm decl c)
  | reasonableBelief (h : QualifiedPersonHadReasonableGroundsToBelieveCategory p cm decl c)


structure CountermeasureAdministration233p2B (p : Person) (cm : Countermeasure)
    (decl : Declaration) (c : ComplaintText) : Prop where
  declarationIssued : SecretaryIssuedAndPublishedDeclaration decl c
  coveredCountermeasure : IsCoveredCountermeasureAgainstSmallpox cm decl c
  qualifiedAdministrator : CountermeasureAdministeredByQualifiedPerson p cm c
  declaredPurposeAndPeriod : AdministeredForDeclaredPurposeDuringEffectivePeriod cm decl c
  categoryCoverage : DeclaredCategoryCoverage233p2B p cm decl c



structure VacciniaTransmissionPresumption233p2C (p : Person) (decl : Declaration)
    (c : ComplaintText) : Prop where
  presumptionWindow : VacciniaContractedWithinPresumptionWindow p decl c
  notRebutted : ¬ VacciniaTransmissionPresumptionRebutted p c


structure VacciniaTransmissionScope233p2D (p : Person) (decl : Declaration)
    (c : ComplaintText) : Prop where
  presumption : VacciniaTransmissionPresumption233p2C p decl c
  deemedWithinScope : TransmittingIndividualDeemedWithinScope p c



inductive PartCExhaustion233p3A (p : Person) (c : ComplaintText) : Prop where
  | exhausted (h : ExhaustedPartCRemedies p c)
  | secretaryDelay (h : 240 < daysFromPartCRequestToFinalDetermination p c)



structure Section233p (p : Person) (cm : Countermeasure) (decl : Declaration)
    (act : ActOrOmission) (c : ComplaintText) : Prop where
  coveredPerson : IsCoveredPersonForCountermeasure p cm c
  administration : CountermeasureAdministration233p2B p cm decl c
  claimArisesOutOfAdministration : ClaimArisesOutOfAdministrationOfCountermeasure act cm c
  exhaustion : PartCExhaustion233p3A p c
  timely : WithinLimitations p c
  cooperation : CoveredPersonCooperatedInDefense p c
  benefitsOffset : PartCCompensationOffsetAgainstAward p c




inductive CulpableConduct233p6A (p : Person) (c : ComplaintText) : Prop where
  | contractBreach (h : FailedToCarryOutContractualObligationToUnitedStates p c)
  | grossFault (h : EngagedInGrosslyNegligentRecklessOrIllegalConduct p c)
  | willfulMisconduct (h : ActedWithScienter p c)


structure UnitedStatesRecovery233p6 (p : Person) (c : ComplaintText) : Prop where
  paymentMade : UnitedStatesMadePaymentToClaimant p c
  culpableConduct : CulpableConduct233p6A p c





structure HealthProfessionalVolunteer233q2 (p : Person) (e : CoveredEntity)
    (svc : HealthService) (c : ComplaintText) : Prop where
  atEntityFacilityOrOffsite : ServiceProvidedAtDeemedEntityFacilityOrOffsite svc e c
  sponsored : EntitySponsorsVolunteerPractitioner p e c
  noCompensation : VolunteerReceivesNoCompensationBeyondExpenseRepayment p e svc c
  noticePosted : ClearAndConspicuousLiabilityNoticePosted p e svc c
  licensed : PractitionerLicensedUnderFederalAndStateLaw p c
  documentation : EntityMaintainsCertifyingDocumentation p e c


structure Section233q (p : Person) (e : CoveredEntity) (svc : HealthService)
    (act : ActOrOmission) (c : ComplaintText) : Prop where
  entityDescribed : EntityDescribed233g4 e c
  volunteerQualifies : HealthProfessionalVolunteer233q2 p e svc c
  fundingEligibleService : ServiceEligibleForFundingUnderSection254b svc c
  transferMade : VolunteerTransferMadeUnderSubsectionQ4C e c
  temporalReach : ActOrOmissionAfterVolunteerDeemingDetermination act p c




structure ValidSection233Claim (p : Person) (act : ActOrOmission) (a : CivilAction)
    (c : ComplaintText) : Prop where
  coveredClaim : Section233a p act c
  exclusivity : ExclusiveRemedy233a p act a c
  causation : ProximateCause p c
  timely : WithinLimitations p c




inductive QualifyingCorpsMembership234 (p : Person) (c : ComplaintText) : Prop where
  | medicalReserveCorps (h : IsMedicalReserveCorpsMember p c)
  | emergencyRegistrySystem (h : IsESARVHPRegisteredProfessional p c)



inductive QualifyingEmergencyResponse234 (p : Person) (act : ActOrOmission)
    (ed : EmergencyDeclaration) (c : ComplaintText) : Prop where
  | publicHealthEmergency (h : RespondingToDeclaredPublicHealthEmergency p ed c)
      (window : daysFromEmergencyDeterminationToActOrOmission act ed c ≤ 90)
  | presidentialDeclaration (h : RespondingToPresidentiallyDeclaredMajorDisasterOrEmergency p ed c)


inductive HealthCareServices234d2 (act : ActOrOmission) (c : ComplaintText) : Prop where
  | diagnosisPreventionTreatment (h : ProvidesDiagnosisPreventionOrTreatmentServices act c)
  | assessmentOrCare (h : ProvidesHealthAssessmentOrCareServices act c)



structure Section234 (p : Person) (act : ActOrOmission) (ed : EmergencyDeclaration)
    (c : ComplaintText) : Prop where
  licensedProfessional : IsLicensedHealthCareProfessional p c
  corpsMembership : QualifyingCorpsMembership234 p c
  emergencyResponse : QualifyingEmergencyResponse234 p act ed c
  duringInitialPeriod : ActOrOmissionDuringInitialDeclarationPeriod act ed c
  relatedToEmergencyTreatment : ActOrOmissionRelatedToEmergencyTreatment act ed c
  inDeclaredState : ActOrOmissionInDeclaredState act ed c
  inCorpsCapacity : ActedInMedicalReserveCorpsOrESARVHPCapacity p act c
  withinLicensureScope : ServicesWithinScopeOfStateLicensure p act c
  priorStateAuthorization : StateAuthorizedDeploymentPriorToActOrOmission p ed c
  healthCareServices : HealthCareServices234d2 act c
  effectiveDateReach : ActOrOmissionOnOrAfterSection234EffectiveDate act c


structure Section234LiabilityRule (p : Person) (act : ActOrOmission)
    (ed : EmergencyDeclaration) (c : ComplaintText) : Prop where
  qualifies : Section234 p act ed c
  situsStateLawOnly : SubjectOnlyToStateLiabilityLawsOfSitusState p act c
  licensureExcepted : LicensureRegistrationAndCertificationExcepted p c




inductive AuthorizedRegulationRoute235 (reg : Regulation) (proj : Project)
    (c : ComplaintText) : Prop where
  | singleAdministrativeUnit (h : RegulationConsolidatesAdministrativeFunctionsInSingleUnit reg proj c)
  | reducedUniformRequirements (h : RegulationReducesAndUniformizesApplicationRequirements reg proj c)
  | revisedInconsistentRequirements (h : RegulationRevisesInconsistentOrDuplicativeRequirements reg proj c)



structure Section235 (reg : Regulation) (proj : Project) (c : ComplaintText) : Prop where
  multipleProgramGrants : GrantsSoughtOrMadeUnderTwoOrMorePrograms proj c
  singleProject : GrantsRelateToSingleProject proj c
  statutoryPurpose : RegulationFacilitatesAdministrationOrExpeditesPurposes reg proj c
  authorizedRoute : AuthorizedRegulationRoute235 reg proj c
  noProhibitedWaiver : ¬ RegulationWaivesOrSuspendsStatutoryRequirement reg proj c




structure BoardConstitution236a (bd : Board) (c : ComplaintText) : Prop where
  established : OrphanProductsBoardEstablishedInDepartment bd c
  composition : BoardIncludesRequiredAgencyRepresentatives bd c
  chair : BoardChairedByAssistantSecretaryForHealth bd c


structure BoardDrugDuties236c (bd : Board) (c : ComplaintText) : Prop where
  orphanDrugActEvaluation : BoardEvaluatedOrphanDrugActEffectAndImplementation bd c
  nihEvaluation : BoardEvaluatedNIHDrugDevelopmentActivities bd c
  interagencyCoordination : BoardAssuredInteragencyDevelopmentCoordination bd c
  stakeholderCoordination : BoardAssuredCoordinationWithManufacturersAndPatientGroups bd c
  availabilityInformation : BoardInformedPhysiciansAndPublicWithSponsorConsent bd c
  recruitment : BoardSoughtSponsorsInvestigatorsAndDistributors bd c
  recognition : BoardRecognizedRareDiseaseDevelopmentEfforts bd c


structure AnnualReport236e (bd : Board) (c : ComplaintText) : Prop where
  requiredContents : AnnualReportContainsRequiredContents bd c
  componentReports : AnnualReportIncludesComponentAgencyReports bd c
  timely : AnnualReportSubmittedByJune1 bd c


structure Section236 (bd : Board) (c : ComplaintText) : Prop where
  constitution : BoardConstitution236a bd c
  statutoryFunction : BoardPromotesRareDiseaseProductDevelopmentAndCoordination bd c
  drugDuties : BoardDrugDuties236c bd c
  consultation : BoardConsultedInterestedPersonsWithOralViewOpportunity bd c
  annualReport : AnnualReport236e bd c




inductive QualifyingDegree237b (p : Person) (c : ComplaintText) : Prop where
  | biomedicalDoctorate (h : HoldsDoctoralDegreeInBiomedicineOrRelatedField p c)
  | engineeringOrBioinformatics (h : HoldsDoctoralOrMastersDegreeInEngineeringOrBioinformatics p c)


structure ServiceEstablishment237a (s : ExpertService) (c : ComplaintText) : Prop where
  establishedInPublicHealthService : ConteServiceEstablishedInPublicHealthService s c
  membershipWithinCap : serviceMemberCount s c ≤ 2000
  statutoryPurpose : ServicePurposeIsRecruitAndRetainExperts s c
  assignmentsByExpertiseNeed : SecretaryAssignedExpertsAccordingToAgencyNeed s c


structure MemberAppointment237b (p : Person) (s : ExpertService) (c : ComplaintText) : Prop where
  appointedBySecretary : AppointedBySecretaryWithoutRegardToTitle5 p s c
  outstandingInField : IsOutstandingInBiomedicalOrProductAssessmentField p c
  degree : QualifyingDegree237b p c
  opmStandards : MeetsOPMQualificationStandardsForGS15 p c
  title5ChaptersInapplicable : EnumeratedTitle5ChaptersInapplicableToMember p s c


structure PerformanceAppraisalSystem237c (s : ExpertService) (c : ComplaintText) : Prop where
  systematicAppraisal : PerformanceAppraisalSystemProvidesSystematicAppraisal s c
  encouragesExcellence : PerformanceAppraisalSystemEncouragesExcellence s c



structure MemberPayWithinBounds237d (p : Person) (s : ExpertService)
    (c : ComplaintText) : Prop where
  floor : gs15MinimumAnnualRateDollars s c ≤ memberAnnualPayDollars p s c
  ceiling : memberAnnualPayDollars p s c ≤ executiveCompensationCapDollars s c




inductive PostSeparationAppointment237e (p : Person) (c : ComplaintText) : Prop where
  | careerCompetitive (h : WasCareerAppointeeBeforeServiceAppointment p c)
      (appointment : ReappointedToCompetitiveServiceGS15CareerPosition p c)
  | exceptedTwoYear (h : ¬ WasCareerAppointeeBeforeServiceAppointment p c)
      (appointment : ReappointedToExceptedServiceForNotMoreThanTwoYears p c)


structure Section237eReappointment (p : Person) (s : ExpertService)
    (c : ComplaintText) : Prop where
  involuntarySeparation : SeparatedInvoluntarilyAndWithoutCause p s c
  route : PostSeparationAppointment237e p c



structure Section237 (p : Person) (s : ExpertService) (c : ComplaintText) : Prop where
  establishment : ServiceEstablishment237a s c
  appointment : MemberAppointment237b p s c
  appraisalSystem : PerformanceAppraisalSystem237c s c
  pay : MemberPayWithinBounds237d p s c
  regulations : SecretaryPromulgatedServiceAdministrationRegulations s c




structure OfficeEstablishment237a (o : Office) (c : ComplaintText) : Prop where
  establishedWithinOfficeOfSecretary : OfficeOnWomensHealthEstablishedWithinOfficeOfSecretary o c
  headedByDeputyAssistantSecretary : OfficeHeadedByDeputyAssistantSecretaryForWomensHealth o c



structure OfficeDuties237b (o : Office) (c : ComplaintText) : Prop where
  goalsAndCoordination : EstablishedGoalsAndCoordinatedDepartmentalActivities o c
  expertAdvice : ProvidedExpertAdviceToSecretary o c
  monitoring : MonitoredDepartmentalWomensHealthActivities o c
  coordinatingCommittee : EstablishedCoordinatingCommitteeOnWomensHealth o c
  informationCenter : EstablishedNationalWomensHealthInformationCenter o c
  privateSectorCoordination : CoordinatedPrivateSectorPromotionEfforts o c
  informationExchange : ProvidedForExchangeOfInformationWithGranteesAndPublic o c


structure OfficeFundingAuthority237c (o : Office) (c : ComplaintText) : Prop where
  awardsMade : SecretaryMadeGrantsOrEnteredAgreements o c
  evaluationsAndDissemination : ProvidedForProjectEvaluationsAndDissemination o c


structure Section237a (o : Office) (c : ComplaintText) : Prop where
  establishment : OfficeEstablishment237a o c
  duties : OfficeDuties237b o c
  fundingAuthority : OfficeFundingAuthority237c o c
  biennialReport : BiennialReportSubmittedToCongress o c
  appropriationsAuthority : AppropriationsAuthorizedForCoveredFiscalYears o c





structure Section238aUse (h : Hospital) (c : ComplaintText) : Prop where
  departmentHeadsAgreed : HeadsOfConcernedDepartmentsAgreed h c
  usePermitted : ImmigrationServicePermittedPHSUseOfStationHospital h c
  forPublicHealthServicePatients : UseIsForCareOfPublicHealthServicePatients h c
  actualCostReimbursed : SurgeonGeneralReimbursedActualCostOfUtilitiesAndSupplies h c
  properlyCredited : ReimbursementCoveredIntoProperAppropriationOrWorkingFunds h c
  noUpkeepCharge : ¬ ChargeMadeForPhysicalUpkeepOfHospitals h c



structure Section238aDetaineeReimbursement (p : Person) (h : Hospital)
    (c : ComplaintText) : Prop where
  detainedAtServiceRequest : PersonDetainedAtImmigrationServiceRequest p h c
  reimbursed : ImmigrationServiceReimbursedForCareOfDetainedPersons p h c
  noSection249aEntitlement : ¬ DetainedPersonEntitledToCareUnderSection249a p c




inductive TransferDisqualification238l (tr : Transfer) (c : ComplaintText) : Prop where
  | unqualifiedTransferee (h : TransfereeNotQualifiedToApplyUnderSection222 tr c)
  | disapprovedTransferee (h : TransfereeDisapprovedByStateMentalHealthAgency tr c)


inductive RecoveryTriggeringEvent238l (fac : Facility) (tr : Transfer)
    (c : ComplaintText) : Prop where
  | saleOrTransfer (h : FacilitySoldOrTransferred fac tr c)
      (disqualification : TransferDisqualification238l tr c)
  | cessationOfUse (h : FacilityCeasedUseForComprehensiveMentalHealthServices fac c)




inductive InterestPeriodStart238l (fac : Facility) (c : ComplaintText) : Prop where
  | noticeGiven (h : WrittenNoticeProvidedToSecretary fac c)
      (timely : daysFromTriggeringEventToNotice fac c ≤ 10)
      (start : interestPeriodStartDaysAfterEvent fac c = 191)
  | noticeOmitted (h : ¬ WrittenNoticeProvidedToSecretary fac c)
      (start : interestPeriodStartDaysAfterEvent fac c = 11)



structure BaseAmount238lc1 (fac : Facility) (c : ComplaintText) : Prop where
  costPositive : 0 < projectCostDollars fac c
  federalShareWithinCost : federalParticipationDollars fac c ≤ projectCostDollars fac c
  valueEstablished : 0 < facilityThenValueDollars fac c
  proportionateShare : BaseAmountComputedAsProportionateShare fac c




structure Section238l (fac : Facility) (tr : Transfer) (c : ComplaintText) : Prop where
  communityMentalHealthFunded : FacilityFundedUnderCommunityMentalHealthCentersAct fac c
  withinTwentyYears : yearsFromCompletionOrAcquisitionToTriggeringEvent fac c < 20
  triggeringEvent : RecoveryTriggeringEvent238l fac tr c
  properDefendant : UnitedStatesEntitledToRecoverFromTransferorTransfereeOrOwner fac c
  baseAmount : BaseAmount238lc1 fac c
  interestRate : InterestComputedAtTreasuryBillRate fac c
  interestPeriod : InterestPeriodStart238l fac c
  noWaiver : ¬ SecretaryWaivedRecoveryForGoodCause fac c
  noPreJudgmentLien : ¬ RecoveryRightAssertedAsPreJudgmentLien fac c




inductive FiscalAgentStatus238m (fa : FiscalAgent) (c : ComplaintText) : Prop where
  | medicareCarrier (h : IsCarrierDescribedInSection1395uF1 fa c)
  | tribalOrganization (h : IsIndianTribeOrTribalOrganizationUnderSelfDeterminationAct fa c)


inductive PaymentDeterminationFunction238m (k : FiscalAgentContract)
    (c : ComplaintText) : Prop where
  | indianHealthService (h : ContractDeterminesAmountsPayableForIndianHealthServiceCare k c)
  | publicHealthService (h : ContractDeterminesAmountsPayableForPublicHealthServiceCare k c)


structure ContractFunctions238ma (k : FiscalAgentContract) (c : ComplaintText) : Prop where
  paymentDetermination : PaymentDeterminationFunction238m k c
  fundsHandling : ContractProvidesForReceiptDisbursementAndAccounting k c
  audits : ContractProvidesForAuditsOfRecords k c
  additionalFunctions : ContractProvidesForNecessaryAdditionalFunctions k c


structure SecretaryFindings238mb2 (fa : FiscalAgent) (k : FiscalAgentContract)
    (c : ComplaintText) : Prop where
  efficientAndEffectivePerformance : SecretaryFoundEntityWillPerformEfficientlyAndEffectively fa k c
  financialAndLegalCapacity : SecretaryFoundEntityMeetsFinancialAndLegalRequirements fa k c


structure Section238m (k : FiscalAgentContract) (fa : FiscalAgent)
    (c : ComplaintText) : Prop where
  contractEntered : SecretaryEnteredContractWithFiscalAgent k fa c
  agentStatus : FiscalAgentStatus238m fa c
  functions : ContractFunctions238ma k c
  findings : SecretaryFindings238mb2 fa k c
  competitionRelief : ContractEnteredWithoutRegardToCompetitionRequirements k c
  advances : ContractProvidesForAdvancesOfFunds k c
  medicareCarrierProvisions : MedicareCarrierProvisionsAppliedToContract k c

end Proving.USC.T42.Ch6ASchI.Reslice.Elements
