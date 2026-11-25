











import Proving.USC.T42.Ch21TitleVII.Deontic.Types
import Proving.USC.T42.Ch21TitleVII.Deontic.Predicates
import Proving.USC.T42.Ch21TitleVII.Deontic.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Deontic

open Proving.USC.Common




theorem act2000e2a1_intro_hireOrDischarge {p i : Person} {c : ComplaintText}
    (h : FailedOrRefusedToHireOrDischarged p i c) : Act2000e2a1 p i c := Or.inl h



theorem act2000e2a1_intro_terms {p i : Person} {c : ComplaintText}
    (h : DiscriminatedInCompensationTermsOrConditions p i c) : Act2000e2a1 p i c := Or.inr h


theorem prohibition2000e2a1_intro {p i : Person} {t : ProtectedTrait} {c : ComplaintText}
    (hAddr : IsCoveredEmployer p c) (hTrait : IsProtectedTrait t c)
    (hCond : BecauseOfProtectedTrait p i t c) : Prohibition2000e2a1 p i t c :=
  ⟨hAddr, hTrait, hCond⟩


theorem prohibitionViolated2000e2a1_intro {p i : Person} {t : ProtectedTrait} {c : ComplaintText}
    (hAddr : IsCoveredEmployer p c) (hTrait : IsProtectedTrait t c)
    (hCond : BecauseOfProtectedTrait p i t c) (hAct : Act2000e2a1 p i c) :
    ProhibitionViolated2000e2a1 p i t c :=
  ⟨⟨hAddr, hTrait, hCond⟩, hAct⟩


theorem prohibition2000e2a2_intro {p i : Person} {t : ProtectedTrait} {c : ComplaintText}
    (hAddr : IsCoveredEmployer p c) (hTrait : IsProtectedTrait t c)
    (hCond : BecauseOfProtectedTrait p i t c) : Prohibition2000e2a2 p i t c :=
  ⟨hAddr, hTrait, hCond⟩


theorem prohibitionViolated2000e2a2_intro {p i : Person} {t : ProtectedTrait} {c : ComplaintText}
    (hAddr : IsCoveredEmployer p c) (hTrait : IsProtectedTrait t c)
    (hCond : BecauseOfProtectedTrait p i t c) (hAct : LimitedSegregatedOrClassifiedEmployees p i c) :
    ProhibitionViolated2000e2a2 p i t c :=
  ⟨⟨hAddr, hTrait, hCond⟩, hAct⟩




theorem act2000e2b_intro_refusal {p i : Person} {c : ComplaintText}
    (h : FailedOrRefusedToRefer p i c) : Act2000e2b p i c := Or.inl h


theorem act2000e2b_intro_classification {p i : Person} {c : ComplaintText}
    (h : ClassifiedOrReferredOnProhibitedBasis p i c) : Act2000e2b p i c := Or.inr h


theorem prohibition2000e2b_intro {p i : Person} {t : ProtectedTrait} {c : ComplaintText}
    (hAddr : IsCoveredEmploymentAgency p c) (hTrait : IsProtectedTrait t c)
    (hCond : BecauseOfProtectedTrait p i t c) : Prohibition2000e2b p i t c :=
  ⟨hAddr, hTrait, hCond⟩


theorem prohibitionViolated2000e2b_intro {p i : Person} {t : ProtectedTrait} {c : ComplaintText}
    (hAddr : IsCoveredEmploymentAgency p c) (hTrait : IsProtectedTrait t c)
    (hCond : BecauseOfProtectedTrait p i t c) (hAct : Act2000e2b p i c) :
    ProhibitionViolated2000e2b p i t c :=
  ⟨⟨hAddr, hTrait, hCond⟩, hAct⟩




theorem prohibition2000e2c1_intro {p i : Person} {t : ProtectedTrait} {c : ComplaintText}
    (hAddr : IsCoveredLaborOrganization p c) (hTrait : IsProtectedTrait t c)
    (hCond : BecauseOfProtectedTrait p i t c) : Prohibition2000e2c1 p i t c :=
  ⟨hAddr, hTrait, hCond⟩


theorem prohibitionViolated2000e2c1_intro {p i : Person} {t : ProtectedTrait} {c : ComplaintText}
    (hAddr : IsCoveredLaborOrganization p c) (hTrait : IsProtectedTrait t c)
    (hCond : BecauseOfProtectedTrait p i t c) (hAct : ExcludedOrExpelledFromMembership p i c) :
    ProhibitionViolated2000e2c1 p i t c :=
  ⟨⟨hAddr, hTrait, hCond⟩, hAct⟩


theorem prohibition2000e2c2_intro {p i : Person} {t : ProtectedTrait} {c : ComplaintText}
    (hAddr : IsCoveredLaborOrganization p c) (hTrait : IsProtectedTrait t c)
    (hCond : BecauseOfProtectedTrait p i t c) : Prohibition2000e2c2 p i t c :=
  ⟨hAddr, hTrait, hCond⟩


