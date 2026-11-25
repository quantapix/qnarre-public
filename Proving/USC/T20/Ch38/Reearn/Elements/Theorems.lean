import Proving.USC.T20.Ch38.Reearn.Elements.Statute

set_option autoImplicit false











namespace Proving.USC.T20.Ch38.Reearn.Elements

open Proving.USC.Common



theorem coveredEntity1687_intro_stateInstrumentality {prog c}
    (h : IsStateOrLocalGovernmentInstrumentality prog c) : CoveredEntity1687 prog c :=
  .stateInstrumentality h

theorem coveredEntity1687_intro_stateDistributor {prog c}
    (h : IsStateOrLocalAssistanceDistributingEntity prog c) : CoveredEntity1687 prog c :=
  .stateDistributor h

theorem coveredEntity1687_intro_postsecondary {prog c}
    (h : IsPostsecondaryInstitutionOrSystem prog c) : CoveredEntity1687 prog c :=
  .postsecondary h

theorem coveredEntity1687_intro_schoolSystem {prog c}
    (h : IsLocalEducationalAgencyOrSchoolSystem prog c) : CoveredEntity1687 prog c :=
  .schoolSystem h

theorem coveredEntity1687_intro_whollyAssistedPrivate {prog c}
    (h : IsWhollyAssistedPrivateOrganization prog c) : CoveredEntity1687 prog c :=
  .whollyAssistedPrivate h

theorem coveredEntity1687_intro_educationBusinessPrivate {prog c}
    (h : IsEducationOrSocialServicePrivateOrganization prog c) : CoveredEntity1687 prog c :=
  .educationBusinessPrivate h

theorem coveredEntity1687_intro_separateFacility {prog c}
    (h : IsAssistedGeographicallySeparateFacility prog c) : CoveredEntity1687 prog c :=
  .separateFacility h

theorem coveredEntity1687_intro_jointEntity {prog c}
    (h : IsJointEntityOfCoveredEntities prog c) : CoveredEntity1687 prog c :=
  .jointEntity h

theorem programOrActivity1687_intro {prog c}
    (hEntity : CoveredEntity1687 prog c)
    (hFunded : ReceivesFederalFinancialAssistance prog c)
    (hNotReligious : ¬ ReligiouslyControlledOperationInconsistentWithTenets prog c) :
    ProgramOrActivity1687 prog c :=
  ⟨hEntity, hFunded, hNotReligious⟩

theorem coveredEducationProgram_intro {prog c}
    (hEducational : IsEducationProgram prog c)
    (hScope : ProgramOrActivity1687 prog c) : CoveredEducationProgram prog c :=
  ⟨hEducational, hScope⟩



theorem deliberateIndifferenceResponse_intro {r c}
    (hKnowledge : RecipientHadActualKnowledge r c)
    (hIndifference : RecipientDeliberatelyIndifferent r c) :
    DeliberateIndifferenceResponse r c :=
  ⟨hKnowledge, hIndifference⟩

theorem hostileEnvironmentHarassment_intro {p r prog c}
    (hHarassment : SubjectedToSexualHarassment p c)
    (hSeverity : HarassmentSevereAndPervasive p c)
    (hDeprivation : DeprivedOfEducationalAccess p prog c)
    (hControl : RecipientSubstantialControl r c)
    (hResponse : DeliberateIndifferenceResponse r c) :
    HostileEnvironmentHarassment p r prog c :=
  ⟨hHarassment, hSeverity, hDeprivation, hControl, hResponse⟩

theorem discriminationTheory1681a_intro_excluded {p r prog c}
    (h : ExcludedFromParticipation p prog c) : DiscriminationTheory1681a p r prog c :=
  .excluded h

theorem discriminationTheory1681a_intro_deniedBenefits {p r prog c}
    (h : DeniedBenefitsOfProgram p prog c) : DiscriminationTheory1681a p r prog c :=
  .deniedBenefits h

theorem discriminationTheory1681a_intro_subjected {p r prog c}
    (h : SubjectedToDiscriminationUnderProgram p prog c) : DiscriminationTheory1681a p r prog c :=
  .subjected h

