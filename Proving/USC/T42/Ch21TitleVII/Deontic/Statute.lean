
















import Proving.USC.T42.Ch21TitleVII.Deontic.Types
import Proving.USC.T42.Ch21TitleVII.Deontic.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Deontic

open Proving.USC.Common








def modality2000e : Modality := Modality.definition

def modality2000e16a : Modality := Modality.definition


def modality2000e2a1 : Modality := Modality.prohibition

def modality2000e2a2 : Modality := Modality.prohibition

def modality2000e2b : Modality := Modality.prohibition

def modality2000e2c1 : Modality := Modality.prohibition

def modality2000e2c2 : Modality := Modality.prohibition

def modality2000e2c3 : Modality := Modality.prohibition

def modality2000e2d : Modality := Modality.prohibition



def modality2000e2e : Modality := Modality.permission

def modality2000e2f : Modality := Modality.permission

def modality2000e2g : Modality := Modality.permission

def modality2000e2h : Modality := Modality.permission

def modality2000e2i : Modality := Modality.permission


def modality2000e2j : Modality := Modality.permission

def modality2000e2k : Modality := Modality.prohibition

def modality2000e2l : Modality := Modality.prohibition

def modality2000e2m : Modality := Modality.prohibition

def modality2000e2n : Modality := Modality.prohibition

def modality2000e1 : Modality := Modality.permission

def modality2000e3a : Modality := Modality.prohibition

def modality2000e3b : Modality := Modality.prohibition

def modality2000e4e : Modality := Modality.obligation

def modality2000e4j1 : Modality := Modality.obligation

def modality2000e4j2 : Modality := Modality.obligation

def modality2000e5a : Modality := Modality.power

def modality2000e5b : Modality := Modality.obligation

def modality2000e5bPublicity : Modality := Modality.prohibition

def modality2000e5c : Modality := Modality.prohibition

def modality2000e5f1Commission : Modality := Modality.power

def modality2000e5f1Private : Modality := Modality.permission

def modality2000e5g2A : Modality := Modality.prohibition

def modality2000e5g2Bii : Modality := Modality.prohibition

def modality2000e5k : Modality := Modality.permission

def modality2000e6a : Modality := Modality.power

def modality2000e7 : Modality := Modality.permission

def modality2000e8a : Modality := Modality.power

def modality2000e8c : Modality := Modality.obligation

def modality2000e8e : Modality := Modality.prohibition

def modality2000e9 : Modality := Modality.power

def modality2000e10a : Modality := Modality.obligation

def modality2000e11 : Modality := Modality.permission

def modality2000e12a : Modality := Modality.power

def modality2000e12b : Modality := Modality.permission

def modality2000e13 : Modality := Modality.prohibition

def modality2000e15 : Modality := Modality.obligation

def modality2000e16a_ : Modality := Modality.obligation

def modality2000e16b : Modality := Modality.obligation

def modality2000e16c : Modality := Modality.permission


def modality2000e16ba : Modality := Modality.obligation

def modality2000e16bb3 : Modality := Modality.prohibition

def modality2000e16cb1 : Modality := Modality.permission

def modality2000e16cd : Modality := Modality.obligation

def modality2000e17 : Modality := Modality.prohibition





def Addressee2000e2d (p : Person) (c : ComplaintText) : Prop :=
  IsCoveredEmployer p c ∨ IsCoveredLaborOrganization p c ∨ IsJointLaborManagementCommittee p c



def Addressee2000e3 (p : Person) (c : ComplaintText) : Prop :=
  IsCoveredEmployer p c ∨ IsCoveredEmploymentAgency p c ∨
    IsCoveredLaborOrganization p c ∨ IsJointLaborManagementCommittee p c



def Addressee2000e8c (p : Person) (c : ComplaintText) : Prop :=
  IsCoveredEmployer p c ∨ IsCoveredEmploymentAgency p c ∨ IsCoveredLaborOrganization p c


