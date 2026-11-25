















import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch2.Procedure

open Proving.USC.Common (Person ComplaintText Time)



opaque Aircraft : Type


opaque MotorVehicle : Type



opaque Regulation : Type









inductive State
  | Directed
  | Stopped
  | Submitted
  | Released
  | Charged
  | Convicted
  | Sentenced
  | ProceedingPending
  | FinalJudgment
  | ProsecutionBarred
  | CivilActionBrought
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch2.Procedure
