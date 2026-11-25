

















import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch77TailCompletion.Deontic

open Proving.USC.Common



inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch77TailCompletion.Deontic
