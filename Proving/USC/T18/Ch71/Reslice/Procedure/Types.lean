import Proving.USC.Common.Types
set_option autoImplicit false







namespace Proving.USC.T18.Ch71.Reslice.Procedure

open Proving.USC.Common





inductive State
  | OffenseShown
  | FirstOffensePenalty
  | EnhancedPenalty
  | QuantityShown
  | PresumptionRaised
  | PresumptionRebutted
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch71.Reslice.Procedure
