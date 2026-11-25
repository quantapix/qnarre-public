








































import Proving.USC.T18.Ch42.Elements.Statute
import Proving.Rico.Statute

namespace Proving.USC.T18.Ch42.GoldenBridge
open Proving.USC.T18.Ch42.Elements
open Proving.USC.Common








axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText
axiom act_s892 : Person → Proving.Rico.Act
axiom act_s893 : Person → Proving.Rico.Act
axiom act_s894 : Person → Proving.Rico.Act



axiom corr_s892_racketeering {p : Person} {ag : Agreement} {cr : Credit} {c : ComplaintText} :
    Section892 p ag cr c →
    Proving.Rico.IsRacketeeringActivity (act_s892 p) (mapComplaint c)

axiom corr_s893_racketeering {p : Person} {c : ComplaintText} :
    Section893 p c →
    Proving.Rico.IsRacketeeringActivity (act_s893 p) (mapComplaint c)

axiom corr_s894_racketeering {p : Person} {ag : Agreement} {c : ComplaintText} :
    Section894 p ag c →
    Proving.Rico.IsRacketeeringActivity (act_s894 p) (mapComplaint c)





theorem s892_elements_implies_golden_racketeering
    {p : Person} {ag : Agreement} {cr : Credit} {c : ComplaintText}
    (h : Section892 p ag cr c) :
    Proving.Rico.IsRacketeeringActivity (act_s892 p) (mapComplaint c) :=
  corr_s892_racketeering h



theorem s893_elements_implies_golden_racketeering
    {p : Person} {c : ComplaintText} (h : Section893 p c) :
    Proving.Rico.IsRacketeeringActivity (act_s893 p) (mapComplaint c) :=
  corr_s893_racketeering h



theorem s894_elements_implies_golden_racketeering
    {p : Person} {ag : Agreement} {c : ComplaintText} (h : Section894 p ag c) :
    Proving.Rico.IsRacketeeringActivity (act_s894 p) (mapComplaint c) :=
  corr_s894_racketeering h

end Proving.USC.T18.Ch42.GoldenBridge