theorem prohibitionViolated2000e2c2_intro {p i : Person} {t : ProtectedTrait} {c : ComplaintText}
    (hAddr : IsCoveredLaborOrganization p c) (hTrait : IsProtectedTrait t c)
    (hCond : BecauseOfProtectedTrait p i t c) (hAct : LimitedSegregatedOrClassifiedMembership p i c) :
    ProhibitionViolated2000e2c2 p i t c :=
  ⟨⟨hAddr, hTrait, hCond⟩, hAct⟩


theorem prohibition2000e2c3_intro {p q i : Person} {t : ProtectedTrait} {c : ComplaintText}
    (hAddr : IsCoveredLaborOrganization p c) (hEmployer : IsCoveredEmployer q c)
    (hTrait : IsProtectedTrait t c) (hCond : BecauseOfProtectedTrait q i t c) :
    Prohibition2000e2c3 p q i t c :=
  ⟨hAddr, hEmployer, hTrait, hCond⟩


theorem prohibitionViolated2000e2c3_intro {p q i : Person} {t : ProtectedTrait} {c : ComplaintText}
    (hAddr : IsCoveredLaborOrganization p c) (hEmployer : IsCoveredEmployer q c)
    (hTrait : IsProtectedTrait t c) (hCond : BecauseOfProtectedTrait q i t c)
    (hAct : CausedOrAttemptedToCauseEmployerDiscrimination p q i c) :
    ProhibitionViolated2000e2c3 p q i t c :=
  ⟨⟨hAddr, hEmployer, hTrait, hCond⟩, hAct⟩




theorem prohibition2000e2d_intro {p i : Person} {t : ProtectedTrait} {c : ComplaintText}
    (hAddr : Addressee2000e2d p c) (hTrait : IsProtectedTrait t c)
    (hCond : BecauseOfProtectedTrait p i t c) : Prohibition2000e2d p i t c :=
  ⟨hAddr, hTrait, hCond⟩


theorem prohibitionViolated2000e2d_intro {p i : Person} {t : ProtectedTrait}
    {tp : TrainingProgram} {c : ComplaintText}
    (hAddr : Addressee2000e2d p c) (hTrait : IsProtectedTrait t c)
    (hCond : BecauseOfProtectedTrait p i t c)
    (hAct : DiscriminatedInTrainingAdmissionOrEmployment p i tp c) :
    ProhibitionViolated2000e2d p i t tp c :=
  ⟨⟨hAddr, hTrait, hCond⟩, hAct⟩




theorem unlawfulPracticeDisparateImpact2000e2k_intro_impact {p : Person}
    {prac : EmploymentPractice} {t : ProtectedTrait} {c : ComplaintText}
    (hAddr : IsRespondent p c) (hTrait : IsProtectedTrait t c)
    (hUse : UsedParticularEmploymentPractice p prac c)
    (hImpact : CausesDisparateImpact prac t c)
    (hUnjustified : ¬ JobRelatedAndConsistentWithBusinessNecessity prac c) :
    UnlawfulPracticeDisparateImpact2000e2k p prac t c :=
  .impactUnjustified hAddr hTrait hUse hImpact hUnjustified


theorem unlawfulPracticeDisparateImpact2000e2k_intro_alternative {p : Person}
    {prac : EmploymentPractice} {t : ProtectedTrait} {c : ComplaintText}
    (hAddr : IsRespondent p c) (hTrait : IsProtectedTrait t c)
    (hRefusal : RefusedAlternativeEmploymentPractice p prac c) :
    UnlawfulPracticeDisparateImpact2000e2k p prac t c :=
  .refusedAlternative hAddr hTrait hRefusal


theorem prohibition2000e2l_intro {p : Person} {t : ProtectedTrait} {c : ComplaintText}
    (hAddr : IsRespondent p c) (hTrait : IsProtectedTrait t c) : Prohibition2000e2l p t c :=
  ⟨hAddr, hTrait⟩


theorem prohibitionViolated2000e2l_intro {p : Person} {tst : EmploymentTest} {t : ProtectedTrait}
    {c : ComplaintText} (hAddr : IsRespondent p c) (hTrait : IsProtectedTrait t c)
    (hAct : AdjustedScoresOrAlteredTestResults p tst c) : ProhibitionViolated2000e2l p tst t c :=
  ⟨⟨hAddr, hTrait⟩, hAct⟩


theorem unlawfulPracticeEstablished2000e2m_intro {p : Person} {prac : EmploymentPractice}
    {t : ProtectedTrait} {c : ComplaintText} (hAddr : IsRespondent p c)
    (hTrait : IsProtectedTrait t c) (hMotive : MotivatingFactor t prac c) :
    UnlawfulPracticeEstablished2000e2m p prac t c :=
  ⟨hAddr, hTrait, hMotive⟩


