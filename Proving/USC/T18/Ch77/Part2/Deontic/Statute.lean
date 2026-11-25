import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part2.Deontic.Types
import Proving.USC.T18.Ch77.Part2.Deontic.Predicates

set_option autoImplicit false

















namespace Proving.USC.T18.Ch77.Part2.Deontic

open Proving.USC.Common












def modalityOf1591 : NormId1591 → Modality
  | .a1 => .prohibition
  | .a2 => .prohibition
  | .b1 => .obligation
  | .b2 => .obligation
  | .c => .permission
  | .d => .prohibition
  | .dSentencingCeiling => .prohibition










def Coercion1591e2 (p victim : Person) (c : ComplaintText) : Prop :=
  (ThreatOfHarmAgainstPerson1591e2a p victim c ∧
      HarmIsSufficientlySerious1591e5 p victim c)
    ∨ PhysicalRestraintAgainstPerson1591e2a p victim c
    ∨ (SchemePlanOrPatternCausingBeliefOfHarm1591e2b p victim c ∧
        HarmIsSufficientlySerious1591e5 p victim c)
    ∨ AbuseOrThreatenedAbuseOfLawOrLegalProcess1591e2c p victim c



def WillBeCausedToEngageInCommercialSexAct1591a
    (victim : Person) (c : ComplaintText) : Prop :=
  WillBeCausedToEngageInSexAct1591a victim c ∧ SexActIsCommercial1591e3 victim c



def ParticipationInQualifyingVenture1591e
    (p : Person) (v : Venture) (c : ComplaintText) : Prop :=
  IsVenture1591e6 v c ∧ ParticipationInVenture1591e4 p v c



def MeansOfForceFraudOrCoercion1591a
    (p victim : Person) (c : ComplaintText) : Prop :=
  ForceOrThreatsOfForceWillBeUsed1591a p victim c
    ∨ FraudWillBeUsed1591a p victim c
    ∨ Coercion1591e2 p victim c







def MensReaAsToMeans1591a (p victim : Person) (c : ComplaintText) : Prop :=
  ActuallyKnewMeansWillBeUsed1591a p victim c
    ∨ (¬ ActConstitutingViolationIsAdvertising1591a p victim c
        ∧ RecklesslyDisregardedMeansWillBeUsed1591a p victim c)



def MensReaAsToMinority1591a (p victim : Person) (c : ComplaintText) : Prop :=
  ActuallyKnewVictimUnderStatutoryAge1591a p victim c
    ∨ (¬ ActConstitutingViolationIsAdvertising1591a p victim c
        ∧ RecklesslyDisregardedVictimUnderStatutoryAge1591a p victim c)



inductive MensReaTheory1591a (p victim : Person) (c : ComplaintText) : Prop where



  | byMeans
      (hMeans : MeansOfForceFraudOrCoercion1591a p victim c)
      (hMens : MensReaAsToMeans1591a p victim c)
      (hCause : WillBeCausedToEngageInCommercialSexAct1591a victim c)


  | byMinority
      (hAge : VictimUnderStatutoryAge1591a victim c)
      (hMens : MensReaAsToMinority1591a p victim c)
      (hCause : WillBeCausedToEngageInCommercialSexAct1591a victim c)







structure Prohibition1591a1 (p : Person) (c : ComplaintText) : Prop where

  addressee : AddresseeWhoever1591 p c

  jurisdiction :
    InterstateOrForeignCommerceNexus1591a1 p c
      ∨ SpecialMaritimeOrTerritorialJurisdiction1591a1 p c

  knowingly : ActedKnowingly1591a p c




def ProhibitionViolated1591a1 (p victim : Person) (c : ComplaintText) : Prop :=
  Prohibition1591a1 p c
    ∧ RegulatedActTraffickingPerson1591a1 p victim c
    ∧ MensReaTheory1591a p victim c







structure Prohibition1591a2 (p : Person) (v : Venture) (c : ComplaintText) : Prop where

  addressee : AddresseeWhoever1591 p c

  knowingly : ActedKnowingly1591a p c

  participation : ParticipationInQualifyingVenture1591e p v c

  predicateViolation : VentureEngagedInParagraphOneViolation1591a2 v c


def ProhibitionViolated1591a2
    (p victim : Person) (v : Venture) (c : ComplaintText) : Prop :=
  Prohibition1591a2 p v c
    ∧ RegulatedActBenefitsFromVenture1591a2 p v c
    ∧ MensReaTheory1591a p victim c







structure Prohibition1591d (p : Person) (c : ComplaintText) : Prop where

  addressee : AddresseeWhoever1591 p c


