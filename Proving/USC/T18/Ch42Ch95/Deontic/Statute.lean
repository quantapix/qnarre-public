













import Proving.USC.T18.Ch42Ch95.Deontic.Predicates

set_option autoImplicit false

open Proving.USC.Common (Person ComplaintText)

namespace Proving.USC.T18.Ch42Ch95.Deontic





structure Prohibition892a (p : Person) (x : CreditExtension) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson892a p c
  condition : ConditionExtensionIsExtortionate892a x c




def ProhibitionViolated892a (p : Person) (x : CreditExtension) (c : ComplaintText) : Prop :=
  Prohibition892a p x c ∧ RegulatedActMakesExtortionateExtension892a p x c


def modality892a : Modality := Modality.prohibition





structure PrimaFacieFactors892b (x : CreditExtension) (c : ComplaintText) : Prop where
  unenforceable : Factor892b1RepaymentUnenforceable x c
  excessiveRate : Factor892b2RateExceedsFortyFivePercent x c
  debtorBelief : Factor892b3DebtorBelievedExtortionateCollection x c
  outstanding : Factor892b4OutstandingExceedsOneHundredDollars x c



def modality892b : Modality := Modality.definition




structure Permission892c (ct : Court) (x : CreditExtension) (c : ComplaintText) : Prop where
  addressee : AddresseeTrialCourt ct c
  circumstanceEvidence : ConditionEvidenceOf892bCircumstancesIntroduced x c
  directEvidenceUnavailable : ConditionDirectEvidenceOfDebtorBeliefUnavailable x c



def PermissionExercisedWithinScope892c
    (ct : Court) (x : CreditExtension) (c : ComplaintText) : Prop :=
  Permission892c ct x c ∧ RegulatedActAllowsCreditorReputationEvidence892c ct x c


def modality892c : Modality := Modality.permission





structure Prohibition894a (p : Person) (x : CreditExtension) (c : ComplaintText) : Prop where
  addressee : AddresseeKnowingParticipant894a p c
  condition : ConditionExtortionateMeansUsed894a p x c



inductive ProhibitedPurpose894a
    (p : Person) (v : Person) (x : CreditExtension) (c : ComplaintText) : Prop where

  | collect (h : RegulatedActCollectsExtension894a1 p x c) : ProhibitedPurpose894a p v x c

  | punish (h : RegulatedActPunishesNonrepayment894a2 p v x c) : ProhibitedPurpose894a p v x c



def ProhibitionViolated894a
    (p : Person) (v : Person) (x : CreditExtension) (c : ComplaintText) : Prop :=
  Prohibition894a p x c ∧ ProhibitedPurpose894a p v x c


def modality894a : Modality := Modality.prohibition


structure Permission894b (p : Person) (v : Person) (c : ComplaintText) : Prop where
  condition : ConditionPriorExtortionateCollectionsKnownToTarget894b p v c


def PermissionExercisedWithinScope894b (p : Person) (v : Person) (c : ComplaintText) : Prop :=
  Permission894b p v c ∧ RegulatedActIntroducesImplicitThreatEvidence894b p v c


def modality894b : Modality := Modality.permission




structure Permission894c
    (ct : Court) (x : CreditExtension) (c : ComplaintText) : Prop where
  addressee : AddresseeTrialCourt ct c
  circumstanceEvidence : ConditionEvidenceOf892bCircumstancesIntroduced x c
  directEvidenceUnavailable : ConditionDirectEvidenceOfDebtorBeliefUnavailable x c



def PermissionExercisedWithinScope894c
    (ct : Court) (p : Person) (v : Person) (x : CreditExtension) (c : ComplaintText) : Prop :=
  Permission894c ct x c ∧ RegulatedActAllowsDefendantReputationEvidence894c ct p v c


def modality894c : Modality := Modality.permission





structure Prohibition1952a (p : Person) (u : UnlawfulActivity) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson1952a p c
  unlawfulActivity : ConditionActivityIsUnlawfulActivity1952b u c


inductive ProscribedIntent1952a
    (p : Person) (u : UnlawfulActivity) (c : ComplaintText) : Prop where

  | distributeProceeds (h : ConditionIntentToDistributeProceeds1952a1 p u c) :
      ProscribedIntent1952a p u c

  | crimeOfViolence (h : ConditionIntentToCommitCrimeOfViolence1952a2 p u c) :
      ProscribedIntent1952a p u c


  | promoteOrFacilitate (h : ConditionIntentToPromoteOrFacilitate1952a3 p u c) :
      ProscribedIntent1952a p u c








def ProhibitionViolated1952a
    (p : Person) (u : UnlawfulActivity) (c : ComplaintText) : Prop :=
  Prohibition1952a p u c
    ∧ RegulatedActTravelsOrUsesInterstateFacility1952a p c
    ∧ ProscribedIntent1952a p u c
    ∧ RegulatedActThereafterPerformsOrAttempts1952a p u c
    ∧ ¬ EscapeSavingsPromotionRaffle1952e p u c