theorem preclusionCondition2000e2n_intro_notice {i : Person} {j : ConsentJudgment}
    {c : ComplaintText} (h : HadNoticeAndOpportunityToObject i j c) :
    PreclusionCondition2000e2n i j c := .noticedObjector h


theorem preclusionCondition2000e2n_intro_represented {i : Person} {j : ConsentJudgment}
    {c : ComplaintText} (h : InterestsAdequatelyRepresented i j c) :
    PreclusionCondition2000e2n i j c := .adequatelyRepresented h


theorem prohibition2000e2n_intro {i : Person} {prac : EmploymentPractice} {j : ConsentJudgment}
    {c : ComplaintText} (hScope : PracticeImplementsConsentJudgment prac j c)
    (hCond : PreclusionCondition2000e2n i j c) : Prohibition2000e2n i prac j c :=
  ⟨hScope, hCond⟩


theorem prohibitionViolated2000e2n_intro {i : Person} {prac : EmploymentPractice}
    {j : ConsentJudgment} {c : ComplaintText}
    (hScope : PracticeImplementsConsentJudgment prac j c)
    (hCond : PreclusionCondition2000e2n i j c)
    (hAct : ChallengedConsentJudgmentPractice i prac c) : ProhibitionViolated2000e2n i prac j c :=
  ⟨⟨hScope, hCond⟩, hAct⟩




theorem protectedActivity2000e3a_intro_opposition {i : Person} {c : ComplaintText}
    (h : OpposedUnlawfulEmploymentPractice i c) : ProtectedActivity2000e3a i c := Or.inl h


theorem protectedActivity2000e3a_intro_participation {i : Person} {c : ComplaintText}
    (h : ParticipatedInTitleVIIProceeding i c) : ProtectedActivity2000e3a i c := Or.inr h


theorem prohibition2000e3a_intro {p i : Person} {c : ComplaintText}
    (hAddr : Addressee2000e3 p c) (hCond : ProtectedActivity2000e3a i c) :
    Prohibition2000e3a p i c := ⟨hAddr, hCond⟩


theorem prohibitionViolated2000e3a_intro {p i : Person} {c : ComplaintText}
    (hAddr : Addressee2000e3 p c) (hCond : ProtectedActivity2000e3a i c)
    (hAct : DiscriminatedAgainstForProtectedActivity p i c) : ProhibitionViolated2000e3a p i c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition2000e3b_intro {p : Person} {n : Notice} {t : ProtectedTrait}
    {c : ComplaintText} (hAddr : Addressee2000e3 p c) (hTrait : IsProtectedTrait t c)
    (hCond : NoticeIndicatesProhibitedPreference n t c)
    (hNoBfoq : ¬ BonaFideOccupationalQualification t p c) : Prohibition2000e3b p n t c :=
  ⟨hAddr, hTrait, hCond, hNoBfoq⟩


theorem prohibitionViolated2000e3b_intro {p : Person} {n : Notice} {t : ProtectedTrait}
    {c : ComplaintText} (hAddr : Addressee2000e3 p c) (hTrait : IsProtectedTrait t c)
    (hCond : NoticeIndicatesProhibitedPreference n t c)
    (hNoBfoq : ¬ BonaFideOccupationalQualification t p c)
    (hAct : PrintedOrPublishedNotice p n c) : ProhibitionViolated2000e3b p n t c :=
  ⟨⟨hAddr, hTrait, hCond, hNoBfoq⟩, hAct⟩




theorem immunity2000e12b_intro {p : Person} {c : ComplaintText}
    (h : GoodFaithRelianceOnCommissionInterpretation p c) : Immunity2000e12b p c := h


theorem practiceAttributedToEmployer2000e1c1_intro {p q : Person} {c : ComplaintText}
    (h : EmployerControlsForeignCorporation p q c) :
    PracticeAttributedToEmployer2000e1c1 p q c := h


theorem undefeatedViolation2000e2a1_intro {p i : Person} {t : ProtectedTrait}
    {tst : EmploymentTest} {s : SeniorityOrMeritSystem} {c : ComplaintText}
    (hViolation : ProhibitionViolated2000e2a1 p i t c) (hNotExempt : ¬ Exempt2000e1 p i c)
    (hNoDefense : ¬ Defense2000e2 p i t tst s c) (hNoImmunity : ¬ Immunity2000e12b p c) :
    UndefeatedViolation2000e2a1 p i t tst s c :=
  ⟨hViolation, hNotExempt, hNoDefense, hNoImmunity⟩


theorem permission2000e2j_intro {p : Person} {c : ComplaintText} (hAddr : IsRespondent p c)
    (hCond : ImbalanceInWorkforceComposition p c) : Permission2000e2j p c := ⟨hAddr, hCond⟩




theorem obligation2000e14_intro {p : Person} {c : ComplaintText} (hAddr : IsCommission p c) :
    Obligation2000e14 p c := ⟨hAddr⟩


