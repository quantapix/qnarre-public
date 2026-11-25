import Proving.USC.T42.Ch21TitleVII.Elements.Statute
import Proving.USC.Common.Tactic

set_option autoImplicit false
set_option relaxedAutoImplicit false











namespace Proving.USC.T42.Ch21TitleVII.Elements

open Proving.USC.Common



@[grind →] theorem coveredEmployer_intro {e : Employer} {c : ComplaintText}
    (hPerson : EmployerIsStatutoryPerson e c)
    (hCommerce : EngagedInIndustryAffectingCommerce e c)
    (hCount : CalendarWeeksWithFifteenEmployees e c ≥ 20)
    (hNotExcluded : ¬ EmployerStatutoryExclusion e c) :
    CoveredEmployer e c :=
  ⟨hPerson, hCommerce, hCount, hNotExcluded⟩

@[grind →] theorem coveredEmployee_intro {p : Person} {e : Employer} {c : ComplaintText}
    (hEmployed : IsIndividualEmployedByEmployer p e c)
    (hCarveBack : EmployeeStatutoryExclusion p c → IsSubjectToStateCivilServiceLaws p c) :
    CoveredEmployee p e c :=
  ⟨hEmployed, hCarveBack⟩

@[grind →] theorem coveredEmploymentAgency_intro
    {a : EmploymentAgency} {c : ComplaintText}
    (hProcures : RegularlyProcuresEmployeesOrOpportunities a c) :
    CoveredEmploymentAgency a c :=
  ⟨hProcures⟩

@[grind →] theorem coveredLaborOrganization_intro
    {l : LaborOrganization} {c : ComplaintText}
    (hForm : IsLaborOrganizationInForm l c)
    (hCommerce : LaborOrganizationAffectingCommerce l c) :
    CoveredLaborOrganization l c :=
  ⟨hForm, hCommerce⟩

@[grind →] theorem coveredJointCommittee_intro
    {j : JointCommittee} {t : TrainingProgram} {c : ComplaintText}
    (hControls : ControlsApprenticeshipOrTrainingProgram j t c) :
    CoveredJointCommittee j t c :=
  ⟨hControls⟩


@[grind →] theorem laborOrganizationAffectingCommerce_of_membership
    {l : LaborOrganization} {c : ComplaintText}
    (hCount : LaborOrganizationMemberCount l c ≥ 15)
    (hRoute : LaborOrganizationRepresentationRoute l c) :
    LaborOrganizationAffectingCommerce l c :=
  .membership hCount hRoute


@[grind →] theorem laborOrganizationAffectingCommerce_of_hiringHall
    {l : LaborOrganization} {c : ComplaintText}
    (h : MaintainsHiringHallOrOffice l c) :
    LaborOrganizationAffectingCommerce l c :=
  .hiringHall h



example {e : Employer} {c : ComplaintText}
    (hPerson : EmployerIsStatutoryPerson e c)
    (hCommerce : EngagedInIndustryAffectingCommerce e c)
    (hCount : CalendarWeeksWithFifteenEmployees e c ≥ 20)
    (hNotExcluded : ¬ EmployerStatutoryExclusion e c) :
    IsCoveredEmployer e c := by prove_element

example {p : Person} {e : Employer} {c : ComplaintText}
    (hEmployed : IsIndividualEmployedByEmployer p e c)
    (hCarveBack : EmployeeStatutoryExclusion p c → IsSubjectToStateCivilServiceLaws p c) :
    IsCoveredEmployee p e c := by prove_element

example {l : LaborOrganization} {c : ComplaintText}
    (hForm : IsLaborOrganizationInForm l c)
    (hHall : MaintainsHiringHallOrOffice l c) :
    IsCoveredLaborOrganization l c := by prove_element



theorem bfoqDefense_intro {r : Respondent} {p : Person} {b : ProtectedBasis}
    {c : ComplaintText}
    (hEligible : BfoqEligibleBasis b)
    (hQual : BonaFideOccupationalQualification r p b c) :
    BfoqDefense r p b c :=
  ⟨hEligible, hQual⟩

