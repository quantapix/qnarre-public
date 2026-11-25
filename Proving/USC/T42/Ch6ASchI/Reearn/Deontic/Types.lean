











import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reearn.Deontic

open Proving.USC.Common





inductive Modality where

  | obligation

  | prohibition

  | permission

  | power

  | definition
  deriving DecidableEq, Repr




opaque CorpsComponent : Type



opaque Grade : Type




opaque Payment : Type





opaque Regulation : Type




opaque AdvisoryBody : Type

end Proving.USC.T42.Ch6ASchI.Reearn.Deontic
