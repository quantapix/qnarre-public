











import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Deontic

open Proving.USC.Common




inductive Modality where

  | Obligation

  | Prohibition

  | Permission

  | Power

  | Definition
  deriving DecidableEq, Repr




opaque Conduct : Type




opaque Property : Type





opaque Offense : Type



opaque Sentence : Type



opaque Prosecution : Type



opaque Tribunal : Type



opaque Construction : Type

end Proving.USC.T18.Ch113B.Wmd.Part2.Deontic
