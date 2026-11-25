import Proving.USC.T42.Ch21TitleVII.Elements.Predicates
import Proving.USC.Common.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false










namespace Proving.USC.T42.Ch21TitleVII.Elements

open Proving.USC.Common





inductive EmployerStatutoryExclusion (e : Employer) (c : ComplaintText) : Prop where
  | unitedStates (h : IsUnitedStatesOrWhollyOwnedCorporation e c)
  | indianTribe (h : IsIndianTribe e c)
  | dcCompetitiveService (h : IsDistrictOfColumbiaCompetitiveServiceAgency e c)
  | privateMembershipClub (h : IsBonaFidePrivateMembershipClub e c)


structure CoveredEmployer (e : Employer) (c : ComplaintText) : Prop where
  isPerson : EmployerIsStatutoryPerson e c
  affectingCommerce : EngagedInIndustryAffectingCommerce e c
  headcount : CalendarWeeksWithFifteenEmployees e c ≥ 20
  notExcluded : ¬ EmployerStatutoryExclusion e c


abbrev IsCoveredEmployer (e : Employer) (c : ComplaintText) : Prop :=
  CoveredEmployer e c



inductive EmployeeStatutoryExclusion (p : Person) (c : ComplaintText) : Prop where
  | electedOfficial (h : IsElectedPublicOfficial p c)
  | personalStaff (h : IsPersonalStaffOfElectedOfficial p c)
  | policymakingAppointee (h : IsPolicymakingAppointee p c)
  | immediateAdviser (h : IsImmediateAdviserOnLegalPowers p c)




structure CoveredEmployee (p : Person) (e : Employer) (c : ComplaintText) : Prop where
  employed : IsIndividualEmployedByEmployer p e c
  civilServiceCarveBack :
    EmployeeStatutoryExclusion p c → IsSubjectToStateCivilServiceLaws p c


abbrev IsCoveredEmployee (p : Person) (e : Employer) (c : ComplaintText) : Prop :=
  CoveredEmployee p e c




inductive CoveredIndividual (p : Person) (e : Employer) (c : ComplaintText) : Prop where
  | employee (h : CoveredEmployee p e c)
  | applicant (h : IsApplicantForEmployment p e c)
  | citizenAbroad (h : IsUnitedStatesCitizenEmployedAbroad p c)
                  (he : IsIndividualEmployedByEmployer p e c)


structure CoveredEmploymentAgency (a : EmploymentAgency) (c : ComplaintText) : Prop where
  procures : RegularlyProcuresEmployeesOrOpportunities a c




inductive LaborOrganizationRepresentationRoute
    (l : LaborOrganization) (c : ComplaintText) : Prop where
  | certified (h : IsCertifiedRepresentative l c)
  | recognized (h : IsRecognizedRepresentative l c)
  | charteredLocal (h : HasCharteredLocalOrSubsidiary l c)
  | wasChartered (h : WasCharteredByLaborOrganization l c)
  | subordinateBody (h : IsSubordinateConferenceOrCouncil l c)



inductive LaborOrganizationAffectingCommerce
    (l : LaborOrganization) (c : ComplaintText) : Prop where
  | hiringHall (h : MaintainsHiringHallOrOffice l c)
  | membership (hn : LaborOrganizationMemberCount l c ≥ 15)
               (h : LaborOrganizationRepresentationRoute l c)


structure CoveredLaborOrganization (l : LaborOrganization) (c : ComplaintText) : Prop where
  isLaborOrganization : IsLaborOrganizationInForm l c
  affectingCommerce : LaborOrganizationAffectingCommerce l c


abbrev IsCoveredLaborOrganization (l : LaborOrganization) (c : ComplaintText) : Prop :=
  CoveredLaborOrganization l c



structure CoveredJointCommittee
    (j : JointCommittee) (t : TrainingProgram) (c : ComplaintText) : Prop where
  controls : ControlsApprenticeshipOrTrainingProgram j t c





