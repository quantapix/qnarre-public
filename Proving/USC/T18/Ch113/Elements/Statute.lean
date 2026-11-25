






import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch113.Elements.Types
import Proving.USC.T18.Ch113.Elements.Predicates

namespace Proving.USC.T18.Ch113.Elements

open Proving.USC.Common



inductive CoveredInstrument2311 (i : Instrument) (c : ComplaintText) : Prop where
  | motorVehicle (h : IsMotorVehicle i c)
  | vessel       (h : IsVessel i c)
  | aircraft     (h : IsAircraft i c)



abbrev IsCoveredInstrument (i : Instrument) (c : ComplaintText) : Prop :=
  CoveredInstrument2311 i c



structure Section2312 (p : Person) (i : Instrument) (c : ComplaintText) : Prop where
  transports : Transports p i c
  commerce   : TransportedInInterstateCommerce i c
  instrument : IsCoveredInstrument i c
  stolen     : InstrumentWasStolen i c
  scienter   : ActedWithScienter p c





inductive Section2313Act (p : Person) (i : Instrument) (c : ComplaintText) : Prop where
  | receives  (h : Receives p i c)
  | possesses (h : Possesses p i c)
  | conceals  (h : Conceals p i c)
  | stores    (h : Stores p i c)
  | barters   (h : Barters p i c)
  | sells     (h : Sells p i c)
  | disposes  (h : Disposes p i c)

structure Section2313 (p : Person) (i : Instrument) (c : ComplaintText) : Prop where
  act        : Section2313Act p i c
  instrument : IsCoveredInstrument i c
  stolen     : InstrumentWasStolen i c
  crossed    : CrossedStateBoundary i c
  scienter   : ActedWithScienter p c



inductive ValidStolenVehicleOffense (p : Person) (i : Instrument) (c : ComplaintText) : Prop where
  | transportation (h : Section2312 p i c)
  | saleOrReceipt  (h : Section2313 p i c)

end Proving.USC.T18.Ch113.Elements
