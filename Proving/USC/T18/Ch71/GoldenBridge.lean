








































import Proving.USC.T18.Ch71.Elements.Statute
import Proving.Rico.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch71.GoldenBridge
open Proving.USC.Common
open Proving.USC.T18





axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText

axiom mapActMatter : Elements.Matter → Proving.Rico.Act




axiom corr_1461 {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section1461 p m c →
    Proving.Rico.IsRacketeeringActivity (mapActMatter m) (mapComplaint c)

axiom corr_1462 {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section1462 p m c →
    Proving.Rico.IsRacketeeringActivity (mapActMatter m) (mapComplaint c)

axiom corr_1463 {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section1463 p m c →
    Proving.Rico.IsRacketeeringActivity (mapActMatter m) (mapComplaint c)

axiom corr_1464 {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section1464 p m c →
    Proving.Rico.IsRacketeeringActivity (mapActMatter m) (mapComplaint c)

axiom corr_1465 {p : Person} {m : Elements.Matter} {c : ComplaintText} :
    Elements.Section1465 p m c →
    Proving.Rico.IsRacketeeringActivity (mapActMatter m) (mapComplaint c)





theorem cand_1461_implies_golden {p m c} (h : Elements.Section1461 p m c) :
    Proving.Rico.IsRacketeeringActivity (mapActMatter m) (mapComplaint c) := corr_1461 h

theorem cand_1462_implies_golden {p m c} (h : Elements.Section1462 p m c) :
    Proving.Rico.IsRacketeeringActivity (mapActMatter m) (mapComplaint c) := corr_1462 h

theorem cand_1463_implies_golden {p m c} (h : Elements.Section1463 p m c) :
    Proving.Rico.IsRacketeeringActivity (mapActMatter m) (mapComplaint c) := corr_1463 h

theorem cand_1464_implies_golden {p m c} (h : Elements.Section1464 p m c) :
    Proving.Rico.IsRacketeeringActivity (mapActMatter m) (mapComplaint c) := corr_1464 h

theorem cand_1465_implies_golden {p m c} (h : Elements.Section1465 p m c) :
    Proving.Rico.IsRacketeeringActivity (mapActMatter m) (mapComplaint c) := corr_1465 h

end Proving.USC.T18.Ch71.GoldenBridge
