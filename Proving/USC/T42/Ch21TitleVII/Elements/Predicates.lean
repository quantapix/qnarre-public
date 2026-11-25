import Proving.USC.T42.Ch21TitleVII.Elements.Types
import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false












namespace Proving.USC.T42.Ch21TitleVII.Elements

open Proving.USC.Common







axiom EmployerIsStatutoryPerson (e : Employer) (c : ComplaintText) : Prop




axiom EngagedInIndustryAffectingCommerce (e : Employer) (c : ComplaintText) : Prop





axiom CalendarWeeksWithFifteenEmployees (e : Employer) (c : ComplaintText) : Nat




axiom IsUnitedStatesOrWhollyOwnedCorporation (e : Employer) (c : ComplaintText) : Prop



axiom IsIndianTribe (e : Employer) (c : ComplaintText) : Prop




axiom IsDistrictOfColumbiaCompetitiveServiceAgency (e : Employer) (c : ComplaintText) : Prop




axiom IsBonaFidePrivateMembershipClub (e : Employer) (c : ComplaintText) : Prop






axiom IsIndividualEmployedByEmployer (p : Person) (e : Employer) (c : ComplaintText) : Prop




axiom IsElectedPublicOfficial (p : Person) (c : ComplaintText) : Prop




axiom IsPersonalStaffOfElectedOfficial (p : Person) (c : ComplaintText) : Prop



axiom IsPolicymakingAppointee (p : Person) (c : ComplaintText) : Prop




axiom IsImmediateAdviserOnLegalPowers (p : Person) (c : ComplaintText) : Prop





axiom IsSubjectToStateCivilServiceLaws (p : Person) (c : ComplaintText) : Prop




axiom IsApplicantForEmployment (p : Person) (e : Employer) (c : ComplaintText) : Prop




axiom IsUnitedStatesCitizenEmployedAbroad (p : Person) (c : ComplaintText) : Prop







axiom RegularlyProcuresEmployeesOrOpportunities (a : EmploymentAgency) (c : ComplaintText) : Prop








axiom IsLaborOrganizationInForm (l : LaborOrganization) (c : ComplaintText) : Prop




axiom MaintainsHiringHallOrOffice (l : LaborOrganization) (c : ComplaintText) : Prop





axiom LaborOrganizationMemberCount (l : LaborOrganization) (c : ComplaintText) : Nat




axiom IsCertifiedRepresentative (l : LaborOrganization) (c : ComplaintText) : Prop






axiom IsRecognizedRepresentative (l : LaborOrganization) (c : ComplaintText) : Prop





axiom HasCharteredLocalOrSubsidiary (l : LaborOrganization) (c : ComplaintText) : Prop





axiom WasCharteredByLaborOrganization (l : LaborOrganization) (c : ComplaintText) : Prop






axiom IsSubordinateConferenceOrCouncil (l : LaborOrganization) (c : ComplaintText) : Prop






axiom ControlsApprenticeshipOrTrainingProgram
    (j : JointCommittee) (t : TrainingProgram) (c : ComplaintText) : Prop





axiom FailedOrRefusedToHire (e : Employer) (p : Person) (c : ComplaintText) : Prop



axiom DischargedIndividual (e : Employer) (p : Person) (c : ComplaintText) : Prop





axiom DiscriminatedInCompensationTermsConditionsPrivileges
    (e : Employer) (p : Person) (c : ComplaintText) : Prop




axiom LimitedSegregatedOrClassified (e : Employer) (p : Person) (c : ComplaintText) : Prop





axiom DeprivedOfEmploymentOpportunitiesOrAdverselyAffectedStatus
    (e : Employer) (p : Person) (c : ComplaintText) : Prop




axiom BecauseOfProtectedBasis (p : Person) (b : ProtectedBasis) (c : ComplaintText) : Prop






axiom FailedOrRefusedToRefer (a : EmploymentAgency) (p : Person) (c : ComplaintText) : Prop




axiom ClassifiedOrReferredOnProtectedBasis
    (a : EmploymentAgency) (p : Person) (b : ProtectedBasis) (c : ComplaintText) : Prop






axiom ExcludedOrExpelledFromMembership
    (l : LaborOrganization) (p : Person) (c : ComplaintText) : Prop




axiom DiscriminatedAgainstMember
    (l : LaborOrganization) (p : Person) (c : ComplaintText) : Prop






axiom LimitedSegregatedOrClassifiedMembership
    (l : LaborOrganization) (p : Person) (c : ComplaintText) : Prop




axiom CausedOrAttemptedToCauseEmployerToDiscriminate
    (l : LaborOrganization) (e : Employer) (p : Person) (c : ComplaintText) : Prop






