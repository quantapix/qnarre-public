



















import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Enforcement.Procedure

open Proving.USC.Common



opaque ReferredComplaint : Type



opaque AGComplaint : Type






inductive State
  | Referred
  | Investigated
  | SettlementSought
  | CauseFound
  | ActionFiled
  | ThreeJudgeRequested
  | Adjudicated
  | Appealed
  deriving DecidableEq, Repr

end Proving.USC.T42.PublicAccommodations.Enforcement.Procedure