def BfoqEligibleBasis : ProtectedBasis → Prop
  | ProtectedBasis.religion => True
  | ProtectedBasis.sex => True
  | ProtectedBasis.nationalOrigin => True
  | ProtectedBasis.race => False
  | ProtectedBasis.color => False


structure BfoqDefense (r : Respondent) (p : Person) (b : ProtectedBasis)
    (c : ComplaintText) : Prop where
  eligibleBasis : BfoqEligibleBasis b
  qualification : BonaFideOccupationalQualification r p b c


structure NationalSecurityDefense (r : Respondent) (p : Person)
    (c : ComplaintText) : Prop where
  requirement : PositionSubjectToNationalSecurityRequirement r p c
  unfulfilled : IndividualHasNotFulfilledSecurityRequirement p c



structure SeniorityOrMeritSystemDefense (r : Respondent)
    (s : SeniorityOrMeritSystem) (c : ComplaintText) : Prop where
  bonaFide : AppliedBonaFideSeniorityOrMeritSystem r s c
  noDiscriminatoryIntent : ¬ DifferencesResultOfIntentionToDiscriminate s c



structure AbilityTestDefense (r : Respondent) (pr : EmploymentPractice)
    (c : ComplaintText) : Prop where
  professionallyDeveloped : AppliedProfessionallyDevelopedAbilityTest r pr c
  notDiscriminatory : ¬ TestDesignedIntendedOrUsedToDiscriminate pr c


structure ForeignLawDefense (r : Respondent) (p : Person)
    (c : ComplaintText) : Prop where
  conflict : ForeignWorkplaceComplianceWouldViolateForeignLaw r p c



structure GoodFaithRelianceDefense (r : Respondent) (c : ComplaintText) : Prop where
  goodFaith : ActInGoodFaith r c
  conformity : ActInConformityWithCommissionWrittenInterpretation r c
  reliance : ActInRelianceOnCommissionWrittenInterpretation r c



inductive ConsentJudgmentPreclusionRoute
    (p : Person) (j : ConsentJudgment) (c : ComplaintText) : Prop where
  | noticeAndOpportunity (h1 : HadActualNoticeOfProposedJudgment p j c)
                         (h2 : HadReasonableOpportunityToObject p j c)
  | adequateRepresentation (h : InterestsAdequatelyRepresentedByPriorChallenger p j c)
                           (hn : ¬ InterveningChangeInLawOrFact j c)



structure ConsentJudgmentPreclusion (p : Person) (pr : EmploymentPractice)
    (j : ConsentJudgment) (c : ComplaintText) : Prop where
  withinScope : PracticeImplementsAndWithinScopeOfJudgment pr j c
  route : ConsentJudgmentPreclusionRoute p j c
  notCollusive : ¬ JudgmentObtainedByCollusionFraudOrInvalid j c





inductive UnlawfulPracticeException (r : Respondent) (p : Person)
    (b : ProtectedBasis) (c : ComplaintText) : Prop where
  | bfoq (h : BfoqDefense r p b c)
  | religiousEducationalInstitution
      (h : IsReligiousEducationalInstitutionHiringCoreligionists r c)
  | communistOrganization (h : IsCommunistOrganizationMember p c)
  | nationalSecurity (h : NationalSecurityDefense r p c)
  | seniorityOrMerit (h : ∃ s, SeniorityOrMeritSystemDefense r s c)
  | abilityTest (h : ∃ pr, AbilityTestDefense r pr c)
  | equalPayActDifferential (h : SexDifferentialAuthorizedByEqualPayAct r p c)
  | indianReservation (h : IsIndianReservationPreference r p c)
  | religiousOrganization (h : IsReligiousOrganizationEmployingCoreligionists r c)
  | alienOutsideAnyState (h : EmploymentOfAliensOutsideAnyState p c)
  | foreignLaw (h : ForeignLawDefense r p c)
  | foreignEmployerNotControlled (h : IsForeignPersonNotControlledByAmericanEmployer r c)
  | goodFaithReliance (h : GoodFaithRelianceDefense r c)
  | consentJudgment (h : ∃ pr j, ConsentJudgmentPreclusion p pr j c)