theorem obligationBreached2000e14_intro {p : Person} {c : ComplaintText}
    (hAddr : IsCommission p c) (hOmission : ¬ TransmittedAnnualReportToCongressAndPresident c) :
    ObligationBreached2000e14 p c := ⟨⟨hAddr⟩, hOmission⟩


theorem obligation2000e4j1_intro {p : Person} {c : ComplaintText} (hAddr : IsCommission p c) :
    Obligation2000e4j1 p c := ⟨hAddr⟩


theorem obligationBreached2000e4j1_intro {p : Person} {c : ComplaintText}
    (hAddr : IsCommission p c) (hOmission : ¬ EstablishedTechnicalAssistanceTrainingInstitute c) :
    ObligationBreached2000e4j1 p c := ⟨⟨hAddr⟩, hOmission⟩


theorem complianceNotExcused2000e4j2_intro {p : Person} {c : ComplaintText}
    (hAddr : IsRespondent p c) (hCond : FailedToReceiveTechnicalAssistance p c) :
    ComplianceNotExcused2000e4j2 p c := ⟨hAddr, hCond⟩




theorem power2000e5a_intro {p q : Person} {c : ComplaintText} (hAddr : IsCommission p c)
    (hSubject : IsStatutoryPerson q c) : Power2000e5a p q c := ⟨hAddr, hSubject⟩


theorem obligation2000e5bNotice_intro {p i : Person} {ch : Charge} {c : ComplaintText}
    (hAddr : IsCommission p c) (hCond : FiledChargeWithCommission i ch c) :
    Obligation2000e5bNotice p i ch c := ⟨hAddr, hCond⟩


theorem obligationBreached2000e5bNotice_intro {p i : Person} {ch : Charge} {c : ComplaintText}
    (hAddr : IsCommission p c) (hCond : FiledChargeWithCommission i ch c)
    (hOmission : ¬ (ServedNoticeOfChargeWithinTenDays ch c ∧ InvestigatedCharge ch c)) :
    ObligationBreached2000e5bNotice p i ch c := ⟨⟨hAddr, hCond⟩, hOmission⟩


theorem obligation2000e5bConciliation_intro {p : Person} {ch : Charge} {c : ComplaintText}
    (hAddr : IsCommission p c) (hCond : ReasonableCauseDetermined ch c) :
    Obligation2000e5bConciliation p ch c := ⟨hAddr, hCond⟩


theorem obligationBreached2000e5bConciliation_intro {p : Person} {ch : Charge} {c : ComplaintText}
    (hAddr : IsCommission p c) (hCond : ReasonableCauseDetermined ch c)
    (hOmission : ¬ EndeavoredConciliationByInformalMethods ch c) :
    ObligationBreached2000e5bConciliation p ch c := ⟨⟨hAddr, hCond⟩, hOmission⟩


theorem prohibition2000e5bPublicity_intro {p : Person} {c : ComplaintText}
    (hAddr : Addressee2000e5bPublicity p c) : Prohibition2000e5bPublicity p c := ⟨hAddr⟩


theorem prohibitionViolated2000e5bPublicity_intro {p : Person} {ch : Charge} {c : ComplaintText}
    (hAddr : Addressee2000e5bPublicity p c)
    (hAct : MadePublicChargeOrConciliationCommunication p ch c) :
    ProhibitionViolated2000e5bPublicity p ch c := ⟨⟨hAddr⟩, hAct⟩


theorem prohibition2000e5c_intro {i : Person} {ch : Charge} {l : StateOrLocalLaw}
    {c : ComplaintText} (hAddr : IsComplainingParty i c)
    (hJurisdiction : StateOrLocalLawProhibitsThePractice l c)
    (hCond : ¬ StateOrLocalDeferralPeriodElapsed ch l c) : Prohibition2000e5c i ch l c :=
  ⟨hAddr, hJurisdiction, hCond⟩


theorem prohibitionViolated2000e5c_intro {i : Person} {ch : Charge} {l : StateOrLocalLaw}
    {c : ComplaintText} (hAddr : IsComplainingParty i c)
    (hJurisdiction : StateOrLocalLawProhibitsThePractice l c)
    (hCond : ¬ StateOrLocalDeferralPeriodElapsed ch l c)
    (hAct : FiledChargeWithCommission i ch c) : ProhibitionViolated2000e5c i ch l c :=
  ⟨⟨hAddr, hJurisdiction, hCond⟩, hAct⟩


theorem power2000e5f1Commission_intro {p : Person} {ch : Charge} {c : ComplaintText}
    (hAddr : IsCommission p c) (hCond : ConciliationAgreementNotSecured ch c) :
    Power2000e5f1Commission p ch c := ⟨hAddr, hCond⟩


