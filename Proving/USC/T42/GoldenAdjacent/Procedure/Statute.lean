











import Proving.USC.T42.GoldenAdjacent.Procedure.Predicates

namespace Proving.USC.T42.GoldenAdjacent.Procedure

open Proving.USC.Common


structure Transition where
  source : State
  target : State




structure ReachAdjudicated (pr : Proceeding) (c : ComplaintText) : Prop where
  isEnforcement : IsEnforcementProceeding pr c
  jurisdiction  : JurisdictionExercised pr c
  adjudicated   : Adjudicated pr c



structure ReachPartyPrevailed (p : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  reachedAdjudicated : ReachAdjudicated pr c
  prevailing         : IsPrevailingParty p pr c




structure TimelyFeeAward (p : Person) (pr : Proceeding) (fr : FeeRequest) (c : ComplaintText) : Prop where
  reachedPrevailed : ReachPartyPrevailed p pr c
  feeRequested     : FeeRequested p fr c
  feeReasonable    : FeeIsReasonable fr c
  barInapplicable  : JudicialOfficerBarInapplicable p pr c



def FeeAwardReachable (p : Person) (pr : Proceeding) (fr : FeeRequest) (c : ComplaintText) : Prop :=
  TimelyFeeAward p pr fr c

end Proving.USC.T42.GoldenAdjacent.Procedure
