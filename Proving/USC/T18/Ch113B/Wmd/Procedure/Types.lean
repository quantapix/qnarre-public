













import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Procedure

open Proving.USC.Common





opaque ChargingInstrument : Type












inductive ProceedingStage
  | conductCompleted
  | jurisdictionEstablished
  | investigationOpened
  | charged
  | convicted
  | sentenced
  deriving DecidableEq







inductive ConductClass

  | killingOrDeathResulting

  | kidnapping

  | maiming


  | assaultDangerousWeaponOrSeriousBodilyInjury


  | destructionOfProperty

  | attemptOrConspiracy (completed : ConductClass)

  | threat
  deriving DecidableEq

end Proving.USC.T18.Ch113B.Wmd.Procedure