def Addressee2000e5bPublicity (p : Person) (c : ComplaintText) : Prop :=
  IsCommission p c ∨ IsCommissionOfficerOrEmployee p c





def Act2000e2a1 (p i : Person) (c : ComplaintText) : Prop :=
  FailedOrRefusedToHireOrDischarged p i c ∨ DiscriminatedInCompensationTermsOrConditions p i c


structure Prohibition2000e2a1 (p i : Person) (t : ProtectedTrait) (c : ComplaintText) : Prop where

  addressee : IsCoveredEmployer p c

  trait : IsProtectedTrait t c

  condition : BecauseOfProtectedTrait p i t c



def ProhibitionViolated2000e2a1 (p i : Person) (t : ProtectedTrait) (c : ComplaintText) : Prop :=
  Prohibition2000e2a1 p i t c ∧ Act2000e2a1 p i c


structure Prohibition2000e2a2 (p i : Person) (t : ProtectedTrait) (c : ComplaintText) : Prop where
  addressee : IsCoveredEmployer p c
  trait : IsProtectedTrait t c
  condition : BecauseOfProtectedTrait p i t c


def ProhibitionViolated2000e2a2 (p i : Person) (t : ProtectedTrait) (c : ComplaintText) : Prop :=
  Prohibition2000e2a2 p i t c ∧ LimitedSegregatedOrClassifiedEmployees p i c




def Act2000e2b (p i : Person) (c : ComplaintText) : Prop :=
  FailedOrRefusedToRefer p i c ∨ ClassifiedOrReferredOnProhibitedBasis p i c


structure Prohibition2000e2b (p i : Person) (t : ProtectedTrait) (c : ComplaintText) : Prop where
  addressee : IsCoveredEmploymentAgency p c
  trait : IsProtectedTrait t c
  condition : BecauseOfProtectedTrait p i t c


def ProhibitionViolated2000e2b (p i : Person) (t : ProtectedTrait) (c : ComplaintText) : Prop :=
  Prohibition2000e2b p i t c ∧ Act2000e2b p i c




structure Prohibition2000e2c1 (p i : Person) (t : ProtectedTrait) (c : ComplaintText) : Prop where
  addressee : IsCoveredLaborOrganization p c
  trait : IsProtectedTrait t c
  condition : BecauseOfProtectedTrait p i t c


def ProhibitionViolated2000e2c1 (p i : Person) (t : ProtectedTrait) (c : ComplaintText) : Prop :=
  Prohibition2000e2c1 p i t c ∧ ExcludedOrExpelledFromMembership p i c


structure Prohibition2000e2c2 (p i : Person) (t : ProtectedTrait) (c : ComplaintText) : Prop where
  addressee : IsCoveredLaborOrganization p c
  trait : IsProtectedTrait t c
  condition : BecauseOfProtectedTrait p i t c


def ProhibitionViolated2000e2c2 (p i : Person) (t : ProtectedTrait) (c : ComplaintText) : Prop :=
  Prohibition2000e2c2 p i t c ∧ LimitedSegregatedOrClassifiedMembership p i c



structure Prohibition2000e2c3 (p q i : Person) (t : ProtectedTrait) (c : ComplaintText) : Prop where
  addressee : IsCoveredLaborOrganization p c
  targetEmployer : IsCoveredEmployer q c
  trait : IsProtectedTrait t c
  condition : BecauseOfProtectedTrait q i t c


def ProhibitionViolated2000e2c3 (p q i : Person) (t : ProtectedTrait) (c : ComplaintText) : Prop :=
  Prohibition2000e2c3 p q i t c ∧ CausedOrAttemptedToCauseEmployerDiscrimination p q i c




structure Prohibition2000e2d (p i : Person) (t : ProtectedTrait) (c : ComplaintText) : Prop where
  addressee : Addressee2000e2d p c
  trait : IsProtectedTrait t c
  condition : BecauseOfProtectedTrait p i t c


