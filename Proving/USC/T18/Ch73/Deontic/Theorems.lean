import Proving.USC.T18.Ch73.Deontic.Types
import Proving.USC.T18.Ch73.Deontic.Predicates
import Proving.USC.T18.Ch73.Deontic.Statute
import Proving.USC.Common.Types
set_option autoImplicit false







namespace Proving.USC.T18.Ch73.Deontic

open Proving.USC.Common

theorem prohibition1503a_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hCond : ConditionMet1503a p c)
    (hAct : RegulatedActOccurred1503a p c) : ProhibitionViolated1503a p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibition1512a1_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hCond : ConditionMet1512a1 p c)
    (hAct : RegulatedActOccurred1512a1 p c) : ProhibitionViolated1512a1 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibition1512a2_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hCond : ConditionMet1512a2 p c)
    (hAct : RegulatedActOccurred1512a2 p c) : ProhibitionViolated1512a2 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibition1512b_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hCond : ConditionMet1512b p c)
    (hAct : RegulatedActOccurred1512b p c) : ProhibitionViolated1512b p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibition1512c_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hCond : ConditionMet1512c p c)
    (hAct : RegulatedActOccurred1512c p c) : ProhibitionViolated1512c p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibition1512d_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hCond : ConditionMet1512d p c)
    (hAct : RegulatedActOccurred1512d p c) : ProhibitionViolated1512d p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibition1512k_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hCond : ConditionMet1512k p c)
    (hAct : RegulatedActOccurred1512k p c) : ProhibitionViolated1512k p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1512b_violated_absent_defense_intro {p : Person} {c : ComplaintText}
    (hViol : ProhibitionViolated1512b p c)
    (hNoDef : ¬ Permission1512e p c) : ProhibitionViolated1512bAbsentDefense p c :=
  ⟨hViol, hNoDef⟩

theorem prohibition1513a1_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hCond : ConditionMet1513a1 p c)
    (hAct : RegulatedActOccurred1513a1 p c) : ProhibitionViolated1513a1 p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibition1513b_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hCond : ConditionMet1513b p c)
    (hAct : RegulatedActOccurred1513b p c) : ProhibitionViolated1513b p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibition1513e_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hCond : ConditionMet1513e p c)
    (hAct : RegulatedActOccurred1513e p c) : ProhibitionViolated1513e p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

theorem prohibition1513f_violated_intro {p : Person} {c : ComplaintText}
    (hAddr : AddresseeWhoever p c) (hCond : ConditionMet1513f p c)
    (hAct : RegulatedActOccurred1513f p c) : ProhibitionViolated1513f p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T18.Ch73.Deontic