inductive EmployerAdverseAction (e : Employer) (p : Person) (c : ComplaintText) : Prop where
  | refusalToHire (h : FailedOrRefusedToHire e p c)
  | discharge (h : DischargedIndividual e p c)
  | termsConditionsPrivileges (h : DiscriminatedInCompensationTermsConditionsPrivileges e p c)


structure Section2000e2a1 (e : Employer) (p : Person) (b : ProtectedBasis)
    (c : ComplaintText) : Prop where
  coveredEmployer : IsCoveredEmployer e c
  coveredIndividual : CoveredIndividual p e c
  adverseAction : EmployerAdverseAction e p c
  discriminatoryIntent : IntentToDiscriminate p c
  causation : BecauseOfProtectedBasis p b c
  noException : ¬ UnlawfulPracticeException (Respondent.employer e) p b c


structure Section2000e2a2 (e : Employer) (p : Person) (b : ProtectedBasis)
    (c : ComplaintText) : Prop where
  coveredEmployer : IsCoveredEmployer e c
  coveredIndividual : CoveredIndividual p e c
  classification : LimitedSegregatedOrClassified e p c
  deprivation : DeprivedOfEmploymentOpportunitiesOrAdverselyAffectedStatus e p c
  causation : BecauseOfProtectedBasis p b c
  noException : ¬ UnlawfulPracticeException (Respondent.employer e) p b c




inductive EmploymentAgencyAdverseAction (a : EmploymentAgency) (p : Person)
    (b : ProtectedBasis) (c : ComplaintText) : Prop where
  | refusalToRefer (h : FailedOrRefusedToRefer a p c)
  | classifyOrRefer (h : ClassifiedOrReferredOnProtectedBasis a p b c)


structure Section2000e2b (a : EmploymentAgency) (p : Person) (b : ProtectedBasis)
    (c : ComplaintText) : Prop where
  coveredAgency : CoveredEmploymentAgency a c
  adverseAction : EmploymentAgencyAdverseAction a p b c
  causation : BecauseOfProtectedBasis p b c
  noException : ¬ UnlawfulPracticeException (Respondent.employmentAgency a) p b c




inductive LaborOrganizationAdverseAction (l : LaborOrganization) (p : Person)
    (c : ComplaintText) : Prop where
  | exclusionOrExpulsion (h : ExcludedOrExpelledFromMembership l p c)
  | otherDiscrimination (h : DiscriminatedAgainstMember l p c)
  | limitSegregateClassify (h : LimitedSegregatedOrClassifiedMembership l p c)


structure Section2000e2c12 (l : LaborOrganization) (p : Person) (b : ProtectedBasis)
    (c : ComplaintText) : Prop where
  coveredLabor : IsCoveredLaborOrganization l c
  adverseAction : LaborOrganizationAdverseAction l p c
  causation : BecauseOfProtectedBasis p b c
  noException : ¬ UnlawfulPracticeException (Respondent.laborOrganization l) p b c




structure Section2000e2c3 (l : LaborOrganization) (e : Employer) (p : Person)
    (b : ProtectedBasis) (c : ComplaintText) : Prop where
  coveredLabor : IsCoveredLaborOrganization l c
  coveredEmployer : IsCoveredEmployer e c
  causedOrAttempted : CausedOrAttemptedToCauseEmployerToDiscriminate l e p c
  causation : BecauseOfProtectedBasis p b c




structure Section2000e2d (r : Respondent) (p : Person) (t : TrainingProgram)
    (b : ProtectedBasis) (c : ComplaintText) : Prop where
  discrimination : DiscriminatedInAdmissionOrEmploymentInTraining r p t b c
  causation : BecauseOfProtectedBasis p b c
  noException : ¬ UnlawfulPracticeException r p b c






