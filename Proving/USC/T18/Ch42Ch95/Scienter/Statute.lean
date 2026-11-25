




import Proving.USC.Common.Types
import Proving.USC.T18.Ch42Ch95.Scienter.Types
import Proving.USC.T18.Ch42Ch95.Scienter.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Scienter

open Proving.USC.Common








def requirement : ScienterElement → ScienterRequirement


  | .E892aMakingAct =>
      ⟨.rung .StrictLiability, .noQualifier, .Defendant⟩
  | .E892aUnderstandingCreditor =>
      ⟨.rung .Knowledge, .definitional, .Creditor⟩
  | .E892aUnderstandingDebtor =>
      ⟨.rung .Knowledge, .definitional, .Debtor⟩
  | .E892aConspiracyPurpose =>
      ⟨.rung .Specific, .purposeInfinitive, .Conspirator⟩

  | .E892b3DebtorBelief =>
      ⟨.rung .Knowledge, .express, .Debtor⟩
  | .E892bObjectiveFactors =>
      ⟨.unspecified, .absent, .Defendant⟩
  | .E892cEvidentiaryRoute =>
      ⟨.unspecified, .absent, .Debtor⟩

  | .E894aKnowingParticipation =>
      ⟨.rung .Knowledge, .express, .Defendant⟩
  | .E894aCollectionPurpose =>
      ⟨.rung .Specific, .purposeInfinitive, .Defendant⟩
  | .E894aPunishmentPurpose =>
      ⟨.rung .Specific, .purposeInfinitive, .Defendant⟩
  | .E894aConspiracyPurpose =>
      ⟨.rung .Specific, .purposeInfinitive, .Conspirator⟩


  | .E894bTargetKnowledge =>
      ⟨.rung .Knowledge, .express, .ThreatTarget⟩

  | .E894cEvidentiaryRoute =>
      ⟨.unspecified, .absent, .ThreatTarget⟩


  | .E1952aTravelOrFacilityUse =>
      ⟨.rung .StrictLiability, .noQualifier, .Defendant⟩
  | .E1952aIntentDistributeProceeds =>
      ⟨.rung .Specific, .express, .Defendant⟩
  | .E1952aIntentCommitCrimeOfViolence =>
      ⟨.rung .Specific, .express, .Defendant⟩
  | .E1952aIntentPromoteUnlawfulActivity =>
      ⟨.rung .Specific, .express, .Defendant⟩
  | .E1952aSubsequentAct =>
      ⟨.rung .StrictLiability, .noQualifier, .Defendant⟩


  | .E1952dPreRetailProductEnhancement =>
      ⟨.rung .StrictLiability, .noQualifier, .Defendant⟩
  | .E1952NonOperative =>
      ⟨.unspecified, .absent, .Defendant⟩

  | .E1956a1ConductTransaction =>
      ⟨.rung .StrictLiability, .noQualifier, .Defendant⟩
  | .E1956a1KnowledgeProceedsSomeForm =>
      ⟨.rung .Knowledge, .express, .Defendant⟩


  | .E1956a1InFactSpecifiedUnlawfulActivity =>
      ⟨.rung .StrictLiability, .expressNegation, .Defendant⟩
  | .E1956a1AiIntentPromote =>
      ⟨.rung .Specific, .express, .Defendant⟩
  | .E1956a1AiiIntentViolateIRC =>
      ⟨.rung .Specific, .express, .Defendant⟩


  | .E1956a1BiKnowledgeDesignToConceal =>
      ⟨.rung .Knowledge, .express, .Defendant⟩
  | .E1956a1BiiKnowledgeDesignToAvoidReporting =>
      ⟨.rung .Knowledge, .express, .Defendant⟩

  | .E1956a2TransportTransmitTransfer =>
      ⟨.rung .StrictLiability, .noQualifier, .Defendant⟩
  | .E1956a2AIntentPromote =>
      ⟨.rung .Specific, .express, .Defendant⟩
  | .E1956a2BKnowledgeProceedsSomeForm =>
      ⟨.rung .Knowledge, .express, .Defendant⟩
  | .E1956a2BiKnowledgeDesignToConceal =>
      ⟨.rung .Knowledge, .express, .Defendant⟩
  | .E1956a2BiiKnowledgeDesignToAvoidReporting =>
      ⟨.rung .Knowledge, .express, .Defendant⟩


  | .E1956a3ConductTransaction =>
      ⟨.rung .StrictLiability, .noQualifier, .Defendant⟩
  | .E1956a3PropertyRepresented =>
      ⟨.rung .StrictLiability, .noQualifier, .Defendant⟩
  | .E1956a3IntentPromote =>
      ⟨.rung .Specific, .express, .Defendant⟩
  | .E1956a3IntentConcealBelievedProceeds =>
      ⟨.rung .Specific, .express, .Defendant⟩


  | .E1956a3BeliefPropertyIsProceeds =>
      ⟨.rung .Knowledge, .express, .Defendant⟩
  | .E1956a3IntentAvoidReporting =>
      ⟨.rung .Specific, .express, .Defendant⟩

  | .E1956hConspiracyPurpose =>
      ⟨.rung .Specific, .purposeInfinitive, .Conspirator⟩
  | .E1956NonOperative =>
      ⟨.unspecified, .absent, .Defendant⟩


