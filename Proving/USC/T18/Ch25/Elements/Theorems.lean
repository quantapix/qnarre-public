




import Proving.USC.Common.Types
import Proving.USC.T18.Ch25.Elements.Types
import Proving.USC.T18.Ch25.Elements.Predicates
import Proving.USC.T18.Ch25.Elements.Statute

namespace Proving.USC.T18.Ch25.Elements

open Proving.USC.Common

theorem section0471_intro {p i c}
    (hIntent : ActsWithIntentToDefraud p c)
    (hObject : IsObligationOrSecurityOfUS i c)
    (hAct : MakesCounterfeit471 p i c) : Section0471 p i c :=
  ⟨hIntent, hObject, hAct⟩

theorem section0472_intro {p i c}
    (hIntent : ActsWithIntentToDefraud p c)
    (hObject : IsObligationOrSecurityOfUS i c)
    (hCounterfeit : IsCounterfeited i c)
    (hAct : Utters472 p i c) : Section0472 p i c :=
  ⟨hIntent, hObject, hCounterfeit, hAct⟩

theorem section0473_intro {p i c}
    (hObject : IsObligationOrSecurityOfUS i c)
    (hCounterfeit : IsCounterfeited i c)
    (hAct : DealsIn473 p i c)
    (hIntent : IntentPassedAsGenuine p c) : Section0473 p i c :=
  ⟨hObject, hCounterfeit, hAct, hIntent⟩

end Proving.USC.T18.Ch25.Elements
