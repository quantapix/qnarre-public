import Proving.USC.Common.Types

set_option autoImplicit false












namespace Proving.USC.T42.Ch21CivilRights.Recert.Deontic

open Proving.USC.Common







inductive Modality where
  | obligation
  | prohibition
  | permission
  | power
  | definition
  deriving DecidableEq, Repr





opaque Addressee : Type




opaque Recipient : Type




opaque Proceeding : Type



opaque Rule : Type



opaque EnforcementAction : Type

end Proving.USC.T42.Ch21CivilRights.Recert.Deontic