theorem discriminationTheory1681a_intro_hostileEnvironment {p r prog c}
    (h : HostileEnvironmentHarassment p r prog c) : DiscriminationTheory1681a p r prog c :=
  .hostileEnvironment h



theorem exemption1681a1_intro {p inst c}
    (hAdmissions : ClaimConcernsAdmissions p c)
    (hNotCovered : ¬ AdmissionsCoveredInstitution inst c) : Exemption1681a1 p inst c :=
  ⟨hAdmissions, hNotCovered⟩

theorem exemption1681a2_intro {p inst c}
    (hAdmissions : ClaimConcernsAdmissions p c)
    (hTransition : WithinAdmissionsTransitionPlanExemption inst c) : Exemption1681a2 p inst c :=
  ⟨hAdmissions, hTransition⟩

theorem exemption1681a5_intro {p inst c}
    (hAdmissions : ClaimConcernsAdmissions p c)
    (hTraditional : TraditionallySingleSexPublicUndergraduateInstitution inst c) :
    Exemption1681a5 p inst c :=
  ⟨hAdmissions, hTraditional⟩

theorem membershipPracticeExemption1681a6_intro_fraternityOrSorority {prog c}
    (h : SocialFraternityOrSororityMembershipPractice prog c) :
    MembershipPracticeExemption1681a6 prog c :=
  .fraternityOrSorority h

theorem membershipPracticeExemption1681a6_intro_youthServiceOrganization {prog c}
    (h : TraditionalYouthServiceOrganizationMembershipPractice prog c) :
    MembershipPracticeExemption1681a6 prog c :=
  .youthServiceOrganization h

theorem conferenceActivityExemption1681a7_intro_americanLegion {prog c}
    (h : AmericanLegionConferenceActivity prog c) : ConferenceActivityExemption1681a7 prog c :=
  .americanLegion h

theorem conferenceActivityExemption1681a7_intro_schoolPromotion {prog c}
    (h : SchoolPromotionOfBoysOrGirlsStateConference prog c) :
    ConferenceActivityExemption1681a7 prog c :=
  .schoolPromotion h

theorem conferenceActivityExemption1681a7_intro_schoolSelection {prog c}
    (h : SchoolSelectionForBoysOrGirlsStateConference prog c) :
    ConferenceActivityExemption1681a7 prog c :=
  .schoolSelection h

theorem exemption1681a8_intro {prog c}
    (hActivity : IsFatherSonOrMotherDaughterActivity prog c)
    (hComparable : ComparableActivityProvidedForOtherSex prog c) : Exemption1681a8 prog c :=
  ⟨hActivity, hComparable⟩

theorem exemption1681a9_intro {p c}
    (hAward : SingleSexPageantScholarshipAward p c)
    (hCompliance : PageantCompliesWithOtherFederalNondiscriminationLaw p c) :
    Exemption1681a9 p c :=
  ⟨hAward, hCompliance⟩



theorem section1681a_intro {p r inst prog c}
    (hPerson : IsPersonInUS p c)
    (hInstitution : IsEducationalInstitutionUnderSection1681c inst c)
    (hCoverage : CoveredEducationProgram prog c)
    (hRecipient : DefendantIsFundingRecipient r c)
    (hTheory : DiscriminationTheory1681a p r prog c)
    (hSex : OnTheBasisOfSex p prog c)
    (hNot1 : ¬ Exemption1681a1 p inst c)
    (hNot2 : ¬ Exemption1681a2 p inst c)
    (hNot3 : ¬ ReligiouslyControlledInstitutionInconsistentWithTenets inst c)
    (hNot4 : ¬ MilitaryOrMerchantMarineTrainingInstitution inst c)
    (hNot5 : ¬ Exemption1681a5 p inst c)
    (hNot6 : ¬ MembershipPracticeExemption1681a6 prog c)
    (hNot7 : ¬ ConferenceActivityExemption1681a7 prog c)
    (hNot8 : ¬ Exemption1681a8 prog c)
    (hNot9 : ¬ Exemption1681a9 p c)
    (hNotQuota : ¬ ClaimDemandsPreferentialTreatmentForImbalance p prog c)
    (hNotHousing : ¬ ClaimChallengesSeparateLivingFacilities inst c)
    (hNotAbortion : ¬ ClaimWouldRequireOrProhibitAbortionRelatedBenefit p c)
    (hNotInsurance : ¬ AssistanceExtendedByInsuranceOrGuarantyContract prog c) :
    Section1681a p r inst prog c :=
  ⟨hPerson, hInstitution, hCoverage, hRecipient, hTheory, hSex, hNot1, hNot2, hNot3, hNot4,
   hNot5, hNot6, hNot7, hNot8, hNot9, hNotQuota, hNotHousing, hNotAbortion, hNotInsurance⟩

