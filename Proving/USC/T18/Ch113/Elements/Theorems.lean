






import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch113.Elements.Types
import Proving.USC.T18.Ch113.Elements.Predicates
import Proving.USC.T18.Ch113.Elements.Statute

namespace Proving.USC.T18.Ch113.Elements

open Proving.USC.Common


theorem section2312_intro {p i c}
    (hTransports : Transports p i c)
    (hCommerce   : TransportedInInterstateCommerce i c)
    (hInstrument : IsCoveredInstrument i c)
    (hStolen     : InstrumentWasStolen i c)
    (hScienter   : ActedWithScienter p c) :
    Section2312 p i c :=
  ⟨hTransports, hCommerce, hInstrument, hStolen, hScienter⟩


theorem section2313_intro {p i c}
    (hAct        : Section2313Act p i c)
    (hInstrument : IsCoveredInstrument i c)
    (hStolen     : InstrumentWasStolen i c)
    (hCrossed    : CrossedStateBoundary i c)
    (hScienter   : ActedWithScienter p c) :
    Section2313 p i c :=
  ⟨hAct, hInstrument, hStolen, hCrossed, hScienter⟩


theorem validStolenVehicleOffense_ofTransportation {p i c}
    (h : Section2312 p i c) : ValidStolenVehicleOffense p i c :=
  .transportation h

theorem validStolenVehicleOffense_ofSaleOrReceipt {p i c}
    (h : Section2313 p i c) : ValidStolenVehicleOffense p i c :=
  .saleOrReceipt h

end Proving.USC.T18.Ch113.Elements
