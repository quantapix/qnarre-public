


































import Proving.USC.T18.Ch113.Reslice.Elements.Theorems
import Proving.USC.T18.Ch113.Reslice.Deontic.Theorems
import Proving.USC.T18.Ch113.Reslice.Scienter.Theorems

namespace Proving.USC.T18.Ch113.Reslice.Bridge

open Proving.USC.Common

set_option autoImplicit false



axiom corr_2315_elem_deon {p : Person} {item : Elements.Property} {c : ComplaintText} :
    Elements.Section2315Offense p item c → Deontic.ProhibitionViolated2315 p c
axiom corr_2315_elem_sci {p : Person} {item : Elements.Property} {c : ComplaintText} :
    Elements.Section2315Offense p item c → Scienter.Scienter2315Culpable p c
axiom corr_2315_deon_sci {p : Person} {c : ComplaintText} :
    Deontic.ProhibitionViolated2315 p c → Scienter.Scienter2315Culpable p c

theorem s2315_elements_implies_deontic {p : Person} {item : Elements.Property} {c : ComplaintText}
    (h : Elements.Section2315Offense p item c) : Deontic.ProhibitionViolated2315 p c :=
  corr_2315_elem_deon h
theorem s2315_elements_implies_scienter {p : Person} {item : Elements.Property} {c : ComplaintText}
    (h : Elements.Section2315Offense p item c) : Scienter.Scienter2315Culpable p c :=
  corr_2315_elem_sci h
theorem s2315_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated2315 p c) : Scienter.Scienter2315Culpable p c :=
  corr_2315_deon_sci h



axiom corr_2318_elem_deon {p : Person} {item : Elements.Label} {c : ComplaintText} :
    Elements.Section2318Offense p item c → Deontic.ProhibitionViolated2318 p c
axiom corr_2318_elem_sci {p : Person} {item : Elements.Label} {c : ComplaintText} :
    Elements.Section2318Offense p item c → Scienter.Scienter2318Culpable p c
axiom corr_2318_deon_sci {p : Person} {c : ComplaintText} :
    Deontic.ProhibitionViolated2318 p c → Scienter.Scienter2318Culpable p c

theorem s2318_elements_implies_deontic {p : Person} {item : Elements.Label} {c : ComplaintText}
    (h : Elements.Section2318Offense p item c) : Deontic.ProhibitionViolated2318 p c :=
  corr_2318_elem_deon h
theorem s2318_elements_implies_scienter {p : Person} {item : Elements.Label} {c : ComplaintText}
    (h : Elements.Section2318Offense p item c) : Scienter.Scienter2318Culpable p c :=
  corr_2318_elem_sci h
theorem s2318_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated2318 p c) : Scienter.Scienter2318Culpable p c :=
  corr_2318_deon_sci h



axiom corr_2320_elem_deon {p : Person} {item : Elements.TradeItem} {mark : Elements.Mark} {c : ComplaintText} :
    Elements.Section2320Offense p item mark c → Deontic.ProhibitionViolated2320 p c
axiom corr_2320_elem_sci {p : Person} {item : Elements.TradeItem} {mark : Elements.Mark} {c : ComplaintText} :
    Elements.Section2320Offense p item mark c → Scienter.Scienter2320aCulpable p c
axiom corr_2320_deon_sci {p : Person} {c : ComplaintText} :
    Deontic.ProhibitionViolated2320 p c → Scienter.Scienter2320aCulpable p c

theorem s2320_elements_implies_deontic
    {p : Person} {item : Elements.TradeItem} {mark : Elements.Mark} {c : ComplaintText}
    (h : Elements.Section2320Offense p item mark c) : Deontic.ProhibitionViolated2320 p c :=
  corr_2320_elem_deon h
theorem s2320_elements_implies_scienter
    {p : Person} {item : Elements.TradeItem} {mark : Elements.Mark} {c : ComplaintText}
    (h : Elements.Section2320Offense p item mark c) : Scienter.Scienter2320aCulpable p c :=
  corr_2320_elem_sci h
theorem s2320_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated2320 p c) : Scienter.Scienter2320aCulpable p c :=
  corr_2320_deon_sci h

end Proving.USC.T18.Ch113.Reslice.Bridge
