















import Proving.USC.Common.Types

namespace Proving.USC.T08.Procedure

open Proving.USC.Common



inductive State
  | offenseCommitted
  | seized
  | forfeited
  | arrested
  | charged
  | adjudicated
  deriving DecidableEq, Repr



opaque Conveyance : Type



opaque Deposition : Type

end Proving.USC.T08.Procedure
