































import Proving.USC.T18.Ch113.Elements.Statute
import Proving.Rico.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch113.GoldenBridge
open Proving.USC.Common
open Proving.USC.T18.Ch113





axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText

axiom mapActVehicle : Elements.Instrument → Proving.Rico.Act





axiom corr_2312 {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section2312 p i c →
    Proving.Rico.IsRacketeeringActivity (mapActVehicle i) (mapComplaint c)


axiom corr_2313 {p : Person} {i : Elements.Instrument} {c : ComplaintText} :
    Elements.Section2313 p i c →
    Proving.Rico.IsRacketeeringActivity (mapActVehicle i) (mapComplaint c)





theorem cand_2312_implies_golden {p i c} (h : Elements.Section2312 p i c) :
    Proving.Rico.IsRacketeeringActivity (mapActVehicle i) (mapComplaint c) := corr_2312 h

theorem cand_2313_implies_golden {p i c} (h : Elements.Section2313 p i c) :
    Proving.Rico.IsRacketeeringActivity (mapActVehicle i) (mapComplaint c) := corr_2313 h

end Proving.USC.T18.Ch113.GoldenBridge
