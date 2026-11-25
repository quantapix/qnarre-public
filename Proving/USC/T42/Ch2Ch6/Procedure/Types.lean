













import Proving.USC.Common.Types

namespace Proving.USC.T42.Ch2Ch6.Procedure

open Proving.USC.Common





inductive CargoState
  | Prohibited
  | Reported
  | Warranted
  | Discharged
  deriving DecidableEq, Repr




inductive WarehouseState
  | Deposited
  | InJointCustody
  | Removable
  | Released
  deriving DecidableEq, Repr




inductive EntryState
  | Pending
  | Extended
  | Entered
  | Lapsed
  deriving DecidableEq, Repr



inductive OfficerState
  | EpidemicOnset
  | Directed
  | Relocated
  | Noticed
  deriving DecidableEq, Repr

end Proving.USC.T42.Ch2Ch6.Procedure
