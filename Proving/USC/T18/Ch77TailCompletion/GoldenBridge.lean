














































import Proving.USC.T18.Ch77TailCompletion.Elements.Statute
import Proving.Rico.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch77TailCompletion.GoldenBridge

open Proving.USC.Common
open Proving.USC.T18.Ch77TailCompletion








opaque Act : Type
axiom mapAct       : Act           → Proving.Rico.Act
axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText



axiom corr_1583_is_racketeering {p v : Person} {a : Act} {c : ComplaintText} :
    Elements.Section1583 p v c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)
axiom corr_1584_is_racketeering {p v : Person} {a : Act} {c : ComplaintText} :
    Elements.Section1584Liability p v c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)





theorem s1583_elements_implies_rico
    {p v : Person} {a : Act} {c : ComplaintText} (h : Elements.Section1583 p v c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  corr_1583_is_racketeering h



theorem s1584_elements_implies_rico
    {p v : Person} {a : Act} {c : ComplaintText} (h : Elements.Section1584Liability p v c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  corr_1584_is_racketeering h








theorem ch77tail_elements_implies_rico
    {p v : Person} {a : Act} {c : ComplaintText}
    (h : Elements.Section1583 p v c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  corr_1583_is_racketeering h

end Proving.USC.T18.Ch77TailCompletion.GoldenBridge
