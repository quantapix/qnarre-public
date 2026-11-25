import Proving.USC.T20.Ch38.Reearn.Elements.Predicates

set_option autoImplicit false










namespace Proving.USC.T20.Ch38.Reearn.Elements

open Proving.USC.Common





inductive CoveredEntity1687 (prog : EducationProgram) (c : ComplaintText) : Prop where
  | stateInstrumentality (h : IsStateOrLocalGovernmentInstrumentality prog c)
  | stateDistributor (h : IsStateOrLocalAssistanceDistributingEntity prog c)
  | postsecondary (h : IsPostsecondaryInstitutionOrSystem prog c)
  | schoolSystem (h : IsLocalEducationalAgencyOrSchoolSystem prog c)
  | whollyAssistedPrivate (h : IsWhollyAssistedPrivateOrganization prog c)
  | educationBusinessPrivate (h : IsEducationOrSocialServicePrivateOrganization prog c)
  | separateFacility (h : IsAssistedGeographicallySeparateFacility prog c)
  | jointEntity (h : IsJointEntityOfCoveredEntities prog c)




structure ProgramOrActivity1687 (prog : EducationProgram) (c : ComplaintText) : Prop where
  entity : CoveredEntity1687 prog c
  funded : ReceivesFederalFinancialAssistance prog c
  notReligiouslyExempt : ¬ ReligiouslyControlledOperationInconsistentWithTenets prog c


structure CoveredEducationProgram (prog : EducationProgram) (c : ComplaintText) : Prop where
  educational : IsEducationProgram prog c
  scope : ProgramOrActivity1687 prog c




abbrev IsEducationProgramOrActivityReceivingFederalAssistance
    (prog : EducationProgram) (c : ComplaintText) : Prop :=
  CoveredEducationProgram prog c






structure DeliberateIndifferenceResponse (r : Recipient) (c : ComplaintText) : Prop where
  actualKnowledge : RecipientHadActualKnowledge r c
  indifference : RecipientDeliberatelyIndifferent r c




structure HostileEnvironmentHarassment (p : Person) (r : Recipient)
    (prog : EducationProgram) (c : ComplaintText) : Prop where
  harassment : SubjectedToSexualHarassment p c
  severity : HarassmentSevereAndPervasive p c
  deprivation : DeprivedOfEducationalAccess p prog c
  control : RecipientSubstantialControl r c
  response : DeliberateIndifferenceResponse r c




inductive DiscriminationTheory1681a (p : Person) (r : Recipient)
    (prog : EducationProgram) (c : ComplaintText) : Prop where
  | excluded (h : ExcludedFromParticipation p prog c)
  | deniedBenefits (h : DeniedBenefitsOfProgram p prog c)
  | subjected (h : SubjectedToDiscriminationUnderProgram p prog c)
  | hostileEnvironment (h : HostileEnvironmentHarassment p r prog c)





def Exemption1681a1 (p : Person) (inst : EducationalInstitution) (c : ComplaintText) : Prop :=
  ClaimConcernsAdmissions p c ∧ ¬ AdmissionsCoveredInstitution inst c



def Exemption1681a2 (p : Person) (inst : EducationalInstitution) (c : ComplaintText) : Prop :=
  ClaimConcernsAdmissions p c ∧ WithinAdmissionsTransitionPlanExemption inst c



def Exemption1681a5 (p : Person) (inst : EducationalInstitution) (c : ComplaintText) : Prop :=
  ClaimConcernsAdmissions p c ∧ TraditionallySingleSexPublicUndergraduateInstitution inst c


inductive MembershipPracticeExemption1681a6 (prog : EducationProgram) (c : ComplaintText) : Prop where
  | fraternityOrSorority (h : SocialFraternityOrSororityMembershipPractice prog c)
  | youthServiceOrganization (h : TraditionalYouthServiceOrganizationMembershipPractice prog c)


