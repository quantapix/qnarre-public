import Proving.USC.Common.Types
import Proving.USC.T18.Ch71.Reslice.Deontic.Types
import Proving.USC.T18.Ch71.Reslice.Deontic.Predicates
import Proving.USC.T18.Ch71.Reslice.Deontic.Statute
set_option autoImplicit false



namespace Proving.USC.T18.Ch71.Reslice.Deontic

open Proving.USC.Common



theorem prohibition1462_violated_intro {p : Person} {m : ObsceneMatter} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hObs : MatterIsObscene m c)
    (hCom : InterstateOrForeignCommerceNexus c) (hAct : TransportedObsceneMatter1462 p m c)
    : ProhibitionViolated1462 p m c :=
  ⟨⟨hAddr, hObs, hCom⟩, hAct⟩



theorem prohibition1465_violated_intro {p : Person} {m : ObsceneMatter} {c : ComplaintText}
    (hAddr : AddresseeIsAnyPerson p c) (hObs : MatterIsObscene m c)
    (hCom : InterstateOrForeignCommerceNexus c) (hSale : PurposeOfSaleOrDistribution1465 m c)
    (hAct : ProducedOrTransportedForSale1465 p m c)
    : ProhibitionViolated1465 p m c :=
  ⟨⟨hAddr, hObs, hCom, hSale⟩, hAct⟩

end Proving.USC.T18.Ch71.Reslice.Deontic
