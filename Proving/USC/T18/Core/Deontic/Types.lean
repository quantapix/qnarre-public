














import Proving.USC.Common.Types

namespace Proving.USC.T18.Core.Deontic

open Proving.USC.Common




inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
deriving DecidableEq, Repr

end Proving.USC.T18.Core.Deontic
