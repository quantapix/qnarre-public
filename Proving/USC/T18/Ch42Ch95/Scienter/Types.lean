









import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Scienter

open Proving.USC.Common



inductive MentalState
  | StrictLiability
  | Negligence
  | Recklessness
  | Knowledge
  | Specific
deriving DecidableEq, Repr


def MentalState.rank : MentalState → Nat
  | .StrictLiability => 0
  | .Negligence      => 1
  | .Recklessness    => 2
  | .Knowledge       => 3
  | .Specific        => 4



def MentalState.atLeast (a b : MentalState) : Prop := b.rank ≤ a.rank

instance (a b : MentalState) : Decidable (a.atLeast b) :=
  inferInstanceAs (Decidable (b.rank ≤ a.rank))





inductive Demand
  | rung (m : MentalState)
  | unspecified
deriving DecidableEq





def Demand.metBy : Demand → MentalState → Prop
  | .rung r,      proven => proven.atLeast r
  | .unspecified, _      => False

instance : ∀ (d : Demand) (m : MentalState), Decidable (d.metBy m)
  | .rung r,      m => inferInstanceAs (Decidable (m.atLeast r))
  | .unspecified, _ => inferInstanceAs (Decidable False)





inductive DemandSource

  | express


  | expressNegation


  | purposeInfinitive

  | definitional

  | noQualifier

  | absent
deriving DecidableEq





inductive ActorRole
  | Defendant
  | Creditor
  | Debtor
  | Conspirator
  | ThreatTarget
deriving DecidableEq



inductive ScienterElement


  | E892aMakingAct



  | E892aUnderstandingCreditor

  | E892aUnderstandingDebtor

  | E892aConspiracyPurpose


  | E892b3DebtorBelief

  | E892bObjectiveFactors

  | E892cEvidentiaryRoute



  | E894aKnowingParticipation


  | E894aCollectionPurpose


  | E894aPunishmentPurpose

  | E894aConspiracyPurpose


  | E894bTargetKnowledge


  | E894cEvidentiaryRoute



  | E1952aTravelOrFacilityUse


  | E1952aIntentDistributeProceeds


  | E1952aIntentCommitCrimeOfViolence


  | E1952aIntentPromoteUnlawfulActivity


  | E1952aSubsequentAct

  | E1952dPreRetailProductEnhancement


  | E1952NonOperative



  | E1956a1ConductTransaction



  | E1956a1KnowledgeProceedsSomeForm


  | E1956a1InFactSpecifiedUnlawfulActivity


  | E1956a1AiIntentPromote


  | E1956a1AiiIntentViolateIRC


  | E1956a1BiKnowledgeDesignToConceal


  | E1956a1BiiKnowledgeDesignToAvoidReporting


  | E1956a2TransportTransmitTransfer


  | E1956a2AIntentPromote


  | E1956a2BKnowledgeProceedsSomeForm


  | E1956a2BiKnowledgeDesignToConceal


  | E1956a2BiiKnowledgeDesignToAvoidReporting

  | E1956a3ConductTransaction



  | E1956a3PropertyRepresented


  | E1956a3IntentPromote


  | E1956a3IntentConcealBelievedProceeds


  | E1956a3BeliefPropertyIsProceeds


  | E1956a3IntentAvoidReporting


  | E1956hConspiracyPurpose



  | E1956NonOperative
deriving DecidableEq


structure ScienterRequirement where
  demand : Demand
  source : DemandSource
  actor  : ActorRole
deriving DecidableEq

end Proving.USC.T18.Ch42Ch95.Scienter
