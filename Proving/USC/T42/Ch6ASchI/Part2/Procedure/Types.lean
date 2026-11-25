import Proving.USC.Common.Types








namespace Proving.USC.T42.Ch6ASchI.Part2.Procedure

open Proving.USC.Common


inductive PromotionStage
  | InGrade
  | Examined
  | Qualified
  | Promoted
  | Separated
  deriving DecidableEq, Repr


inductive RetirementStage
  | OnActiveDuty
  | RetirementApplied
  | Retired
  | FlagPresented
  deriving DecidableEq, Repr


inductive CorpsStatus
  | Civilian
  | Militarized
  deriving DecidableEq, Repr

end Proving.USC.T42.Ch6ASchI.Part2.Procedure