theorem validTitleIXClaim_intro {p r inst prog c}
    (hViolation : Section1681a p r inst prog c)
    (hIntent : IntentToDiscriminate p c)
    (hInjury : SufferedEducationalInjury p c)
    (hCausation : ProximateCause p c)
    (hTimeliness : WithinLimitations p c) : ValidTitleIXClaim p r inst prog c :=
  ⟨hViolation, hIntent, hInjury, hCausation, hTimeliness⟩




theorem thirtyDaysElapsedAfterReport_of_count {act c} {n : Nat}
    (h : daysFromReportFilingToEffectiveDate act c = n) (hn : 30 ≤ n) :
    ThirtyDaysElapsedAfterReport act c := by
  show 30 ≤ daysFromReportFilingToEffectiveDate act c
  omega

theorem enforcementPrerequisites1682_intro {ag r prog c}
    (hEmpowered : AgencyEmpoweredToExtendAssistance ag prog c)
    (hRule : RequirementAdoptedByGeneralRule ag c)
    (hApproval : RuleApprovedByPresident ag c)
    (hNoncompliance : RecipientFailedToComplyWithRequirement r c)
    (hAdvised : AdvisedOfFailureToComply ag r c)
    (hVoluntary : DeterminedVoluntaryComplianceUnavailable ag r c)
    (hNotInsurance : ¬ AssistanceExtendedByInsuranceOrGuarantyContract prog c) :
    EnforcementPrerequisites1682 ag r prog c :=
  ⟨hEmpowered, hRule, hApproval, hNoncompliance, hAdvised, hVoluntary, hNotInsurance⟩

theorem fundTerminationAction1682_intro {ag r prog act c}
    (hPrereq : EnforcementPrerequisites1682 ag r prog c)
    (hFinding : ExpressFindingOnRecordAfterHearing act c)
    (hLimitedRecipient : TerminationLimitedToFoundRecipient act c)
    (hLimitedProgram : TerminationLimitedToNoncompliantProgram act c)
    (hReport : WrittenReportFiledWithCongressionalCommittees act c)
    (hThirtyDays : ThirtyDaysElapsedAfterReport act c) :
    FundTerminationAction1682 ag r prog act c :=
  ⟨hPrereq, hFinding, hLimitedRecipient, hLimitedProgram, hReport, hThirtyDays⟩

theorem otherMeansEnforcement1682_intro {ag r prog act c}
    (hPrereq : EnforcementPrerequisites1682 ag r prog c)
    (hOtherMeans : EnforcementByOtherMeansAuthorizedByLaw act c) :
    OtherMeansEnforcement1682 ag r prog act c :=
  ⟨hPrereq, hOtherMeans⟩

theorem lawfulEnforcementAction1682_intro_termination {ag r prog act c}
    (h : FundTerminationAction1682 ag r prog act c) :
    LawfulEnforcementAction1682 ag r prog act c :=
  .termination h

theorem lawfulEnforcementAction1682_intro_otherMeans {ag r prog act c}
    (h : OtherMeansEnforcement1682 ag r prog act c) :
    LawfulEnforcementAction1682 ag r prog act c :=
  .otherMeans h