def ProhibitionViolated2000e2d (p i : Person) (t : ProtectedTrait) (tp : TrainingProgram)
    (c : ComplaintText) : Prop :=
  Prohibition2000e2d p i t c ∧ DiscriminatedInTrainingAdmissionOrEmployment p i tp c






inductive UnlawfulPracticeDisparateImpact2000e2k (p : Person) (prac : EmploymentPractice)
    (t : ProtectedTrait) (c : ComplaintText) : Prop where


  | impactUnjustified (addressee : IsRespondent p c) (trait : IsProtectedTrait t c)
      (use : UsedParticularEmploymentPractice p prac c)
      (impact : CausesDisparateImpact prac t c)
      (unjustified : ¬ JobRelatedAndConsistentWithBusinessNecessity prac c)


  | refusedAlternative (addressee : IsRespondent p c) (trait : IsProtectedTrait t c)
      (refusal : RefusedAlternativeEmploymentPractice p prac c)




structure Prohibition2000e2l (p : Person) (t : ProtectedTrait) (c : ComplaintText) : Prop where
  addressee : IsRespondent p c
  trait : IsProtectedTrait t c



def ProhibitionViolated2000e2l (p : Person) (tst : EmploymentTest) (t : ProtectedTrait)
    (c : ComplaintText) : Prop :=
  Prohibition2000e2l p t c ∧ AdjustedScoresOrAlteredTestResults p tst c





def UnlawfulPracticeEstablished2000e2m (p : Person) (prac : EmploymentPractice)
    (t : ProtectedTrait) (c : ComplaintText) : Prop :=
  IsRespondent p c ∧ IsProtectedTrait t c ∧ MotivatingFactor t prac c




inductive PreclusionCondition2000e2n (i : Person) (j : ConsentJudgment) (c : ComplaintText) : Prop where


  | noticedObjector (h : HadNoticeAndOpportunityToObject i j c)


  | adequatelyRepresented (h : InterestsAdequatelyRepresented i j c)


structure Prohibition2000e2n (i : Person) (prac : EmploymentPractice) (j : ConsentJudgment)
    (c : ComplaintText) : Prop where

  scope : PracticeImplementsConsentJudgment prac j c

  condition : PreclusionCondition2000e2n i j c


def ProhibitionViolated2000e2n (i : Person) (prac : EmploymentPractice) (j : ConsentJudgment)
    (c : ComplaintText) : Prop :=
  Prohibition2000e2n i prac j c ∧ ChallengedConsentJudgmentPractice i prac c




def ProtectedActivity2000e3a (i : Person) (c : ComplaintText) : Prop :=
  OpposedUnlawfulEmploymentPractice i c ∨ ParticipatedInTitleVIIProceeding i c


structure Prohibition2000e3a (p i : Person) (c : ComplaintText) : Prop where
  addressee : Addressee2000e3 p c


  condition : ProtectedActivity2000e3a i c


def ProhibitionViolated2000e3a (p i : Person) (c : ComplaintText) : Prop :=
  Prohibition2000e3a p i c ∧ DiscriminatedAgainstForProtectedActivity p i c




structure Prohibition2000e3b (p : Person) (n : Notice) (t : ProtectedTrait)
    (c : ComplaintText) : Prop where
  addressee : Addressee2000e3 p c
  trait : IsProtectedTrait t c
  condition : NoticeIndicatesProhibitedPreference n t c
  noBonaFideQualification : ¬ BonaFideOccupationalQualification t p c


def ProhibitionViolated2000e3b (p : Person) (n : Notice) (t : ProtectedTrait)
    (c : ComplaintText) : Prop :=
  Prohibition2000e3b p n t c ∧ PrintedOrPublishedNotice p n c





def Exempt2000e1 (p i : Person) (c : ComplaintText) : Prop :=
  AliensEmployedOutsideAnyState p i c ∨ ReligiousOrganizationReligiousPreference p i c ∨
    ForeignLawComplianceConflict p c ∨ IsForeignPersonNotControlledByAmericanEmployer p c



