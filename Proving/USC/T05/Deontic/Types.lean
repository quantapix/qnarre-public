

















import Proving.USC.Common.Types

namespace Proving.USC.T05.Deontic

open Proving.USC.Common





inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr




opaque AgencyAct : Type

end Proving.USC.T05.Deontic
