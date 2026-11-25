













































import Proving.USC.T18.Ch113.Reslice.Elements.Theorems
import Proving.Rico.Predicates

namespace Proving.USC.T18.Ch113.Reslice.GoldenBridge

open Proving.USC.Common










axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText
axiom act2315 : Person → Elements.Property → Proving.Rico.Act
axiom act2318 : Person → Elements.Label → Proving.Rico.Act
axiom act2320 : Person → Elements.TradeItem → Elements.Mark → Proving.Rico.Act









axiom corr_2315 {p item c} :
    Elements.Section2315Offense p item c →
    Proving.Rico.IsRacketeeringActivity (act2315 p item) (mapComplaint c)

axiom corr_2318 {p item c} :
    Elements.Section2318Offense p item c →
    Proving.Rico.IsRacketeeringActivity (act2318 p item) (mapComplaint c)

axiom corr_2320 {p item mark c} :
    Elements.Section2320Offense p item mark c →
    Proving.Rico.IsRacketeeringActivity (act2320 p item mark) (mapComplaint c)





theorem s2315_elements_implies_golden {p item c}
    (h : Elements.Section2315Offense p item c) :
    Proving.Rico.IsRacketeeringActivity (act2315 p item) (mapComplaint c) :=
  corr_2315 h





theorem s2318_elements_implies_golden {p item c}
    (h : Elements.Section2318Offense p item c) :
    Proving.Rico.IsRacketeeringActivity (act2318 p item) (mapComplaint c) :=
  corr_2318 h





theorem s2320_elements_implies_golden {p item mark c}
    (h : Elements.Section2320Offense p item mark c) :
    Proving.Rico.IsRacketeeringActivity (act2320 p item mark) (mapComplaint c) :=
  corr_2320 h

end Proving.USC.T18.Ch113.Reslice.GoldenBridge
