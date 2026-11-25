



















import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Reslice.Deontic.Types
import Proving.USC.T18.Ch77.Reslice.Deontic.Predicates

set_option autoImplicit false

open Proving.USC.Common (Person ComplaintText)

namespace Proving.USC.T18.Ch77.Reslice.Deontic




def modality1590a : Modality := Modality.prohibition




structure Prohibition1590a (p : Person) (v : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  condition : LaborOrServicesInViolationOfChapter1590a v c




def Prohibition1590aViolated (p : Person) (v : Person) (c : ComplaintText) : Prop :=
  Prohibition1590a p v c ∧ ActedKnowingly1590a p c ∧ TraffickingActOccurred1590a p v c





structure Prohibition1590aAggravated (p : Person) (v : Person) (c : ComplaintText) : Prop where
  base : Prohibition1590aViolated p v c
  aggravator : AggravatingResultOccurred1590a p v c




def modality1590b : Modality := Modality.prohibition




structure Prohibition1590b (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c



def Prohibition1590bViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1590b p c ∧ ObstructedEnforcement1590b p c




def modality1591a : Modality := Modality.prohibition




def JurisdictionalNexus1591a1 (p : Person) (c : ComplaintText) : Prop :=
  AffectsInterstateOrForeignCommerce p c ∨ WithinSpecialMaritimeAndTerritorialJurisdiction p c






def MensReaObject1591a (p : Person) (v : Person) (c : ComplaintText) : Prop :=
  KnewProscribedMeansOrMinority1591a p v c ∨
    (RecklesslyDisregardedProscribedMeansOrMinority1591a p v c ∧
      ¬ ActConstitutingViolationIsAdvertising1591a p c)




inductive ProhibitedActBranch1591a
    (p : Person) (v : Person) (ven : Venture) (c : ComplaintText) : Prop where
  | recruitment
      (nexus : JurisdictionalNexus1591a1 p c)
      (act : RecruitmentActOccurred1591a1 p v c) :
      ProhibitedActBranch1591a p v ven c
  | benefit
      (venture : IsVenture1591e6 ven c)
      (participation : IsParticipationInVenture1591e4 p ven c)
      (benefit : BenefitedFromVenture1591a2 p ven c)
      (engaged : VentureEngagedInProhibitedAct1591a2 ven v c) :
      ProhibitedActBranch1591a p v ven c


structure Prohibition1591a
    (p : Person) (v : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter : ActedKnowingly1591a p c
  condition : MensReaObject1591a p v c




def Prohibition1591aViolated
    (p : Person) (v : Person) (ven : Venture) (c : ComplaintText) : Prop :=
  Prohibition1591a p v c ∧ ProhibitedActBranch1591a p v ven c







inductive PenaltyTier1591b
    (p : Person) (v : Person) (ven : Venture) (c : ComplaintText) : Prop where
  | aggravated
      (violation : Prohibition1591aViolated p v ven c)
      (trigger : EffectedByProscribedMeans1591b1 p v c ∨ VictimUnderFourteen1591b1 v c) :
      PenaltyTier1591b p v ven c
  | standard
      (violation : Prohibition1591aViolated p v ven c)
      (notEffected : ¬ EffectedByProscribedMeans1591b1 p v c)
      (ageBand : VictimAtLeastFourteenUnderEighteen1591b2 v c) :
      PenaltyTier1591b p v ven c





def modality1591c : Modality := Modality.permission




structure Permission1591c (p : Person) (v : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeGovernment c
  posture : ProsecutionUnderSubsection1591a1 p c
  condition : ReasonableOpportunityToObserve1591c p v c


def Permission1591cAvailable (p : Person) (v : Person) (c : ComplaintText) : Prop :=
  Permission1591c p v c




def Permission1591cExercised (p : Person) (v : Person) (c : ComplaintText) : Prop :=
  Permission1591c p v c ∧ OmitsProofOfAgeKnowledge1591c c




def modality1591d : Modality := Modality.prohibition


structure Prohibition1591d (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c


def Prohibition1591dViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1591d p c ∧ ObstructedEnforcement1591d p c




def modality1591e : Modality := Modality.definition




def modality1592a : Modality := Modality.prohibition


inductive CircumstanceBranch1592a (p : Person) (v : Person) (c : ComplaintText) : Prop where
  | inCourseOf (h : InCourseOfChapterViolation1592a1 p c) : CircumstanceBranch1592a p v c
  | withIntent (h : IntentToViolateChapter1592a2 p c) : CircumstanceBranch1592a p v c
  | toRestrictLiberty
      (purpose : PurposeToPreventOrRestrictLiberty1592a3 p v c)
      (victimStatus : IsSevereFormTraffickingVictim v c) :
      CircumstanceBranch1592a p v c




def Exempt1592b (p : Person) (c : ComplaintText) : Prop :=
  IsSevereFormTraffickingVictim p c ∧ ConductCausedByOrIncidentToTrafficking1592b p c






structure Prohibition1592a
    (p : Person) (v : Person) (d : Document) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter : ActedKnowingly1592a p c
  documentClass : IsCoveredDocument1592a d v c
  condition : CircumstanceBranch1592a p v c
  notExempt : ¬ Exempt1592b p c


def Prohibition1592aViolated
    (p : Person) (v : Person) (d : Document) (c : ComplaintText) : Prop :=
  Prohibition1592a p v d c ∧ DocumentActOccurred1592a p d v c




def modality1592c : Modality := Modality.prohibition


structure Prohibition1592c (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c


def Prohibition1592cViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1592c p c ∧ ObstructedEnforcement1592c p c

end Proving.USC.T18.Ch77.Reslice.Deontic
