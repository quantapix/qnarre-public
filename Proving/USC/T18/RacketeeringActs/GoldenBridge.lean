
































import Proving.USC.T18.RacketeeringActs.Elements.Theorems
import Proving.Rico.Predicates

namespace Proving.USC.T18.RacketeeringActs.GoldenBridge

open Proving.USC.Common







axiom mapAct       : Elements.Act    → Proving.Rico.Act
axiom mapComplaint : ComplaintText   → Proving.Rico.ComplaintText












axiom corr_enumerated {a c} :
    Elements.ActIsEnumeratedRacketeering a c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)

axiom corr_hobbs {a c} :
    Elements.Section1951 a c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)

axiom corr_travel {a c} :
    Elements.Section1952 a c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)







theorem cand_implies_golden_racketeering {a c}
    (h : Elements.RacketeeringActivity a c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  match h with
  | Elements.RacketeeringActivity.enumerated he => corr_enumerated he
  | Elements.RacketeeringActivity.hobbs hh      => corr_hobbs hh
  | Elements.RacketeeringActivity.travel ht     => corr_travel ht

end Proving.USC.T18.RacketeeringActs.GoldenBridge
