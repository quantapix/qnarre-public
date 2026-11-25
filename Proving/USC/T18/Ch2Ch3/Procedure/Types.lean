import Proving.USC.Common.Types

set_option autoImplicit false















namespace Proving.USC.T18.Ch2Ch3.Procedure

open Proving.USC.Common





inductive State

  | Chargeable

  | JurisdictionEstablished

  | Prosecutable

  | ProsecutionBarred

  | Convicted

  | Sentenced

  | CivilProceedingPending

  | CivilEstopped

  | AdminSuspensionProceeding

  | RulemakingComplete
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch2Ch3.Procedure
