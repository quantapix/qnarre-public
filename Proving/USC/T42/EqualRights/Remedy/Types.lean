














import Proving.USC.Common.Types

namespace Proving.USC.T42.EqualRights.Remedy

open Proving.USC.Common



inductive Enforcer
  | privateRight
  | agencyOnly
  | criminal
  | mixed
  deriving DecidableEq, Repr


inductive Relief
  | compensatoryDamages
  | punitiveDamages
  | equitableRelief
  | backpay
  | attorneysFees
  | costs
  deriving DecidableEq, Repr

end Proving.USC.T42.EqualRights.Remedy