theorem permission2000e5f1Private_intro {i : Person} {ch : Charge} {c : ComplaintText}
    (hAddr : IsComplainingParty i c) (hTimely : ChargeFiledWithinLimitationsPeriod ch c)
    (hNotice : RightToSueNoticeGiven i ch c) (hWindow : CivilActionFiledWithinNinetyDays i c) :
    Permission2000e5f1Private i ch c := ⟨hAddr, hTimely, hNotice, hWindow⟩


theorem prohibition2000e5g2A_intro {i : Person} {c : ComplaintText}
    (hCond : RefusedOrDischargedForReasonOtherThanDiscrimination i c) :
    Prohibition2000e5g2A i c := ⟨hCond⟩


theorem prohibitionViolated2000e5g2A_intro {o : AdjudicativeOrder} {i : Person}
    {c : ComplaintText} (hCond : RefusedOrDischargedForReasonOtherThanDiscrimination i c)
    (hAct : OrderedAdmissionReinstatementOrBackPay o i c) :
    ProhibitionViolated2000e5g2A o i c := ⟨⟨hCond⟩, hAct⟩


theorem prohibition2000e5g2Bii_intro {p : Person} {prac : EmploymentPractice}
    {t : ProtectedTrait} {c : ComplaintText}
    (hEstablished : UnlawfulPracticeEstablished2000e2m p prac t c)
    (hSame : SameActionAbsentImpermissibleFactor p prac c) : Prohibition2000e5g2Bii p prac t c :=
  ⟨hEstablished, hSame⟩


theorem prohibitionViolated2000e5g2Bii_intro {o : AdjudicativeOrder} {p i : Person}
    {prac : EmploymentPractice} {t : ProtectedTrait} {c : ComplaintText}
    (hEstablished : UnlawfulPracticeEstablished2000e2m p prac t c)
    (hSame : SameActionAbsentImpermissibleFactor p prac c)
    (hAct : AwardedDamagesOrMandatoryRelief o i c) :
    ProhibitionViolated2000e5g2Bii o p i prac t c := ⟨⟨hEstablished, hSame⟩, hAct⟩


theorem permission2000e5k_intro {i : Person} {c : ComplaintText} (hCond : IsPrevailingParty i c) :
    Permission2000e5k i c := ⟨hCond⟩




theorem power2000e6a_intro {p q : Person} {c : ComplaintText} (hAddr : IsAttorneyGeneral p c)
    (hCause : AttorneyGeneralReasonableCause c) (hCond : PatternOrPracticeOfResistance q c) :
    Power2000e6a p q c := ⟨hAddr, hCause, hCond⟩


theorem stateLawPreserved2000e7_intro {l : StateOrLocalLaw} {c : ComplaintText}
    (h : ¬ StateLawRequiresOrPermitsUnlawfulPractice l c) : StateLawPreserved2000e7 l c := h


theorem stateLawNotPreserved2000e7_intro {l : StateOrLocalLaw} {c : ComplaintText}
    (h : StateLawRequiresOrPermitsUnlawfulPractice l c) : StateLawNotPreserved2000e7 l c := h




theorem power2000e8a_intro {p i : Person} {ch : Charge} {c : ComplaintText}
    (hAddr : IsCommission p c) (hCond : FiledChargeWithCommission i ch c) :
    Power2000e8a p i ch c := ⟨hAddr, hCond⟩


theorem powerExercised2000e8a_intro {p i : Person} {ch : Charge} {c : ComplaintText}
    (hAddr : IsCommission p c) (hCond : FiledChargeWithCommission i ch c)
    (hAct : HadAccessToAndCopiedRelevantEvidence ch c) : PowerExercised2000e8a p i ch c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation2000e8c_intro {p : Person} {c : ComplaintText}
    (hAddr : Addressee2000e8c p c) : Obligation2000e8c p c := ⟨hAddr⟩


theorem obligationBreached2000e8c_intro {p : Person} {r : EmploymentRecord} {c : ComplaintText}
    (hAddr : Addressee2000e8c p c) (hOmission : ¬ MadeAndKeptRequiredRecords p r c) :
    ObligationBreached2000e8c p r c := ⟨⟨hAddr⟩, hOmission⟩


theorem prohibition2000e8e_intro {p : Person} {info : Information} {c : ComplaintText}
    (hAddr : IsCommissionOfficerOrEmployee p c)
    (hProvenance : InformationObtainedUnderInvestigativeAuthority info c)
    (hCond : ¬ ProceedingInstituted c) : Prohibition2000e8e p info c :=
  ⟨hAddr, hProvenance, hCond⟩


theorem prohibitionViolated2000e8e_intro {p : Person} {info : Information} {c : ComplaintText}
    (hAddr : IsCommissionOfficerOrEmployee p c)
    (hProvenance : InformationObtainedUnderInvestigativeAuthority info c)
    (hCond : ¬ ProceedingInstituted c) (hAct : MadePublicInvestigativeInformation p info c) :
    ProhibitionViolated2000e8e p info c := ⟨⟨hAddr, hProvenance, hCond⟩, hAct⟩


