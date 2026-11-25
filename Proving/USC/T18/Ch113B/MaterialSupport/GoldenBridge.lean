






















































import Proving.Terrorism.Statute
import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.MaterialSupport.Elements.Theorems

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.GoldenBridge

open Proving.USC.Common
open Proving.USC.T18.Ch113B.MaterialSupport









axiom mapComplaint : ComplaintText → Proving.Terrorism.ComplaintText






axiom corr_2339_g5B {d t : Person} {o : Elements.PredicateOffense}
    {c : ComplaintText} (a : Proving.Terrorism.Action) :
    Elements.Section2339a d t o c →
    Proving.Terrorism.ViolatesEnumeratedTerrorismOffense a (mapComplaint c)




theorem s2339_elements_implies_golden_1961G
    {d t : Person} {o : Elements.PredicateOffense} {c : ComplaintText}
    (a : Proving.Terrorism.Action) (h : Elements.Section2339a d t o c) :
    Proving.Terrorism.RicoPredicateActUnderClauseG a (mapComplaint c) :=
  ⟨corr_2339_g5B a h⟩




axiom corr_2339A_g5B {d : Person} {s : Elements.Support}
    {o : Elements.PredicateOffense} {c : ComplaintText}
    (a : Proving.Terrorism.Action) :
    Elements.Section2339Aa d s o c →
    Proving.Terrorism.ViolatesEnumeratedTerrorismOffense a (mapComplaint c)


theorem s2339A_elements_implies_golden_1961G
    {d : Person} {s : Elements.Support} {o : Elements.PredicateOffense}
    {c : ComplaintText} (a : Proving.Terrorism.Action)
    (h : Elements.Section2339Aa d s o c) :
    Proving.Terrorism.RicoPredicateActUnderClauseG a (mapComplaint c) :=
  ⟨corr_2339A_g5B a h⟩




axiom corr_2339B_g5B {d : Person} {s : Elements.Support}
    {o : Elements.Organization} {c : ComplaintText}
    (a : Proving.Terrorism.Action) :
    Elements.Section2339Ba1 d s o c →
    Proving.Terrorism.ViolatesEnumeratedTerrorismOffense a (mapComplaint c)


theorem s2339B_elements_implies_golden_1961G
    {d : Person} {s : Elements.Support} {o : Elements.Organization}
    {c : ComplaintText} (a : Proving.Terrorism.Action)
    (h : Elements.Section2339Ba1 d s o c) :
    Proving.Terrorism.RicoPredicateActUnderClauseG a (mapComplaint c) :=
  ⟨corr_2339B_g5B a h⟩




axiom corr_2339C_g5B {d : Person} {f : Elements.Funds}
    {pa : Elements.PredicateAct} {c : ComplaintText}
    (a : Proving.Terrorism.Action) :
    Elements.Section2339Ca1 d f pa c →
    Proving.Terrorism.ViolatesEnumeratedTerrorismOffense a (mapComplaint c)


theorem s2339C_elements_implies_golden_1961G
    {d : Person} {f : Elements.Funds} {pa : Elements.PredicateAct}
    {c : ComplaintText} (a : Proving.Terrorism.Action)
    (h : Elements.Section2339Ca1 d f pa c) :
    Proving.Terrorism.RicoPredicateActUnderClauseG a (mapComplaint c) :=
  ⟨corr_2339C_g5B a h⟩




axiom corr_2339D_g5B {d : Person} {t : Elements.Training}
    {o : Elements.Organization} {c : ComplaintText}
    (a : Proving.Terrorism.Action) :
    Elements.Section2339Da d t o c →
    Proving.Terrorism.ViolatesEnumeratedTerrorismOffense a (mapComplaint c)


theorem s2339D_elements_implies_golden_1961G
    {d : Person} {t : Elements.Training} {o : Elements.Organization}
    {c : ComplaintText} (a : Proving.Terrorism.Action)
    (h : Elements.Section2339Da d t o c) :
    Proving.Terrorism.RicoPredicateActUnderClauseG a (mapComplaint c) :=
  ⟨corr_2339D_g5B a h⟩

end Proving.USC.T18.Ch113B.MaterialSupport.GoldenBridge
