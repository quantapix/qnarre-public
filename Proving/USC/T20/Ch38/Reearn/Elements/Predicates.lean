import Proving.USC.T20.Ch38.Reearn.Elements.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false












namespace Proving.USC.T20.Ch38.Reearn.Elements

open Proving.USC.Common


axiom IsStateOrLocalGovernmentInstrumentality (prog : EducationProgram) (c : ComplaintText) : Prop


axiom IsStateOrLocalAssistanceDistributingEntity (prog : EducationProgram) (c : ComplaintText) : Prop


axiom IsPostsecondaryInstitutionOrSystem (prog : EducationProgram) (c : ComplaintText) : Prop


axiom IsLocalEducationalAgencyOrSchoolSystem (prog : EducationProgram) (c : ComplaintText) : Prop


axiom IsWhollyAssistedPrivateOrganization (prog : EducationProgram) (c : ComplaintText) : Prop


axiom IsEducationOrSocialServicePrivateOrganization (prog : EducationProgram) (c : ComplaintText) : Prop


axiom IsAssistedGeographicallySeparateFacility (prog : EducationProgram) (c : ComplaintText) : Prop


axiom IsJointEntityOfCoveredEntities (prog : EducationProgram) (c : ComplaintText) : Prop


axiom ReceivesFederalFinancialAssistance (prog : EducationProgram) (c : ComplaintText) : Prop


axiom ReligiouslyControlledOperationInconsistentWithTenets (prog : EducationProgram) (c : ComplaintText) : Prop


axiom IsEducationProgram (prog : EducationProgram) (c : ComplaintText) : Prop


axiom IsEducationalInstitutionUnderSection1681c (inst : EducationalInstitution) (c : ComplaintText) : Prop


axiom DefendantIsFundingRecipient (r : Recipient) (c : ComplaintText) : Prop


axiom ExcludedFromParticipation (p : Person) (prog : EducationProgram) (c : ComplaintText) : Prop


axiom DeniedBenefitsOfProgram (p : Person) (prog : EducationProgram) (c : ComplaintText) : Prop


axiom SubjectedToDiscriminationUnderProgram (p : Person) (prog : EducationProgram) (c : ComplaintText) : Prop


axiom OnTheBasisOfSex (p : Person) (prog : EducationProgram) (c : ComplaintText) : Prop


axiom SufferedEducationalInjury (p : Person) (c : ComplaintText) : Prop


axiom SubjectedToSexualHarassment (p : Person) (c : ComplaintText) : Prop


axiom HarassmentSevereAndPervasive (p : Person) (c : ComplaintText) : Prop


axiom DeprivedOfEducationalAccess (p : Person) (prog : EducationProgram) (c : ComplaintText) : Prop


axiom RecipientHadActualKnowledge (r : Recipient) (c : ComplaintText) : Prop


axiom RecipientDeliberatelyIndifferent (r : Recipient) (c : ComplaintText) : Prop


axiom RecipientSubstantialControl (r : Recipient) (c : ComplaintText) : Prop


axiom ClaimConcernsAdmissions (p : Person) (c : ComplaintText) : Prop


axiom AdmissionsCoveredInstitution (inst : EducationalInstitution) (c : ComplaintText) : Prop


axiom WithinAdmissionsTransitionPlanExemption (inst : EducationalInstitution) (c : ComplaintText) : Prop


axiom ReligiouslyControlledInstitutionInconsistentWithTenets (inst : EducationalInstitution) (c : ComplaintText) : Prop


axiom MilitaryOrMerchantMarineTrainingInstitution (inst : EducationalInstitution) (c : ComplaintText) : Prop


axiom TraditionallySingleSexPublicUndergraduateInstitution (inst : EducationalInstitution) (c : ComplaintText) : Prop


axiom SocialFraternityOrSororityMembershipPractice (prog : EducationProgram) (c : ComplaintText) : Prop


axiom TraditionalYouthServiceOrganizationMembershipPractice (prog : EducationProgram) (c : ComplaintText) : Prop


axiom AmericanLegionConferenceActivity (prog : EducationProgram) (c : ComplaintText) : Prop


