





















import Proving.USC.Common.Types

namespace Proving.USC.T18.PredicateDefs.Procedure

open Proving.USC.Common




opaque OfficialProceeding : Type







inductive State

  | Official


  | SafeHarbored
  deriving DecidableEq, Repr

end Proving.USC.T18.PredicateDefs.Procedure
