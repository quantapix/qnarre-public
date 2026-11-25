








import Proving.USC.Common.Types

namespace Proving.USC.T18.Spec.Remedy

open Proving.USC.Common





inductive Enforcer
  | privateRight
  | agencyOnly
  | criminal
  | mixed
  deriving DecidableEq, Repr


inductive Relief
  | trebleDamages
  | costs
  | attorneysFees
  | injunction
  | divestiture
  | dissolution
  | criminalForfeiture
  | fine
  | imprisonment
  deriving DecidableEq, Repr

end Proving.USC.T18.Spec.Remedy
