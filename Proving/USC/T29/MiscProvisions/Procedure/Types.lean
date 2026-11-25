

























import Proving.USC.Common.Types

namespace Proving.USC.T29.MiscProvisions.Procedure

open Proving.USC.Common



opaque LaborDispute : Type




opaque BoardAction : Type





inductive JurisdictionState
  | BeforeAssertion
  | BoardDeclined
  | StateAssumed
  deriving DecidableEq, Repr





inductive ValidationState
  | Challenged
  | Validated
  deriving DecidableEq, Repr

end Proving.USC.T29.MiscProvisions.Procedure
