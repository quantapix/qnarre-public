









import Proving.USC.T42.Ch21TitleVII.Deontic.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Deontic

open Proving.USC.Common




axiom IsStatutoryPerson (p : Person) (c : ComplaintText) : Prop




axiom IsCoveredEmployer (p : Person) (c : ComplaintText) : Prop




axiom IsCoveredEmploymentAgency (p : Person) (c : ComplaintText) : Prop




axiom IsCoveredLaborOrganization (p : Person) (c : ComplaintText) : Prop




axiom IsCoveredEmployee (i : Person) (p : Person) (c : ComplaintText) : Prop




axiom EngagedInIndustryAffectingCommerce (p : Person) (c : ComplaintText) : Prop




axiom IsProtectedTrait (t : ProtectedTrait) (c : ComplaintText) : Prop




axiom IsComplainingParty (i : Person) (c : ComplaintText) : Prop




axiom IsRespondent (p : Person) (c : ComplaintText) : Prop




axiom AliensEmployedOutsideAnyState (p : Person) (i : Person) (c : ComplaintText) : Prop




axiom ReligiousOrganizationReligiousPreference (p : Person) (i : Person) (c : ComplaintText) : Prop




axiom ForeignLawComplianceConflict (p : Person) (c : ComplaintText) : Prop




axiom EmployerControlsForeignCorporation (p : Person) (q : Person) (c : ComplaintText) : Prop




axiom IsForeignPersonNotControlledByAmericanEmployer (p : Person) (c : ComplaintText) : Prop




axiom FailedOrRefusedToHireOrDischarged (p : Person) (i : Person) (c : ComplaintText) : Prop




axiom DiscriminatedInCompensationTermsOrConditions (p : Person) (i : Person) (c : ComplaintText) : Prop




axiom LimitedSegregatedOrClassifiedEmployees (p : Person) (i : Person) (c : ComplaintText) : Prop




axiom BecauseOfProtectedTrait (p : Person) (i : Person) (t : ProtectedTrait) (c : ComplaintText) : Prop




axiom FailedOrRefusedToRefer (p : Person) (i : Person) (c : ComplaintText) : Prop




axiom ClassifiedOrReferredOnProhibitedBasis (p : Person) (i : Person) (c : ComplaintText) : Prop




axiom ExcludedOrExpelledFromMembership (p : Person) (i : Person) (c : ComplaintText) : Prop




axiom LimitedSegregatedOrClassifiedMembership (p : Person) (i : Person) (c : ComplaintText) : Prop




axiom CausedOrAttemptedToCauseEmployerDiscrimination (p : Person) (q : Person) (i : Person) (c : ComplaintText) : Prop




axiom IsJointLaborManagementCommittee (p : Person) (c : ComplaintText) : Prop




axiom DiscriminatedInTrainingAdmissionOrEmployment (p : Person) (i : Person) (tp : TrainingProgram) (c : ComplaintText) : Prop




axiom BonaFideOccupationalQualification (t : ProtectedTrait) (p : Person) (c : ComplaintText) : Prop




axiom CommunistOrganizationMembership (i : Person) (c : ComplaintText) : Prop




axiom NationalSecurityRequirementUnfulfilled (i : Person) (c : ComplaintText) : Prop




axiom BonaFideSeniorityOrMeritSystem (s : SeniorityOrMeritSystem) (c : ComplaintText) : Prop




axiom ProfessionallyDevelopedAbilityTest (tst : EmploymentTest) (c : ComplaintText) : Prop




axiom IntentionToDiscriminate (p : Person) (c : ComplaintText) : Prop




axiom IndianReservationPreference (p : Person) (c : ComplaintText) : Prop




axiom ImbalanceInWorkforceComposition (p : Person) (c : ComplaintText) : Prop




axiom UsedParticularEmploymentPractice (p : Person) (prac : EmploymentPractice) (c : ComplaintText) : Prop