inductive ConferenceActivityExemption1681a7 (prog : EducationProgram) (c : ComplaintText) : Prop where
  | americanLegion (h : AmericanLegionConferenceActivity prog c)
  | schoolPromotion (h : SchoolPromotionOfBoysOrGirlsStateConference prog c)
  | schoolSelection (h : SchoolSelectionForBoysOrGirlsStateConference prog c)




def Exemption1681a8 (prog : EducationProgram) (c : ComplaintText) : Prop :=
  IsFatherSonOrMotherDaughterActivity prog c ∧ ComparableActivityProvidedForOtherSex prog c



def Exemption1681a9 (p : Person) (c : ComplaintText) : Prop :=
  SingleSexPageantScholarshipAward p c ∧ PageantCompliesWithOtherFederalNondiscriminationLaw p c






structure Section1681a (p : Person) (r : Recipient) (inst : EducationalInstitution)
    (prog : EducationProgram) (c : ComplaintText) : Prop where
  personInUS : IsPersonInUS p c
  institution : IsEducationalInstitutionUnderSection1681c inst c
  coverage : CoveredEducationProgram prog c
  recipientDefendant : DefendantIsFundingRecipient r c
  theory : DiscriminationTheory1681a p r prog c
  basisOfSex : OnTheBasisOfSex p prog c
  notAdmissionsUncovered : ¬ Exemption1681a1 p inst c
  notTransitional : ¬ Exemption1681a2 p inst c
  notReligiouslyControlled : ¬ ReligiouslyControlledInstitutionInconsistentWithTenets inst c
  notMilitaryTraining : ¬ MilitaryOrMerchantMarineTrainingInstitution inst c
  notTraditionalSingleSex : ¬ Exemption1681a5 p inst c
  notMembershipPractice : ¬ MembershipPracticeExemption1681a6 prog c
  notConferenceActivity : ¬ ConferenceActivityExemption1681a7 prog c
  notParentChildActivity : ¬ Exemption1681a8 prog c
  notPageantScholarship : ¬ Exemption1681a9 p c
  notQuotaDemand : ¬ ClaimDemandsPreferentialTreatmentForImbalance p prog c
  notLivingFacilities : ¬ ClaimChallengesSeparateLivingFacilities inst c
  notAbortionMandate : ¬ ClaimWouldRequireOrProhibitAbortionRelatedBenefit p c
  notInsuranceOrGuarantyOnly : ¬ AssistanceExtendedByInsuranceOrGuarantyContract prog c




structure ValidTitleIXClaim (p : Person) (r : Recipient) (inst : EducationalInstitution)
    (prog : EducationProgram) (c : ComplaintText) : Prop where
  violation : Section1681a p r inst prog c
  intent : IntentToDiscriminate p c
  injury : SufferedEducationalInjury p c
  causation : ProximateCause p c
  timeliness : WithinLimitations p c




def ThirtyDaysElapsedAfterReport (act : AgencyAction) (c : ComplaintText) : Prop :=
  30 ≤ daysFromReportFilingToEffectiveDate act c


structure EnforcementPrerequisites1682 (ag : FederalAgency) (r : Recipient)
    (prog : EducationProgram) (c : ComplaintText) : Prop where
  empowered : AgencyEmpoweredToExtendAssistance ag prog c
  generalRule : RequirementAdoptedByGeneralRule ag c
  presidentialApproval : RuleApprovedByPresident ag c
  noncompliance : RecipientFailedToComplyWithRequirement r c
  advised : AdvisedOfFailureToComply ag r c
  voluntaryComplianceUnavailable : DeterminedVoluntaryComplianceUnavailable ag r c
  notInsuranceOrGuaranty : ¬ AssistanceExtendedByInsuranceOrGuarantyContract prog c