inductive DisparateImpactParticularity (r : Respondent) (pr : EmploymentPractice)
    (c : ComplaintText) : Prop where
  | eachPractice (h : IdentifiedEachParticularChallengedPractice pr c)
  | inseparableProcess (h : DecisionmakingProcessNotCapableOfSeparation r c)



structure DisparateImpactBusinessNecessityRoute (r : Respondent)
    (pr : EmploymentPractice) (b : ProtectedBasis) (c : ComplaintText) : Prop where
  uses : RespondentUsesParticularEmploymentPractice r pr c
  impact : PracticeCausesDisparateImpactOnBasis pr b c
  particularity : DisparateImpactParticularity r pr c
  noCausationRebuttal : ¬ RespondentDemonstratesPracticeDoesNotCauseImpact pr c
  notJustified : ¬ PracticeJobRelatedAndConsistentWithBusinessNecessity pr c



structure DisparateImpactAlternativeRoute (r : Respondent) (p : Person)
    (pr : EmploymentPractice) (c : ComplaintText) : Prop where
  uses : RespondentUsesParticularEmploymentPractice r pr c
  alternative : DemonstratedAlternativeEmploymentPractice p pr c
  refusal : RespondentRefusedToAdoptAlternative r pr c



inductive DisparateImpactRoute (r : Respondent) (p : Person)
    (pr : EmploymentPractice) (b : ProtectedBasis) (c : ComplaintText) : Prop where
  | businessNecessity (h : DisparateImpactBusinessNecessityRoute r pr b c)
  | alternativePractice (h : DisparateImpactAlternativeRoute r p pr c)




structure Section2000e2k (r : Respondent) (p : Person) (pr : EmploymentPractice)
    (b : ProtectedBasis) (c : ComplaintText) : Prop where
  route : DisparateImpactRoute r p pr b c
  controlledSubstanceCarveOut :
    IsControlledSubstanceEmploymentBarRule pr c →
      ControlledSubstanceRuleAdoptedOrAppliedWithDiscriminatoryIntent pr c
  noException : ¬ UnlawfulPracticeException r p b c




structure Section2000e2l (r : Respondent) (pr : EmploymentPractice)
    (b : ProtectedBasis) (c : ComplaintText) : Prop where
  inConnection : InConnectionWithSelectionOrReferralForEmploymentOrPromotion pr c
  adjustment : AdjustedOrAlteredEmploymentTestResults r pr b c


structure Section2000e2m (r : Respondent) (p : Person) (pr : EmploymentPractice)
    (b : ProtectedBasis) (c : ComplaintText) : Prop where
  practice : RespondentUsesParticularEmploymentPractice r pr c
  motivatingFactor : ProtectedBasisWasMotivatingFactor p b c



structure SameDecisionReliefLimitation (r : Respondent) (p : Person)
    (pr : EmploymentPractice) (b : ProtectedBasis) (c : ComplaintText) : Prop where
  violation : Section2000e2m r p pr b c
  sameAction : RespondentWouldHaveTakenSameActionAbsentImpermissibleFactor r p c






structure ReligiousAccommodationClaim (e : Employer) (p : Person)
    (c : ComplaintText) : Prop where
  coveredEmployer : IsCoveredEmployer e c
  coveredIndividual : CoveredIndividual p e c
  bonaFideBelief : HasBonaFideReligiousObservanceOrPractice p c
  conflict : ReligiousPracticeConflictsWithEmploymentRequirement p c
  notice : NotifiedEmployerOfReligiousConflict p e c
  adverseAction : EmployerAdverseAction e p c
  noUndueHardship : ¬ EmployerUnableToAccommodateWithoutUndueHardship e p c



