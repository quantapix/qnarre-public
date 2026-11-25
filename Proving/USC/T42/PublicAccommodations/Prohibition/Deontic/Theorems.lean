import Proving.USC.T42.PublicAccommodations.Prohibition.Deontic.Statute
import Proving.USC.Common.Types







namespace Proving.USC.T42.PublicAccommodations.Prohibition.Deontic

open Proving.USC.Common



theorem prohibitionViolated2000a1_intro {p c}
    (hAddr : StateActorAddressee2000a1 p c)
    (hCond : RequiredByStateLaw2000a1 c)
    (hAct  : DiscriminationOrSegregationAct2000a1 p c) :
    ProhibitionViolated2000a1 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem prohibitionViolated2000a2_intro {p r c}
    (hAddr : AnyPersonAddressee2000a2 p c)
    (hCond : RightSecuredBy2000aOr2000a1 r c)
    (hAct  : InterferenceAct2000a2 p r c) :
    ProhibitionViolated2000a2 p r c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T42.PublicAccommodations.Prohibition.Deontic