structure FundTerminationAction1682 (ag : FederalAgency) (r : Recipient)
    (prog : EducationProgram) (act : AgencyAction) (c : ComplaintText) : Prop where
  prerequisites : EnforcementPrerequisites1682 ag r prog c
  expressFinding : ExpressFindingOnRecordAfterHearing act c
  limitedToRecipient : TerminationLimitedToFoundRecipient act c
  limitedToProgram : TerminationLimitedToNoncompliantProgram act c
  reportFiled : WrittenReportFiledWithCongressionalCommittees act c
  thirtyDays : ThirtyDaysElapsedAfterReport act c


structure OtherMeansEnforcement1682 (ag : FederalAgency) (r : Recipient)
    (prog : EducationProgram) (act : AgencyAction) (c : ComplaintText) : Prop where
  prerequisites : EnforcementPrerequisites1682 ag r prog c
  otherMeans : EnforcementByOtherMeansAuthorizedByLaw act c


inductive LawfulEnforcementAction1682 (ag : FederalAgency) (r : Recipient)
    (prog : EducationProgram) (act : AgencyAction) (c : ComplaintText) : Prop where
  | termination (h : FundTerminationAction1682 ag r prog act c)
  | otherMeans (h : OtherMeansEnforcement1682 ag r prog act c)




structure ReviewUnderExistingLaw1683 (act : AgencyAction) (c : ComplaintText) : Prop where
  pursuantTo1682 : ActionTakenPursuantToSection1682 act c
  otherwiseReviewable : SimilarActionOtherwiseSubjectToJudicialReview act c




structure ApaReviewRoute1683 (act : AgencyAction) (c : ComplaintText) : Prop where
  pursuantTo1682 : ActionTakenPursuantToSection1682 act c
  notOtherwiseReviewable : ActionNotOtherwiseSubjectToJudicialReview act c
  terminationOrRefusal : ActionTerminatesOrRefusesFinancialAssistance act c
  findingOfNoncompliance : ActionBasedOnFindingOfNoncompliance act c


inductive JudicialReviewRoute1683 (act : AgencyAction) (c : ComplaintText) : Prop where
  | existingLaw (h : ReviewUnderExistingLaw1683 act c)
  | apa (h : ApaReviewRoute1683 act c)


structure Section1683Claim (p : Person) (act : AgencyAction) (c : ComplaintText) : Prop where
  aggrieved : IsPersonAggrievedByAgencyAction p act c
  route : JudicialReviewRoute1683 act c






structure Section1684 (p : Person) (r : Recipient) (prog : EducationProgram)
    (crs : CourseOfStudy) (c : ComplaintText) : Prop where
  personInUS : IsPersonInUS p c
  deniedAdmission : DeniedAdmissionToCourseOfStudy p crs c
  ground : OnGroundOfBlindnessOrSeverelyImpairedVision p c
  recipientDefendant : RecipientOfFederalAssistanceForEducationProgram r prog c
  notSpecialServicesDemand : ¬ ClaimSeeksSpecialServicesForVisualImpairment p c
  notInsuranceOrGuarantyOnly : ¬ AssistanceExtendedByInsuranceOrGuarantyContract prog c


structure ValidSection1684Claim (p : Person) (r : Recipient) (prog : EducationProgram)
    (crs : CourseOfStudy) (c : ComplaintText) : Prop where
  violation : Section1684 p r prog crs c
  injury : SufferedEducationalInjury p c
  causation : ProximateCause p c
  timeliness : WithinLimitations p c






structure InsuranceOrGuarantyCarveOut1685 (prog : EducationProgram) (c : ComplaintText) : Prop where
  insuranceOrGuarantyOnly : AssistanceExtendedByInsuranceOrGuarantyContract prog c



structure SeparateLivingFacilitiesPermitted1686 (inst : EducationalInstitution)
    (c : ComplaintText) : Prop where
  funded : InstitutionReceivesFundsUnderThisAct inst c
  separateFacilities : MaintainsSeparateLivingFacilitiesForSexes inst c



