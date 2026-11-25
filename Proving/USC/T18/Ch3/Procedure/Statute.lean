import Proving.USC.T18.Ch3.Procedure.Types
import Proving.USC.T18.Ch3.Procedure.Predicates
import Proving.USC.Common.Types








namespace Proving.USC.T18.Ch3.Procedure

open Proving.USC.Common





def PromulgationWithin180Days (c : ComplaintText) : Prop :=
  PromulgationActionDay c - PromulgationTriggerDay c ≤ 180




structure PenaltyTrigger (p : Person) (c : ComplaintText) : Prop where
  violation  : ViolationOccurred p c
  prosecuted : ProsecutionCommenced p c
  convicted  : ConvictionEntered p c



structure RestitutionAvailable (p : Person) (c : ComplaintText) : Prop where
  convicted   : ConvictionEntered p c
  restitution : RestitutionOrderEntered p c




structure TimelyPromulgation (c : ComplaintText) : Prop where
  issued    : PromulgationIssued c
  within180 : PromulgationWithin180Days c

end Proving.USC.T18.Ch3.Procedure
