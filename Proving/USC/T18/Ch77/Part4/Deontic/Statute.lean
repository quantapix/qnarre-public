

















import Proving.USC.T18.Ch77.Part4.Deontic.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.Deontic

open Proving.USC.Common




def modality1591a1 : Modality := Modality.Prohibition

def modality1591a2 : Modality := Modality.Prohibition

def modality1591b : Modality := Modality.Obligation

def modality1591c : Modality := Modality.Permission

def modality1591d : Modality := Modality.Prohibition

def modality1591dSanction : Modality := Modality.Power

def modality1591e : Modality := Modality.Definition










inductive CoercionUnder1591e2 (m : Means) (h : Harm) (c : ComplaintText) : Prop where

  | byThreatOfSeriousHarm :
      ThreatOfSeriousHarm1591e2a m h c → SeriousHarmUnder1591e5 h c →
      CoercionUnder1591e2 m h c

  | byPhysicalRestraint :
      PhysicalRestraintAgainstPerson1591e2a m c → CoercionUnder1591e2 m h c

  | byScheme :
      SchemeToInduceBeliefOfSeriousHarmOrRestraint1591e2b m h c →
      SeriousHarmUnder1591e5 h c → CoercionUnder1591e2 m h c


  | byAbuseOfLegalProcess :
      AbuseOrThreatenedAbuseOfLegalProcess1591e1 m c → CoercionUnder1591e2 m h c






inductive ProscribedMeans1591a (m : Means) (h : Harm) (c : ComplaintText) : Prop where
  | byForce : MeansOfForce1591a m c → ProscribedMeans1591a m h c
  | byThreatsOfForce : MeansOfThreatsOfForce1591a m c → ProscribedMeans1591a m h c
  | byFraud : MeansOfFraud1591a m c → ProscribedMeans1591a m h c
  | byCoercion : CoercionUnder1591e2 m h c → ProscribedMeans1591a m h c



def MeansWillCauseCommercialSexAct1591a
    (q : Person) (m : Means) (h : Harm) (c : ComplaintText) : Prop :=
  ProscribedMeans1591a m h c ∧ MeansWillBeUsedToCauseCommercialSexAct1591a q m c




def MeansConditionSatisfied1591a
    (p q : Person) (m : Means) (h : Harm) (c : ComplaintText) : Prop :=
  MeansWillCauseCommercialSexAct1591a q m h c ∧
    (KnewMeansCondition1591a p q m c ∨
      (¬ ActConstitutingViolationIsAdvertising1591a p c ∧
        RecklesslyDisregardedMeansCondition1591a p q m c))



def UnderageConditionSatisfied1591a (p q : Person) (c : ComplaintText) : Prop :=
  VictimUnderEighteenWillBeCaused1591a q c ∧
    (KnewUnderageCondition1591a p q c ∨
      (¬ ActConstitutingViolationIsAdvertising1591a p c ∧
        RecklesslyDisregardedUnderageCondition1591a p q c))



inductive TraffickingMensRea1591a
    (p q : Person) (m : Means) (h : Harm) (c : ComplaintText) : Prop where
  | byForceFraudOrCoercion :
      MeansConditionSatisfied1591a p q m h c → TraffickingMensRea1591a p q m h c
  | byVictimMinority :
      UnderageConditionSatisfied1591a p q c → TraffickingMensRea1591a p q m h c




structure Prohibition1591a1
    (p q : Person) (m : Means) (h : Harm) (c : ComplaintText) : Prop where

  addressee : AddresseeWhoever p c

  jurisdiction : CommerceOrMaritimeNexus1591a1 p q c

  scienter : ActedKnowingly p c

  mensRea : TraffickingMensRea1591a p q m h c



def Prohibition1591a1Violated
    (p q : Person) (m : Means) (h : Harm) (c : ComplaintText) : Prop :=
  Prohibition1591a1 p q m h c ∧ ActTraffickingConduct1591a1 p q c


structure Prohibition1591a2
    (p q : Person) (v : Venture) (m : Means) (h : Harm) (c : ComplaintText) : Prop where

  addressee : AddresseeWhoever p c

  scienter : ActedKnowingly p c

  venture : VentureUnder1591e6 v c

  participation : ParticipationInVenture1591e4 p v c

  predicateOffense : VentureEngagedInParagraphOneAct1591a2 v c

  mensRea : TraffickingMensRea1591a p q m h c


def Prohibition1591a2Violated
    (p q : Person) (v : Venture) (m : Means) (h : Harm) (c : ComplaintText) : Prop :=
  Prohibition1591a2 p q v m h c ∧ ActBenefitFromVenture1591a2 p v c


