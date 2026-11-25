















import Proving.USC.Common.Types

namespace Proving.USC.T18.Obstruction.Deontic

open Proving.USC.Common





opaque OfficialProceeding : Type




inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr

end Proving.USC.T18.Obstruction.Deontic
