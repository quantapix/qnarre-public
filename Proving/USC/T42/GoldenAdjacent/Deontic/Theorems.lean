





import Proving.USC.T42.GoldenAdjacent.Deontic.Statute

namespace Proving.USC.T42.GoldenAdjacent.Deontic

open Proving.USC.Common




theorem prohibition1982_violated_intro {p c}
    (hAddr : IsCitizenWithPropertyRight p c)
    (hCond : DenialOnRacialBasis p c)
    (hAct  : PropertyRightDenied p c) :
    Prohibition1982Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩





theorem permission1988b_exercised_intro {ct p c}
    (hEnf : ActionEnforcesListedProvision c)
    (hPrev : IsPrevailingParty p c)
    (hExc : JudicialOfficerExceptionClears p c)
    (hAct : FeeAllowed ct p c) :
    Permission1988bExercised ct p c :=
  ⟨⟨hEnf, hPrev, hExc⟩, hAct⟩

end Proving.USC.T42.GoldenAdjacent.Deontic
