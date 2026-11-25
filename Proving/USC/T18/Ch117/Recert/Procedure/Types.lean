









import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Procedure

open Proving.USC.Common











opaque CivilAction : Type




opaque Prosecution : Type



inductive CivilStage
  | Injured
  | Accrued
  | Filed
  | Adjudicated
  | TimeBarred
  deriving DecidableEq, Repr





inductive DefenseStage
  | Charged
  | DefenseRaised
  | DefenseEstablished
  | ChargeDefeated
  | Unavailable
  deriving DecidableEq, Repr



inductive RestitutionStage
  | Convicted
  | RestitutionOrdered
  | ScopeSettled
  deriving DecidableEq, Repr




inductive Section2421ACharge
  | subsectionA
  | subsectionB1
  | subsectionB2
  deriving DecidableEq, Repr



inductive Section2423Offense
  | subsectionA
  | subsectionB
  | subsectionC
  | subsectionD
  | subsectionE
  deriving DecidableEq, Repr





inductive BurdenQuantum
  | preponderance
  | clearAndConvincing
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch117.Recert.Procedure
