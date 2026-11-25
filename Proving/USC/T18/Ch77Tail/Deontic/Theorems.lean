







import Proving.USC.Common.Types
import Proving.USC.T18.Ch77Tail.Deontic.Types
import Proving.USC.T18.Ch77Tail.Deontic.Predicates
import Proving.USC.T18.Ch77Tail.Deontic.Statute

namespace Proving.USC.T18.Ch77Tail.Deontic

open Proving.USC.Common


theorem prohibition1582_violated_intro {p v c}
    (hAddr : AddresseeInClass1582 p c) (hCond : ConditionMet1582 p c)
    (hAct : RegulatedActOccurred1582 p v c) : ProhibitionViolated1582 p v c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1585_violated_intro {p v c}
    (hAddr : AddresseeInClass1585 p c) (hCond : ConditionMet1585 p c)
    (hAct : RegulatedActOccurred1585 p v c) : ProhibitionViolated1585 p v c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1586_violated_intro {p v c}
    (hAddr : AddresseeInClass1586 p c) (hCond : ConditionMet1586 p v c)
    (hAct : RegulatedActOccurred1586 p v c) : ProhibitionViolated1586 p v c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1587_violated_intro {p v c}
    (hAddr : AddresseeInClass1587 p v c) (hCond : ConditionMet1587 p c)
    (hAct : RegulatedActOccurred1587 p v c) : ProhibitionViolated1587 p v c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1588_violated_intro {p v c}
    (hAddr : AddresseeInClass1588 p v c) (hCond : ConditionMet1588 p c)
    (hAct : RegulatedActOccurred1588 p v c) : ProhibitionViolated1588 p v c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem prohibition1592_violated_intro {p d c}
    (hAddr : AddresseeInClass1592 p c) (hCond : ConditionMet1592 p c)
    (hAct : RegulatedActOccurred1592 p d c) (hNotEx : ¬ VictimException1592 p c)
    : ProhibitionViolated1592 p d c :=
  ⟨⟨hAddr, hCond⟩, hAct, hNotEx⟩


theorem prohibition1592c_violated_intro {p c}
    (hAddr : AddresseeInClass1592c p c) (hAct : RegulatedActOccurred1592c p c)
    : ProhibitionViolated1592c p c :=
  ⟨⟨hAddr⟩, hAct⟩

end Proving.USC.T18.Ch77Tail.Deontic
