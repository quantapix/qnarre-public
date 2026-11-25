






import Proving.USC.Common.Types
import Proving.USC.T42.EqualRights.Deontic.Types
import Proving.USC.T42.EqualRights.Deontic.Predicates
import Proving.USC.T42.EqualRights.Deontic.Statute

namespace Proving.USC.T42.EqualRights.Deontic

open Proving.USC.Common



theorem prohibition1981Violated_intro {p : Person} {c : ComplaintText}
    (hAddr : Section1981AddresseeBound p c)
    (hCond : Section1981RaceBaselineDenial p c)
    (hAct : Section1981ImpairedContractRight p c) :
    Prohibition1981Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem prohibition1982Violated_intro {p : Person} {c : ComplaintText}
    (hAddr : Section1982AddresseeBound p c)
    (hCond : Section1982CitizenRaceBaselineDenial p c)
    (hAct : Section1982ImpairedPropertyRight p c) :
    Prohibition1982Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem permission1981aAvailable_intro {p : Person} {c : ComplaintText}
    (hParty : Section1981aComplainingParty p c)
    (hCond : Section1981aIntentionalDiscrimination p c)
    (hNoBar : ¬ Section1981aGoodFaithAccommodationBar p c) :
    Permission1981aAvailable p c :=
  ⟨⟨hParty, hCond⟩, hNoBar⟩




theorem punitivePermission1981aAvailable_intro {p : Person} {c : ComplaintText}
    (hBase : Permission1981aAvailable p c)
    (hMalice : Section1981aMaliceOrRecklessIndifference p c) :
    PunitivePermission1981aAvailable p c :=
  ⟨hBase, hMalice⟩

end Proving.USC.T42.EqualRights.Deontic