inductive Prohibition1591aViolated
    (p q : Person) (v : Venture) (m : Means) (h : Harm) (c : ComplaintText) : Prop where
  | byTrafficking :
      Prohibition1591a1Violated p q m h c → Prohibition1591aViolated p q v m h c
  | byBenefiting :
      Prohibition1591a2Violated p q v m h c → Prohibition1591aViolated p q v m h c





def SentenceOfImprisonmentAtLeast
    (ct : SentencingCourt) (p : Person) (c : ComplaintText) (n : Nat) : Prop :=
  LifeImprisonmentImposed ct p c ∨ n ≤ yearsOfImprisonmentImposed ct p c



def ActImposeFifteenYearMinimum1591b1
    (ct : SentencingCourt) (p : Person) (c : ComplaintText) : Prop :=
  FineUnderThisTitleImposed ct p c ∧ SentenceOfImprisonmentAtLeast ct p c 15



def ActImposeTenYearMinimum1591b2
    (ct : SentencingCourt) (p : Person) (c : ComplaintText) : Prop :=
  FineUnderThisTitleImposed ct p c ∧ SentenceOfImprisonmentAtLeast ct p c 10


structure Obligation1591b1
    (ct : SentencingCourt) (p q : Person) (c : ComplaintText) : Prop where

  addressee : AddresseeSentencingAuthority ct c

  offense : ConvictedOfOffenseUnder1591a p c

  aggravator :
    OffenseEffectedByForceFraudOrCoercion1591b p q c ∨ VictimUnderFourteenAtOffense1591b1 q c



def Obligation1591b1Breached
    (ct : SentencingCourt) (p q : Person) (c : ComplaintText) : Prop :=
  Obligation1591b1 ct p q c ∧ ¬ ActImposeFifteenYearMinimum1591b1 ct p c


structure Obligation1591b2
    (ct : SentencingCourt) (p q : Person) (c : ComplaintText) : Prop where

  addressee : AddresseeSentencingAuthority ct c

  offense : ConvictedOfOffenseUnder1591a p c

  notAggravated : ¬ OffenseEffectedByForceFraudOrCoercion1591b p q c

  victimAge : VictimAtLeastFourteenAndUnderEighteenAtOffense1591b2 q c


def Obligation1591b2Breached
    (ct : SentencingCourt) (p q : Person) (c : ComplaintText) : Prop :=
  Obligation1591b2 ct p q c ∧ ¬ ActImposeTenYearMinimum1591b2 ct p c


inductive Obligation1591bBreached
    (ct : SentencingCourt) (p q : Person) (c : ComplaintText) : Prop where
  | tierOne : Obligation1591b1Breached ct p q c → Obligation1591bBreached ct p q c
  | tierTwo : Obligation1591b2Breached ct p q c → Obligation1591bBreached ct p q c






structure Permission1591c
    (g : Government) (p q : Person) (c : ComplaintText) : Prop where

  addressee : AddresseeGovernmentProsecutor g p c

  prosecution : ProsecutionUnder1591a1Pending g p c

  observation : DefendantHadReasonableOpportunityToObserve1591c p q c




def Permission1591cExercised
    (g : Government) (p q : Person) (c : ComplaintText) : Prop :=
  Permission1591c g p q c ∧ ActProceedWithoutProvingAgeScienter1591c g p q c





structure Prohibition1591d (p : Person) (c : ComplaintText) : Prop where

  addressee : AddresseeWhoever p c


def Prohibition1591dViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1591d p c ∧ ActObstructEnforcement1591d p c




def SanctionWithinCeiling1591d
    (ct : SentencingCourt) (p : Person) (c : ComplaintText) : Prop :=
  (FineUnderThisTitleImposed ct p c ∨ 0 < yearsOfImprisonmentImposed ct p c) ∧
    ¬ LifeImprisonmentImposed ct p c ∧
    yearsOfImprisonmentImposed ct p c ≤ 25




structure Power1591dSanction
    (ct : SentencingCourt) (p : Person) (c : ComplaintText) : Prop where

  addressee : AddresseeSentencingAuthority ct c

  conviction : ConvictedOfObstructionUnder1591d p c


def Power1591dSanctionExercised
    (ct : SentencingCourt) (p : Person) (c : ComplaintText) : Prop :=
  Power1591dSanction ct p c ∧ SanctionWithinCeiling1591d ct p c




inductive Section1591Violated
    (p q : Person) (v : Venture) (m : Means) (h : Harm) (c : ComplaintText) : Prop where
  | bySubsectionA : Prohibition1591aViolated p q v m h c → Section1591Violated p q v m h c
  | bySubsectionD : Prohibition1591dViolated p c → Section1591Violated p q v m h c

end Proving.USC.T18.Ch77.Part4.Deontic
