














































import Proving.Rico.Predicates
import Proving.USC.T18.Ch73.Reslice.Elements.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.GoldenBridge

open Proving.USC.Common (Person Agreement ComplaintText)
open Proving.USC.T18.Ch73.Reslice








opaque Act : Type


axiom mapAct : Act → Proving.Rico.Act

axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText









axiom corr_1512a1_B {d v : Person} {pr : Elements.OfficialProceeding} {o : Person}
    {c : ComplaintText} (a : Act) :
    Elements.Section1512a1 d v pr o c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)



axiom corr_1512a2_B {d v : Person} {pr : Elements.OfficialProceeding} {o : Person}
    {c : ComplaintText} (a : Act) :
    Elements.Section1512a2 d v pr o c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)



axiom corr_1512b_B {d v : Person} {pr : Elements.OfficialProceeding} {o : Person}
    {c : ComplaintText} (a : Act) :
    Elements.Section1512b d v pr o c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)



axiom corr_1512c_B {d : Person} {r : Elements.RecordOrObject}
    {pr : Elements.OfficialProceeding} {c : ComplaintText} (a : Act) :
    Elements.Section1512c d r pr c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)



axiom corr_1512d_B {d v : Person} {pr : Elements.OfficialProceeding} {o : Person}
    {c : ComplaintText} (a : Act) :
    Elements.Section1512d d v pr o c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)




axiom corr_1512k_B {d : Person} {ag : Agreement} {c : ComplaintText} (a : Act) :
    Elements.Section1512k d ag c →
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c)












theorem s1512_elements_implies_rico_1961B {d v : Person} {r : Elements.RecordOrObject}
    {pr : Elements.OfficialProceeding} {o : Person} {ag : Agreement} {c : ComplaintText}
    (a : Act) (h : Elements.Section1512Offense d v r pr o ag c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  match h with
  | .killing hk => corr_1512a1_B a hk
  | .force hf => corr_1512a2_B a hf
  | .tampering ht => corr_1512b_B a ht
  | .obstruction hc => corr_1512c_B a hc
  | .harassment hh => corr_1512d_B a hh
  | .conspiracy hcs => corr_1512k_B a hcs




theorem s1512_prosecution_implies_rico_1961B {d v : Person} {r : Elements.RecordOrObject}
    {pr : Elements.OfficialProceeding} {o : Person} {ag : Agreement} {c : ComplaintText}
    (a : Act) (h : Elements.ValidSection1512Prosecution d v r pr o ag c) :
    Proving.Rico.IsRacketeeringActivity (mapAct a) (mapComplaint c) :=
  s1512_elements_implies_rico_1961B a h.offense

end Proving.USC.T18.Ch73.Reslice.GoldenBridge
