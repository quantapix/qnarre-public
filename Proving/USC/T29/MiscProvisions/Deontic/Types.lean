





















import Proving.USC.Common.Types

namespace Proving.USC.T29.MiscProvisions.Deontic

open Proving.USC.Common




inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr




opaque LaborOrganization : Type

end Proving.USC.T29.MiscProvisions.Deontic
