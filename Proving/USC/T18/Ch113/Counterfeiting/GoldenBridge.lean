

































import Proving.USC.T18.Ch113.Counterfeiting.Elements.Statute
import Proving.Rico.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch113.Counterfeiting.GoldenBridge
open Proving.USC.Common
open Proving.USC.T18.Ch113.Counterfeiting





axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText


axiom mapActLabel : Elements.Label → Proving.Rico.Act

axiom mapActWork  : Elements.Work → Proving.Rico.Act

axiom mapActGoods : Elements.Goods → Proving.Rico.Act




axiom corr_2318 {p : Person} {l : Elements.Label} {w : Elements.Work} {c : ComplaintText} :
    Elements.Section2318Offense p l w c →
    Proving.Rico.IsRacketeeringActivity (mapActLabel l) (mapComplaint c)

axiom corr_2319 {p : Person} {w : Elements.Work} {c : ComplaintText} :
    Elements.Section2319Offense p w c →
    Proving.Rico.IsRacketeeringActivity (mapActWork w) (mapComplaint c)


axiom corr_2320 {p : Person} {m : Elements.Mark} {g : Elements.Goods} {c : ComplaintText} :
    Elements.Section2320Offense p m g c →
    Proving.Rico.IsRacketeeringActivity (mapActGoods g) (mapComplaint c)





theorem cand_2318_implies_golden {p l w c} (h : Elements.Section2318Offense p l w c) :
    Proving.Rico.IsRacketeeringActivity (mapActLabel l) (mapComplaint c) := corr_2318 h

theorem cand_2319_implies_golden {p w c} (h : Elements.Section2319Offense p w c) :
    Proving.Rico.IsRacketeeringActivity (mapActWork w) (mapComplaint c) := corr_2319 h

theorem cand_2320_implies_golden {p m g c} (h : Elements.Section2320Offense p m g c) :
    Proving.Rico.IsRacketeeringActivity (mapActGoods g) (mapComplaint c) := corr_2320 h

end Proving.USC.T18.Ch113.Counterfeiting.GoldenBridge
