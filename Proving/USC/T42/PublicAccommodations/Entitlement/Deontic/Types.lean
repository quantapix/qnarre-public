
















import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Entitlement.Deontic

open Proving.USC.Common





opaque Establishment : Type




inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr

end Proving.USC.T42.PublicAccommodations.Entitlement.Deontic