axiom CausesDisparateImpact (prac : EmploymentPractice) (t : ProtectedTrait) (c : ComplaintText) : Prop




axiom JobRelatedAndConsistentWithBusinessNecessity (prac : EmploymentPractice) (c : ComplaintText) : Prop




axiom RefusedAlternativeEmploymentPractice (p : Person) (prac : EmploymentPractice) (c : ComplaintText) : Prop




axiom AdjustedScoresOrAlteredTestResults (p : Person) (tst : EmploymentTest) (c : ComplaintText) : Prop




axiom MotivatingFactor (t : ProtectedTrait) (prac : EmploymentPractice) (c : ComplaintText) : Prop




axiom PracticeImplementsConsentJudgment (prac : EmploymentPractice) (j : ConsentJudgment) (c : ComplaintText) : Prop




axiom ChallengedConsentJudgmentPractice (i : Person) (prac : EmploymentPractice) (c : ComplaintText) : Prop




axiom HadNoticeAndOpportunityToObject (i : Person) (j : ConsentJudgment) (c : ComplaintText) : Prop




axiom InterestsAdequatelyRepresented (i : Person) (j : ConsentJudgment) (c : ComplaintText) : Prop




axiom DiscriminatedAgainstForProtectedActivity (p : Person) (i : Person) (c : ComplaintText) : Prop




axiom OpposedUnlawfulEmploymentPractice (i : Person) (c : ComplaintText) : Prop




axiom ParticipatedInTitleVIIProceeding (i : Person) (c : ComplaintText) : Prop




axiom PrintedOrPublishedNotice (p : Person) (n : Notice) (c : ComplaintText) : Prop




axiom NoticeIndicatesProhibitedPreference (n : Notice) (t : ProtectedTrait) (c : ComplaintText) : Prop




axiom IsCommission (p : Person) (c : ComplaintText) : Prop




axiom TransmittedAnnualReportToCongressAndPresident (c : ComplaintText) : Prop




axiom EstablishedTechnicalAssistanceTrainingInstitute (c : ComplaintText) : Prop




axiom FailedToReceiveTechnicalAssistance (p : Person) (c : ComplaintText) : Prop




axiom IsCommissionOfficerOrEmployee (p : Person) (c : ComplaintText) : Prop




axiom FiledChargeWithCommission (i : Person) (ch : Charge) (c : ComplaintText) : Prop




axiom ServedNoticeOfChargeWithinTenDays (ch : Charge) (c : ComplaintText) : Prop




axiom InvestigatedCharge (ch : Charge) (c : ComplaintText) : Prop




axiom ReasonableCauseDetermined (ch : Charge) (c : ComplaintText) : Prop




axiom EndeavoredConciliationByInformalMethods (ch : Charge) (c : ComplaintText) : Prop




axiom MadePublicChargeOrConciliationCommunication (p : Person) (ch : Charge) (c : ComplaintText) : Prop




axiom StateOrLocalLawProhibitsThePractice (l : StateOrLocalLaw) (c : ComplaintText) : Prop




axiom StateOrLocalDeferralPeriodElapsed (ch : Charge) (l : StateOrLocalLaw) (c : ComplaintText) : Prop




axiom ChargeFiledWithinLimitationsPeriod (ch : Charge) (c : ComplaintText) : Prop




axiom ConciliationAgreementNotSecured (ch : Charge) (c : ComplaintText) : Prop




axiom RightToSueNoticeGiven (i : Person) (ch : Charge) (c : ComplaintText) : Prop




axiom CivilActionFiledWithinNinetyDays (i : Person) (c : ComplaintText) : Prop




axiom RefusedOrDischargedForReasonOtherThanDiscrimination (i : Person) (c : ComplaintText) : Prop




axiom OrderedAdmissionReinstatementOrBackPay (o : AdjudicativeOrder) (i : Person) (c : ComplaintText) : Prop




axiom SameActionAbsentImpermissibleFactor (p : Person) (prac : EmploymentPractice) (c : ComplaintText) : Prop




