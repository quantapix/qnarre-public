









































import Proving.Rico.Predicates
import Proving.USC.T18.Ch113B.Elements.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.GoldenBridge

open Proving.USC.Common








opaque Act : Type
axiom mapAct : Act → Proving.Rico.Act
axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText






axiom corr_2332_G {p v : Person} {ag : Agreement} {c : ComplaintText} (act : Act) :
    Elements.Section2332Violation p v ag c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)


theorem s2332_elements_implies_rico_1961G
    {p v : Person} {ag : Agreement} {c : ComplaintText} (act : Act)
    (h : Elements.Section2332Violation p v ag c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_2332_G act h





axiom corr_2332a_G {p v : Person} {w : Elements.Weapon} {t : Elements.Target}
    {ag : Agreement} {c : ComplaintText} (act : Act) :
    Elements.Section2332aViolation p v w t ag c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)

theorem s2332a_elements_implies_rico_1961G
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
    {c : ComplaintText} (act : Act)
    (h : Elements.Section2332aViolation p v w t ag c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_2332a_G act h





axiom corr_2332b_G {p v : Person} {t : Elements.Target} {ag : Agreement}
    {c : ComplaintText} (act : Act) :
    Elements.Section2332bViolation p v t ag c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)

theorem s2332b_elements_implies_rico_1961G
    {p v : Person} {t : Elements.Target} {ag : Agreement} {c : ComplaintText} (act : Act)
    (h : Elements.Section2332bViolation p v t ag c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_2332b_G act h





axiom corr_2332f_G {p v : Person} {w : Elements.Weapon} {t : Elements.Target}
    {ag : Agreement} {c : ComplaintText} (act : Act) :
    Elements.Section2332fViolation p v w t ag c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)

theorem s2332f_elements_implies_rico_1961G
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
    {c : ComplaintText} (act : Act)
    (h : Elements.Section2332fViolation p v w t ag c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_2332f_G act h





axiom corr_2332g_G {p v : Person} {w : Elements.Weapon} {t : Elements.Target}
    {c : ComplaintText} (act : Act) :
    Elements.Section2332gMissileOffense p v w t c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)

theorem s2332g_elements_implies_rico_1961G
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {c : ComplaintText}
    (act : Act) (h : Elements.Section2332gMissileOffense p v w t c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_2332g_G act h





axiom corr_2332h_G {p v : Person} {w : Elements.Weapon} {t : Elements.Target}
    {c : ComplaintText} (act : Act) :
    Elements.Section2332hRadiologicalOffense p v w t c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)

theorem s2332h_elements_implies_rico_1961G
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {c : ComplaintText}
    (act : Act) (h : Elements.Section2332hRadiologicalOffense p v w t c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_2332h_G act h





axiom corr_2332i_G {p v : Person} {w : Elements.Weapon} {t : Elements.Target}
    {ag : Agreement} {c : ComplaintText} (act : Act) :
    Elements.Section2332iViolation p v w t ag c →
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c)

theorem s2332i_elements_implies_rico_1961G
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
    {c : ComplaintText} (act : Act)
    (h : Elements.Section2332iViolation p v w t ag c) :
    Proving.Rico.IsRacketeeringActivity (mapAct act) (mapComplaint c) :=
  corr_2332i_G act h

end Proving.USC.T18.Ch113B.GoldenBridge
