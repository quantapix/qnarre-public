import Proving.USC.Common.Types

set_option autoImplicit false












namespace Proving.USC.T18.Ch77.Part2.Deontic

open Proving.USC.Common





inductive Modality where

  | obligation


  | prohibition

  | permission

  | power

  | definition
  deriving DecidableEq, Repr







opaque Venture : Type







inductive NormId1591 where

  | a1

  | a2

  | b1

  | b2


  | c

  | d

  | dSentencingCeiling
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch77.Part2.Deontic
