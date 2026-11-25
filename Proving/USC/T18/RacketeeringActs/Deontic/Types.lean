



















import Proving.USC.Common.Types

namespace Proving.USC.T18.RacketeeringActs.Deontic

open Proving.USC.Common




inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr




opaque Offense : Type



opaque Transaction : Type

end Proving.USC.T18.RacketeeringActs.Deontic
