








































import Proving.USC.T18.Ch11.Elements.Statute
import Proving.Rico.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch11.GoldenBridge
open Proving.USC.Common
open Proving.USC.T18.Ch11





axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText


axiom mapAct201 : Elements.Matter → Proving.Rico.Act


axiom mapAct224 : Elements.Entity → Proving.Rico.Act





axiom corr_201 {p o : Person} {t : Elements.Thing} {m : Elements.Matter} {c : ComplaintText} :
    Elements.ViolatesSection201 p o t m c →
    Proving.Rico.IsRacketeeringActivity (mapAct201 m) (mapComplaint c)

axiom corr_224 {p : Person} {e : Elements.Entity} {c : ComplaintText} :
    Elements.Section224 p e c →
    Proving.Rico.IsRacketeeringActivity (mapAct224 e) (mapComplaint c)





theorem cand_201_implies_golden {p o t m c} (h : Elements.ViolatesSection201 p o t m c) :
    Proving.Rico.IsRacketeeringActivity (mapAct201 m) (mapComplaint c) := corr_201 h

theorem cand_224_implies_golden {p e c} (h : Elements.Section224 p e c) :
    Proving.Rico.IsRacketeeringActivity (mapAct224 e) (mapComplaint c) := corr_224 h

end Proving.USC.T18.Ch11.GoldenBridge
