













import Proving.USC.Common.Types

namespace Proving.USC.T08.Inadmissibility.Deontic

open Proving.USC.Common





inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr

end Proving.USC.T08.Inadmissibility.Deontic
