












import Proving.USC.Common.Types
import Proving.USC.T29.MiscProvisions.Procedure.Types
import Proving.USC.T29.MiscProvisions.Procedure.Predicates

namespace Proving.USC.T29.MiscProvisions.Procedure

open Proving.USC.Common







structure DeclinationStep (d : LaborDispute) (c : ComplaintText) : Prop where
  notSubstantial : BoardEffectNotSubstantial d c
  declined       : BoardDeclinedJurisdiction d c
  aboveFloor     : Above1959JurisdictionFloor d c




structure StateAssumptionStep (d : LaborDispute) (c : ComplaintText) : Prop where
  priorDeclination : DeclinationStep d c
  stateAssumed     : StateForumAssumed d c




def Jurisdiction164cReachable (d : LaborDispute) (c : ComplaintText) : Prop :=
  StateAssumptionStep d c








structure Validation168Step (a : BoardAction) (c : ComplaintText) : Prop where
  challenged      : ChallengeOn159fghGround a c
  withinCure      : Within168CureWindow a c
  liabilityBarred : Before1951LiabilityBar a c
  notFinal        : NotFinal160efJudgment a c



def Validation168Reachable (a : BoardAction) (c : ComplaintText) : Prop :=
  Validation168Step a c





inductive Reaches (d : LaborDispute) (c : ComplaintText) :
    JurisdictionState → JurisdictionState → Prop where
  | refl (s : JurisdictionState) : Reaches d c s s
  | decline :
      DeclinationStep d c →
      Reaches d c JurisdictionState.BeforeAssertion JurisdictionState.BoardDeclined
  | assume :
      StateAssumptionStep d c →
      Reaches d c JurisdictionState.BoardDeclined JurisdictionState.StateAssumed
  | trans {x y z} :
      Reaches d c x y → Reaches d c y z → Reaches d c x z

end Proving.USC.T29.MiscProvisions.Procedure
