import Proving.USC.Common.Types
import Proving.USC.T18.Ch71.Reslice.Deontic.Types
set_option autoImplicit false





namespace Proving.USC.T18.Ch71.Reslice.Deontic

open Proving.USC.Common




axiom AddresseeIsAnyPerson (p : Person) (c : ComplaintText) : Prop





axiom MatterIsObscene (m : ObsceneMatter) (c : ComplaintText) : Prop






axiom InterstateOrForeignCommerceNexus (c : ComplaintText) : Prop







axiom TransportedObsceneMatter1462 (p : Person) (m : ObsceneMatter) (c : ComplaintText) : Prop





axiom PurposeOfSaleOrDistribution1465 (m : ObsceneMatter) (c : ComplaintText) : Prop







axiom ProducedOrTransportedForSale1465 (p : Person) (m : ObsceneMatter) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch71.Reslice.Deontic