axiom DiscriminatedInAdmissionOrEmploymentInTraining
    (r : Respondent) (p : Person) (t : TrainingProgram) (b : ProtectedBasis)
    (c : ComplaintText) : Prop







axiom BonaFideOccupationalQualification
    (r : Respondent) (p : Person) (b : ProtectedBasis) (c : ComplaintText) : Prop






axiom IsReligiousEducationalInstitutionHiringCoreligionists
    (r : Respondent) (c : ComplaintText) : Prop





axiom IsCommunistOrganizationMember (p : Person) (c : ComplaintText) : Prop





axiom PositionSubjectToNationalSecurityRequirement
    (r : Respondent) (p : Person) (c : ComplaintText) : Prop




axiom IndividualHasNotFulfilledSecurityRequirement (p : Person) (c : ComplaintText) : Prop






axiom AppliedBonaFideSeniorityOrMeritSystem
    (r : Respondent) (s : SeniorityOrMeritSystem) (c : ComplaintText) : Prop




axiom DifferencesResultOfIntentionToDiscriminate
    (s : SeniorityOrMeritSystem) (c : ComplaintText) : Prop




axiom AppliedProfessionallyDevelopedAbilityTest
    (r : Respondent) (pr : EmploymentPractice) (c : ComplaintText) : Prop




axiom TestDesignedIntendedOrUsedToDiscriminate
    (pr : EmploymentPractice) (c : ComplaintText) : Prop




axiom SexDifferentialAuthorizedByEqualPayAct
    (r : Respondent) (p : Person) (c : ComplaintText) : Prop





axiom IsIndianReservationPreference
    (r : Respondent) (p : Person) (c : ComplaintText) : Prop





axiom ClaimWouldRequirePreferentialTreatmentForImbalance (c : ComplaintText) : Prop




axiom EmploymentOfAliensOutsideAnyState (p : Person) (c : ComplaintText) : Prop






axiom IsReligiousOrganizationEmployingCoreligionists
    (r : Respondent) (c : ComplaintText) : Prop





axiom ForeignWorkplaceComplianceWouldViolateForeignLaw
    (r : Respondent) (p : Person) (c : ComplaintText) : Prop




axiom IsForeignPersonNotControlledByAmericanEmployer
    (r : Respondent) (c : ComplaintText) : Prop





axiom PracticeEngagedInByControlledForeignCorporation
    (e : Employer) (c : ComplaintText) : Prop




axiom InterrelationOfOperations (e : Employer) (c : ComplaintText) : Prop



axiom CommonManagement (e : Employer) (c : ComplaintText) : Prop



axiom CentralizedControlOfLaborRelations (e : Employer) (c : ComplaintText) : Prop



axiom CommonOwnershipOrFinancialControl (e : Employer) (c : ComplaintText) : Prop




axiom ActInGoodFaith (r : Respondent) (c : ComplaintText) : Prop




axiom ActInConformityWithCommissionWrittenInterpretation
    (r : Respondent) (c : ComplaintText) : Prop




axiom ActInRelianceOnCommissionWrittenInterpretation
    (r : Respondent) (c : ComplaintText) : Prop







axiom PracticeImplementsAndWithinScopeOfJudgment
    (pr : EmploymentPractice) (j : ConsentJudgment) (c : ComplaintText) : Prop





axiom HadActualNoticeOfProposedJudgment
    (p : Person) (j : ConsentJudgment) (c : ComplaintText) : Prop




axiom HadReasonableOpportunityToObject
    (p : Person) (j : ConsentJudgment) (c : ComplaintText) : Prop





axiom InterestsAdequatelyRepresentedByPriorChallenger
    (p : Person) (j : ConsentJudgment) (c : ComplaintText) : Prop




axiom InterveningChangeInLawOrFact (j : ConsentJudgment) (c : ComplaintText) : Prop





axiom JudgmentObtainedByCollusionFraudOrInvalid
    (j : ConsentJudgment) (c : ComplaintText) : Prop






axiom RespondentUsesParticularEmploymentPractice
    (r : Respondent) (pr : EmploymentPractice) (c : ComplaintText) : Prop




axiom PracticeCausesDisparateImpactOnBasis
    (pr : EmploymentPractice) (b : ProtectedBasis) (c : ComplaintText) : Prop




axiom IdentifiedEachParticularChallengedPractice
    (pr : EmploymentPractice) (c : ComplaintText) : Prop





axiom DecisionmakingProcessNotCapableOfSeparation
    (r : Respondent) (c : ComplaintText) : Prop





axiom PracticeJobRelatedAndConsistentWithBusinessNecessity
    (pr : EmploymentPractice) (c : ComplaintText) : Prop




