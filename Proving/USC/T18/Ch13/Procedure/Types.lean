












import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch13.Procedure

open Proving.USC.Common





inductive State
  | PreCharge
  | Certified
  | Charged
  | TimeBarred
  | CivilActionPending
  | Adjudicated
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch13.Procedure