theorem nationalSecurityDefense_intro {r : Respondent} {p : Person} {c : ComplaintText}
    (hReq : PositionSubjectToNationalSecurityRequirement r p c)
    (hUnfulfilled : IndividualHasNotFulfilledSecurityRequirement p c) :
    NationalSecurityDefense r p c :=
  ⟨hReq, hUnfulfilled⟩

theorem seniorityOrMeritSystemDefense_intro {r : Respondent}
    {s : SeniorityOrMeritSystem} {c : ComplaintText}
    (hBonaFide : AppliedBonaFideSeniorityOrMeritSystem r s c)
    (hNoIntent : ¬ DifferencesResultOfIntentionToDiscriminate s c) :
    SeniorityOrMeritSystemDefense r s c :=
  ⟨hBonaFide, hNoIntent⟩

theorem abilityTestDefense_intro {r : Respondent} {pr : EmploymentPractice}
    {c : ComplaintText}
    (hTest : AppliedProfessionallyDevelopedAbilityTest r pr c)
    (hNotDiscriminatory : ¬ TestDesignedIntendedOrUsedToDiscriminate pr c) :
    AbilityTestDefense r pr c :=
  ⟨hTest, hNotDiscriminatory⟩

theorem foreignLawDefense_intro {r : Respondent} {p : Person} {c : ComplaintText}
    (hConflict : ForeignWorkplaceComplianceWouldViolateForeignLaw r p c) :
    ForeignLawDefense r p c :=
  ⟨hConflict⟩

theorem goodFaithRelianceDefense_intro {r : Respondent} {c : ComplaintText}
    (hGoodFaith : ActInGoodFaith r c)
    (hConformity : ActInConformityWithCommissionWrittenInterpretation r c)
    (hReliance : ActInRelianceOnCommissionWrittenInterpretation r c) :
    GoodFaithRelianceDefense r c :=
  ⟨hGoodFaith, hConformity, hReliance⟩

theorem consentJudgmentPreclusion_intro {p : Person} {pr : EmploymentPractice}
    {j : ConsentJudgment} {c : ComplaintText}
    (hScope : PracticeImplementsAndWithinScopeOfJudgment pr j c)
    (hRoute : ConsentJudgmentPreclusionRoute p j c)
    (hNotCollusive : ¬ JudgmentObtainedByCollusionFraudOrInvalid j c) :
    ConsentJudgmentPreclusion p pr j c :=
  ⟨hScope, hRoute, hNotCollusive⟩



theorem section2000e2a1_intro {e : Employer} {p : Person} {b : ProtectedBasis}
    {c : ComplaintText}
    (hEmployer : IsCoveredEmployer e c)
    (hIndividual : CoveredIndividual p e c)
    (hAction : EmployerAdverseAction e p c)
    (hIntent : IntentToDiscriminate p c)
    (hCausation : BecauseOfProtectedBasis p b c)
    (hNoException : ¬ UnlawfulPracticeException (Respondent.employer e) p b c) :
    Section2000e2a1 e p b c :=
  ⟨hEmployer, hIndividual, hAction, hIntent, hCausation, hNoException⟩

theorem section2000e2a2_intro {e : Employer} {p : Person} {b : ProtectedBasis}
    {c : ComplaintText}
    (hEmployer : IsCoveredEmployer e c)
    (hIndividual : CoveredIndividual p e c)
    (hClassification : LimitedSegregatedOrClassified e p c)
    (hDeprivation : DeprivedOfEmploymentOpportunitiesOrAdverselyAffectedStatus e p c)
    (hCausation : BecauseOfProtectedBasis p b c)
    (hNoException : ¬ UnlawfulPracticeException (Respondent.employer e) p b c) :
    Section2000e2a2 e p b c :=
  ⟨hEmployer, hIndividual, hClassification, hDeprivation, hCausation, hNoException⟩