theorem power2000e9_intro {p : Person} {c : ComplaintText} (hAddr : IsCommission p c)
    (hCond : CommissionHearingOrInvestigation c) : Power2000e9 p c := ⟨hAddr, hCond⟩




theorem obligation2000e10a_intro {p : Person} {c : ComplaintText}
    (hAddr : Addressee2000e8c p c) : Obligation2000e10a p c := ⟨hAddr⟩


theorem obligationBreached2000e10a_intro {p : Person} {n : Notice} {c : ComplaintText}
    (hAddr : Addressee2000e8c p c) (hOmission : ¬ PostedRequiredNotice p n c) :
    ObligationBreached2000e10a p n c := ⟨⟨hAddr⟩, hOmission⟩


theorem punishableViolation2000e10b_intro {p : Person} {n : Notice} {c : ComplaintText}
    (hBreach : ObligationBreached2000e10a p n c) (hWillful : WillfulViolation p c) :
    PunishableViolation2000e10b p n c := ⟨hBreach, hWillful⟩


theorem veteransPreferenceUnmodified2000e11_intro {l : StateOrLocalLaw} {c : ComplaintText}
    (h : VeteransPreferenceLaw l c) : VeteransPreferenceUnmodified2000e11 l c := h


theorem power2000e12a_intro {p : Person} {c : ComplaintText} (hAddr : IsCommission p c) :
    Power2000e12a p c := ⟨hAddr⟩


theorem powerExercised2000e12a_intro {p : Person} {reg : Regulation} {c : ComplaintText}
    (hAddr : IsCommission p c) (hAct : IssuedConformingProceduralRegulation reg c) :
    PowerExercised2000e12a p reg c := ⟨⟨hAddr⟩, hAct⟩


theorem prohibition2000e13_intro {i : Person} {c : ComplaintText}
    (hVictim : IsCommissionOfficerOrEmployee i c) : Prohibition2000e13 i c := ⟨hVictim⟩


theorem prohibitionViolated2000e13_intro {p i : Person} {c : ComplaintText}
    (hVictim : IsCommissionOfficerOrEmployee i c)
    (hAct : KilledCommissionPersonnelInPerformanceOfDuties p i c) :
    ProhibitionViolated2000e13 p i c := ⟨⟨hVictim⟩, hAct⟩


theorem obligation2000e15_intro {p : Person} {c : ComplaintText} (hAddr : IsPresident p c) :
    Obligation2000e15 p c := ⟨hAddr⟩


theorem obligationBreached2000e15_intro {p : Person} {c : ComplaintText}
    (hAddr : IsPresident p c) (hOmission : ¬ ConvenedEqualEmploymentConferences c) :
    ObligationBreached2000e15 p c := ⟨⟨hAddr⟩, hOmission⟩




theorem obligation2000e16a_intro {p i : Person} {pa : PersonnelAction} {c : ComplaintText}
    (hAddr : IsCoveredFederalEntity p c) (hCond : PersonnelActionAffectsIndividual pa i p c) :
    Obligation2000e16a p i pa c := ⟨hAddr, hCond⟩


theorem obligationBreached2000e16a_intro {p i : Person} {pa : PersonnelAction}
    {c : ComplaintText} (hAddr : IsCoveredFederalEntity p c)
    (hCond : PersonnelActionAffectsIndividual pa i p c)
    (hOmission : ¬ PersonnelActionFreeFromDiscrimination pa c) :
    ObligationBreached2000e16a p i pa c := ⟨⟨hAddr, hCond⟩, hOmission⟩


theorem obligation2000e16b_intro {p : Person} {c : ComplaintText}
    (hAddr : IsCoveredFederalEntity p c) : Obligation2000e16b p c := ⟨hAddr⟩


theorem obligationBreached2000e16b_intro {p : Person} {c : ComplaintText}
    (hAddr : IsCoveredFederalEntity p c)
    (hOmission : ¬ ComplyWithCommissionRulesAndOrders p c) : ObligationBreached2000e16b p c :=
  ⟨⟨hAddr⟩, hOmission⟩


theorem permission2000e16c_intro {i : Person} {c : ComplaintText}
    (hRipe : FinalAgencyActionOrOneHundredEightyDaysElapsed i c)
    (hWindow : CivilActionFiledWithinNinetyDays i c) : Permission2000e16c i c := ⟨hRipe, hWindow⟩


theorem obligation2000e16ba_intro {p i : Person} {pa : PersonnelAction} {c : ComplaintText}
    (hBeneficiary : IsCoveredGovernmentEmployee i c)
    (hCond : PersonnelActionAffectsIndividual pa i p c) : Obligation2000e16ba p i pa c :=
  ⟨hBeneficiary, hCond⟩


