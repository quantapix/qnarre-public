










import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch47.Procedure

open Proving.USC.Common





opaque Prosecution : Type





opaque Agency : Type











inductive Stage where
  | Conduct
  | CircumstanceEstablished
  | Charged
  | Convicted
  | Sentenced
  | ForfeitureOrdered
  | Exempt
  deriving DecidableEq



inductive PenaltyTier1028 where
  | thirtyYears
  | twentyYears
  | fifteenYears
  | fiveYears
  | oneYear
  deriving DecidableEq


inductive PenaltyTier1029 where
  | twentyYears
  | fifteenYears
  | tenYears
  deriving DecidableEq

end Proving.USC.T18.Ch47.Procedure
