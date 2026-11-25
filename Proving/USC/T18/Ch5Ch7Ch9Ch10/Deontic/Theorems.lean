import Proving.USC.T18.Ch5Ch7Ch9Ch10.Deontic.Statute










namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Deontic

open Proving.USC.Common



theorem prohibitionViolated_intro {prov : Provision} {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass prov p c) (hCond : ConditionMet prov c)
    (hAct : RegulatedActOccurred prov p c) : ProhibitionViolated prov p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem obligationBreached_intro {prov : Provision} {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass prov p c) (hCond : ConditionMet prov c)
    (hNoAct : ¬ RegulatedActOccurred prov p c) : ObligationBreached prov p c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩

theorem powerExercised_intro {prov : Provision} {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass prov p c) (hCond : ConditionMet prov c)
    (hAct : RegulatedActOccurred prov p c) : PowerExercised prov p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem prohibition81_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s81 p c) (hCond : ConditionMet Provision.s81 c)
    (hAct : RegulatedActOccurred Provision.s81 p c) : ProhibitionViolated81 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition111_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s111 p c) (hCond : ConditionMet Provision.s111 c)
    (hAct : RegulatedActOccurred Provision.s111 p c) : ProhibitionViolated111 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition112_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s112 p c) (hCond : ConditionMet Provision.s112 c)
    (hAct : RegulatedActOccurred Provision.s112 p c) : ProhibitionViolated112 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition113_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s113 p c) (hCond : ConditionMet Provision.s113 c)
    (hAct : RegulatedActOccurred Provision.s113 p c) : ProhibitionViolated113 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition114_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s114 p c) (hCond : ConditionMet Provision.s114 c)
    (hAct : RegulatedActOccurred Provision.s114 p c) : ProhibitionViolated114 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition115_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s115 p c) (hCond : ConditionMet Provision.s115 c)
    (hAct : RegulatedActOccurred Provision.s115 p c) : ProhibitionViolated115 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition116_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s116 p c) (hCond : ConditionMet Provision.s116 c)
    (hAct : RegulatedActOccurred Provision.s116 p c) : ProhibitionViolated116 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition117_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s117 p c) (hCond : ConditionMet Provision.s117 c)
    (hAct : RegulatedActOccurred Provision.s117 p c) : ProhibitionViolated117 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition118_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s118 p c) (hCond : ConditionMet Provision.s118 c)
    (hAct : RegulatedActOccurred Provision.s118 p c) : ProhibitionViolated118 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition119_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s119 p c) (hCond : ConditionMet Provision.s119 c)
    (hAct : RegulatedActOccurred Provision.s119 p c) : ProhibitionViolated119 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition152_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s152 p c) (hCond : ConditionMet Provision.s152 c)
    (hAct : RegulatedActOccurred Provision.s152 p c) : ProhibitionViolated152 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition153_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s153 p c) (hCond : ConditionMet Provision.s153 c)
    (hAct : RegulatedActOccurred Provision.s153 p c) : ProhibitionViolated153 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition154_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s154 p c) (hCond : ConditionMet Provision.s154 c)
    (hAct : RegulatedActOccurred Provision.s154 p c) : ProhibitionViolated154 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition155_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s155 p c) (hCond : ConditionMet Provision.s155 c)
    (hAct : RegulatedActOccurred Provision.s155 p c) : ProhibitionViolated155 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition156_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s156 p c) (hCond : ConditionMet Provision.s156 c)
    (hAct : RegulatedActOccurred Provision.s156 p c) : ProhibitionViolated156 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition157_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s157 p c) (hCond : ConditionMet Provision.s157 c)
    (hAct : RegulatedActOccurred Provision.s157 p c) : ProhibitionViolated157 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition175_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s175 p c) (hCond : ConditionMet Provision.s175 c)
    (hAct : RegulatedActOccurred Provision.s175 p c) : ProhibitionViolated175 p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition175b_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s175b p c) (hCond : ConditionMet Provision.s175b c)
    (hAct : RegulatedActOccurred Provision.s175b p c) : ProhibitionViolated175b p c :=
  prohibitionViolated_intro hAddr hCond hAct

theorem prohibition175c_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s175c p c) (hCond : ConditionMet Provision.s175c c)
    (hAct : RegulatedActOccurred Provision.s175c p c) : ProhibitionViolated175c p c :=
  prohibitionViolated_intro hAddr hCond hAct



theorem obligation158_breached_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s158 p c) (hCond : ConditionMet Provision.s158 c)
    (hNoAct : ¬ RegulatedActOccurred Provision.s158 p c) : ObligationBreached158 p c :=
  obligationBreached_intro hAddr hCond hNoAct



theorem power175a_exercised_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s175a p c) (hCond : ConditionMet Provision.s175a c)
    (hAct : RegulatedActOccurred Provision.s175a p c) : PowerExercised175a p c :=
  powerExercised_intro hAddr hCond hAct

theorem power176_exercised_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s176 p c) (hCond : ConditionMet Provision.s176 c)
    (hAct : RegulatedActOccurred Provision.s176 p c) : PowerExercised176 p c :=
  powerExercised_intro hAddr hCond hAct

theorem power177_exercised_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeInClass Provision.s177 p c) (hCond : ConditionMet Provision.s177 c)
    (hAct : RegulatedActOccurred Provision.s177 p c) : PowerExercised177 p c :=
  powerExercised_intro hAddr hCond hAct

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Deontic
