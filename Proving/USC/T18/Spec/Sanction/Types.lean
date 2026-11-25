

















import Proving.USC.Common.Types

namespace Proving.USC.T18.Spec.Sanction




abbrev ComplaintText := Proving.USC.Common.ComplaintText






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

end Proving.USC.T18.Spec.Sanction