def PracticeAttributedToEmployer2000e1c1 (p q : Person) (c : ComplaintText) : Prop :=
  EmployerControlsForeignCorporation p q c




def Defense2000e2 (p i : Person) (t : ProtectedTrait) (tst : EmploymentTest)
    (s : SeniorityOrMeritSystem) (c : ComplaintText) : Prop :=
  BonaFideOccupationalQualification t p c ∨
    CommunistOrganizationMembership i c ∨
    NationalSecurityRequirementUnfulfilled i c ∨
    (BonaFideSeniorityOrMeritSystem s c ∧ ¬ IntentionToDiscriminate p c) ∨
    (ProfessionallyDevelopedAbilityTest tst c ∧ ¬ IntentionToDiscriminate p c) ∨
    IndianReservationPreference p c




def Immunity2000e12b (p : Person) (c : ComplaintText) : Prop :=
  GoodFaithRelianceOnCommissionInterpretation p c


def UndefeatedViolation2000e2a1 (p i : Person) (t : ProtectedTrait) (tst : EmploymentTest)
    (s : SeniorityOrMeritSystem) (c : ComplaintText) : Prop :=
  ProhibitionViolated2000e2a1 p i t c ∧ ¬ Exempt2000e1 p i c ∧
    ¬ Defense2000e2 p i t tst s c ∧ ¬ Immunity2000e12b p c



structure Permission2000e2j (p : Person) (c : ComplaintText) : Prop where
  addressee : IsRespondent p c
  condition : ImbalanceInWorkforceComposition p c




structure Obligation2000e14 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsCommission p c


def ObligationBreached2000e14 (p : Person) (c : ComplaintText) : Prop :=
  Obligation2000e14 p c ∧ ¬ TransmittedAnnualReportToCongressAndPresident c


structure Obligation2000e4j1 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsCommission p c


def ObligationBreached2000e4j1 (p : Person) (c : ComplaintText) : Prop :=
  Obligation2000e4j1 p c ∧ ¬ EstablishedTechnicalAssistanceTrainingInstitute c



def ComplianceNotExcused2000e4j2 (p : Person) (c : ComplaintText) : Prop :=
  IsRespondent p c ∧ FailedToReceiveTechnicalAssistance p c





structure Power2000e5a (p q : Person) (c : ComplaintText) : Prop where
  addressee : IsCommission p c

  subject : IsStatutoryPerson q c



structure Obligation2000e5bNotice (p i : Person) (ch : Charge) (c : ComplaintText) : Prop where
  addressee : IsCommission p c
  condition : FiledChargeWithCommission i ch c


def ObligationBreached2000e5bNotice (p i : Person) (ch : Charge) (c : ComplaintText) : Prop :=
  Obligation2000e5bNotice p i ch c ∧
    ¬ (ServedNoticeOfChargeWithinTenDays ch c ∧ InvestigatedCharge ch c)



structure Obligation2000e5bConciliation (p : Person) (ch : Charge) (c : ComplaintText) : Prop where
  addressee : IsCommission p c
  condition : ReasonableCauseDetermined ch c


def ObligationBreached2000e5bConciliation (p : Person) (ch : Charge) (c : ComplaintText) : Prop :=
  Obligation2000e5bConciliation p ch c ∧ ¬ EndeavoredConciliationByInformalMethods ch c



structure Prohibition2000e5bPublicity (p : Person) (c : ComplaintText) : Prop where
  addressee : Addressee2000e5bPublicity p c


def ProhibitionViolated2000e5bPublicity (p : Person) (ch : Charge) (c : ComplaintText) : Prop :=
  Prohibition2000e5bPublicity p c ∧ MadePublicChargeOrConciliationCommunication p ch c








