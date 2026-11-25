









import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch25.Deontic

open Proving.USC.Common




opaque Obligation : Type




inductive Modality
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch25.Deontic