axiom RespondentDemonstratesPracticeDoesNotCauseImpact
    (pr : EmploymentPractice) (c : ComplaintText) : Prop





axiom DemonstratedAlternativeEmploymentPractice
    (p : Person) (pr : EmploymentPractice) (c : ComplaintText) : Prop




axiom RespondentRefusedToAdoptAlternative
    (r : Respondent) (pr : EmploymentPractice) (c : ComplaintText) : Prop






axiom IsControlledSubstanceEmploymentBarRule
    (pr : EmploymentPractice) (c : ComplaintText) : Prop




axiom ControlledSubstanceRuleAdoptedOrAppliedWithDiscriminatoryIntent
    (pr : EmploymentPractice) (c : ComplaintText) : Prop







axiom AdjustedOrAlteredEmploymentTestResults
    (r : Respondent) (pr : EmploymentPractice) (b : ProtectedBasis)
    (c : ComplaintText) : Prop




axiom InConnectionWithSelectionOrReferralForEmploymentOrPromotion
    (pr : EmploymentPractice) (c : ComplaintText) : Prop





axiom ProtectedBasisWasMotivatingFactor
    (p : Person) (b : ProtectedBasis) (c : ComplaintText) : Prop




axiom RespondentWouldHaveTakenSameActionAbsentImpermissibleFactor
    (r : Respondent) (p : Person) (c : ComplaintText) : Prop






axiom HasBonaFideReligiousObservanceOrPractice (p : Person) (c : ComplaintText) : Prop




axiom ReligiousPracticeConflictsWithEmploymentRequirement
    (p : Person) (c : ComplaintText) : Prop




axiom NotifiedEmployerOfReligiousConflict
    (p : Person) (e : Employer) (c : ComplaintText) : Prop





axiom EmployerUnableToAccommodateWithoutUndueHardship
    (e : Employer) (p : Person) (c : ComplaintText) : Prop




axiom AdverseActionBecauseOfPregnancyChildbirthOrRelatedCondition
    (p : Person) (c : ComplaintText) : Prop






axiom PregnancyAffectedEmployeeTreatedDifferentlyFromSimilarlyAble
    (p : Person) (c : ComplaintText) : Prop





axiom pregnancy_is_because_of_sex {p : Person} {c : ComplaintText} :
    AdverseActionBecauseOfPregnancyChildbirthOrRelatedCondition p c →
    BecauseOfProtectedBasis p ProtectedBasis.sex c






axiom OpposedPracticeMadeUnlawful (p : Person) (c : ComplaintText) : Prop





axiom MadeChargeTestifiedAssistedOrParticipated (p : Person) (c : ComplaintText) : Prop




axiom RetaliatoryAdverseAction (r : Respondent) (p : Person) (c : ComplaintText) : Prop




axiom AdverseActionBecauseOfProtectedActivity
    (r : Respondent) (p : Person) (c : ComplaintText) : Prop





axiom PrintedOrPublishedNoticeOrAdvertisement
    (r : Respondent) (ad : Advertisement) (c : ComplaintText) : Prop





axiom AdvertisementIndicatesPreferenceOnProtectedBasis
    (ad : Advertisement) (b : ProtectedBasis) (c : ComplaintText) : Prop






axiom ChargeFiledByOrOnBehalfOfAggrievedPerson
    (ch : Charge) (p : Person) (c : ComplaintText) : Prop




axiom ChargeInWritingUnderOathOrAffirmation (ch : Charge) (c : ComplaintText) : Prop





axiom DaysFromUnlawfulPracticeToChargeFiling (ch : Charge) (c : ComplaintText) : Nat





axiom InstitutedProceedingsWithStateOrLocalAgency (p : Person) (c : ComplaintText) : Prop





axiom DaysFromStateTerminationNoticeToChargeFiling (ch : Charge) (c : ComplaintText) : Nat




axiom DaysStateOrLocalProceedingsPendingBeforeCharge (ch : Charge) (c : ComplaintText) : Nat



axiom StateOrLocalProceedingsEarlierTerminated (p : Person) (c : ComplaintText) : Prop




axiom ReceivedNoticeOfRightToSue (p : Person) (c : ComplaintText) : Prop




axiom DaysFromRightToSueNoticeToCivilAction (p : Person) (c : ComplaintText) : Nat





axiom SenioritySystemAdoptedForIntentionallyDiscriminatoryPurpose
    (s : SeniorityOrMeritSystem) (c : ComplaintText) : Prop






axiom DiscriminatoryCompensationDecisionAppliedDuringChargePeriod
    (p : Person) (c : ComplaintText) : Prop




axiom RespondentIsGovernmentGovernmentalAgencyOrPoliticalSubdivision
    (r : Respondent) (c : ComplaintText) : Prop