structure Section1688NoPenaltyFloor (p : Person) (r : Recipient) (c : ComplaintText) : Prop where
  noPenalty : ¬ PenaltyImposedForSeekingOrReceivingLegalAbortion p r c




def DetailWithinThreeYearLimit (dt : PersonnelDetail) (c : ComplaintText) : Prop :=
  monthsOfPersonnelDetail dt c ≤ 36


def PlanSubmittedWithinNinetyDays (tf : TaskForce) (c : ComplaintText) : Prop :=
  daysFromTaskForceEstablishmentToPlanSubmission tf c ≤ 90


structure TaskForceDuties1689a (tf : TaskForce) (c : ComplaintText) : Prop where
  information : ProvidesCampusSexualViolenceInformation tf c
  responseTeams : RecommendsPreventionAndResponseTeams tf c
  survivorResources : DevelopsSurvivorResourceRecommendations tf c
  bestPractices : DevelopsPreventionBestPracticesWithStudentGroups tf c
  sexEducation : DevelopsSexEducationAndDisciplineRecommendations tf c
  culturallyResponsive : DevelopsCulturallyResponsiveSupportRecommendations tf c
  stakeholderInput : SolicitsPeriodicSurvivorAndStakeholderInput tf c
  fineAuthority : AssessesIntermediateFineAuthority tf c
  plan : CreatesWorkforcePlan tf c


structure TaskForceEstablishment1689a (tf : TaskForce) (c : ComplaintText) : Prop where
  timely : TaskForceEstablishedByStatutoryDeadline tf c
  jointly : JointlyEstablishedByEducationHhsAndAttorneyGeneral tf c
  duties : TaskForceDuties1689a tf c



structure PersonnelDetail1689b (dt : PersonnelDetail) (tf : TaskForce)
    (c : ComplaintText) : Prop where
  authorized : DetailAuthorizedByComponentHeadAndTaskForce dt tf c
  withinThreeYears : DetailWithinThreeYearLimit dt c
  basis : DetailOnReimbursableOrNonreimbursableBasis dt c


structure WorkforcePlanContents1689c (tf : TaskForce) (c : ComplaintText) : Prop where
  gaps : PlanIdentifiesInvestigationAndEnforcementGaps tf c
  recruitment : PlanExaminesRecruitmentRetentionAndDevelopment tf c
  outreach : PlanAssessesOutreachAndTrainingBenefits tf c
  awareness : PlanExaminesBestPracticesAwarenessAndResearchGaps tf c
  otherMatters : PlanAddressesOtherSecretaryIdentifiedMatters tf c



structure WorkforcePlan1689c (tf : TaskForce) (c : ComplaintText) : Prop where
  submitted : WorkforcePlanSubmittedToCongress tf c
  timely : PlanSubmittedWithinNinetyDays tf c
  contents : WorkforcePlanContents1689c tf c


structure AnnualReportContents1689d (tf : TaskForce) (c : ComplaintText) : Prop where
  complaints : ReportStatesNumberOfSexualViolenceComplaints tf c
  openInvestigations : ReportStatesNumberOfOpenInvestigations tf c
  resolved : ReportStatesNumberOfComplaintsResolved tf c
  informal : ReportStatesNumberResolvedInformally tf c
  averageTime : ReportStatesAverageInvestigationTime tf c
  complaintInitiated : ReportStatesInvestigationsInitiatedByComplaint tf c
  departmentInitiated : ReportStatesInvestigationsInitiatedByDepartment tf c



structure AnnualReport1689d (tf : TaskForce) (c : ComplaintText) : Prop where
  submitted : AnnualReportSubmittedAndMadePublic tf c
  contents : AnnualReportContents1689d tf c



structure Section1689Compliance (tf : TaskForce) (c : ComplaintText) : Prop where
  establishment : TaskForceEstablishment1689a tf c
  plan : WorkforcePlan1689c tf c
  report : AnnualReport1689d tf c

end Proving.USC.T20.Ch38.Reearn.Elements
