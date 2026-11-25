













































import Proving.USC.T18.Ch5Ch7Ch9Ch10.Elements.Statute
import Proving.Rico.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.GoldenBridge

open Proving.USC.Common
open Proving.USC.T18.Ch5Ch7Ch9Ch10






axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText
axiom mapAct       : ComplaintText → Proving.Rico.Act




axiom corr_rack_175 {p m c} : Elements.Section175 p m c →
    Proving.Rico.IsRacketeeringActivity (mapAct c) (mapComplaint c)


theorem section175_implies_golden {p m c} (h : Elements.Section175 p m c) :
    Proving.Rico.IsRacketeeringActivity (mapAct c) (mapComplaint c) :=
  corr_rack_175 h


axiom corr_rack_175b {p m c} : Elements.Section175b p m c →
    Proving.Rico.IsRacketeeringActivity (mapAct c) (mapComplaint c)


theorem section175b_implies_golden {p m c} (h : Elements.Section175b p m c) :
    Proving.Rico.IsRacketeeringActivity (mapAct c) (mapComplaint c) :=
  corr_rack_175b h


axiom corr_rack_175c {p c} : Elements.Section175c p c →
    Proving.Rico.IsRacketeeringActivity (mapAct c) (mapComplaint c)


theorem section175c_implies_golden {p c} (h : Elements.Section175c p c) :
    Proving.Rico.IsRacketeeringActivity (mapAct c) (mapComplaint c) :=
  corr_rack_175c h






axiom corr_rack_152 {p c} : Elements.Section152 p c →
    Proving.Rico.IsRacketeeringActivity (mapAct c) (mapComplaint c)


theorem section152_implies_golden {p c} (h : Elements.Section152 p c) :
    Proving.Rico.IsRacketeeringActivity (mapAct c) (mapComplaint c) :=
  corr_rack_152 h



axiom corr_rack_153 {p c} : Elements.Section153 p c →
    Proving.Rico.IsRacketeeringActivity (mapAct c) (mapComplaint c)


theorem section153_implies_golden {p c} (h : Elements.Section153 p c) :
    Proving.Rico.IsRacketeeringActivity (mapAct c) (mapComplaint c) :=
  corr_rack_153 h



axiom corr_rack_155 {p c} : Elements.Section155 p c →
    Proving.Rico.IsRacketeeringActivity (mapAct c) (mapComplaint c)


theorem section155_implies_golden {p c} (h : Elements.Section155 p c) :
    Proving.Rico.IsRacketeeringActivity (mapAct c) (mapComplaint c) :=
  corr_rack_155 h

end Proving.USC.T18.Ch5Ch7Ch9Ch10.GoldenBridge
