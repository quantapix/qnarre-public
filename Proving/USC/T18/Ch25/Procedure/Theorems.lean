









import Proving.USC.T18.Ch25.Procedure.Statute

namespace Proving.USC.T18.Ch25.Procedure

open Proving.USC.Common


theorem timelyProsecution471_intro {p : Person} {c : ComplaintText}
    (hOff : OffenseCommitted471 p c) (hCom : ProsecutionCommenced p c)
    (hWin : WithinLimitationsPeriod p c) : TimelyProsecution471 p c :=
  ⟨hOff, hCom, hWin⟩


theorem timelyProsecution472_intro {p : Person} {c : ComplaintText}
    (hOff : OffenseCommitted472 p c) (hCom : ProsecutionCommenced p c)
    (hWin : WithinLimitationsPeriod p c) : TimelyProsecution472 p c :=
  ⟨hOff, hCom, hWin⟩


theorem timelyProsecution473_intro {p : Person} {c : ComplaintText}
    (hOff : OffenseCommitted473 p c) (hCom : ProsecutionCommenced p c)
    (hWin : WithinLimitationsPeriod p c) : TimelyProsecution473 p c :=
  ⟨hOff, hCom, hWin⟩



theorem timelyCounterfeitProsecution_making_intro {p : Person} {c : ComplaintText}
    (h : TimelyProsecution471 p c) : TimelyCounterfeitProsecution p c :=
  .making h


theorem timelyCounterfeitProsecution_uttering_intro {p : Person} {c : ComplaintText}
    (h : TimelyProsecution472 p c) : TimelyCounterfeitProsecution p c :=
  .uttering h


theorem timelyCounterfeitProsecution_dealing_intro {p : Person} {c : ComplaintText}
    (h : TimelyProsecution473 p c) : TimelyCounterfeitProsecution p c :=
  .dealing h

end Proving.USC.T18.Ch25.Procedure
