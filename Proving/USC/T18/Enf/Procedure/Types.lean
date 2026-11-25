













import Proving.USC.Common.Types

namespace Proving.USC.T18.Enf.Procedure

open Proving.USC.Common



opaque Property : Type




opaque ChargingInstrument : Type



opaque PreservationOrder : Type



opaque AncillaryPetition : Type



inductive State

  | Initiated

  | Restrained

  | Adjudicated

  | AncillaryPending

  | Concluded

  | TimeBarred
  deriving DecidableEq, Repr

end Proving.USC.T18.Enf.Procedure
