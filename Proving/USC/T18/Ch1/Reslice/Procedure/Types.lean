


















import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Procedure

open Proving.USC.Common



opaque Prosecution : Type



opaque Locus : Type


opaque Vessel : Type


opaque Aircraft : Type



opaque SpaceVehicle : Type


opaque Institution : Type



opaque Property : Type


opaque Representation : Type



opaque Forum : Type



opaque Charge : Type



opaque BenefitProgram : Type






inductive Stage where

  | Alleged

  | LocusFixed

  | JurisdictionAttached

  | ForumCompetent

  | ElementEstablished

  | OffenseClassified
  deriving DecidableEq

end Proving.USC.T18.Ch1.Reslice.Procedure
