






import Proving.USC.T18.Ch42.Deontic.Statute

namespace Proving.USC.T18.Ch42.Deontic
open Proving.USC.Common

theorem prohibition892_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass892 p c)
    (hCond : ConditionMet892 c)
    (hAct  : RegulatedActOccurred892 p c)
    : ProhibitionViolated892 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibition893_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass893 p c)
    (hCond : ConditionMet893 p c)
    (hAct  : RegulatedActOccurred893 p c)
    : ProhibitionViolated893 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibition894_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass894 p c)
    (hCond : ConditionMet894 c)
    (hAct  : RegulatedActOccurred894 p c)
    : ProhibitionViolated894 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T18.Ch42.Deontic