structure PregnancyDiscriminationClaim (p : Person) (c : ComplaintText) : Prop where
  adverseAction : AdverseActionBecauseOfPregnancyChildbirthOrRelatedCondition p c
  unequalTreatment : PregnancyAffectedEmployeeTreatedDifferentlyFromSimilarlyAble p c




inductive ProtectedActivity (p : Person) (c : ComplaintText) : Prop where
  | opposition (h : OpposedPracticeMadeUnlawful p c)
  | participation (h : MadeChargeTestifiedAssistedOrParticipated p c)


structure Section2000e3a (r : Respondent) (p : Person) (c : ComplaintText) : Prop where
  protectedActivity : ProtectedActivity p c
  adverseAction : RetaliatoryAdverseAction r p c
  causation : AdverseActionBecauseOfProtectedActivity r p c



structure Section2000e3b (r : Respondent) (ad : Advertisement) (b : ProtectedBasis)
    (c : ComplaintText) : Prop where
  published : PrintedOrPublishedNoticeOrAdvertisement r ad c
  indicatesPreference : AdvertisementIndicatesPreferenceOnProtectedBasis ad b c
  noBfoq : ¬ (BfoqEligibleBasis b ∧ ∃ p, BonaFideOccupationalQualification r p b c)





inductive AccrualRule (p : Person) (c : ComplaintText) : Prop where
  | ordinary
  | senioritySystem (s : SeniorityOrMeritSystem)
      (h : SenioritySystemAdoptedForIntentionallyDiscriminatoryPurpose s c)
  | compensationDecision (h : DiscriminatoryCompensationDecisionAppliedDuringChargePeriod p c)




inductive TimelyCharge (ch : Charge) (p : Person) (c : ComplaintText) : Prop where
  | standard (h : DaysFromUnlawfulPracticeToChargeFiling ch c ≤ 180)
  | deferral (hs : InstitutedProceedingsWithStateOrLocalAgency p c)
             (h300 : DaysFromUnlawfulPracticeToChargeFiling ch c ≤ 300)
             (h30 : DaysFromStateTerminationNoticeToChargeFiling ch c ≤ 30)






inductive StateDeferralSatisfied (ch : Charge) (p : Person) (c : ComplaintText) : Prop where
  | waited (h : DaysStateOrLocalProceedingsPendingBeforeCharge ch c ≥ 60)
  | earlierTerminated (h : StateOrLocalProceedingsEarlierTerminated p c)
  | noStateProceeding (h : ¬ InstitutedProceedingsWithStateOrLocalAgency p c)


structure AdministrativeExhaustion (ch : Charge) (p : Person) (c : ComplaintText) : Prop where
  chargeFiled : ChargeFiledByOrOnBehalfOfAggrievedPerson ch p c
  underOath : ChargeInWritingUnderOathOrAffirmation ch c
  accrual : AccrualRule p c
  timely : TimelyCharge ch p c
  deferral : StateDeferralSatisfied ch p c
  rightToSue : ReceivedNoticeOfRightToSue p c
  suitWithinNinetyDays : DaysFromRightToSueNoticeToCivilAction p c ≤ 90



structure Section2000e5Prerequisites (ch : Charge) (p : Person)
    (c : ComplaintText) : Prop where
  exhaustion : AdministrativeExhaustion ch p c
  jurisdiction : FederalJurisdictionalNexus c
  injury : SufferedInjuryFromUnlawfulEmploymentPractice p c
  causation : ProximateCause p c




structure ReliefAvailable (r : Respondent) (p : Person) (c : ComplaintText) : Prop where
  intentional : RespondentIntentionallyEngagedInUnlawfulPractice r c
  notOtherReason : ¬ RefusedOrDischargedForReasonOtherThanProhibitedDiscrimination p c





