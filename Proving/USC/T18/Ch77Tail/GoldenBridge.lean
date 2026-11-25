




































import Proving.USC.T18.Ch77Tail.Elements.Statute
import Proving.Rico.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch77Tail.GoldenBridge

open Proving.USC.Common
open Proving.USC.T18.Ch77Tail









opaque Act : Type
axiom mapAct       : Act           → Proving.Rico.Act
axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText



axiom corr_1582_is_racketeering {p : Person} {ve : Elements.Vessel}
    {a : Act} {c : ComplaintText} :
    Elements.Section1582 p ve c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)
axiom corr_1585_is_racketeering {p victim : Person}
    {a : Act} {c : ComplaintText} :
    Elements.Section1585 p victim c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)
axiom corr_1586_is_racketeering {p : Person} {ve : Elements.Vessel}
    {a : Act} {c : ComplaintText} :
    Elements.Section1586 p ve c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)
axiom corr_1587_is_racketeering {p victim : Person} {ve : Elements.Vessel}
    {a : Act} {c : ComplaintText} :
    Elements.Section1587 p ve victim c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)
axiom corr_1588_is_racketeering {p victim : Person}
    {a : Act} {c : ComplaintText} :
    Elements.Section1588 p victim c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)
axiom corr_1592_is_racketeering {p : Person} {d : Elements.Document}
    {a : Act} {c : ComplaintText} :
    Elements.Section1592 p d c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)




theorem s1582_elements_implies_rico
    {p : Person} {ve : Elements.Vessel} {a : Act} {c : ComplaintText}
    (h : Elements.Section1582 p ve c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  corr_1582_is_racketeering h


theorem s1585_elements_implies_rico
    {p victim : Person} {a : Act} {c : ComplaintText}
    (h : Elements.Section1585 p victim c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  corr_1585_is_racketeering h


theorem s1586_elements_implies_rico
    {p : Person} {ve : Elements.Vessel} {a : Act} {c : ComplaintText}
    (h : Elements.Section1586 p ve c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  corr_1586_is_racketeering h


theorem s1587_elements_implies_rico
    {p victim : Person} {ve : Elements.Vessel} {a : Act} {c : ComplaintText}
    (h : Elements.Section1587 p ve victim c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  corr_1587_is_racketeering h


theorem s1588_elements_implies_rico
    {p victim : Person} {a : Act} {c : ComplaintText}
    (h : Elements.Section1588 p victim c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  corr_1588_is_racketeering h


theorem s1592_elements_implies_rico
    {p : Person} {d : Elements.Document} {a : Act} {c : ComplaintText}
    (h : Elements.Section1592 p d c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  corr_1592_is_racketeering h









theorem ch77_elements_implies_rico
    {p victim : Person} {ve : Elements.Vessel} {d : Elements.Document}
    {a : Act} {c : ComplaintText}
    (h : Elements.Chapter77SlaveryOffense p ve victim d c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  match h with
  | .s1582 h => corr_1582_is_racketeering h
  | .s1585 h => corr_1585_is_racketeering h
  | .s1586 h => corr_1586_is_racketeering h
  | .s1587 h => corr_1587_is_racketeering h
  | .s1588 h => corr_1588_is_racketeering h
  | .s1592 h => corr_1592_is_racketeering h

end Proving.USC.T18.Ch77Tail.GoldenBridge
