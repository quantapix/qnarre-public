import Proving.USC.Common.Types
import Proving.USC.T18.Ch71.Deontic.Types
import Proving.USC.T18.Ch71.Deontic.Predicates
import Proving.USC.T18.Ch71.Deontic.Statute









set_option autoImplicit false

namespace Proving.USC.T18.Ch71.Deontic

open Proving.USC.Common

theorem prohibitionViolated1461_intro {p : Person} {m : Matter} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) (hCond : IsNonmailableMatter1461 m c)
    (hAct : KnowinglyMailsNonmailable1461 p m c) : ProhibitionViolated1461 p m c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibitionViolated1462_intro {p : Person} {m : Matter} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) (hCond : IsObsceneMatter1462 m c)
    (hComm : AffectsInterstateOrForeignCommerce p c)
    (hAct : ImportsOrTransportsObscene1462 p m c) : ProhibitionViolated1462 p m c :=
  ⟨⟨hAddr, hCond, hComm⟩, hAct⟩

theorem prohibitionViolated1463_intro {p : Person} {m : Matter} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) (hCond : IsIndecentWrapperMatter1463 m c)
    (hAct : KnowinglyDepositsWrapper1463 p m c) : ProhibitionViolated1463 p m c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibitionViolated1464_intro {p : Person} {m : Matter} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) (hCond : IsObsceneOrProfaneLanguage1464 m c)
    (hAct : UttersByRadio1464 p m c) : ProhibitionViolated1464 p m c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibitionViolated1465_intro {p : Person} {m : Matter} {c : ComplaintText}
    (hAddr : AddresseeAnyPerson p c) (hCond : IsObsceneMatter1465 m c)
    (hComm : AffectsInterstateOrForeignCommerce p c)
    (hAct : ProducesOrTransportsForDistribution1465 p m c) : ProhibitionViolated1465 p m c :=
  ⟨⟨hAddr, hCond, hComm⟩, hAct⟩

end Proving.USC.T18.Ch71.Deontic
