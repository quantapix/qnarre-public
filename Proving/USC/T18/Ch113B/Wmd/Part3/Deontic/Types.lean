






import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Deontic

open Proving.USC.Common





inductive Modality where

  | obligation



  | prohibition

  | permission



  | power

  | definition
  deriving DecidableEq, Repr



opaque Weapon : Type





opaque Property : Type



opaque Offense : Type



opaque Tribunal : Type

end Proving.USC.T18.Ch113B.Wmd.Part3.Deontic