theorem reviewUnderExistingLaw1683_intro {act c}
    (hPursuant : ActionTakenPursuantToSection1682 act c)
    (hReviewable : SimilarActionOtherwiseSubjectToJudicialReview act c) :
    ReviewUnderExistingLaw1683 act c :=
  ⟨hPursuant, hReviewable⟩

theorem apaReviewRoute1683_intro {act c}
    (hPursuant : ActionTakenPursuantToSection1682 act c)
    (hNotReviewable : ActionNotOtherwiseSubjectToJudicialReview act c)
    (hTermination : ActionTerminatesOrRefusesFinancialAssistance act c)
    (hFinding : ActionBasedOnFindingOfNoncompliance act c) : ApaReviewRoute1683 act c :=
  ⟨hPursuant, hNotReviewable, hTermination, hFinding⟩

theorem judicialReviewRoute1683_intro_existingLaw {act c}
    (h : ReviewUnderExistingLaw1683 act c) : JudicialReviewRoute1683 act c :=
  .existingLaw h

theorem judicialReviewRoute1683_intro_apa {act c}
    (h : ApaReviewRoute1683 act c) : JudicialReviewRoute1683 act c :=
  .apa h

theorem section1683Claim_intro {p act c}
    (hAggrieved : IsPersonAggrievedByAgencyAction p act c)
    (hRoute : JudicialReviewRoute1683 act c) : Section1683Claim p act c :=
  ⟨hAggrieved, hRoute⟩



theorem section1684_intro {p r prog crs c}
    (hPerson : IsPersonInUS p c)
    (hDenied : DeniedAdmissionToCourseOfStudy p crs c)
    (hGround : OnGroundOfBlindnessOrSeverelyImpairedVision p c)
    (hRecipient : RecipientOfFederalAssistanceForEducationProgram r prog c)
    (hNotServices : ¬ ClaimSeeksSpecialServicesForVisualImpairment p c)
    (hNotInsurance : ¬ AssistanceExtendedByInsuranceOrGuarantyContract prog c) :
    Section1684 p r prog crs c :=
  ⟨hPerson, hDenied, hGround, hRecipient, hNotServices, hNotInsurance⟩

theorem validSection1684Claim_intro {p r prog crs c}
    (hViolation : Section1684 p r prog crs c)
    (hInjury : SufferedEducationalInjury p c)
    (hCausation : ProximateCause p c)
    (hTimeliness : WithinLimitations p c) : ValidSection1684Claim p r prog crs c :=
  ⟨hViolation, hInjury, hCausation, hTimeliness⟩



theorem insuranceOrGuarantyCarveOut1685_intro {prog c}
    (h : AssistanceExtendedByInsuranceOrGuarantyContract prog c) :
    InsuranceOrGuarantyCarveOut1685 prog c :=
  ⟨h⟩

theorem separateLivingFacilitiesPermitted1686_intro {inst c}
    (hFunded : InstitutionReceivesFundsUnderThisAct inst c)
    (hFacilities : MaintainsSeparateLivingFacilitiesForSexes inst c) :
    SeparateLivingFacilitiesPermitted1686 inst c :=
  ⟨hFunded, hFacilities⟩

theorem section1688NoPenaltyFloor_intro {p r c}
    (h : ¬ PenaltyImposedForSeekingOrReceivingLegalAbortion p r c) :
    Section1688NoPenaltyFloor p r c :=
  ⟨h⟩




theorem detailWithinThreeYearLimit_of_count {dt c} {n : Nat}
    (h : monthsOfPersonnelDetail dt c = n) (hn : n ≤ 36) :
    DetailWithinThreeYearLimit dt c := by
  show monthsOfPersonnelDetail dt c ≤ 36
  omega


theorem planSubmittedWithinNinetyDays_of_count {tf c} {n : Nat}
    (h : daysFromTaskForceEstablishmentToPlanSubmission tf c = n) (hn : n ≤ 90) :
    PlanSubmittedWithinNinetyDays tf c := by
  show daysFromTaskForceEstablishmentToPlanSubmission tf c ≤ 90
  omega

