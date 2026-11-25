import Proving.USC.Common.Types








open Proving.USC.Common

namespace Proving.USC.T42.Ch6ASchI.Deontic



opaque Officer : Type




opaque Agency : Type



opaque Payment : Type




inductive Modality where
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr

end Proving.USC.T42.Ch6ASchI.Deontic
