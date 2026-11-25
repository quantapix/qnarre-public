






















import Proving.USC.Common.Types

namespace Proving.USC.T42.EqualRights.Sanction



inductive SanctionKind
  | Imprisonment
  | Fine
  | Multiplier
  | Forfeiture
  | Penalty
deriving DecidableEq


inductive Direction
  | Ceiling
  | Floor
  | Exact
deriving DecidableEq




structure Sanction where
  kind  : SanctionKind
  bound : Nat
  dir   : Direction
deriving DecidableEq

end Proving.USC.T42.EqualRights.Sanction
