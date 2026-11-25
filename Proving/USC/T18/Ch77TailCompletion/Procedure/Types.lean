


















import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch77TailCompletion.Procedure

open Proving.USC.Common





inductive State
  | Accrued
  | Filed
  | Stayed
  | Adjudicated
  | TimeBarred
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch77TailCompletion.Procedure