def modality1952a : Modality := Modality.prohibition



def modality1952b : Modality := Modality.definition



structure Obligation1952c (a : Authority) (i : Investigation) (c : ComplaintText) : Prop where
  addressee : AddresseeInvestigatingAuthority1952c a c
  condition : ConditionInvestigationInvolvesLiquor1952c i c




def ObligationBreached1952c (a : Authority) (i : Investigation) (c : ComplaintText) : Prop :=
  Obligation1952c a i c ∧ ¬ RegulatedActConductedUnderAttorneyGeneralSupervision1952c a i c


def modality1952c : Modality := Modality.obligation




structure Obligation1952d (ct : Court) (o : Offense) (c : ComplaintText) : Prop where
  addressee : AddresseeSentencingCourt1952d ct c
  condition : ConditionOffenseInvolvesPreRetailMedicalProduct1952d o c
  noEscape : ¬ EscapeSubsectionAPunishmentGreater1952d o c



def ObligationBreached1952d (ct : Court) (o : Offense) (c : ComplaintText) : Prop :=
  Obligation1952d ct o c ∧ ¬ RegulatedActPunishmentSetToSection670Level1952d ct o c


def modality1952d : Modality := Modality.obligation



def modality1952e2 : Modality := Modality.definition







structure Prohibition1956a1
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson1956 p c
  knowledge : ConditionKnowsPropertyIsProceeds1956a1 p t c
  inFactSpecifiedUnlawfulActivity : ConditionInvolvesProceedsOfSpecifiedUnlawfulActivity1956a1 t c


inductive ProscribedPurpose1956a1
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop where

  | promote (h : ConditionIntentToPromoteSua1956a1Ai p t c) : ProscribedPurpose1956a1 p t c

  | taxViolation (h : ConditionIntentToViolateInternalRevenueCode1956a1Aii p t c) :
      ProscribedPurpose1956a1 p t c

  | conceal (h : ConditionKnowsTransactionDesignedToConceal1956a1Bi p t c) :
      ProscribedPurpose1956a1 p t c

  | avoidReporting (h : ConditionKnowsTransactionDesignedToAvoidReporting1956a1Bii p t c) :
      ProscribedPurpose1956a1 p t c


def ProhibitionViolated1956a1
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop :=
  Prohibition1956a1 p t c
    ∧ RegulatedActConductsFinancialTransaction1956a1 p t c
    ∧ ProscribedPurpose1956a1 p t c


def modality1956a1 : Modality := Modality.prohibition




structure Prohibition1956a2
    (p : Person) (m : MonetaryProperty) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson1956 p c
  crossesBorder : ConditionCrossesUnitedStatesBorder1956a2 m c


inductive ProscribedPurpose1956a2
    (p : Person) (m : MonetaryProperty) (c : ComplaintText) : Prop where

  | promote (h : ConditionIntentToPromoteSua1956a2A p m c) : ProscribedPurpose1956a2 p m c

  | conceal (h : ConditionKnowsProceedsAndDesignedToConceal1956a2Bi p m c) :
      ProscribedPurpose1956a2 p m c


  | avoidReporting (h : ConditionKnowsProceedsAndDesignedToAvoidReporting1956a2Bii p m c) :
      ProscribedPurpose1956a2 p m c


def ProhibitionViolated1956a2
    (p : Person) (m : MonetaryProperty) (c : ComplaintText) : Prop :=
  Prohibition1956a2 p m c
    ∧ RegulatedActTransportsTransmitsOrTransfers1956a2 p m c
    ∧ ProscribedPurpose1956a2 p m c


def modality1956a2 : Modality := Modality.prohibition


structure Prohibition1956a3 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson1956 p c


inductive ProscribedPurpose1956a3
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop where

  | promote (h : ConditionIntentToPromoteSua1956a3A p t c) : ProscribedPurpose1956a3 p t c

  | conceal (h : ConditionIntentToConcealRepresentedProceeds1956a3B p t c) :
      ProscribedPurpose1956a3 p t c

  | avoidReporting (h : ConditionIntentToAvoidReportingRequirement1956a3C p t c) :
      ProscribedPurpose1956a3 p t c


def ProhibitionViolated1956a3
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop :=
  Prohibition1956a3 p c
    ∧ RegulatedActConductsTransactionInRepresentedProperty1956a3 p t c
    ∧ ProscribedPurpose1956a3 p t c


def modality1956a3 : Modality := Modality.prohibition


