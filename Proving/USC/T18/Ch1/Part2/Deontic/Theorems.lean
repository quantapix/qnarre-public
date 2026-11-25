





import Proving.USC.T18.Ch1.Part2.Deontic.Statute

namespace Proving.USC.T18.Ch1.Part2.Deontic

open Proving.USC.Common


theorem permissionAvailable17_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass17 p c) (hCond : ConditionMet17 p c) :
    PermissionAvailable17 p c :=
  ⟨hAddr, hCond⟩


theorem prohibitionViolated25_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass25 p c) (hCond : ConditionMet25 p c)
    (hAct : RegulatedActOccurred25 p c) : ProhibitionViolated25 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permissionAvailable28b_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass28b p c) (hCond : ConditionMet28b p c) :
    PermissionAvailable28b p c :=
  ⟨hAddr, hCond⟩



theorem obligationBreached28c_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass28c p c) (hCond : ConditionMet28c p c)
    (hNotAct : ¬ RegulatedActOccurred28c p c) : ObligationBreached28c p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩


theorem prohibitionViolated28d_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass28d p c) (hCond : ConditionMet28d p c)
    (hAct : RegulatedActOccurred28d p c) : ProhibitionViolated28d p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibitionViolated28e_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass28e p c) (hCond : ConditionMet28e p c)
    (hAct : RegulatedActOccurred28e p c) : ProhibitionViolated28e p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem chapter1DeonticBreach_useOfMinor25_intro {p : Person} {c : ComplaintText}
    (h : ProhibitionViolated25 p c) : Chapter1DeonticBreach p c :=
  .useOfMinor25 h


theorem chapter1DeonticBreach_sealDuty28c_intro {p : Person} {c : ComplaintText}
    (h : ObligationBreached28c p c) : Chapter1DeonticBreach p c :=
  .sealDuty28c h


theorem chapter1DeonticBreach_mitigationBar28d_intro {p : Person} {c : ComplaintText}
    (h : ProhibitionViolated28d p c) : Chapter1DeonticBreach p c :=
  .mitigationBar28d h


theorem chapter1DeonticBreach_disqualBar28e_intro {p : Person} {c : ComplaintText}
    (h : ProhibitionViolated28e p c) : Chapter1DeonticBreach p c :=
  .disqualBar28e h

end Proving.USC.T18.Ch1.Part2.Deontic
