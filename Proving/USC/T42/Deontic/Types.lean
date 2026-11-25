


















import Proving.USC.Common.Types

namespace Proving.USC.T42.Deontic

open Proving.USC.Common



inductive Modality
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr




opaque Program : Type



opaque SecuredRight : Type



opaque Contract : Type

end Proving.USC.T42.Deontic