structure Prohibition2000e5c (i : Person) (ch : Charge) (l : StateOrLocalLaw)
    (c : ComplaintText) : Prop where
  addressee : IsComplainingParty i c

  deferralJurisdiction : StateOrLocalLawProhibitsThePractice l c

  condition : ¬ StateOrLocalDeferralPeriodElapsed ch l c


def ProhibitionViolated2000e5c (i : Person) (ch : Charge) (l : StateOrLocalLaw)
    (c : ComplaintText) : Prop :=
  Prohibition2000e5c i ch l c ∧ FiledChargeWithCommission i ch c


structure Power2000e5f1Commission (p : Person) (ch : Charge) (c : ComplaintText) : Prop where
  addressee : IsCommission p c
  condition : ConciliationAgreementNotSecured ch c


structure Permission2000e5f1Private (i : Person) (ch : Charge) (c : ComplaintText) : Prop where
  addressee : IsComplainingParty i c
  timelyCharge : ChargeFiledWithinLimitationsPeriod ch c
  notice : RightToSueNoticeGiven i ch c
  window : CivilActionFiledWithinNinetyDays i c




structure Prohibition2000e5g2A (i : Person) (c : ComplaintText) : Prop where
  condition : RefusedOrDischargedForReasonOtherThanDiscrimination i c


def ProhibitionViolated2000e5g2A (o : AdjudicativeOrder) (i : Person) (c : ComplaintText) : Prop :=
  Prohibition2000e5g2A i c ∧ OrderedAdmissionReinstatementOrBackPay o i c




structure Prohibition2000e5g2Bii (p : Person) (prac : EmploymentPractice) (t : ProtectedTrait)
    (c : ComplaintText) : Prop where
  establishment : UnlawfulPracticeEstablished2000e2m p prac t c
  sameDecision : SameActionAbsentImpermissibleFactor p prac c


def ProhibitionViolated2000e5g2Bii (o : AdjudicativeOrder) (p i : Person)
    (prac : EmploymentPractice) (t : ProtectedTrait) (c : ComplaintText) : Prop :=
  Prohibition2000e5g2Bii p prac t c ∧ AwardedDamagesOrMandatoryRelief o i c



structure Permission2000e5k (i : Person) (c : ComplaintText) : Prop where
  condition : IsPrevailingParty i c




structure Power2000e6a (p q : Person) (c : ComplaintText) : Prop where
  addressee : IsAttorneyGeneral p c
  reasonableCause : AttorneyGeneralReasonableCause c
  condition : PatternOrPracticeOfResistance q c






def StateLawPreserved2000e7 (l : StateOrLocalLaw) (c : ComplaintText) : Prop :=
  ¬ StateLawRequiresOrPermitsUnlawfulPractice l c



def StateLawNotPreserved2000e7 (l : StateOrLocalLaw) (c : ComplaintText) : Prop :=
  StateLawRequiresOrPermitsUnlawfulPractice l c





structure Power2000e8a (p i : Person) (ch : Charge) (c : ComplaintText) : Prop where
  addressee : IsCommission p c
  condition : FiledChargeWithCommission i ch c


def PowerExercised2000e8a (p i : Person) (ch : Charge) (c : ComplaintText) : Prop :=
  Power2000e8a p i ch c ∧ HadAccessToAndCopiedRelevantEvidence ch c


structure Obligation2000e8c (p : Person) (c : ComplaintText) : Prop where
  addressee : Addressee2000e8c p c


def ObligationBreached2000e8c (p : Person) (r : EmploymentRecord) (c : ComplaintText) : Prop :=
  Obligation2000e8c p c ∧ ¬ MadeAndKeptRequiredRecords p r c




structure Prohibition2000e8e (p : Person) (info : Information) (c : ComplaintText) : Prop where
  addressee : IsCommissionOfficerOrEmployee p c
  provenance : InformationObtainedUnderInvestigativeAuthority info c
  condition : ¬ ProceedingInstituted c


def ProhibitionViolated2000e8e (p : Person) (info : Information) (c : ComplaintText) : Prop :=
  Prohibition2000e8e p info c ∧ MadePublicInvestigativeInformation p info c






