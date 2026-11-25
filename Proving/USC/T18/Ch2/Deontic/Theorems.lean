






import Proving.USC.T18.Ch2.Deontic.Statute

namespace Proving.USC.T18.Ch2.Deontic

open Proving.USC.Common



theorem prohibitionViolated_intro {p n c}
    (hAddr : AddresseeInClass p n c) (hCond : ConditionMet n c)
    (hAct : RegulatedActOccurred p n c) : ProhibitionViolated p n c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem obligationBreached_intro {p n c}
    (hAddr : AddresseeInClass p n c) (hCond : ConditionMet n c)
    (hNotAct : ¬ RegulatedActOccurred p n c) : ObligationBreached p n c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩




theorem prohibition32_violated_intro {p c}
    (hAddr : AddresseeInClass p .s32 c) (hCond : ConditionMet .s32 c)
    (hAct : RegulatedActOccurred p .s32 c) : Prohibition32Violated p c :=
  prohibitionViolated_intro hAddr hCond hAct


theorem prohibition32c_violated_intro {p c}
    (hAddr : AddresseeInClass p .s32c c) (hCond : ConditionMet .s32c c)
    (hAct : RegulatedActOccurred p .s32c c) : Prohibition32cViolated p c :=
  prohibitionViolated_intro hAddr hCond hAct


theorem prohibition33_violated_intro {p c}
    (hAddr : AddresseeInClass p .s33 c) (hCond : ConditionMet .s33 c)
    (hAct : RegulatedActOccurred p .s33 c) : Prohibition33Violated p c :=
  prohibitionViolated_intro hAddr hCond hAct


theorem prohibition35_violated_intro {p c}
    (hAddr : AddresseeInClass p .s35 c) (hCond : ConditionMet .s35 c)
    (hAct : RegulatedActOccurred p .s35 c) : Prohibition35Violated p c :=
  prohibitionViolated_intro hAddr hCond hAct


theorem prohibition36_violated_intro {p c}
    (hAddr : AddresseeInClass p .s36 c) (hCond : ConditionMet .s36 c)
    (hAct : RegulatedActOccurred p .s36 c) : Prohibition36Violated p c :=
  prohibitionViolated_intro hAddr hCond hAct


theorem prohibition37_violated_intro {p c}
    (hAddr : AddresseeInClass p .s37 c) (hCond : ConditionMet .s37 c)
    (hAct : RegulatedActOccurred p .s37 c) : Prohibition37Violated p c :=
  prohibitionViolated_intro hAddr hCond hAct


theorem prohibition38_violated_intro {p c}
    (hAddr : AddresseeInClass p .s38 c) (hCond : ConditionMet .s38 c)
    (hAct : RegulatedActOccurred p .s38 c) : Prohibition38Violated p c :=
  prohibitionViolated_intro hAddr hCond hAct


theorem prohibition39a1_violated_intro {p c}
    (hAddr : AddresseeInClass p .s39a1 c) (hCond : ConditionMet .s39a1 c)
    (hAct : RegulatedActOccurred p .s39a1 c) : Prohibition39a1Violated p c :=
  prohibitionViolated_intro hAddr hCond hAct


theorem prohibition39a2_violated_intro {p c}
    (hAddr : AddresseeInClass p .s39a2 c) (hCond : ConditionMet .s39a2 c)
    (hAct : RegulatedActOccurred p .s39a2 c) : Prohibition39a2Violated p c :=
  prohibitionViolated_intro hAddr hCond hAct


theorem prohibition39A_violated_intro {p c}
    (hAddr : AddresseeInClass p .s39A c) (hCond : ConditionMet .s39A c)
    (hAct : RegulatedActOccurred p .s39A c) : Prohibition39AViolated p c :=
  prohibitionViolated_intro hAddr hCond hAct


theorem prohibition39B_violated_intro {p c}
    (hAddr : AddresseeInClass p .s39B c) (hCond : ConditionMet .s39B c)
    (hAct : RegulatedActOccurred p .s39B c) : Prohibition39BViolated p c :=
  prohibitionViolated_intro hAddr hCond hAct


theorem prohibition40leave_violated_intro {p c}
    (hAddr : AddresseeInClass p .s40leave c) (hCond : ConditionMet .s40leave c)
    (hAct : RegulatedActOccurred p .s40leave c) : Prohibition40leaveViolated p c :=
  prohibitionViolated_intro hAddr hCond hAct


theorem prohibition40A_violated_intro {p c}
    (hAddr : AddresseeInClass p .s40A c) (hCond : ConditionMet .s40A c)
    (hAct : RegulatedActOccurred p .s40A c) : Prohibition40AViolated p c :=
  prohibitionViolated_intro hAddr hCond hAct


theorem obligation40stop_breached_intro {p c}
    (hAddr : AddresseeInClass p .s40stop c) (hCond : ConditionMet .s40stop c)
    (hNotAct : ¬ RegulatedActOccurred p .s40stop c) : Obligation40stopBreached p c :=
  obligationBreached_intro hAddr hCond hNotAct

end Proving.USC.T18.Ch2.Deontic
