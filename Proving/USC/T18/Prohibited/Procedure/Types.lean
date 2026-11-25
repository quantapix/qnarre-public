
















import Proving.USC.Common.Types

namespace Proving.USC.T18.Prohibited.Procedure

open Proving.USC.Common






inductive State
  | Accrued
  | Filed
  | TimeBarred
  deriving DecidableEq, Repr





inductive ViolationTarget
  | subA
  | subB
  | subC
  | subD
  deriving DecidableEq, Repr




def fourYearWindowDays : Nat := 4 * 365

end Proving.USC.T18.Prohibited.Procedure
