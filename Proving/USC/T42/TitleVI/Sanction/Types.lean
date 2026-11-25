import Proving.USC.Common.Types




























namespace Proving.USC.T42.TitleVI.Sanction

open Proving.USC.Common




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





inductive Reach
  | partOfProgram
  | program
  | recipient
  | agencyWide
deriving DecidableEq



def Reach.rank : Reach → Nat
  | .partOfProgram => 0
  | .program       => 1
  | .recipient     => 2
  | .agencyWide    => 3




structure Sanction where
  kind   : SanctionKind
  bound  : Nat
  reach  : Reach
  dir    : Direction

end Proving.USC.T42.TitleVI.Sanction