structure Section2000e6a (c : ComplaintText) : Prop where
  reasonableCause : AttorneyGeneralHasReasonableCauseToBelieve c
  patternOrPractice : PatternOrPracticeOfResistanceToRightsSecured c
  intent : PatternIntendedToDenyFullExerciseOfRights c
  signed : ComplaintSignedByAttorneyGeneral c
  setsForthFacts : ComplaintSetsForthPatternOrPracticeFacts c
  requestsRelief : ComplaintRequestsRelief c





structure Section2000e8e (p : Person) (c : ComplaintText) : Prop where
  commissionPersonnel : IsCommissionOfficerOrEmployee p c
  disclosure : MadePublicInformationObtainedUnderThisSection p c
  priorToProceeding : DisclosurePriorToInstitutionOfProceeding p c



structure Section2000e8cExemption (r : Respondent) (c : ComplaintText) : Prop where
  subject : SubjectToRecordkeepingRegulationOrOrder r c
  applied : AppliedToCommissionForUndueHardshipExemption r c
  denied : ExemptionApplicationDenied r c
  undueHardship : RegulationWouldImposeUndueHardship r c




structure Section2000e10a (r : Respondent) (c : ComplaintText) : Prop where
  failedToPost : FailedToPostRequiredNotice r c



structure Section2000e10b (r : Respondent) (p : Person) (c : ComplaintText) : Prop where
  violation : Section2000e10a r c
  willful : ActedWithScienter p c




structure Section2000e13 (accused : Person) (victim : Person)
    (c : ComplaintText) : Prop where
  victimIsCommissionPersonnel : VictimWasCommissionOfficerAgentOrEmployee victim c
  killing : KilledPersonInViolationOfSection1114 accused c
  officialFunctions : VictimEngagedInOrKilledOnAccountOfOfficialFunctions victim c




inductive FederalSectorExhaustion (p : Person) (c : ComplaintText) : Prop where
  | finalAction (h : ReceivedNoticeOfFinalAgencyAction p c)
                (h90 : DaysFromFinalAgencyActionToCivilAction p c ≤ 90)
  | agencyInaction (h180 : DaysFromInitialChargeFilingWithAgency p c ≥ 180)


structure Section2000e16 (f : FederalUnit) (p : Person) (b : ProtectedBasis)
    (c : ComplaintText) : Prop where
  coveredUnit : IsCoveredFederalUnit f c
  coveredIndividual : IsFederalEmployeeOrApplicant p f c
  notAlienAbroad : ¬ IsAlienEmployedOutsideTheUnitedStates p c
  discrimination : PersonnelActionNotFreeFromDiscrimination p f b c
  exhaustion : FederalSectorExhaustion p c
  properDefendant : HeadOfDepartmentAgencyOrUnitNamedAsDefendant f c




inductive GeraCoveredIndividual (p : Person) (c : ComplaintText) : Prop where
  | presidentialAppointee (h : IsPresidentialAppointeeUnderSection1219 p c)
  | stateEmployee (h1 : ChosenOrAppointedByElectedStateOfficial p c)
                  (h2 : ServesAsPersonalStaffPolicymakerOrImmediateAdvisor p c)


structure Section2000e16b (p : Person) (b : GeraBasis) (c : ComplaintText) : Prop where
  covered : GeraCoveredIndividual p c
  discrimination : PersonnelActionNotFreeFromGeraDiscrimination p b c



structure Section2000e16c (p : Person) (b : GeraBasis) (c : ComplaintText) : Prop where
  violation : Section2000e16b p b c
  filedWithCommission : GeraComplaintFiledWithCommission p c
  timely : DaysFromViolationToGeraComplaint p c ≤ 180





structure Section2000e17 (e : Employer) (pl : AffirmativeActionPlan)
    (c : ComplaintText) : Prop where
  accepted : HasPreviouslyAcceptedAffirmativeActionPlanSameFacility e pl c
  withinTwelveMonths : MonthsSincePlanAcceptance pl c ≤ 12
  adverseContractAction : ContractDeniedWithheldTerminatedOrSuspended e c
  noHearing : ¬ AccordedFullHearingAndAdjudication e c
  noSubstantialDeviation : ¬ DeviatedSubstantiallyFromAffirmativeActionPlan e c




