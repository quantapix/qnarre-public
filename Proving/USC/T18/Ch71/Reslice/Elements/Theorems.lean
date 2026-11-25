








import Proving.USC.T18.Ch71.Reslice.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Tactic

set_option autoImplicit false

namespace Proving.USC.T18.Ch71.Reslice.Elements

open Proving.USC.Common



theorem millerObscene_intro {m : ObsceneMatter} {c : ComplaintText}
    (hPru : AppealsToPrurientInterest m c)
    (hOff : DepictsSexualConductPatentlyOffensively m c)
    (hVal : LacksSeriousValue m c) : MatterIsObscene m c :=
  ⟨hPru, hOff, hVal⟩




example {m : ObsceneMatter} {c : ComplaintText}
    (hPru : AppealsToPrurientInterest m c)
    (hOff : DepictsSexualConductPatentlyOffensively m c)
    (hVal : LacksSeriousValue m c) : MatterIsObscene m c := by
  prove_element


theorem section1462_intro {p : Person} {m : ObsceneMatter} {c : ComplaintText}
    (hObs : MatterIsObscene m c)
    (hSci : KnowsObsceneCharacter p m c)
    (hCond : ProhibitedTransportOrReceipt1462 p m c) : Section1462 p m c :=
  ⟨hObs, hSci, hCond⟩


theorem section1465_intro {p : Person} {m : ObsceneMatter} {c : ComplaintText}
    (hObs : MatterIsObscene m c)
    (hSci : KnowsObsceneCharacter p m c)
    (hPur : ForPurposeOfSaleOrDistribution p m c)
    (hComm : AffectsInterstateOrForeignCommerce m c)
    (hCond : ProductionOrTransport1465 p m c) : Section1465 p m c :=
  ⟨hObs, hSci, hPur, hComm, hCond⟩

end Proving.USC.T18.Ch71.Reslice.Elements
