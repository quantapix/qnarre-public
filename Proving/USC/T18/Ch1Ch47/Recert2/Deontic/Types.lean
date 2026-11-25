import Proving.USC.Common.Types

set_option autoImplicit false












namespace Proving.USC.T18.Ch1Ch47.Recert2.Deontic

open Proving.USC.Common




inductive Modality where

  | obligation

  | prohibition

  | permission

  | power

  | definition
  deriving DecidableEq, Repr



opaque Locus : Type


opaque Treaty : Type



opaque Property : Type




opaque Court : Type




opaque Agency : Type


opaque Agreement : Type



opaque Institution : Type




opaque IdentificationObject : Type




opaque AccessDevice : Type




opaque OffenseInstance : Type

end Proving.USC.T18.Ch1Ch47.Recert2.Deontic
