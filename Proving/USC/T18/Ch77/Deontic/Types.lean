import Proving.USC.Common.Types
set_option autoImplicit false
























namespace Proving.USC.T18.Ch77.Deontic

open Proving.USC.Common





inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch77.Deontic
