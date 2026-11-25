












import Proving.USC.Common.Types

namespace Proving.USC.T22.Procedure.Sub

open Proving.USC.Common



inductive State
  | Inception
  | ApparatusConstituted
  | DirectorSeated
  | ReportPending
  | ReportTimelyFiled
  | ReportUntimely
  | DataRequested
  | PresumptionTriggered
  deriving DecidableEq, Repr

end Proving.USC.T22.Procedure.Sub