axiom SchoolPromotionOfBoysOrGirlsStateConference (prog : EducationProgram) (c : ComplaintText) : Prop


axiom SchoolSelectionForBoysOrGirlsStateConference (prog : EducationProgram) (c : ComplaintText) : Prop


axiom IsFatherSonOrMotherDaughterActivity (prog : EducationProgram) (c : ComplaintText) : Prop


axiom ComparableActivityProvidedForOtherSex (prog : EducationProgram) (c : ComplaintText) : Prop


axiom SingleSexPageantScholarshipAward (p : Person) (c : ComplaintText) : Prop


axiom PageantCompliesWithOtherFederalNondiscriminationLaw (p : Person) (c : ComplaintText) : Prop


axiom ClaimDemandsPreferentialTreatmentForImbalance (p : Person) (prog : EducationProgram) (c : ComplaintText) : Prop


axiom AssistanceExtendedByInsuranceOrGuarantyContract (prog : EducationProgram) (c : ComplaintText) : Prop


axiom MaintainsSeparateLivingFacilitiesForSexes (inst : EducationalInstitution) (c : ComplaintText) : Prop


axiom InstitutionReceivesFundsUnderThisAct (inst : EducationalInstitution) (c : ComplaintText) : Prop


axiom ClaimChallengesSeparateLivingFacilities (inst : EducationalInstitution) (c : ComplaintText) : Prop


axiom ClaimWouldRequireOrProhibitAbortionRelatedBenefit (p : Person) (c : ComplaintText) : Prop


axiom PenaltyImposedForSeekingOrReceivingLegalAbortion (p : Person) (r : Recipient) (c : ComplaintText) : Prop


axiom AgencyEmpoweredToExtendAssistance (ag : FederalAgency) (prog : EducationProgram) (c : ComplaintText) : Prop


axiom RequirementAdoptedByGeneralRule (ag : FederalAgency) (c : ComplaintText) : Prop


axiom RuleApprovedByPresident (ag : FederalAgency) (c : ComplaintText) : Prop


axiom RecipientFailedToComplyWithRequirement (r : Recipient) (c : ComplaintText) : Prop


axiom ExpressFindingOnRecordAfterHearing (act : AgencyAction) (c : ComplaintText) : Prop


axiom TerminationLimitedToFoundRecipient (act : AgencyAction) (c : ComplaintText) : Prop


axiom TerminationLimitedToNoncompliantProgram (act : AgencyAction) (c : ComplaintText) : Prop


axiom AdvisedOfFailureToComply (ag : FederalAgency) (r : Recipient) (c : ComplaintText) : Prop


axiom DeterminedVoluntaryComplianceUnavailable (ag : FederalAgency) (r : Recipient) (c : ComplaintText) : Prop


axiom WrittenReportFiledWithCongressionalCommittees (act : AgencyAction) (c : ComplaintText) : Prop


axiom EnforcementByOtherMeansAuthorizedByLaw (act : AgencyAction) (c : ComplaintText) : Prop


axiom daysFromReportFilingToEffectiveDate (act : AgencyAction) (c : ComplaintText) : Nat


axiom ActionTakenPursuantToSection1682 (act : AgencyAction) (c : ComplaintText) : Prop


axiom IsPersonAggrievedByAgencyAction (p : Person) (act : AgencyAction) (c : ComplaintText) : Prop


axiom SimilarActionOtherwiseSubjectToJudicialReview (act : AgencyAction) (c : ComplaintText) : Prop


axiom ActionNotOtherwiseSubjectToJudicialReview (act : AgencyAction) (c : ComplaintText) : Prop


axiom ActionTerminatesOrRefusesFinancialAssistance (act : AgencyAction) (c : ComplaintText) : Prop


axiom ActionBasedOnFindingOfNoncompliance (act : AgencyAction) (c : ComplaintText) : Prop


axiom DeniedAdmissionToCourseOfStudy (p : Person) (crs : CourseOfStudy) (c : ComplaintText) : Prop


axiom OnGroundOfBlindnessOrSeverelyImpairedVision (p : Person) (c : ComplaintText) : Prop


