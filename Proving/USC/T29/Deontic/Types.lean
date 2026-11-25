
















import Proving.USC.Common.Types

namespace Proving.USC.T29.Deontic

open Proving.USC.Common




inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr




opaque LaborOrganization : Type



opaque Board : Type

end Proving.USC.T29.Deontic
