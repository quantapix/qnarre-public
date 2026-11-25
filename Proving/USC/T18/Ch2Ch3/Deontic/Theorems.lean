import Proving.USC.T18.Ch2Ch3.Deontic.Statute
set_option autoImplicit false









namespace Proving.USC.T18.Ch2Ch3.Deontic

open Proving.USC.Common


theorem prohibitionViolated32_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass32 p c) (hCond : ConditionMet32 c)
    (hAct : ProhibitedActOccurred32 p c) : ProhibitionViolated32 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibitionViolated36_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass36 p c) (hCond : ConditionMet36 c)
    (hAct : ProhibitedActOccurred36 p c) : ProhibitionViolated36 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibitionViolated37_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass37 p c) (hCond : ConditionMet37 c)
    (hAct : ProhibitedActOccurred37 p c) : ProhibitionViolated37 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibitionViolated38_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass38 p c) (hCond : ConditionMet38 c)
    (hCommerce : AffectsInterstateCommerce c)
    (hAct : ProhibitedActOccurred38 p c) : ProhibitionViolated38 p c :=
  ⟨⟨hAddr, hCond, hCommerce⟩, hAct⟩


theorem prohibitionViolated39B_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass39B p c) (hCond : ConditionMet39B c)
    (hAct : ProhibitedActOccurred39B p c) : ProhibitionViolated39B p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibitionViolated40A_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass40A p c) (hCond : ConditionMet40A c)
    (hAct : ProhibitedActOccurred40A p c) : ProhibitionViolated40A p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibitionViolated42_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass42 p c) (hCond : ConditionMet42 c)
    (hAct : ProhibitedActOccurred42 p c) : ProhibitionViolated42 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibitionViolated43_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass43 p c) (hCond : ConditionMet43 c)
    (hCommerce : AffectsInterstateCommerce c)
    (hAct : ProhibitedActOccurred43 p c) : ProhibitionViolated43 p c :=
  ⟨⟨hAddr, hCond, hCommerce⟩, hAct⟩



theorem obligationBreached42Dispose_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass42Dispose p c) (hCond : ConditionMet42Dispose c)
    (hOmit : ¬ DisposalActOccurred42 p c) : ObligationBreached42Dispose p c :=
  ⟨⟨hAddr, hCond⟩, hOmit⟩

end Proving.USC.T18.Ch2Ch3.Deontic