axiom RecipientOfFederalAssistanceForEducationProgram (r : Recipient) (prog : EducationProgram) (c : ComplaintText) : Prop


axiom ClaimSeeksSpecialServicesForVisualImpairment (p : Person) (c : ComplaintText) : Prop


axiom TaskForceEstablishedByStatutoryDeadline (tf : TaskForce) (c : ComplaintText) : Prop


axiom JointlyEstablishedByEducationHhsAndAttorneyGeneral (tf : TaskForce) (c : ComplaintText) : Prop


axiom ProvidesCampusSexualViolenceInformation (tf : TaskForce) (c : ComplaintText) : Prop


axiom RecommendsPreventionAndResponseTeams (tf : TaskForce) (c : ComplaintText) : Prop


axiom DevelopsSurvivorResourceRecommendations (tf : TaskForce) (c : ComplaintText) : Prop


axiom DevelopsPreventionBestPracticesWithStudentGroups (tf : TaskForce) (c : ComplaintText) : Prop


axiom DevelopsSexEducationAndDisciplineRecommendations (tf : TaskForce) (c : ComplaintText) : Prop


axiom DevelopsCulturallyResponsiveSupportRecommendations (tf : TaskForce) (c : ComplaintText) : Prop


axiom SolicitsPeriodicSurvivorAndStakeholderInput (tf : TaskForce) (c : ComplaintText) : Prop


axiom AssessesIntermediateFineAuthority (tf : TaskForce) (c : ComplaintText) : Prop


axiom CreatesWorkforcePlan (tf : TaskForce) (c : ComplaintText) : Prop


axiom DetailAuthorizedByComponentHeadAndTaskForce (dt : PersonnelDetail) (tf : TaskForce) (c : ComplaintText) : Prop


axiom DetailOnReimbursableOrNonreimbursableBasis (dt : PersonnelDetail) (c : ComplaintText) : Prop


axiom monthsOfPersonnelDetail (dt : PersonnelDetail) (c : ComplaintText) : Nat


axiom WorkforcePlanSubmittedToCongress (tf : TaskForce) (c : ComplaintText) : Prop


axiom daysFromTaskForceEstablishmentToPlanSubmission (tf : TaskForce) (c : ComplaintText) : Nat


axiom PlanIdentifiesInvestigationAndEnforcementGaps (tf : TaskForce) (c : ComplaintText) : Prop


axiom PlanExaminesRecruitmentRetentionAndDevelopment (tf : TaskForce) (c : ComplaintText) : Prop


axiom PlanAssessesOutreachAndTrainingBenefits (tf : TaskForce) (c : ComplaintText) : Prop


axiom PlanExaminesBestPracticesAwarenessAndResearchGaps (tf : TaskForce) (c : ComplaintText) : Prop


axiom PlanAddressesOtherSecretaryIdentifiedMatters (tf : TaskForce) (c : ComplaintText) : Prop


axiom AnnualReportSubmittedAndMadePublic (tf : TaskForce) (c : ComplaintText) : Prop


axiom ReportStatesNumberOfSexualViolenceComplaints (tf : TaskForce) (c : ComplaintText) : Prop


axiom ReportStatesNumberOfOpenInvestigations (tf : TaskForce) (c : ComplaintText) : Prop


axiom ReportStatesNumberOfComplaintsResolved (tf : TaskForce) (c : ComplaintText) : Prop


axiom ReportStatesNumberResolvedInformally (tf : TaskForce) (c : ComplaintText) : Prop


axiom ReportStatesAverageInvestigationTime (tf : TaskForce) (c : ComplaintText) : Prop


axiom ReportStatesInvestigationsInitiatedByComplaint (tf : TaskForce) (c : ComplaintText) : Prop


axiom ReportStatesInvestigationsInitiatedByDepartment (tf : TaskForce) (c : ComplaintText) : Prop


axiom IsEducationalInstitutionUnderSection1689e (inst : EducationalInstitution) (c : ComplaintText) : Prop

end Proving.USC.T20.Ch38.Reearn.Elements
