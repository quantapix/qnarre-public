















import Proving.USC.Common.Types

namespace Proving.USC.T42.EqualRights.Deontic

open Proving.USC.Common




inductive Modality where
  | obligation
  | prohibition
  | permission
  | power
  | definition
deriving DecidableEq, Repr



opaque Award : Type

end Proving.USC.T42.EqualRights.Deontic