axiom AwardedDamagesOrMandatoryRelief (o : AdjudicativeOrder) (i : Person) (c : ComplaintText) : Prop




axiom IsPrevailingParty (i : Person) (c : ComplaintText) : Prop




axiom IsAttorneyGeneral (p : Person) (c : ComplaintText) : Prop




axiom PatternOrPracticeOfResistance (p : Person) (c : ComplaintText) : Prop




axiom AttorneyGeneralReasonableCause (c : ComplaintText) : Prop




axiom StateLawRequiresOrPermitsUnlawfulPractice (l : StateOrLocalLaw) (c : ComplaintText) : Prop




axiom HadAccessToAndCopiedRelevantEvidence (ch : Charge) (c : ComplaintText) : Prop




axiom MadeAndKeptRequiredRecords (p : Person) (r : EmploymentRecord) (c : ComplaintText) : Prop




axiom MadePublicInvestigativeInformation (p : Person) (info : Information) (c : ComplaintText) : Prop




axiom InformationObtainedUnderInvestigativeAuthority (info : Information) (c : ComplaintText) : Prop




axiom ProceedingInstituted (c : ComplaintText) : Prop




axiom CommissionHearingOrInvestigation (c : ComplaintText) : Prop




axiom PostedRequiredNotice (p : Person) (n : Notice) (c : ComplaintText) : Prop




axiom WillfulViolation (p : Person) (c : ComplaintText) : Prop




axiom VeteransPreferenceLaw (l : StateOrLocalLaw) (c : ComplaintText) : Prop




axiom IssuedConformingProceduralRegulation (reg : Regulation) (c : ComplaintText) : Prop




axiom GoodFaithRelianceOnCommissionInterpretation (p : Person) (c : ComplaintText) : Prop




axiom KilledCommissionPersonnelInPerformanceOfDuties (p : Person) (i : Person) (c : ComplaintText) : Prop




axiom IsPresident (p : Person) (c : ComplaintText) : Prop




axiom ConvenedEqualEmploymentConferences (c : ComplaintText) : Prop




axiom IsCoveredFederalEntity (p : Person) (c : ComplaintText) : Prop




axiom PersonnelActionAffectsIndividual (pa : PersonnelAction) (i : Person) (p : Person) (c : ComplaintText) : Prop




axiom PersonnelActionFreeFromDiscrimination (pa : PersonnelAction) (c : ComplaintText) : Prop




axiom ComplyWithCommissionRulesAndOrders (p : Person) (c : ComplaintText) : Prop




axiom FinalAgencyActionOrOneHundredEightyDaysElapsed (i : Person) (c : ComplaintText) : Prop




axiom IsCoveredGovernmentEmployee (i : Person) (c : ComplaintText) : Prop




axiom AwardedPunitiveDamages (o : AdjudicativeOrder) (c : ComplaintText) : Prop




axiom ComplaintFiledWithinOneHundredEightyDays (i : Person) (c : ComplaintText) : Prop




axiom IssuedFinalOrderOnComplaint (o : AdjudicativeOrder) (c : ComplaintText) : Prop




axiom FinalOrderArbitraryOrUnsupported (o : AdjudicativeOrder) (c : ComplaintText) : Prop




axiom SetAsideFinalOrder (o : AdjudicativeOrder) (c : ComplaintText) : Prop




axiom IsFederalAgencyOrOfficer (p : Person) (c : ComplaintText) : Prop




axiom DeniedOrTerminatedGovernmentContract (p : Person) (gk : GovernmentContract) (c : ComplaintText) : Prop




axiom AffirmativeActionPlanPreviouslyAccepted (pl : AffirmativeActionPlan) (c : ComplaintText) : Prop




axiom AccordedFullHearingAndAdjudication (p : Person) (c : ComplaintText) : Prop




axiom SubstantialDeviationFromPlan (p : Person) (pl : AffirmativeActionPlan) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21TitleVII.Deontic