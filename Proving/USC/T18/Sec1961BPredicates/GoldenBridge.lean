



























import Proving.USC.T18.Sec1961BPredicates.Elements.Statute
import Proving.Rico.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Sec1961BPredicates.GoldenBridge
open Proving.USC.Common
open Proving.USC.T18.Sec1961BPredicates




axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText

axiom mapActStolen   : Elements.Property        → Proving.Rico.Act
axiom mapActIdDoc    : Elements.IdDocument      → Proving.Rico.Act
axiom mapActDevice   : Elements.AccessDevice    → Proving.Rico.Act
axiom mapActGambling : Elements.GamblingBusiness → Proving.Rico.Act
axiom mapActWire     : Elements.WireComm        → Proving.Rico.Act





axiom corr_2314 {p : Person} {prop : Elements.Property} {c : ComplaintText} :
    Elements.ViolationOf2314 p prop c →
    Proving.Rico.IsRacketeeringActivity (mapActStolen prop) (mapComplaint c)
axiom corr_2315 {p : Person} {prop : Elements.Property} {c : ComplaintText} :
    Elements.ViolationOf2315 p prop c →
    Proving.Rico.IsRacketeeringActivity (mapActStolen prop) (mapComplaint c)


axiom corr_1028 {p : Person} {doc : Elements.IdDocument} {c : ComplaintText} :
    Elements.Section1028a p doc c →
    Proving.Rico.IsRacketeeringActivity (mapActIdDoc doc) (mapComplaint c)


axiom corr_1029 {p : Person} {d : Elements.AccessDevice} {c : ComplaintText} :
    Elements.Section1029a p d c →
    Proving.Rico.IsRacketeeringActivity (mapActDevice d) (mapComplaint c)


axiom corr_1955 {p : Person} {gb : Elements.GamblingBusiness} {c : ComplaintText} :
    Elements.Section1955 p gb c →
    Proving.Rico.IsRacketeeringActivity (mapActGambling gb) (mapComplaint c)


axiom corr_1084 {p : Person} {w : Elements.WireComm} {c : ComplaintText} :
    Elements.Section1084a p w c →
    Proving.Rico.IsRacketeeringActivity (mapActWire w) (mapComplaint c)







theorem cand_2314_implies_golden {p prop c} (h : Elements.ViolationOf2314 p prop c) :
    Proving.Rico.IsRacketeeringActivity (mapActStolen prop) (mapComplaint c) := corr_2314 h

theorem cand_2315_implies_golden {p prop c} (h : Elements.ViolationOf2315 p prop c) :
    Proving.Rico.IsRacketeeringActivity (mapActStolen prop) (mapComplaint c) := corr_2315 h

theorem cand_1028_implies_golden {p doc c} (h : Elements.Section1028a p doc c) :
    Proving.Rico.IsRacketeeringActivity (mapActIdDoc doc) (mapComplaint c) := corr_1028 h

theorem cand_1029_implies_golden {p d c} (h : Elements.Section1029a p d c) :
    Proving.Rico.IsRacketeeringActivity (mapActDevice d) (mapComplaint c) := corr_1029 h

theorem cand_1955_implies_golden {p gb c} (h : Elements.Section1955 p gb c) :
    Proving.Rico.IsRacketeeringActivity (mapActGambling gb) (mapComplaint c) := corr_1955 h

theorem cand_1084_implies_golden {p w c} (h : Elements.Section1084a p w c) :
    Proving.Rico.IsRacketeeringActivity (mapActWire w) (mapComplaint c) := corr_1084 h

end Proving.USC.T18.Sec1961BPredicates.GoldenBridge
