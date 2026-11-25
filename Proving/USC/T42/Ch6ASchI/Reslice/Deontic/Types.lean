import Proving.USC.Common.Types

set_option autoImplicit false














namespace Proving.USC.T42.Ch6ASchI.Reslice.Deontic

open Proving.USC.Common





inductive Modality where
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr




opaque Entity : Type



opaque Facility : Type

end Proving.USC.T42.Ch6ASchI.Reslice.Deontic
