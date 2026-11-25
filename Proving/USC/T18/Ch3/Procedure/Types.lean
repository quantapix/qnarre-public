import Proving.USC.Common.Types












namespace Proving.USC.T18.Ch3.Procedure

open Proving.USC.Common



inductive State
  | ViolationCommitted
  | Prosecuted
  | Convicted
  | PenaltyImposed
  | RestitutionOrdered
  deriving DecidableEq, Repr




inductive Forum
  | criminalProsecution
  | administrativePermitSuspension
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch3.Procedure
