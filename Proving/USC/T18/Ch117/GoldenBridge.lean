




































import Proving.Rico.Statute
import Proving.USC.Common.Types
import Proving.USC.T18.Ch117.Elements.Statute

namespace Proving.USC.T18.Ch117.GoldenBridge

open Proving.USC.Common
open Proving.USC.T18.Ch117







axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText
axiom rackAct2421a : Person → Person → ComplaintText → Proving.Rico.Act
axiom rackAct2422a : Person → Person → ComplaintText → Proving.Rico.Act
axiom rackAct2422b : Person → Person → ComplaintText → Proving.Rico.Act
axiom rackAct2423a : Person → Person → ComplaintText → Proving.Rico.Act
axiom rackAct2423b : Person → ComplaintText → Proving.Rico.Act
axiom rackAct2423c : Person → ComplaintText → Proving.Rico.Act
axiom rackAct2423e : Person → Person → ComplaintText → Proving.Rico.Act
axiom rackAct2424a : Person → Person → ComplaintText → Proving.Rico.Act



axiom corr_rack_2421a {p v c} : Elements.Section2421a p v c →
    Proving.Rico.IsRacketeeringActivity (rackAct2421a p v c) (mapComplaint c)
axiom corr_rack_2422a {p v c} : Elements.Section2422a p v c →
    Proving.Rico.IsRacketeeringActivity (rackAct2422a p v c) (mapComplaint c)
axiom corr_rack_2422b {p v c} : Elements.Section2422b p v c →
    Proving.Rico.IsRacketeeringActivity (rackAct2422b p v c) (mapComplaint c)
axiom corr_rack_2423a {p v c} : Elements.Section2423a p v c →
    Proving.Rico.IsRacketeeringActivity (rackAct2423a p v c) (mapComplaint c)
axiom corr_rack_2423b {p c} : Elements.Section2423b p c →
    Proving.Rico.IsRacketeeringActivity (rackAct2423b p c) (mapComplaint c)
axiom corr_rack_2423c {p c} : Elements.Section2423c p c →
    Proving.Rico.IsRacketeeringActivity (rackAct2423c p c) (mapComplaint c)
axiom corr_rack_2423e {p v c} : Elements.Section2423e p v c →
    Proving.Rico.IsRacketeeringActivity (rackAct2423e p v c) (mapComplaint c)
axiom corr_rack_2424a {p v c} : Elements.Section2424a p v c →
    Proving.Rico.IsRacketeeringActivity (rackAct2424a p v c) (mapComplaint c)



theorem s2421a_implies_racketeering {p v c} (h : Elements.Section2421a p v c) :
    Proving.Rico.IsRacketeeringActivity (rackAct2421a p v c) (mapComplaint c) :=
  corr_rack_2421a h

theorem s2422a_implies_racketeering {p v c} (h : Elements.Section2422a p v c) :
    Proving.Rico.IsRacketeeringActivity (rackAct2422a p v c) (mapComplaint c) :=
  corr_rack_2422a h

theorem s2422b_implies_racketeering {p v c} (h : Elements.Section2422b p v c) :
    Proving.Rico.IsRacketeeringActivity (rackAct2422b p v c) (mapComplaint c) :=
  corr_rack_2422b h

theorem s2423a_implies_racketeering {p v c} (h : Elements.Section2423a p v c) :
    Proving.Rico.IsRacketeeringActivity (rackAct2423a p v c) (mapComplaint c) :=
  corr_rack_2423a h

theorem s2423b_implies_racketeering {p c} (h : Elements.Section2423b p c) :
    Proving.Rico.IsRacketeeringActivity (rackAct2423b p c) (mapComplaint c) :=
  corr_rack_2423b h

theorem s2423c_implies_racketeering {p c} (h : Elements.Section2423c p c) :
    Proving.Rico.IsRacketeeringActivity (rackAct2423c p c) (mapComplaint c) :=
  corr_rack_2423c h

theorem s2423e_implies_racketeering {p v c} (h : Elements.Section2423e p v c) :
    Proving.Rico.IsRacketeeringActivity (rackAct2423e p v c) (mapComplaint c) :=
  corr_rack_2423e h

theorem s2424a_implies_racketeering {p v c} (h : Elements.Section2424a p v c) :
    Proving.Rico.IsRacketeeringActivity (rackAct2424a p v c) (mapComplaint c) :=
  corr_rack_2424a h

end Proving.USC.T18.Ch117.GoldenBridge
