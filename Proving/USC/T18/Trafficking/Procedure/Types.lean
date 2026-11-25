



















import Proving.USC.Common.Types

namespace Proving.USC.T18.Trafficking.Procedure
open Proving.USC.Common


inductive State
  | accrued
  | charged
  | adjudicated
  | timeBarred
  deriving DecidableEq, Repr






structure ChargingDates where
  accrualDay  : Nat
  chargingDay : Nat
  windowDays  : Nat
  deriving DecidableEq, Repr

end Proving.USC.T18.Trafficking.Procedure