def demandOf (el : ScienterElement) : Demand := (requirement el).demand


def actorOf (el : ScienterElement) : ActorRole := (requirement el).actor


def sourceOf (el : ScienterElement) : DemandSource := (requirement el).source




def demandStated (el : ScienterElement) : Bool :=
  match demandOf el with
  | .rung _      => true
  | .unspecified => false





def ScienterProvenDirectly (p : Person) (el : ScienterElement) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, (demandOf el).metBy rung ∧ MentalStateProven p el rung c



def ScienterProvenByStatutoryRoute (p : Person) (el : ScienterElement) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, (demandOf el).metBy rung ∧ RungShownByStatutoryProofRoute p el rung c



def ScienterMet (p : Person) (el : ScienterElement) (c : ComplaintText) : Prop :=
  ScienterProvenDirectly p el c ∨ ScienterProvenByStatutoryRoute p el c








structure Scienter892aMaking (creditor debtor : Person) (c : ComplaintText) : Prop where
  creditorUnderstanding : ScienterMet creditor .E892aUnderstandingCreditor c
  debtorUnderstanding   : ScienterMet debtor .E892aUnderstandingDebtor c
  mutualUnderstanding   : SharedUnderstandingOfViolentConsequence creditor debtor c


structure Scienter892aConspiracy (p : Person) (c : ComplaintText) : Prop where
  purpose         : ScienterMet p .E892aConspiracyPurpose c
  pleadedPurpose  : ConspiratorialPurposeToCommitOffense p .E892aConspiracyPurpose c


inductive Scienter892a (creditor debtor : Person) (c : ComplaintText) : Prop
  | making     (h : Scienter892aMaking creditor debtor c)
  | conspiracy (h : Scienter892aConspiracy creditor c)



structure Scienter892b3 (debtor : Person) (c : ComplaintText) : Prop where
  belief     : ScienterMet debtor .E892b3DebtorBelief c
  reasonable : BeliefObjectivelyReasonable debtor .E892b3DebtorBelief c




inductive Section894Object
  | collect
  | punish
deriving DecidableEq


def Scienter894Object (p : Person) (obj : Section894Object) (c : ComplaintText) : Prop :=
  match obj with
  | .collect => ScienterMet p .E894aCollectionPurpose c
  | .punish  => ScienterMet p .E894aPunishmentPurpose c



structure Scienter894aParticipation (p : Person) (c : ComplaintText) : Prop where
  knowingParticipation : ScienterMet p .E894aKnowingParticipation c
  purpose              : ∃ obj : Section894Object, Scienter894Object p obj c


structure Scienter894aConspiracy (p : Person) (c : ComplaintText) : Prop where
  purpose        : ScienterMet p .E894aConspiracyPurpose c
  pleadedPurpose : ConspiratorialPurposeToCommitOffense p .E894aConspiracyPurpose c


inductive Scienter894a (p : Person) (c : ComplaintText) : Prop
  | participation (h : Scienter894aParticipation p c)
  | conspiracy    (h : Scienter894aConspiracy p c)



def Scienter894b (target : Person) (c : ComplaintText) : Prop :=
  ScienterMet target .E894bTargetKnowledge c




inductive Section1952Object
  | distributeProceeds
  | crimeOfViolence
  | promoteUnlawfulActivity
deriving DecidableEq


