





import Proving.USC.T18.Ch113.Deontic.Statute

namespace Proving.USC.T18.Ch113.Deontic

open Proving.USC.Common


theorem prohibition2312_violated_intro {p : Person} {v : Conveyance} {c : ComplaintText}
    (hAddr : AddresseeInClass2312 p c) (hCond : ConditionMet2312 p v c)
    (hAct : RegulatedActOccurred2312 p v c) : ProhibitionViolated2312 p v c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition2313_violated_intro {p : Person} {v : Conveyance} {c : ComplaintText}
    (hAddr : AddresseeInClass2313 p c) (hCond : ConditionMet2313 p v c)
    (hAct : RegulatedActOccurred2313 p v c) : ProhibitionViolated2313 p v c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T18.Ch113.Deontic
