








import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Scienter



inductive MentalState
  | StrictLiability
  | Negligence
  | Recklessness
  | Knowledge
  | Specific
  deriving DecidableEq, Repr


def MentalState.rank : MentalState → Nat
  | .StrictLiability => 0
  | .Negligence => 1
  | .Recklessness => 2
  | .Knowledge => 3
  | .Specific => 4



def MentalState.atLeast (a b : MentalState) : Prop := b.rank ≤ a.rank

instance (a b : MentalState) : Decidable (a.atLeast b) :=
  inferInstanceAs (Decidable (b.rank ≤ a.rank))




inductive ScienterDemand
  | Requires (m : MentalState)
  | Unspecified
  deriving DecidableEq, Repr




inductive Addressee
  | Defendant
  | PersonInduced
  deriving DecidableEq, Repr



inductive ClausePolarity
  | Inculpatory
  | Exculpatory
  deriving DecidableEq, Repr




inductive BurdenBearer
  | Unallocated
  | Defendant
  deriving DecidableEq, Repr



inductive ProofStandard
  | Unstated
  | Preponderance
  deriving DecidableEq, Repr








inductive Clause


  | S1512a1


  | S1512a2



  | S1512a2Bii


  | S1512bConduct


  | S1512bObjective


  | S1512b2B


  | S1512c1Intent



  | S1512c2

  | S1512dHarassment


  | S1512dResult


  | S1512eDefense


  | S1512gFederalNexus


  | S1512kConspiracy

  | S1515a3A


  | S1515a3B


  | S1515a3CKnowledge

  | S1515a3CIntent


  | S1515a3DKnowledge

  | S1515a3DIntent


  | S1515a3EKnowledge

  | S1515a3EIntent



  | S1515bImproperPurpose1505
  deriving DecidableEq, Repr



inductive ConductRoute1512b
  | Intimidation
  | Threat
  | CorruptPersuasion
  | MisleadingConduct
  deriving DecidableEq, Repr



inductive MisleadingProng
  | FalseStatement
  | OmissionOrConcealment
  | WritingOrRecording
  | SampleOrObject
  | TrickSchemeDevice
  deriving DecidableEq, Repr


structure BurdenAllocation where
  bearer : BurdenBearer
  standard : ProofStandard
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch73.Reslice.Scienter
