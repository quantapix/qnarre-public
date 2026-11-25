












import Proving.USC.Common.Types
import Proving.USC.T18.PredicateDefs.Procedure.Types
import Proving.USC.T18.PredicateDefs.Procedure.Predicates

namespace Proving.USC.T18.PredicateDefs.Procedure

open Proving.USC.Common



structure Transition (op : OfficialProceeding) (c : ComplaintText) where
  fromState : State
  toState   : State
  guard     : Prop




structure ProceedingIsOfficial (op : OfficialProceeding) (c : ComplaintText) : Prop where
  official : IsOfficialProceeding op c






structure SafeHarborApplies (op : OfficialProceeding) (c : ComplaintText) : Prop where
  official  : IsOfficialProceeding op c
  bonaFide  : BonaFideLegalRepresentation op c





inductive Reachable (op : OfficialProceeding) (c : ComplaintText) : State → Prop

  | official  (h : ProceedingIsOfficial op c) : Reachable op c State.Official

  | safeHarbor (h : SafeHarborApplies op c)    : Reachable op c State.SafeHarbored

end Proving.USC.T18.PredicateDefs.Procedure
