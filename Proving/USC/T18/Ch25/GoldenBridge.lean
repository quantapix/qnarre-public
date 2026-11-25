

































import Proving.Rico.Statute
import Proving.USC.Common.Types
import Proving.USC.T18.Ch25.Elements.Statute

namespace Proving.USC.T18.Ch25.GoldenBridge

open Proving.USC.Common








axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText
axiom rackAct471 : Person → Proving.USC.T18.Ch25.Elements.Instrument → ComplaintText → Proving.Rico.Act
axiom rackAct472 : Person → Proving.USC.T18.Ch25.Elements.Instrument → ComplaintText → Proving.Rico.Act
axiom rackAct473 : Person → Proving.USC.T18.Ch25.Elements.Instrument → ComplaintText → Proving.Rico.Act




axiom corr_rack_471 {p i c} :
    Proving.USC.T18.Ch25.Elements.Section0471 p i c →
    Proving.Rico.IsRacketeeringActivity (rackAct471 p i c) (mapComplaint c)

axiom corr_rack_472 {p i c} :
    Proving.USC.T18.Ch25.Elements.Section0472 p i c →
    Proving.Rico.IsRacketeeringActivity (rackAct472 p i c) (mapComplaint c)

axiom corr_rack_473 {p i c} :
    Proving.USC.T18.Ch25.Elements.Section0473 p i c →
    Proving.Rico.IsRacketeeringActivity (rackAct473 p i c) (mapComplaint c)




theorem s471_implies_racketeering {p i c}
    (h : Proving.USC.T18.Ch25.Elements.Section0471 p i c) :
    Proving.Rico.IsRacketeeringActivity (rackAct471 p i c) (mapComplaint c) :=
  corr_rack_471 h


theorem s472_implies_racketeering {p i c}
    (h : Proving.USC.T18.Ch25.Elements.Section0472 p i c) :
    Proving.Rico.IsRacketeeringActivity (rackAct472 p i c) (mapComplaint c) :=
  corr_rack_472 h


theorem s473_implies_racketeering {p i c}
    (h : Proving.USC.T18.Ch25.Elements.Section0473 p i c) :
    Proving.Rico.IsRacketeeringActivity (rackAct473 p i c) (mapComplaint c) :=
  corr_rack_473 h

end Proving.USC.T18.Ch25.GoldenBridge