theorem taskForceDuties1689a_intro {tf c}
    (h1 : ProvidesCampusSexualViolenceInformation tf c)
    (h2 : RecommendsPreventionAndResponseTeams tf c)
    (h3 : DevelopsSurvivorResourceRecommendations tf c)
    (h4 : DevelopsPreventionBestPracticesWithStudentGroups tf c)
    (h5 : DevelopsSexEducationAndDisciplineRecommendations tf c)
    (h6 : DevelopsCulturallyResponsiveSupportRecommendations tf c)
    (h7 : SolicitsPeriodicSurvivorAndStakeholderInput tf c)
    (h8 : AssessesIntermediateFineAuthority tf c)
    (h9 : CreatesWorkforcePlan tf c) : TaskForceDuties1689a tf c :=
  ⟨h1, h2, h3, h4, h5, h6, h7, h8, h9⟩

theorem taskForceEstablishment1689a_intro {tf c}
    (hTimely : TaskForceEstablishedByStatutoryDeadline tf c)
    (hJointly : JointlyEstablishedByEducationHhsAndAttorneyGeneral tf c)
    (hDuties : TaskForceDuties1689a tf c) : TaskForceEstablishment1689a tf c :=
  ⟨hTimely, hJointly, hDuties⟩

theorem personnelDetail1689b_intro {dt tf c}
    (hAuthorized : DetailAuthorizedByComponentHeadAndTaskForce dt tf c)
    (hWithin : DetailWithinThreeYearLimit dt c)
    (hBasis : DetailOnReimbursableOrNonreimbursableBasis dt c) : PersonnelDetail1689b dt tf c :=
  ⟨hAuthorized, hWithin, hBasis⟩

theorem workforcePlanContents1689c_intro {tf c}
    (h1 : PlanIdentifiesInvestigationAndEnforcementGaps tf c)
    (h2 : PlanExaminesRecruitmentRetentionAndDevelopment tf c)
    (h3 : PlanAssessesOutreachAndTrainingBenefits tf c)
    (h4 : PlanExaminesBestPracticesAwarenessAndResearchGaps tf c)
    (h5 : PlanAddressesOtherSecretaryIdentifiedMatters tf c) : WorkforcePlanContents1689c tf c :=
  ⟨h1, h2, h3, h4, h5⟩

theorem workforcePlan1689c_intro {tf c}
    (hSubmitted : WorkforcePlanSubmittedToCongress tf c)
    (hTimely : PlanSubmittedWithinNinetyDays tf c)
    (hContents : WorkforcePlanContents1689c tf c) : WorkforcePlan1689c tf c :=
  ⟨hSubmitted, hTimely, hContents⟩

theorem annualReportContents1689d_intro {tf c}
    (h1 : ReportStatesNumberOfSexualViolenceComplaints tf c)
    (h2 : ReportStatesNumberOfOpenInvestigations tf c)
    (h3 : ReportStatesNumberOfComplaintsResolved tf c)
    (h4 : ReportStatesNumberResolvedInformally tf c)
    (h5 : ReportStatesAverageInvestigationTime tf c)
    (h6 : ReportStatesInvestigationsInitiatedByComplaint tf c)
    (h7 : ReportStatesInvestigationsInitiatedByDepartment tf c) :
    AnnualReportContents1689d tf c :=
  ⟨h1, h2, h3, h4, h5, h6, h7⟩

theorem annualReport1689d_intro {tf c}
    (hSubmitted : AnnualReportSubmittedAndMadePublic tf c)
    (hContents : AnnualReportContents1689d tf c) : AnnualReport1689d tf c :=
  ⟨hSubmitted, hContents⟩

theorem section1689Compliance_intro {tf c}
    (hEstablishment : TaskForceEstablishment1689a tf c)
    (hPlan : WorkforcePlan1689c tf c)
    (hReport : AnnualReport1689d tf c) : Section1689Compliance tf c :=
  ⟨hEstablishment, hPlan, hReport⟩

end Proving.USC.T20.Ch38.Reearn.Elements
