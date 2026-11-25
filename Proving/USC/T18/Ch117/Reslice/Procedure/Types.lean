





























import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Procedure

open Proving.USC.Common



opaque CivilAction : Type



opaque Prosecution : Type



opaque DistrictCourt : Type



opaque RestitutionOrder : Type



opaque TravelEvent : Type






inductive State
  | Violation
  | Injured
  | ActionFiled
  | ForumEstablished
  | RecoveryAvailable
  | Charged
  | DefenseRaised
  | DefenseEstablished
  | ViolationEstablished
  | RestitutionOrdered
  deriving DecidableEq, Repr






structure TravelTiming where
  startDay  : Nat
  endDay    : Nat
  intentDay : Nat
  deriving Repr





inductive Subsection2423
  | a | b | c | d | e | other
  deriving DecidableEq, Repr



structure Transition where
  source : State
  target : State
  guard  : Prop

end Proving.USC.T18.Ch117.Reslice.Procedure
