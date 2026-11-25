














import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch1.Deontic

open Proving.USC.Common




inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr





opaque Offense : Type

end Proving.USC.T18.Ch1.Deontic