structure Power2000e9 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsCommission p c
  condition : CommissionHearingOrInvestigation c




structure Obligation2000e10a (p : Person) (c : ComplaintText) : Prop where
  addressee : Addressee2000e8c p c


def ObligationBreached2000e10a (p : Person) (n : Notice) (c : ComplaintText) : Prop :=
  Obligation2000e10a p c ∧ ¬ PostedRequiredNotice p n c



def PunishableViolation2000e10b (p : Person) (n : Notice) (c : ComplaintText) : Prop :=
  ObligationBreached2000e10a p n c ∧ WillfulViolation p c





def VeteransPreferenceUnmodified2000e11 (l : StateOrLocalLaw) (c : ComplaintText) : Prop :=
  VeteransPreferenceLaw l c




structure Power2000e12a (p : Person) (c : ComplaintText) : Prop where
  addressee : IsCommission p c


def PowerExercised2000e12a (p : Person) (reg : Regulation) (c : ComplaintText) : Prop :=
  Power2000e12a p c ∧ IssuedConformingProceduralRegulation reg c





structure Prohibition2000e13 (i : Person) (c : ComplaintText) : Prop where
  victimClass : IsCommissionOfficerOrEmployee i c


def ProhibitionViolated2000e13 (p i : Person) (c : ComplaintText) : Prop :=
  Prohibition2000e13 i c ∧ KilledCommissionPersonnelInPerformanceOfDuties p i c




structure Obligation2000e15 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsPresident p c


def ObligationBreached2000e15 (p : Person) (c : ComplaintText) : Prop :=
  Obligation2000e15 p c ∧ ¬ ConvenedEqualEmploymentConferences c






structure Obligation2000e16a (p i : Person) (pa : PersonnelAction) (c : ComplaintText) : Prop where
  addressee : IsCoveredFederalEntity p c
  condition : PersonnelActionAffectsIndividual pa i p c


def ObligationBreached2000e16a (p i : Person) (pa : PersonnelAction) (c : ComplaintText) : Prop :=
  Obligation2000e16a p i pa c ∧ ¬ PersonnelActionFreeFromDiscrimination pa c



structure Obligation2000e16b (p : Person) (c : ComplaintText) : Prop where
  addressee : IsCoveredFederalEntity p c


def ObligationBreached2000e16b (p : Person) (c : ComplaintText) : Prop :=
  Obligation2000e16b p c ∧ ¬ ComplyWithCommissionRulesAndOrders p c


structure Permission2000e16c (i : Person) (c : ComplaintText) : Prop where
  ripeness : FinalAgencyActionOrOneHundredEightyDaysElapsed i c
  window : CivilActionFiledWithinNinetyDays i c





structure Obligation2000e16ba (p i : Person) (pa : PersonnelAction) (c : ComplaintText) : Prop where
  beneficiary : IsCoveredGovernmentEmployee i c
  condition : PersonnelActionAffectsIndividual pa i p c


def ObligationBreached2000e16ba (p i : Person) (pa : PersonnelAction) (c : ComplaintText) : Prop :=
  Obligation2000e16ba p i pa c ∧ ¬ PersonnelActionFreeFromDiscrimination pa c


structure Prohibition2000e16bb3 (i : Person) (c : ComplaintText) : Prop where
  beneficiary : IsCoveredGovernmentEmployee i c


def ProhibitionViolated2000e16bb3 (o : AdjudicativeOrder) (i : Person) (c : ComplaintText) : Prop :=
  Prohibition2000e16bb3 i c ∧ AwardedPunitiveDamages o c



structure Permission2000e16cb1 (i : Person) (c : ComplaintText) : Prop where
  beneficiary : IsCoveredGovernmentEmployee i c
  window : ComplaintFiledWithinOneHundredEightyDays i c



