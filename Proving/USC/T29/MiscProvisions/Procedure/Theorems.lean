







import Proving.USC.Common.Types
import Proving.USC.T29.MiscProvisions.Procedure.Types
import Proving.USC.T29.MiscProvisions.Procedure.Predicates
import Proving.USC.T29.MiscProvisions.Procedure.Statute

namespace Proving.USC.T29.MiscProvisions.Procedure

open Proving.USC.Common


theorem declination164c_intro {d c}
    (hNot : BoardEffectNotSubstantial d c)
    (hDec : BoardDeclinedJurisdiction d c)
    (hFloor : Above1959JurisdictionFloor d c) :
    DeclinationStep d c :=
  ⟨hNot, hDec, hFloor⟩



theorem stateAssumption164c_intro {d c}
    (hDecl : DeclinationStep d c)
    (hState : StateForumAssumed d c) :
    StateAssumptionStep d c :=
  ⟨hDecl, hState⟩


theorem jurisdiction164cReachable_intro {d c}
    (hStep : StateAssumptionStep d c) :
    Jurisdiction164cReachable d c :=
  hStep



theorem validation168_intro {a c}
    (hChal : ChallengeOn159fghGround a c)
    (hCure : Within168CureWindow a c)
    (hLiab : Before1951LiabilityBar a c)
    (hFinal : NotFinal160efJudgment a c) :
    Validation168Step a c :=
  ⟨hChal, hCure, hLiab, hFinal⟩


theorem validation168Reachable_intro {a c}
    (hStep : Validation168Step a c) :
    Validation168Reachable a c :=
  hStep



theorem reachesStateAssumed_intro {d c}
    (hDecl : DeclinationStep d c)
    (hAssume : StateAssumptionStep d c) :
    Reaches d c JurisdictionState.BeforeAssertion JurisdictionState.StateAssumed :=
  Reaches.trans (Reaches.decline hDecl) (Reaches.assume hAssume)

end Proving.USC.T29.MiscProvisions.Procedure