structure EmployerControlsForeignCorporation (e : Employer) (c : ComplaintText) : Prop where
  interrelation : InterrelationOfOperations e c
  management : CommonManagement e c
  laborRelations : CentralizedControlOfLaborRelations e c
  ownership : CommonOwnershipOrFinancialControl e c



structure ForeignCorporationAttribution (e : Employer) (c : ComplaintText) : Prop where
  control : EmployerControlsForeignCorporation e c
  practice : PracticeEngagedInByControlledForeignCorporation e c





structure StateLawNotSaved (sl : StateLaw) (c : ComplaintText) : Prop where
  requiresOrPermits : StateLawPurportsToRequireOrPermitUnlawfulPractice sl c





inductive TitleVIIViolationTheory (c : ComplaintText) : Prop where
  | employerDisparateTreatment (e : Employer) (p : Person) (b : ProtectedBasis)
      (h : Section2000e2a1 e p b c)
  | employerClassification (e : Employer) (p : Person) (b : ProtectedBasis)
      (h : Section2000e2a2 e p b c)
  | employmentAgency (a : EmploymentAgency) (p : Person) (b : ProtectedBasis)
      (h : Section2000e2b a p b c)
  | laborOrganization (l : LaborOrganization) (p : Person) (b : ProtectedBasis)
      (h : Section2000e2c12 l p b c)
  | laborCausedEmployer (l : LaborOrganization) (e : Employer) (p : Person)
      (b : ProtectedBasis) (h : Section2000e2c3 l e p b c)
  | trainingProgram (r : Respondent) (p : Person) (t : TrainingProgram)
      (b : ProtectedBasis) (h : Section2000e2d r p t b c)
  | disparateImpact (r : Respondent) (p : Person) (pr : EmploymentPractice)
      (b : ProtectedBasis) (h : Section2000e2k r p pr b c)
  | scoreAdjustment (r : Respondent) (pr : EmploymentPractice) (b : ProtectedBasis)
      (h : Section2000e2l r pr b c)
  | motivatingFactor (r : Respondent) (p : Person) (pr : EmploymentPractice)
      (b : ProtectedBasis) (h : Section2000e2m r p pr b c)
  | religiousAccommodation (e : Employer) (p : Person)
      (h : ReligiousAccommodationClaim e p c)
  | retaliation (r : Respondent) (p : Person) (h : Section2000e3a r p c)
  | discriminatoryAdvertising (r : Respondent) (ad : Advertisement)
      (b : ProtectedBasis) (h : Section2000e3b r ad b c)
  | federalSector (f : FederalUnit) (p : Person) (b : ProtectedBasis)
      (h : Section2000e16 f p b c)
  | governmentEmployeeRights (p : Person) (b : GeraBasis) (h : Section2000e16c p b c)



inductive TitleVIIPrerequisites (ch : Charge) (p : Person) (c : ComplaintText) : Prop where
  | privateSector (h : Section2000e5Prerequisites ch p c)
  | federalSector (h : FederalSectorExhaustion p c)
                  (hj : FederalJurisdictionalNexus c)
                  (hi : SufferedInjuryFromUnlawfulEmploymentPractice p c)
  | governmentEmployeeRights (h : GeraComplaintFiledWithCommission p c)
                             (ht : DaysFromViolationToGeraComplaint p c ≤ 180)





structure ValidTitleVIIComplaint (ch : Charge) (p : Person) (c : ComplaintText) : Prop where
  claimant : IsPersonInUS p c
  theory : TitleVIIViolationTheory c
  prerequisites : TitleVIIPrerequisites ch p c
  noPreferentialTreatmentDemand : ¬ ClaimWouldRequirePreferentialTreatmentForImbalance c

end Proving.USC.T42.Ch21TitleVII.Elements
