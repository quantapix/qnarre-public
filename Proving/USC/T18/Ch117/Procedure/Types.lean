












import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch117.Procedure

open Proving.USC.Common


inductive State
  | HarboringCommenced
  | StatementFiled
  | FilingLapsed
  | RequestReceived
  | RequestGranted
  | RequestDenied
  | DenialReasonSubmitted
  | Injured
  | CivilActionFiled
  | Convicted
  | AtSentencing
  | ForfeitureOrdered
  | RestitutionOrdered
  | EnhancementTriggered
  deriving DecidableEq, Repr





structure FilingDates where
  commencedDay : Nat
  filedDay     : Nat
  deriving Inhabited, Repr



structure DenialReasonDates where
  receivedDay        : Nat
  reasonSubmittedDay : Nat
  deriving Inhabited, Repr

end Proving.USC.T18.Ch117.Procedure