theorem section2000e2b_intro {a : EmploymentAgency} {p : Person} {b : ProtectedBasis}
    {c : ComplaintText}
    (hAgency : CoveredEmploymentAgency a c)
    (hAction : EmploymentAgencyAdverseAction a p b c)
    (hCausation : BecauseOfProtectedBasis p b c)
    (hNoException : ¬ UnlawfulPracticeException (Respondent.employmentAgency a) p b c) :
    Section2000e2b a p b c :=
  ⟨hAgency, hAction, hCausation, hNoException⟩

theorem section2000e2c12_intro {l : LaborOrganization} {p : Person}
    {b : ProtectedBasis} {c : ComplaintText}
    (hLabor : IsCoveredLaborOrganization l c)
    (hAction : LaborOrganizationAdverseAction l p c)
    (hCausation : BecauseOfProtectedBasis p b c)
    (hNoException : ¬ UnlawfulPracticeException (Respondent.laborOrganization l) p b c) :
    Section2000e2c12 l p b c :=
  ⟨hLabor, hAction, hCausation, hNoException⟩

theorem section2000e2c3_intro {l : LaborOrganization} {e : Employer} {p : Person}
    {b : ProtectedBasis} {c : ComplaintText}
    (hLabor : IsCoveredLaborOrganization l c)
    (hEmployer : IsCoveredEmployer e c)
    (hCaused : CausedOrAttemptedToCauseEmployerToDiscriminate l e p c)
    (hCausation : BecauseOfProtectedBasis p b c) :
    Section2000e2c3 l e p b c :=
  ⟨hLabor, hEmployer, hCaused, hCausation⟩

theorem section2000e2d_intro {r : Respondent} {p : Person} {t : TrainingProgram}
    {b : ProtectedBasis} {c : ComplaintText}
    (hDiscrimination : DiscriminatedInAdmissionOrEmploymentInTraining r p t b c)
    (hCausation : BecauseOfProtectedBasis p b c)
    (hNoException : ¬ UnlawfulPracticeException r p b c) :
    Section2000e2d r p t b c :=
  ⟨hDiscrimination, hCausation, hNoException⟩

theorem disparateImpactBusinessNecessityRoute_intro {r : Respondent}
    {pr : EmploymentPractice} {b : ProtectedBasis} {c : ComplaintText}
    (hUses : RespondentUsesParticularEmploymentPractice r pr c)
    (hImpact : PracticeCausesDisparateImpactOnBasis pr b c)
    (hParticularity : DisparateImpactParticularity r pr c)
    (hNoRebuttal : ¬ RespondentDemonstratesPracticeDoesNotCauseImpact pr c)
    (hNotJustified : ¬ PracticeJobRelatedAndConsistentWithBusinessNecessity pr c) :
    DisparateImpactBusinessNecessityRoute r pr b c :=
  ⟨hUses, hImpact, hParticularity, hNoRebuttal, hNotJustified⟩

theorem disparateImpactAlternativeRoute_intro {r : Respondent} {p : Person}
    {pr : EmploymentPractice} {c : ComplaintText}
    (hUses : RespondentUsesParticularEmploymentPractice r pr c)
    (hAlternative : DemonstratedAlternativeEmploymentPractice p pr c)
    (hRefusal : RespondentRefusedToAdoptAlternative r pr c) :
    DisparateImpactAlternativeRoute r p pr c :=
  ⟨hUses, hAlternative, hRefusal⟩

theorem section2000e2k_intro {r : Respondent} {p : Person} {pr : EmploymentPractice}
    {b : ProtectedBasis} {c : ComplaintText}
    (hRoute : DisparateImpactRoute r p pr b c)
    (hCarveOut : IsControlledSubstanceEmploymentBarRule pr c →
      ControlledSubstanceRuleAdoptedOrAppliedWithDiscriminatoryIntent pr c)
    (hNoException : ¬ UnlawfulPracticeException r p b c) :
    Section2000e2k r p pr b c :=
  ⟨hRoute, hCarveOut, hNoException⟩

