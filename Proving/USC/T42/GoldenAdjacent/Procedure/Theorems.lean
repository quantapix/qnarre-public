







import Proving.USC.T42.GoldenAdjacent.Procedure.Statute

namespace Proving.USC.T42.GoldenAdjacent.Procedure

open Proving.USC.Common

theorem reachAdjudicated_intro {pr c}
    (hEnf : IsEnforcementProceeding pr c)
    (hJur : JurisdictionExercised pr c)
    (hAdj : Adjudicated pr c) : ReachAdjudicated pr c :=
  ⟨hEnf, hJur, hAdj⟩

theorem reachPartyPrevailed_intro {p pr c}
    (hReach : ReachAdjudicated pr c)
    (hPrev : IsPrevailingParty p pr c) : ReachPartyPrevailed p pr c :=
  ⟨hReach, hPrev⟩

theorem timelyFeeAward_intro {p pr fr c}
    (hReach : ReachPartyPrevailed p pr c)
    (hReq : FeeRequested p fr c)
    (hReas : FeeIsReasonable fr c)
    (hBar : JudicialOfficerBarInapplicable p pr c) : TimelyFeeAward p pr fr c :=
  ⟨hReach, hReq, hReas, hBar⟩

theorem feeAwardReachable_intro {p pr fr c}
    (h : TimelyFeeAward p pr fr c) : FeeAwardReachable p pr fr c :=
  h

end Proving.USC.T42.GoldenAdjacent.Procedure