structure Prohibition1956h (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson1956 p c



def ProhibitionViolated1956h (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1956h p c ∧ RegulatedActConspiresToCommitOffense1956h p c


def modality1956h : Modality := Modality.prohibition




inductive Section1956Violated
    (p : Person) (t : FinancialTransaction) (m : MonetaryProperty) (c : ComplaintText) : Prop where

  | domesticTransaction (h : ProhibitionViolated1956a1 p t c) : Section1956Violated p t m c

  | crossBorderTransfer (h : ProhibitionViolated1956a2 p m c) : Section1956Violated p t m c

  | representedProceeds (h : ProhibitionViolated1956a3 p t c) : Section1956Violated p t m c

  | conspiracy (h : ProhibitionViolated1956h p c) : Section1956Violated p t m c


structure Obligation1956b1
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop where
  addressee : AddresseeCivilPenaltyRespondent1956b1 p c
  condition : ConditionConductedTransactionDescribedInSubsectionA1956b1 p t c



def ObligationBreached1956b1
    (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop :=
  Obligation1956b1 p t c ∧ ¬ RegulatedActPaysCivilPenalty1956b1 p c


def modality1956b1 : Modality := Modality.obligation


structure Power1956b3 (ct : Court) (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeDistrictCourt1956b ct c
  condition : ConditionNecessaryToSecureAssetsForJudgment1956b3 p c


def PowerExercisedWithinScope1956b3 (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Power1956b3 ct p c ∧ RegulatedActIssuesPretrialRestrainingOrder1956b3 ct p c


def modality1956b3 : Modality := Modality.power


structure Power1956b4 (ct : Court) (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeDistrictCourt1956b ct c
  condition : ConditionReceivershipSoughtToSatisfyJudgment1956b4 p c


def PowerExercisedWithinScope1956b4 (ct : Court) (p : Person) (c : ComplaintText) : Prop :=
  Power1956b4 ct p c ∧ RegulatedActAppointsFederalReceiver1956b4 ct p c


def modality1956b4 : Modality := Modality.power


def modality1956c : Modality := Modality.definition




structure Permission1956e (a : Authority) (i : Investigation) (c : ComplaintText) : Prop where
  addressee : AddresseeInvestigativeComponent1956e a c
  agreementGoverns : ConditionInteragencyAgreementGoverns1956e a i c


def PermissionExercisedWithinScope1956e
    (a : Authority) (i : Investigation) (c : ComplaintText) : Prop :=
  Permission1956e a i c ∧ RegulatedActInvestigatesViolation1956e a i c


def modality1956e : Modality := Modality.permission




structure Power1956f (p : Person) (t : FinancialTransaction) (c : ComplaintText) : Prop where
  nexus : ConditionConductByUsCitizenOrPartlyInUs1956f1 p c
  threshold : ConditionTransactionValueExceedsTenThousand1956f2 t c


def modality1956f : Modality := Modality.power


structure Obligation1956g
    (a : Authority) (p : Person) (o : Offense) (c : ComplaintText) : Prop where
  addressee : AddresseeAttorneyGeneral1956g a c
  condition : ConditionFinancialInstitutionFoundGuilty1956g p o c




def ObligationBreached1956g
    (a : Authority) (p : Person) (o : Offense) (c : ComplaintText) : Prop :=
  Obligation1956g a p o c ∧ ¬ RegulatedActProvidesWrittenNoticeToRegulator1956g a p c


def modality1956g : Modality := Modality.obligation


structure Permission1956i (a : Authority) (c : ComplaintText) : Prop where
  addressee : AddresseeProsecutingAuthority1956 a c


inductive VenueBasis1956i
    (d : JudicialDistrict) (t : FinancialTransaction) (c : ComplaintText) : Prop where

  | transactionDistrict (h : ConditionVenueDistrictOfTransaction1956i1A d t c) :
      VenueBasis1956i d t c


  | underlyingActivityDistrict (h : ConditionVenueDistrictOfUnderlyingActivity1956i1B d t c) :
      VenueBasis1956i d t c


  | actInFurtheranceDistrict (h : ConditionVenueActInFurtheranceDistrict1956i2 d c) :
      VenueBasis1956i d t c




def PermissionExercisedWithinScope1956i
    (a : Authority) (d : JudicialDistrict) (t : FinancialTransaction) (c : ComplaintText) : Prop :=
  Permission1956i a c ∧ VenueBasis1956i d t c ∧ RegulatedActBringsProsecutionInDistrict1956i a d c


def modality1956i : Modality := Modality.permission




structure Prohibition1956j (a : Authority) (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeProsecutingAuthority1956 a c
  foreignPredicate : ConditionSuaIsForeignOffense1956j p c
  timeBarred : ConditionIndictmentNotFoundWithinSevenYears1956j p c



def ProhibitionViolated1956j (a : Authority) (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1956j a p c ∧ RegulatedActProsecutesTriesOrPunishes1956j a p c


def modality1956j : Modality := Modality.prohibition

end Proving.USC.T18.Ch42Ch95.Deontic
