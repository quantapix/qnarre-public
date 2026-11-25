import Proving.USC.Common.Types
import Proving.USC.T18.Ch71.Reslice.Deontic.Types
import Proving.USC.T18.Ch71.Reslice.Deontic.Predicates
set_option autoImplicit false







namespace Proving.USC.T18.Ch71.Reslice.Deontic

open Proving.USC.Common




structure Prohibition1462 (p : Person) (m : ObsceneMatter) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  obscene   : MatterIsObscene m c
  commerce  : InterstateOrForeignCommerceNexus c



def ProhibitionViolated1462 (p : Person) (m : ObsceneMatter) (c : ComplaintText) : Prop :=
  Prohibition1462 p m c ∧ TransportedObsceneMatter1462 p m c





structure Prohibition1465 (p : Person) (m : ObsceneMatter) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  obscene   : MatterIsObscene m c
  commerce  : InterstateOrForeignCommerceNexus c
  forSale   : PurposeOfSaleOrDistribution1465 m c



def ProhibitionViolated1465 (p : Person) (m : ObsceneMatter) (c : ComplaintText) : Prop :=
  Prohibition1465 p m c ∧ ProducedOrTransportedForSale1465 p m c

end Proving.USC.T18.Ch71.Reslice.Deontic