theorem obligationBreached2000e16ba_intro {p i : Person} {pa : PersonnelAction}
    {c : ComplaintText} (hBeneficiary : IsCoveredGovernmentEmployee i c)
    (hCond : PersonnelActionAffectsIndividual pa i p c)
    (hOmission : ¬ PersonnelActionFreeFromDiscrimination pa c) :
    ObligationBreached2000e16ba p i pa c := ⟨⟨hBeneficiary, hCond⟩, hOmission⟩


theorem prohibition2000e16bb3_intro {i : Person} {c : ComplaintText}
    (hBeneficiary : IsCoveredGovernmentEmployee i c) : Prohibition2000e16bb3 i c :=
  ⟨hBeneficiary⟩


theorem prohibitionViolated2000e16bb3_intro {o : AdjudicativeOrder} {i : Person}
    {c : ComplaintText} (hBeneficiary : IsCoveredGovernmentEmployee i c)
    (hAct : AwardedPunitiveDamages o c) : ProhibitionViolated2000e16bb3 o i c :=
  ⟨⟨hBeneficiary⟩, hAct⟩


theorem permission2000e16cb1_intro {i : Person} {c : ComplaintText}
    (hBeneficiary : IsCoveredGovernmentEmployee i c)
    (hWindow : ComplaintFiledWithinOneHundredEightyDays i c) : Permission2000e16cb1 i c :=
  ⟨hBeneficiary, hWindow⟩


theorem obligation2000e16cb1_intro {p i : Person} {c : ComplaintText}
    (hAddr : IsCommission p c) (hCond : ComplaintFiledWithinOneHundredEightyDays i c) :
    Obligation2000e16cb1 p i c := ⟨hAddr, hCond⟩


theorem obligationBreached2000e16cb1_intro {p i : Person} {o : AdjudicativeOrder}
    {c : ComplaintText} (hAddr : IsCommission p c)
    (hCond : ComplaintFiledWithinOneHundredEightyDays i c)
    (hOmission : ¬ IssuedFinalOrderOnComplaint o c) : ObligationBreached2000e16cb1 p i o c :=
  ⟨⟨hAddr, hCond⟩, hOmission⟩


theorem obligation2000e16cd_intro {o : AdjudicativeOrder} {c : ComplaintText}
    (hCond : FinalOrderArbitraryOrUnsupported o c) : Obligation2000e16cd o c := ⟨hCond⟩


theorem obligationBreached2000e16cd_intro {o : AdjudicativeOrder} {c : ComplaintText}
    (hCond : FinalOrderArbitraryOrUnsupported o c) (hOmission : ¬ SetAsideFinalOrder o c) :
    ObligationBreached2000e16cd o c := ⟨⟨hCond⟩, hOmission⟩




theorem prohibition2000e17_intro {p q : Person} {pl : AffirmativeActionPlan} {c : ComplaintText}
    (hAddr : IsFederalAgencyOrOfficer p c)
    (hPlan : AffirmativeActionPlanPreviouslyAccepted pl c)
    (hNoHearing : ¬ AccordedFullHearingAndAdjudication q c)
    (hNoDeviation : ¬ SubstantialDeviationFromPlan q pl c) : Prohibition2000e17 p q pl c :=
  ⟨hAddr, hPlan, hNoHearing, hNoDeviation⟩


theorem prohibitionViolated2000e17_intro {p q : Person} {pl : AffirmativeActionPlan}
    {gk : GovernmentContract} {c : ComplaintText} (hAddr : IsFederalAgencyOrOfficer p c)
    (hPlan : AffirmativeActionPlanPreviouslyAccepted pl c)
    (hNoHearing : ¬ AccordedFullHearingAndAdjudication q c)
    (hNoDeviation : ¬ SubstantialDeviationFromPlan q pl c)
    (hAct : DeniedOrTerminatedGovernmentContract p gk c) :
    ProhibitionViolated2000e17 p q pl gk c :=
  ⟨⟨hAddr, hPlan, hNoHearing, hNoDeviation⟩, hAct⟩




theorem unlawfulEmploymentPractice_intro {p i : Person} {t : ProtectedTrait} {c : ComplaintText}
    (h : ProhibitionViolated2000e2a1 p i t c) : UnlawfulEmploymentPractice p i t c :=
  .employerHireOrDischarge h


theorem unlawfulEmploymentPractice_intro_classification {p i : Person} {t : ProtectedTrait}
    {c : ComplaintText} (h : ProhibitionViolated2000e2a2 p i t c) :
    UnlawfulEmploymentPractice p i t c := .employerClassification h


theorem unlawfulEmploymentPractice_intro_agency {p i : Person} {t : ProtectedTrait}
    {c : ComplaintText} (h : ProhibitionViolated2000e2b p i t c) :
    UnlawfulEmploymentPractice p i t c := .agencyReferral h


theorem unlawfulEmploymentPractice_intro_membership {p i : Person} {t : ProtectedTrait}
    {c : ComplaintText} (h : ProhibitionViolated2000e2c1 p i t c) :
    UnlawfulEmploymentPractice p i t c := .laborOrganizationMembership h


