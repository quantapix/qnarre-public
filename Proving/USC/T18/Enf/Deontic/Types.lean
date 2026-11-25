
















import Proving.USC.Common.Types

namespace Proving.USC.T18.Enf.Deontic

open Proving.USC.Common



inductive Modality where
  | obligation
  | prohibition
  | permission
  | power
  | definition
deriving DecidableEq, Repr



opaque Property : Type



opaque Order : Type

end Proving.USC.T18.Enf.Deontic
