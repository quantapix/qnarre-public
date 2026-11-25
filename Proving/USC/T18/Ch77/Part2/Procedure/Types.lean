import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part2.Procedure

open Proving.USC.Common (Person ComplaintText)




opaque Prosecution : Type





opaque Offense : Type








inductive Stage where

  | conductAlleged

  | jurisdictionAttached

  | charged


  | proofBurdenDischarged

  | convicted

  | sentenced
  deriving DecidableEq, Repr




inductive PenaltyTier where

  | tierOne

  | tierTwo
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch77.Part2.Procedure
