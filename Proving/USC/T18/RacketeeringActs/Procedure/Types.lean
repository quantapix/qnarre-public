


















import Proving.USC.Common.Types

namespace Proving.USC.T18.RacketeeringActs.Procedure

open Proving.USC.Common






opaque ChargedTransaction : Type








inductive Stage
  | NexusEstablished
  | ProperlyVenued
  | JurisdictionAttached
  | Prosecuted
  | TimeBarred
  deriving DecidableEq, Repr

end Proving.USC.T18.RacketeeringActs.Procedure