axiom RefusedOrDischargedForReasonOtherThanProhibitedDiscrimination
    (p : Person) (c : ComplaintText) : Prop




axiom RespondentIntentionallyEngagedInUnlawfulPractice
    (r : Respondent) (c : ComplaintText) : Prop




axiom SufferedInjuryFromUnlawfulEmploymentPractice (p : Person) (c : ComplaintText) : Prop






axiom AttorneyGeneralHasReasonableCauseToBelieve (c : ComplaintText) : Prop




axiom PatternOrPracticeOfResistanceToRightsSecured (c : ComplaintText) : Prop




axiom PatternIntendedToDenyFullExerciseOfRights (c : ComplaintText) : Prop




axiom ComplaintSignedByAttorneyGeneral (c : ComplaintText) : Prop




axiom ComplaintSetsForthPatternOrPracticeFacts (c : ComplaintText) : Prop




axiom ComplaintRequestsRelief (c : ComplaintText) : Prop






axiom IsCommissionOfficerOrEmployee (p : Person) (c : ComplaintText) : Prop




axiom MadePublicInformationObtainedUnderThisSection (p : Person) (c : ComplaintText) : Prop




axiom DisclosurePriorToInstitutionOfProceeding (p : Person) (c : ComplaintText) : Prop




axiom SubjectToRecordkeepingRegulationOrOrder (r : Respondent) (c : ComplaintText) : Prop




axiom AppliedToCommissionForUndueHardshipExemption (r : Respondent) (c : ComplaintText) : Prop



axiom ExemptionApplicationDenied (r : Respondent) (c : ComplaintText) : Prop




axiom RegulationWouldImposeUndueHardship (r : Respondent) (c : ComplaintText) : Prop







axiom FailedToPostRequiredNotice (r : Respondent) (c : ComplaintText) : Prop






axiom VictimWasCommissionOfficerAgentOrEmployee (p : Person) (c : ComplaintText) : Prop




axiom KilledPersonInViolationOfSection1114 (p : Person) (c : ComplaintText) : Prop




axiom VictimEngagedInOrKilledOnAccountOfOfficialFunctions (p : Person) (c : ComplaintText) : Prop








axiom IsCoveredFederalUnit (f : FederalUnit) (c : ComplaintText) : Prop




axiom IsFederalEmployeeOrApplicant
    (p : Person) (f : FederalUnit) (c : ComplaintText) : Prop




axiom PersonnelActionNotFreeFromDiscrimination
    (p : Person) (f : FederalUnit) (b : ProtectedBasis) (c : ComplaintText) : Prop




axiom IsAlienEmployedOutsideTheUnitedStates (p : Person) (c : ComplaintText) : Prop




axiom ReceivedNoticeOfFinalAgencyAction (p : Person) (c : ComplaintText) : Prop




axiom DaysFromFinalAgencyActionToCivilAction (p : Person) (c : ComplaintText) : Nat





axiom DaysFromInitialChargeFilingWithAgency (p : Person) (c : ComplaintText) : Nat




axiom HeadOfDepartmentAgencyOrUnitNamedAsDefendant (f : FederalUnit) (c : ComplaintText) : Prop







axiom IsPresidentialAppointeeUnderSection1219 (p : Person) (c : ComplaintText) : Prop





axiom ChosenOrAppointedByElectedStateOfficial (p : Person) (c : ComplaintText) : Prop





axiom ServesAsPersonalStaffPolicymakerOrImmediateAdvisor
    (p : Person) (c : ComplaintText) : Prop




axiom PersonnelActionNotFreeFromGeraDiscrimination
    (p : Person) (b : GeraBasis) (c : ComplaintText) : Prop




axiom DaysFromViolationToGeraComplaint (p : Person) (c : ComplaintText) : Nat




axiom GeraComplaintFiledWithCommission (p : Person) (c : ComplaintText) : Prop






axiom HasPreviouslyAcceptedAffirmativeActionPlanSameFacility
    (e : Employer) (pl : AffirmativeActionPlan) (c : ComplaintText) : Prop






axiom MonthsSincePlanAcceptance (pl : AffirmativeActionPlan) (c : ComplaintText) : Nat





axiom ContractDeniedWithheldTerminatedOrSuspended (e : Employer) (c : ComplaintText) : Prop




axiom AccordedFullHearingAndAdjudication (e : Employer) (c : ComplaintText) : Prop




axiom DeviatedSubstantiallyFromAffirmativeActionPlan (e : Employer) (c : ComplaintText) : Prop







axiom StateLawPurportsToRequireOrPermitUnlawfulPractice
    (sl : StateLaw) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21TitleVII.Elements