theorem section2000e2l_intro {r : Respondent} {pr : EmploymentPractice}
    {b : ProtectedBasis} {c : ComplaintText}
    (hConnection : InConnectionWithSelectionOrReferralForEmploymentOrPromotion pr c)
    (hAdjustment : AdjustedOrAlteredEmploymentTestResults r pr b c) :
    Section2000e2l r pr b c :=
  ⟨hConnection, hAdjustment⟩

theorem section2000e2m_intro {r : Respondent} {p : Person} {pr : EmploymentPractice}
    {b : ProtectedBasis} {c : ComplaintText}
    (hPractice : RespondentUsesParticularEmploymentPractice r pr c)
    (hMotivating : ProtectedBasisWasMotivatingFactor p b c) :
    Section2000e2m r p pr b c :=
  ⟨hPractice, hMotivating⟩

theorem sameDecisionReliefLimitation_intro {r : Respondent} {p : Person}
    {pr : EmploymentPractice} {b : ProtectedBasis} {c : ComplaintText}
    (hViolation : Section2000e2m r p pr b c)
    (hSameAction : RespondentWouldHaveTakenSameActionAbsentImpermissibleFactor r p c) :
    SameDecisionReliefLimitation r p pr b c :=
  ⟨hViolation, hSameAction⟩



theorem religiousAccommodationClaim_intro {e : Employer} {p : Person}
    {c : ComplaintText}
    (hEmployer : IsCoveredEmployer e c)
    (hIndividual : CoveredIndividual p e c)
    (hBelief : HasBonaFideReligiousObservanceOrPractice p c)
    (hConflict : ReligiousPracticeConflictsWithEmploymentRequirement p c)
    (hNotice : NotifiedEmployerOfReligiousConflict p e c)
    (hAction : EmployerAdverseAction e p c)
    (hNoHardship : ¬ EmployerUnableToAccommodateWithoutUndueHardship e p c) :
    ReligiousAccommodationClaim e p c :=
  ⟨hEmployer, hIndividual, hBelief, hConflict, hNotice, hAction, hNoHardship⟩

theorem pregnancyDiscriminationClaim_intro {p : Person} {c : ComplaintText}
    (hAction : AdverseActionBecauseOfPregnancyChildbirthOrRelatedCondition p c)
    (hUnequal : PregnancyAffectedEmployeeTreatedDifferentlyFromSimilarlyAble p c) :
    PregnancyDiscriminationClaim p c :=
  ⟨hAction, hUnequal⟩



@[grind →] theorem becauseOfSex_of_pregnancy {p : Person} {c : ComplaintText}
    (h : PregnancyDiscriminationClaim p c) :
    BecauseOfProtectedBasis p ProtectedBasis.sex c :=
  pregnancy_is_because_of_sex h.adverseAction



theorem section2000e3a_intro {r : Respondent} {p : Person} {c : ComplaintText}
    (hActivity : ProtectedActivity p c)
    (hAction : RetaliatoryAdverseAction r p c)
    (hCausation : AdverseActionBecauseOfProtectedActivity r p c) :
    Section2000e3a r p c :=
  ⟨hActivity, hAction, hCausation⟩

theorem section2000e3b_intro {r : Respondent} {ad : Advertisement}
    {b : ProtectedBasis} {c : ComplaintText}
    (hPublished : PrintedOrPublishedNoticeOrAdvertisement r ad c)
    (hPreference : AdvertisementIndicatesPreferenceOnProtectedBasis ad b c)
    (hNoBfoq : ¬ (BfoqEligibleBasis b ∧ ∃ p, BonaFideOccupationalQualification r p b c)) :
    Section2000e3b r ad b c :=
  ⟨hPublished, hPreference, hNoBfoq⟩



