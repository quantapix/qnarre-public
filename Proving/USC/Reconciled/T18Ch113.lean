































import Proving.USC.T18.Ch113.Elements.Statute

namespace Proving.USC.Reconciled.T18Ch113
open Proving.USC
open Proving.USC.Common





abbrev ValidStolenVehicleOffense
    (p : Person) (i : T18.Ch113.Elements.Instrument) (c : ComplaintText) : Prop :=
  T18.Ch113.Elements.ValidStolenVehicleOffense p i c


theorem validStolenVehicleOffense_ofTransportation
    {p : Person} {i : T18.Ch113.Elements.Instrument} {c : ComplaintText}
    (h : T18.Ch113.Elements.Section2312 p i c) : ValidStolenVehicleOffense p i c :=
  .transportation h


theorem validStolenVehicleOffense_ofSaleOrReceipt
    {p : Person} {i : T18.Ch113.Elements.Instrument} {c : ComplaintText}
    (h : T18.Ch113.Elements.Section2313 p i c) : ValidStolenVehicleOffense p i c :=
  .saleOrReceipt h

end Proving.USC.Reconciled.T18Ch113
