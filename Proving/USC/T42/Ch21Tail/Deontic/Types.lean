





import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21Tail.Deontic

open Proving.USC.Common


inductive Modality where

  | obligation

  | prohibition

  | permission

  | power

  | definition
  deriving DecidableEq, Repr





inductive NormForce where

  | binding

  | precatory
  deriving DecidableEq, Repr



opaque Institution : Type

end Proving.USC.T42.Ch21Tail.Deontic
