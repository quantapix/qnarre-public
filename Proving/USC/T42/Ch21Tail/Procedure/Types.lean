import Proving.USC.Common.Types

















set_option autoImplicit false

namespace Proving.USC.T42.Ch21Tail.Procedure

open Proving.USC.Common




opaque Institution : Type







inductive RetaliationState

  | Unreported

  | Reported


  | ProtectedReport

  | AdverseActionTaken


  | RetaliationEstablished
  deriving DecidableEq, Repr









inductive CorrectionState


  | ConditionsExist

  | CorrectionInitiated


  | PriorityAssigned


  | ConditionsCorrected


  | RedirectionMandated
  deriving DecidableEq, Repr

end Proving.USC.T42.Ch21Tail.Procedure
