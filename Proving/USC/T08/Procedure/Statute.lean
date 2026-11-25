






import Proving.USC.T08.Procedure.Predicates

namespace Proving.USC.T08.Procedure

open Proving.USC.Common




structure Transition where
  fromState : State
  toState   : State
  guard     : Prop






def WithinTwelveMonthThreshold (n d : Nat) : Prop := n ≥ 10 ∧ d ≤ 365

instance (n d : Nat) : Decidable (WithinTwelveMonthThreshold n d) := by
  unfold WithinTwelveMonthThreshold; infer_instance





def HiringOffenseTriggered (c : ComplaintText) : Prop :=
  ∃ n d : Nat,
    QualifyingHireCount c n ∧ HiringWindowDays c d ∧ WithinTwelveMonthThreshold n d




structure ForfeitureValid (cv : Conveyance) (c : ComplaintText) : Prop where
  used     : PropertyUsedInViolation cv c
  seized   : SeizureEffected cv c
  chapter46 : ForfeitureUnderChapter46 cv c




structure DepositionAdmissible (dep : Deposition) (c : ComplaintText) : Prop where
  unavailable : WitnessUnavailable c
  crossExam   : WitnessAvailableForCrossExam c
  freCompliant : DepositionCompliesWithFRE dep c




structure ProsecutionProcedurallyValid (p : Person) (c : ComplaintText) : Prop where
  authorizedArrest : ArrestByAuthorizedOfficer p c
  properVenue      : VenueDistrictQualifies p c

end Proving.USC.T08.Procedure
