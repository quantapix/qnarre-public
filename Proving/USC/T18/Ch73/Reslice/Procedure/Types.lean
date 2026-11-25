









import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Procedure

open Proving.USC.Common



opaque OfficialProceeding : Type




opaque LegalProcess : Type




opaque EvidentiaryItem : Type




opaque Conduct : Type



opaque Prosecution : Type


opaque District : Type





inductive ProceedingStage
  | notInstituted
  | aboutToBeInstituted
  | pending
  | concluded
  deriving DecidableEq



inductive JusticeProcessStage

  | attendanceOrTestimony

  | reportToLawEnforcement

  | arrestSought


  | prosecutionOrRevocationInstituted
  deriving DecidableEq



inductive CompulsionStep
  | processServed
  | appearance
  | testimony
  | production
  deriving DecidableEq


inductive ProsecutionStage
  | notCommenced
  | commenced
  | defenseRaised
  | adjudicated
  deriving DecidableEq



inductive OffenseTier

  | killing

  | attemptedMurder

  | usedPhysicalForce

  | threatenedPhysicalForce

  | corruptPersuasion

  | evidenceObstruction

  | harassment
  deriving DecidableEq

end Proving.USC.T18.Ch73.Reslice.Procedure
