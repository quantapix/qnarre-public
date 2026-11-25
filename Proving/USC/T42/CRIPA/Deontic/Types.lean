



















import Proving.USC.Common.Types

namespace Proving.USC.T42.CRIPA.Deontic

open Proving.USC.Common





opaque Institution : Type




inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr

end Proving.USC.T42.CRIPA.Deontic
