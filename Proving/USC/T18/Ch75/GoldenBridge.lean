































import Proving.Rico.Statute
import Proving.USC.Common.Types
import Proving.USC.T18.Ch75.Elements.Statute

namespace Proving.USC.T18.Ch75.GoldenBridge
open Proving.USC.Common








axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText
axiom rackAct1542 : Person → Proving.USC.T18.Ch75.Elements.Passport → ComplaintText → Proving.Rico.Act
axiom rackAct1543 : Person → Proving.USC.T18.Ch75.Elements.Passport → ComplaintText → Proving.Rico.Act
axiom rackAct1544 : Person → Proving.USC.T18.Ch75.Elements.Passport → ComplaintText → Proving.Rico.Act
axiom rackAct1546 : Person → Proving.USC.T18.Ch75.Elements.EntryDocument → ComplaintText → Proving.Rico.Act




axiom corr_rack_1542 {p pp c} :
    Proving.USC.T18.Ch75.Elements.Section1542 p pp c →
    Proving.Rico.IsRacketeeringActivity (rackAct1542 p pp c) (mapComplaint c)

axiom corr_rack_1543 {p pp c} :
    Proving.USC.T18.Ch75.Elements.Section1543 p pp c →
    Proving.Rico.IsRacketeeringActivity (rackAct1543 p pp c) (mapComplaint c)

axiom corr_rack_1544 {p pp c} :
    Proving.USC.T18.Ch75.Elements.Section1544 p pp c →
    Proving.Rico.IsRacketeeringActivity (rackAct1544 p pp c) (mapComplaint c)

axiom corr_rack_1546 {p d c} :
    Proving.USC.T18.Ch75.Elements.Section1546 p d c →
    Proving.Rico.IsRacketeeringActivity (rackAct1546 p d c) (mapComplaint c)




theorem s1542_implies_racketeering {p pp c}
    (h : Proving.USC.T18.Ch75.Elements.Section1542 p pp c) :
    Proving.Rico.IsRacketeeringActivity (rackAct1542 p pp c) (mapComplaint c) :=
  corr_rack_1542 h


theorem s1543_implies_racketeering {p pp c}
    (h : Proving.USC.T18.Ch75.Elements.Section1543 p pp c) :
    Proving.Rico.IsRacketeeringActivity (rackAct1543 p pp c) (mapComplaint c) :=
  corr_rack_1543 h


theorem s1544_implies_racketeering {p pp c}
    (h : Proving.USC.T18.Ch75.Elements.Section1544 p pp c) :
    Proving.Rico.IsRacketeeringActivity (rackAct1544 p pp c) (mapComplaint c) :=
  corr_rack_1544 h


theorem s1546_implies_racketeering {p d c}
    (h : Proving.USC.T18.Ch75.Elements.Section1546 p d c) :
    Proving.Rico.IsRacketeeringActivity (rackAct1546 p d c) (mapComplaint c) :=
  corr_rack_1546 h

end Proving.USC.T18.Ch75.GoldenBridge
