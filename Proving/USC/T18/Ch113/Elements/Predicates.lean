











import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch113.Elements.Types

namespace Proving.USC.T18.Ch113.Elements

open Proving.USC.Common





axiom IsMotorVehicle (i : Instrument) (c : ComplaintText) : Prop



axiom IsVessel (i : Instrument) (c : ComplaintText) : Prop



axiom IsAircraft (i : Instrument) (c : ComplaintText) : Prop





axiom Transports (p : Person) (i : Instrument) (c : ComplaintText) : Prop




axiom TransportedInInterstateCommerce (i : Instrument) (c : ComplaintText) : Prop





axiom InstrumentWasStolen (i : Instrument) (c : ComplaintText) : Prop




axiom Receives (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom Possesses (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom Conceals (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom Stores (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom Barters (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom Sells (p : Person) (i : Instrument) (c : ComplaintText) : Prop

axiom Disposes (p : Person) (i : Instrument) (c : ComplaintText) : Prop




axiom CrossedStateBoundary (i : Instrument) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113.Elements