structure Obligation2000e16cb1 (p i : Person) (c : ComplaintText) : Prop where
  addressee : IsCommission p c
  condition : ComplaintFiledWithinOneHundredEightyDays i c


def ObligationBreached2000e16cb1 (p i : Person) (o : AdjudicativeOrder) (c : ComplaintText) : Prop :=
  Obligation2000e16cb1 p i c ∧ ¬ IssuedFinalOrderOnComplaint o c




structure Obligation2000e16cd (o : AdjudicativeOrder) (c : ComplaintText) : Prop where
  condition : FinalOrderArbitraryOrUnsupported o c


def ObligationBreached2000e16cd (o : AdjudicativeOrder) (c : ComplaintText) : Prop :=
  Obligation2000e16cd o c ∧ ¬ SetAsideFinalOrder o c







structure Prohibition2000e17 (p q : Person) (pl : AffirmativeActionPlan)
    (c : ComplaintText) : Prop where
  addressee : IsFederalAgencyOrOfficer p c
  acceptedPlan : AffirmativeActionPlanPreviouslyAccepted pl c
  noHearing : ¬ AccordedFullHearingAndAdjudication q c
  noSubstantialDeviation : ¬ SubstantialDeviationFromPlan q pl c


def ProhibitionViolated2000e17 (p q : Person) (pl : AffirmativeActionPlan)
    (gk : GovernmentContract) (c : ComplaintText) : Prop :=
  Prohibition2000e17 p q pl c ∧ DeniedOrTerminatedGovernmentContract p gk c





inductive UnlawfulEmploymentPractice (p i : Person) (t : ProtectedTrait)
    (c : ComplaintText) : Prop where

  | employerHireOrDischarge (h : ProhibitionViolated2000e2a1 p i t c)

  | employerClassification (h : ProhibitionViolated2000e2a2 p i t c)

  | agencyReferral (h : ProhibitionViolated2000e2b p i t c)

  | laborOrganizationMembership (h : ProhibitionViolated2000e2c1 p i t c)

  | laborOrganizationClassification (h : ProhibitionViolated2000e2c2 p i t c)

  | laborOrganizationCausation (q : Person) (h : ProhibitionViolated2000e2c3 p q i t c)

  | trainingProgram (tp : TrainingProgram) (h : ProhibitionViolated2000e2d p i t tp c)

  | disparateImpact (prac : EmploymentPractice) (h : UnlawfulPracticeDisparateImpact2000e2k p prac t c)

  | testScoreAlteration (tst : EmploymentTest) (h : ProhibitionViolated2000e2l p tst t c)

  | motivatingFactor (prac : EmploymentPractice) (h : UnlawfulPracticeEstablished2000e2m p prac t c)

  | retaliation (h : ProhibitionViolated2000e3a p i c)

  | discriminatoryAdvertisement (n : Notice) (h : ProhibitionViolated2000e3b p n t c)

  | federalPersonnelAction (pa : PersonnelAction) (h : ObligationBreached2000e16a p i pa c)

  | governmentEmployeePersonnelAction (pa : PersonnelAction) (h : ObligationBreached2000e16ba p i pa c)



inductive CommissionDeonticFailure (p : Person) (c : ComplaintText) : Prop where

  | noticeOrInvestigation (i : Person) (ch : Charge) (h : ObligationBreached2000e5bNotice p i ch c)

  | conciliation (ch : Charge) (h : ObligationBreached2000e5bConciliation p ch c)

  | chargePublicity (ch : Charge) (h : ProhibitionViolated2000e5bPublicity p ch c)

  | investigativePublicity (info : Information) (h : ProhibitionViolated2000e8e p info c)

  | reporting (h : ObligationBreached2000e14 p c)

  | technicalAssistanceInstitute (h : ObligationBreached2000e4j1 p c)

  | finalOrder (i : Person) (o : AdjudicativeOrder) (h : ObligationBreached2000e16cb1 p i o c)

end Proving.USC.T42.Ch21TitleVII.Deontic
