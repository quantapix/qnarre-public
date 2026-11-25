import Proving.USC.T18.Ch71.Reslice.Procedure.Types
import Proving.USC.T18.Ch71.Reslice.Procedure.Predicates
import Proving.USC.T18.Ch71.Reslice.Procedure.Statute
import Proving.USC.Common.Types
set_option autoImplicit false






namespace Proving.USC.T18.Ch71.Reslice.Procedure

open Proving.USC.Common


theorem enhancedPenalty1462_intro {p : Person} {c : ComplaintText}
    (hOff : OffenseEstablished1462 p c) (hPrior : PriorOffenseEstablished1462 p c) :
    EnhancedPenalty1462 p c :=
  ⟨hOff, hPrior⟩


theorem presumptionRaised1465_intro {p : Person} {c : ComplaintText}
    (hOff : OffenseEstablished1465 p c) (hQty : QuantityThresholdMet1465 p c) :
    PresumptionRaised1465 p c :=
  ⟨hOff, hQty⟩


theorem presumptionStands1465_intro {p : Person} {c : ComplaintText}
    (hRaised : PresumptionRaised1465 p c) (hNotReb : ¬ PresumptionRebutted1465 p c) :
    PresumptionStands1465 p c :=
  ⟨hRaised, hNotReb⟩

end Proving.USC.T18.Ch71.Reslice.Procedure