def ProhibitionViolated1591d (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1591d p c ∧ RegulatedActObstructsEnforcement1591d p c





def SentenceSatisfiesGradeOne1591b1
    (court : Entity) (p : Person) (c : ComplaintText) : Prop :=
  FineUnderThisTitleImposed1591b court p c
    ∧ (LifeImprisonmentImposed1591b court p c
        ∨ 15 ≤ yearsOfImprisonmentImposed1591b court p c)



def SentenceSatisfiesGradeTwo1591b2
    (court : Entity) (p : Person) (c : ComplaintText) : Prop :=
  FineUnderThisTitleImposed1591b court p c
    ∧ (LifeImprisonmentImposed1591b court p c
        ∨ 10 ≤ yearsOfImprisonmentImposed1591b court p c)




def GradeOneCondition1591b1 (p victim : Person) (c : ComplaintText) : Prop :=
  OffenseEffectedByForceThreatsFraudOrCoercion1591b1 p victim c
    ∨ VictimUnderAge14AtOffense1591b1 victim c








def GradeTwoCondition1591b2 (p victim : Person) (c : ComplaintText) : Prop :=
  ¬ OffenseEffectedByForceThreatsFraudOrCoercion1591b1 p victim c
    ∧ VictimAtLeastAge14AndUnderAge18AtOffense1591b2 victim c



structure Obligation1591b1
    (court : Entity) (p victim : Person) (c : ComplaintText) : Prop where

  addressee : AddresseeSentencingCourt1591b court c

  conviction : ConvictedOfOffenseUnderSubsectionA1591b p c

  condition : GradeOneCondition1591b1 p victim c



def Obligation1591b1Breached
    (court : Entity) (p victim : Person) (c : ComplaintText) : Prop :=
  Obligation1591b1 court p victim c ∧ ¬ SentenceSatisfiesGradeOne1591b1 court p c



structure Obligation1591b2
    (court : Entity) (p victim : Person) (c : ComplaintText) : Prop where

  addressee : AddresseeSentencingCourt1591b court c

  conviction : ConvictedOfOffenseUnderSubsectionA1591b p c

  condition : GradeTwoCondition1591b2 p victim c


def Obligation1591b2Breached
    (court : Entity) (p victim : Person) (c : ComplaintText) : Prop :=
  Obligation1591b2 court p victim c ∧ ¬ SentenceSatisfiesGradeTwo1591b2 court p c







structure Permission1591c
    (gov : Entity) (p victim : Person) (c : ComplaintText) : Prop where

  addressee : AddresseeGovernmentInProsecution1591c gov c

  prosecution : ProsecutionUnderParagraphOne1591c gov p c

  opportunity : ReasonableOpportunityToObserveVictim1591c p victim c




def PermissionExercised1591c
    (gov : Entity) (p victim : Person) (c : ComplaintText) : Prop :=
  Permission1591c gov p victim c ∧ ProceedsWithoutProvingMinorityScienter1591c gov p c







def MinorityTheoryEstablished1591
    (gov : Entity) (p victim : Person) (c : ComplaintText) : Prop :=
  VictimUnderStatutoryAge1591a victim c
    ∧ WillBeCausedToEngageInCommercialSexAct1591a victim c
    ∧ (MensReaAsToMinority1591a p victim c ∨ Permission1591c gov p victim c)





def SentencingCeilingExceeded1591d
    (court : Entity) (p : Person) (c : ComplaintText) : Prop :=
  25 < yearsOfImprisonmentImposed1591d court p c


structure ProhibitionOnSentencer1591d
    (court : Entity) (p : Person) (c : ComplaintText) : Prop where

  addressee : AddresseeSentencingCourt1591b court c

  condition : ConvictedOfObstructionUnder1591d p c


def ProhibitionViolatedSentencingCeiling1591d
    (court : Entity) (p : Person) (c : ComplaintText) : Prop :=
  ProhibitionOnSentencer1591d court p c ∧ SentencingCeilingExceeded1591d court p c





def SentenceWithinCeiling1591d
    (court : Entity) (p : Person) (c : ComplaintText) : Prop :=
  (FineUnderThisTitleImposed1591d court p c
      ∨ 0 < yearsOfImprisonmentImposed1591d court p c)
    ∧ ¬ SentencingCeilingExceeded1591d court p c







inductive Section1591Violated
    (p victim : Person) (v : Venture) (c : ComplaintText) : Prop where

  | trafficking (h : ProhibitionViolated1591a1 p victim c)

  | beneficiary (h : ProhibitionViolated1591a2 p victim v c)

  | obstruction (h : ProhibitionViolated1591d p c)

end Proving.USC.T18.Ch77.Part2.Deontic