theorem unlawfulEmploymentPractice_intro_membershipClassification {p i : Person}
    {t : ProtectedTrait} {c : ComplaintText} (h : ProhibitionViolated2000e2c2 p i t c) :
    UnlawfulEmploymentPractice p i t c := .laborOrganizationClassification h


theorem unlawfulEmploymentPractice_intro_causation {p q i : Person} {t : ProtectedTrait}
    {c : ComplaintText} (h : ProhibitionViolated2000e2c3 p q i t c) :
    UnlawfulEmploymentPractice p i t c := .laborOrganizationCausation q h


theorem unlawfulEmploymentPractice_intro_training {p i : Person} {t : ProtectedTrait}
    {tp : TrainingProgram} {c : ComplaintText} (h : ProhibitionViolated2000e2d p i t tp c) :
    UnlawfulEmploymentPractice p i t c := .trainingProgram tp h


theorem unlawfulEmploymentPractice_intro_disparateImpact {p i : Person} {t : ProtectedTrait}
    {prac : EmploymentPractice} {c : ComplaintText}
    (h : UnlawfulPracticeDisparateImpact2000e2k p prac t c) :
    UnlawfulEmploymentPractice p i t c := .disparateImpact prac h


theorem unlawfulEmploymentPractice_intro_testScores {p i : Person} {t : ProtectedTrait}
    {tst : EmploymentTest} {c : ComplaintText} (h : ProhibitionViolated2000e2l p tst t c) :
    UnlawfulEmploymentPractice p i t c := .testScoreAlteration tst h


theorem unlawfulEmploymentPractice_intro_motivatingFactor {p i : Person} {t : ProtectedTrait}
    {prac : EmploymentPractice} {c : ComplaintText}
    (h : UnlawfulPracticeEstablished2000e2m p prac t c) : UnlawfulEmploymentPractice p i t c :=
  .motivatingFactor prac h


theorem unlawfulEmploymentPractice_intro_retaliation {p i : Person} {t : ProtectedTrait}
    {c : ComplaintText} (h : ProhibitionViolated2000e3a p i c) :
    UnlawfulEmploymentPractice p i t c := .retaliation h


theorem unlawfulEmploymentPractice_intro_advertisement {p i : Person} {t : ProtectedTrait}
    {n : Notice} {c : ComplaintText} (h : ProhibitionViolated2000e3b p n t c) :
    UnlawfulEmploymentPractice p i t c := .discriminatoryAdvertisement n h


theorem unlawfulEmploymentPractice_intro_federal {p i : Person} {t : ProtectedTrait}
    {pa : PersonnelAction} {c : ComplaintText} (h : ObligationBreached2000e16a p i pa c) :
    UnlawfulEmploymentPractice p i t c := .federalPersonnelAction pa h


theorem unlawfulEmploymentPractice_intro_governmentEmployee {p i : Person} {t : ProtectedTrait}
    {pa : PersonnelAction} {c : ComplaintText} (h : ObligationBreached2000e16ba p i pa c) :
    UnlawfulEmploymentPractice p i t c := .governmentEmployeePersonnelAction pa h


theorem commissionDeonticFailure_intro {p i : Person} {ch : Charge} {c : ComplaintText}
    (h : ObligationBreached2000e5bNotice p i ch c) : CommissionDeonticFailure p c :=
  .noticeOrInvestigation i ch h


theorem commissionDeonticFailure_intro_conciliation {p : Person} {ch : Charge}
    {c : ComplaintText} (h : ObligationBreached2000e5bConciliation p ch c) :
    CommissionDeonticFailure p c := .conciliation ch h


theorem commissionDeonticFailure_intro_chargePublicity {p : Person} {ch : Charge}
    {c : ComplaintText} (h : ProhibitionViolated2000e5bPublicity p ch c) :
    CommissionDeonticFailure p c := .chargePublicity ch h


theorem commissionDeonticFailure_intro_investigativePublicity {p : Person} {info : Information}
    {c : ComplaintText} (h : ProhibitionViolated2000e8e p info c) :
    CommissionDeonticFailure p c := .investigativePublicity info h


theorem commissionDeonticFailure_intro_reporting {p : Person} {c : ComplaintText}
    (h : ObligationBreached2000e14 p c) : CommissionDeonticFailure p c := .reporting h


theorem commissionDeonticFailure_intro_institute {p : Person} {c : ComplaintText}
    (h : ObligationBreached2000e4j1 p c) : CommissionDeonticFailure p c :=
  .technicalAssistanceInstitute h


theorem commissionDeonticFailure_intro_finalOrder {p i : Person} {o : AdjudicativeOrder}
    {c : ComplaintText} (h : ObligationBreached2000e16cb1 p i o c) :
    CommissionDeonticFailure p c := .finalOrder i o h

end Proving.USC.T42.Ch21TitleVII.Deontic