def Scienter1952Object (p : Person) (obj : Section1952Object) (c : ComplaintText) : Prop :=
  match obj with
  | .distributeProceeds       => ScienterMet p .E1952aIntentDistributeProceeds c
  | .crimeOfViolence          => ScienterMet p .E1952aIntentCommitCrimeOfViolence c
  | .promoteUnlawfulActivity  => ScienterMet p .E1952aIntentPromoteUnlawfulActivity c




structure Scienter1952a (p : Person) (c : ComplaintText) : Prop where
  intent : ∃ obj : Section1952Object, Scienter1952Object p obj c





inductive Section1956a1Object
  | promoteSua
  | violateIrc
  | knowingDesignToConceal
  | knowingDesignToAvoidReporting
deriving DecidableEq


def Scienter1956a1Object (p : Person) (obj : Section1956a1Object) (c : ComplaintText) : Prop :=
  match obj with
  | .promoteSua                     => ScienterMet p .E1956a1AiIntentPromote c
  | .violateIrc                     => ScienterMet p .E1956a1AiiIntentViolateIRC c
  | .knowingDesignToConceal         => ScienterMet p .E1956a1BiKnowledgeDesignToConceal c
  | .knowingDesignToAvoidReporting  => ScienterMet p .E1956a1BiiKnowledgeDesignToAvoidReporting c




structure Scienter1956a1 (p : Person) (c : ComplaintText) : Prop where
  proceedsKnowledge : ScienterMet p .E1956a1KnowledgeProceedsSomeForm c
  genericObject     : KnowsUnlawfulActivityGenerically p c
  object            : ∃ obj : Section1956a1Object, Scienter1956a1Object p obj c


inductive Section1956a2Design
  | conceal
  | avoidReporting
deriving DecidableEq


def Scienter1956a2Design (p : Person) (d : Section1956a2Design) (c : ComplaintText) : Prop :=
  match d with
  | .conceal        => ScienterMet p .E1956a2BiKnowledgeDesignToConceal c
  | .avoidReporting => ScienterMet p .E1956a2BiiKnowledgeDesignToAvoidReporting c



def Scienter1956a2A (p : Person) (c : ComplaintText) : Prop :=
  ScienterMet p .E1956a2AIntentPromote c


structure Scienter1956a2B (p : Person) (c : ComplaintText) : Prop where
  proceedsKnowledge : ScienterMet p .E1956a2BKnowledgeProceedsSomeForm c
  genericObject     : KnowsUnlawfulActivityGenerically p c
  designKnowledge   : ∃ d : Section1956a2Design, Scienter1956a2Design p d c


inductive Scienter1956a2 (p : Person) (c : ComplaintText) : Prop
  | promotion   (h : Scienter1956a2A p c)
  | concealment (h : Scienter1956a2B p c)


inductive Section1956a3Object
  | promote
  | concealBelievedProceeds
  | avoidReporting
deriving DecidableEq



def Scienter1956a3Object (p : Person) (obj : Section1956a3Object) (c : ComplaintText) : Prop :=
  match obj with
  | .promote => ScienterMet p .E1956a3IntentPromote c
  | .concealBelievedProceeds =>
      ScienterMet p .E1956a3IntentConcealBelievedProceeds c ∧
      ScienterMet p .E1956a3BeliefPropertyIsProceeds c
  | .avoidReporting => ScienterMet p .E1956a3IntentAvoidReporting c




structure Scienter1956a3 (p : Person) (c : ComplaintText) : Prop where
  intent : ∃ obj : Section1956a3Object, Scienter1956a3Object p obj c


inductive Scienter1956a (p : Person) (c : ComplaintText) : Prop
  | paragraph1 (h : Scienter1956a1 p c)
  | paragraph2 (h : Scienter1956a2 p c)
  | paragraph3 (h : Scienter1956a3 p c)





def Scienter1956b1 (p : Person) (c : ComplaintText) : Prop := Scienter1956a p c


structure Scienter1956h (p : Person) (c : ComplaintText) : Prop where
  purpose        : ScienterMet p .E1956hConspiracyPurpose c
  pleadedPurpose : ConspiratorialPurposeToCommitOffense p .E1956hConspiracyPurpose c





inductive CulpableUnderSlice (p q : Person) (c : ComplaintText) : Prop
  | s892a  (h : Scienter892a p q c)
  | s894a  (h : Scienter894a p c)
  | s1952a (h : Scienter1952a p c)
  | s1956a (h : Scienter1956a p c)
  | s1956h (h : Scienter1956h p c)

end Proving.USC.T18.Ch42Ch95.Scienter
