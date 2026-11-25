
















import Proving.USC.Common.Types

namespace Proving.USC.T42.Ch6ASchI.Part3.Procedure

open Proving.USC.Common




inductive Sec233Stage
  | IncidentOccurred
  | SuitFiledStateCourt
  | AGCertified
  | RemovedToFederal
  | DeemedTortAgainstUS
  | Remanded
  | Dismissed
  deriving DecidableEq, Repr





structure Transition where
  fromStage : Sec233Stage
  toStage   : Sec233Stage
  firedAt   : Time

end Proving.USC.T42.Ch6ASchI.Part3.Procedure