theorem administrativeExhaustion_intro {ch : Charge} {p : Person} {c : ComplaintText}
    (hFiled : ChargeFiledByOrOnBehalfOfAggrievedPerson ch p c)
    (hOath : ChargeInWritingUnderOathOrAffirmation ch c)
    (hAccrual : AccrualRule p c)
    (hTimely : TimelyCharge ch p c)
    (hDeferral : StateDeferralSatisfied ch p c)
    (hRightToSue : ReceivedNoticeOfRightToSue p c)
    (hNinety : DaysFromRightToSueNoticeToCivilAction p c ≤ 90) :
    AdministrativeExhaustion ch p c :=
  ⟨hFiled, hOath, hAccrual, hTimely, hDeferral, hRightToSue, hNinety⟩

theorem section2000e5Prerequisites_intro {ch : Charge} {p : Person} {c : ComplaintText}
    (hExhaustion : AdministrativeExhaustion ch p c)
    (hJurisdiction : FederalJurisdictionalNexus c)
    (hInjury : SufferedInjuryFromUnlawfulEmploymentPractice p c)
    (hCausation : ProximateCause p c) :
    Section2000e5Prerequisites ch p c :=
  ⟨hExhaustion, hJurisdiction, hInjury, hCausation⟩

theorem reliefAvailable_intro {r : Respondent} {p : Person} {c : ComplaintText}
    (hIntentional : RespondentIntentionallyEngagedInUnlawfulPractice r c)
    (hNotOther : ¬ RefusedOrDischargedForReasonOtherThanProhibitedDiscrimination p c) :
    ReliefAvailable r p c :=
  ⟨hIntentional, hNotOther⟩



theorem section2000e6a_intro {c : ComplaintText}
    (hCause : AttorneyGeneralHasReasonableCauseToBelieve c)
    (hPattern : PatternOrPracticeOfResistanceToRightsSecured c)
    (hIntent : PatternIntendedToDenyFullExerciseOfRights c)
    (hSigned : ComplaintSignedByAttorneyGeneral c)
    (hFacts : ComplaintSetsForthPatternOrPracticeFacts c)
    (hRelief : ComplaintRequestsRelief c) :
    Section2000e6a c :=
  ⟨hCause, hPattern, hIntent, hSigned, hFacts, hRelief⟩

theorem section2000e8e_intro {p : Person} {c : ComplaintText}
    (hPersonnel : IsCommissionOfficerOrEmployee p c)
    (hDisclosure : MadePublicInformationObtainedUnderThisSection p c)
    (hPrior : DisclosurePriorToInstitutionOfProceeding p c) :
    Section2000e8e p c :=
  ⟨hPersonnel, hDisclosure, hPrior⟩

theorem section2000e8cExemption_intro {r : Respondent} {c : ComplaintText}
    (hSubject : SubjectToRecordkeepingRegulationOrOrder r c)
    (hApplied : AppliedToCommissionForUndueHardshipExemption r c)
    (hDenied : ExemptionApplicationDenied r c)
    (hHardship : RegulationWouldImposeUndueHardship r c) :
    Section2000e8cExemption r c :=
  ⟨hSubject, hApplied, hDenied, hHardship⟩

theorem section2000e10a_intro {r : Respondent} {c : ComplaintText}
    (hFailed : FailedToPostRequiredNotice r c) :
    Section2000e10a r c :=
  ⟨hFailed⟩

theorem section2000e10b_intro {r : Respondent} {p : Person} {c : ComplaintText}
    (hViolation : Section2000e10a r c)
    (hWillful : ActedWithScienter p c) :
    Section2000e10b r p c :=
  ⟨hViolation, hWillful⟩

theorem section2000e13_intro {accused : Person} {victim : Person} {c : ComplaintText}
    (hVictim : VictimWasCommissionOfficerAgentOrEmployee victim c)
    (hKilling : KilledPersonInViolationOfSection1114 accused c)
    (hFunctions : VictimEngagedInOrKilledOnAccountOfOfficialFunctions victim c) :
    Section2000e13 accused victim c :=
  ⟨hVictim, hKilling, hFunctions⟩



