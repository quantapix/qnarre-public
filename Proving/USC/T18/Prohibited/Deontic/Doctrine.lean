













import Proving.USC.T18.Prohibited.Deontic.Statute
import Proving.USC.Common.Tactic

namespace Proving.USC.T18.Prohibited.Deontic

open Proving.USC.Common


@[grind →] theorem addresseeInClass1962a_of_leaves {p c}
    (hIncome : ReceivedPatternIncome p c) (hPrincipal : ParticipatedAsPrincipal p c) :
    AddresseeInClass1962a p c :=
  ⟨hIncome, hPrincipal⟩


@[grind →] theorem addresseeInClass1962c_of_employed {p e c}
    (h : EmployedByEnterprise p e c) : AddresseeInClass1962c p e c :=
  .employed h


@[grind →] theorem addresseeInClass1962c_of_associated {p e c}
    (h : AssociatedWithEnterprise p e c) : AddresseeInClass1962c p e c :=
  .associated h

end Proving.USC.T18.Prohibited.Deontic
