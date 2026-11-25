







import Proving.USC.Common.Types
import Proving.USC.T42.EqualRights.Intertemporal.Types
import Proving.USC.T42.EqualRights.Intertemporal.Predicates
import Proving.USC.T42.EqualRights.Intertemporal.Statute

namespace Proving.USC.T42.EqualRights.Intertemporal

open Proving.USC.Common

theorem inEffect1981_intro {c : ComplaintText}
    (hW : ActOccurredOnOrAfter (StatutoryWindow .s1981).fromDay c)
    (hS : ActWithinSunset (StatutoryWindow .s1981).untilDay c)
    (hP : ActIsPostEnactment c) :
    InEffectFor1981 c := ⟨hW, hS, hP⟩

theorem inEffect1981bc_intro {c : ComplaintText}
    (hW : ActOccurredOnOrAfter (StatutoryWindow .s1981bc).fromDay c)
    (hS : ActWithinSunset (StatutoryWindow .s1981bc).untilDay c)
    (hP : ActIsPostEnactment c) :
    InEffectFor1981bc c := ⟨hW, hS, hP⟩

theorem inEffect1981a_intro {c : ComplaintText}
    (hW : ActOccurredOnOrAfter (StatutoryWindow .s1981a).fromDay c)
    (hS : ActWithinSunset (StatutoryWindow .s1981a).untilDay c)
    (hP : ActIsPostEnactment c) :
    InEffectFor1981a c := ⟨hW, hS, hP⟩

theorem inEffect1982_intro {c : ComplaintText}
    (hW : ActOccurredOnOrAfter (StatutoryWindow .s1982).fromDay c)
    (hS : ActWithinSunset (StatutoryWindow .s1982).untilDay c)
    (hP : ActIsPostEnactment c) :
    InEffectFor1982 c := ⟨hW, hS, hP⟩



theorem equalRightsGovernsAct_intro {c : ComplaintText}
    (h1981 : InEffectFor1981 c) (h1981bc : InEffectFor1981bc c)
    (h1981a : InEffectFor1981a c) (h1982 : InEffectFor1982 c) :
    EqualRightsGovernsAct c := ⟨h1981, h1981bc, h1981a, h1982⟩

end Proving.USC.T42.EqualRights.Intertemporal