theorem section2000e16_intro {f : FederalUnit} {p : Person} {b : ProtectedBasis}
    {c : ComplaintText}
    (hUnit : IsCoveredFederalUnit f c)
    (hIndividual : IsFederalEmployeeOrApplicant p f c)
    (hNotAlien : ¬ IsAlienEmployedOutsideTheUnitedStates p c)
    (hDiscrimination : PersonnelActionNotFreeFromDiscrimination p f b c)
    (hExhaustion : FederalSectorExhaustion p c)
    (hDefendant : HeadOfDepartmentAgencyOrUnitNamedAsDefendant f c) :
    Section2000e16 f p b c :=
  ⟨hUnit, hIndividual, hNotAlien, hDiscrimination, hExhaustion, hDefendant⟩

theorem section2000e16b_intro {p : Person} {b : GeraBasis} {c : ComplaintText}
    (hCovered : GeraCoveredIndividual p c)
    (hDiscrimination : PersonnelActionNotFreeFromGeraDiscrimination p b c) :
    Section2000e16b p b c :=
  ⟨hCovered, hDiscrimination⟩

theorem section2000e16c_intro {p : Person} {b : GeraBasis} {c : ComplaintText}
    (hViolation : Section2000e16b p b c)
    (hFiled : GeraComplaintFiledWithCommission p c)
    (hTimely : DaysFromViolationToGeraComplaint p c ≤ 180) :
    Section2000e16c p b c :=
  ⟨hViolation, hFiled, hTimely⟩

theorem section2000e17_intro {e : Employer} {pl : AffirmativeActionPlan}
    {c : ComplaintText}
    (hAccepted : HasPreviouslyAcceptedAffirmativeActionPlanSameFacility e pl c)
    (hMonths : MonthsSincePlanAcceptance pl c ≤ 12)
    (hAdverse : ContractDeniedWithheldTerminatedOrSuspended e c)
    (hNoHearing : ¬ AccordedFullHearingAndAdjudication e c)
    (hNoDeviation : ¬ DeviatedSubstantiallyFromAffirmativeActionPlan e c) :
    Section2000e17 e pl c :=
  ⟨hAccepted, hMonths, hAdverse, hNoHearing, hNoDeviation⟩



theorem employerControlsForeignCorporation_intro {e : Employer} {c : ComplaintText}
    (hInterrelation : InterrelationOfOperations e c)
    (hManagement : CommonManagement e c)
    (hLabor : CentralizedControlOfLaborRelations e c)
    (hOwnership : CommonOwnershipOrFinancialControl e c) :
    EmployerControlsForeignCorporation e c :=
  ⟨hInterrelation, hManagement, hLabor, hOwnership⟩

theorem foreignCorporationAttribution_intro {e : Employer} {c : ComplaintText}
    (hControl : EmployerControlsForeignCorporation e c)
    (hPractice : PracticeEngagedInByControlledForeignCorporation e c) :
    ForeignCorporationAttribution e c :=
  ⟨hControl, hPractice⟩

theorem stateLawNotSaved_intro {sl : StateLaw} {c : ComplaintText}
    (hRequires : StateLawPurportsToRequireOrPermitUnlawfulPractice sl c) :
    StateLawNotSaved sl c :=
  ⟨hRequires⟩



theorem validTitleVIIComplaint_intro {ch : Charge} {p : Person} {c : ComplaintText}
    (hClaimant : IsPersonInUS p c)
    (hTheory : TitleVIIViolationTheory c)
    (hPrerequisites : TitleVIIPrerequisites ch p c)
    (hNoPreference : ¬ ClaimWouldRequirePreferentialTreatmentForImbalance c) :
    ValidTitleVIIComplaint ch p c :=
  ⟨hClaimant, hTheory, hPrerequisites, hNoPreference⟩

end Proving.USC.T42.Ch21TitleVII.Elements
