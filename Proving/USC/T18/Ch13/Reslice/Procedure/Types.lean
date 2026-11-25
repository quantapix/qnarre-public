









import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reslice.Procedure

open Proving.USC.Common



opaque Offense : Type



opaque Certification : Type



opaque CivilAction : Type


opaque Court : Type



inductive CriminalStage where

  | Investigated

  | Certified

  | Charged

  | Adjudicated

  | TimeBarred
  deriving DecidableEq, Repr


inductive CivilStage where

  | Injured

  | Filed

  | ReliefAwarded


  | FinalJudgment
  deriving DecidableEq, Repr



structure GuardedTransition (σ : Type) where
  source : σ
  target : σ
  guard : Prop


inductive Section245PenaltyTier where
  | Base
  | BodilyInjuryOrDangerousInstrumentality
  | DeathOrKidnappingOrSexualAbuseOrAttemptToKill
  deriving DecidableEq, Repr


inductive Section247PenaltyTier where
  | DeathOrKidnappingOrSexualAbuseOrAttemptToKill
  | BodilyInjuryByFireOrExplosive
  | BodilyInjuryOrDangerousInstrumentality
  | PropertyDamageOverThreshold
  | Residual
  deriving DecidableEq, Repr


inductive Section248PenaltyTier where
  | NonviolentObstructionFirst
  | NonviolentObstructionSubsequent
  | First
  | Subsequent
  | BodilyInjury
  | Death
  deriving DecidableEq, Repr

end Proving.USC.T18.Ch13.Reslice.Procedure
