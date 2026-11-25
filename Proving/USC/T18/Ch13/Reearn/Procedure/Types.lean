import Proving.USC.Common.Types

set_option autoImplicit false






















namespace Proving.USC.T18.Ch13.Reearn.Procedure

open Proving.USC.Common



opaque Prosecution : Type



opaque Certification : Type



opaque Investigation : Type



opaque ChargingInstrument : Type



opaque CivilAction : Type



opaque DistrictCourt : Type



opaque Conviction : Type







inductive ProsecutionStage where
  | Uninitiated
  | Investigated
  | Certified
  | Prosecuted
  | TimeBarred
  deriving DecidableEq




inductive CivilStage where
  | Aggrieved
  | Commenced
  | JudgmentRendered
  deriving DecidableEq

end Proving.USC.T18.Ch13.Reearn.Procedure
