




















import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch75.Procedure

open Proving.USC.Common





inductive ProsecutionState
  | Charged
  | OffenseProven
  | TierDetermined
  | Sentenced
  deriving DecidableEq, Repr




inductive PenaltyTier
  | Terrorism25
  | DrugTrafficking20
  | FirstOrSecond10
  | Other15
  deriving DecidableEq, Repr





def PenaltyTier.ceilingYears : PenaltyTier → Nat
  | .Terrorism25       => 25
  | .DrugTrafficking20 => 20
  | .FirstOrSecond10   => 10
  | .Other15           => 15

end Proving.USC.T18.Ch75.Procedure
