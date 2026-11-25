







import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Deontic

open Proving.USC.Common




inductive Modality where
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr



opaque Place : Type


opaque Property : Type



opaque Offense : Type


opaque HealthCareBenefitProgram : Type




opaque Institution : Type


opaque Court : Type


opaque Agency : Type




opaque IdentificationItem : Type


opaque DocumentMakingImplement : Type


opaque MeansOfIdentification : Type


opaque AccessDevice : Type


opaque DeviceMakingEquipment : Type


opaque TelecommunicationsInstrument : Type

end Proving.USC.T18.Ch1Ch47.Recert.Deontic
