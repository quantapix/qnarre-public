














import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch113.Procedure




inductive State

  | stolen

  | inTransit

  | boundaryCrossed

  | possessed

  | penaltyTriggered
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch113.Procedure
