





import Proving.USC.T18.Ch25.Deontic.Statute
import Proving.USC.T18.Ch25.Deontic.Predicates
import Proving.USC.T18.Ch25.Deontic.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch25.Deontic

open Proving.USC.Common


theorem prohibition471_violated_intro {p : Person} {o : Obligation} {c : ComplaintText}
    (hAddr : AddresseeIsPerson p c) (hCond : IntentToDefraud p c)
    (hAct : ForgesObligation p o c) : ProhibitionViolated471 p o c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition472_violated_intro {p : Person} {o : Obligation} {c : ComplaintText}
    (hAddr : AddresseeIsPerson p c) (hCond : IntentToDefraud p c)
    (hObj : IsCounterfeitObligationOfUS o c) (hAct : UttersCounterfeit p o c)
    : ProhibitionViolated472 p o c :=
  ⟨⟨hAddr, hCond⟩, hObj, hAct⟩


theorem prohibition473_violated_intro {p : Person} {o : Obligation} {c : ComplaintText}
    (hAddr : AddresseeIsPerson p c) (hCond : IntentToPassAsGenuine p c)
    (hObj : IsCounterfeitObligationOfUS o c) (hAct : DealsInCounterfeit p o c)
    : ProhibitionViolated473 p o c :=
  ⟨⟨hAddr, hCond⟩, hObj, hAct⟩

end Proving.USC.T18.Ch25.Deontic
