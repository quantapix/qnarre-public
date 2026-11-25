








import Proving.USC.T18.Ch77TailCompletion.Deontic.Types
import Proving.USC.T18.Ch77TailCompletion.Deontic.Predicates
import Proving.USC.T18.Ch77TailCompletion.Deontic.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch77TailCompletion.Deontic

open Proving.USC.Common


theorem prohibition1583_violated_intro {p c}
    (hAddr : AddresseeInClass1583 p c) (hCond : ConditionMet1583 p c)
    (hAct : RegulatedActOccurred1583 p c) : Prohibition1583Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1584_violated_intro {p c}
    (hAddr : AddresseeInClass1584 p c) (hCond : ConditionMet1584 p c)
    (hAct : RegulatedActOccurred1584 p c) : Prohibition1584Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation1593_breached_intro {p c}
    (hAddr : AddresseeInClass1593 p c) (hCond : ConditionMet1593 p c)
    (hNotAct : ¬ RegulatedActOccurred1593 p c) : Obligation1593Breached p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩


theorem prohibition1593A_violated_intro {p c}
    (hAddr : AddresseeInClass1593A p c) (hCond : ConditionMet1593A p c)
    (hAct : RegulatedActOccurred1593A p c) : Prohibition1593AViolated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1594_violated_intro {p c}
    (hAddr : AddresseeInClass1594 p c) (hCond : ConditionMet1594 p c)
    (hAct : RegulatedActOccurred1594 p c) : Prohibition1594Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permission1595_exercisable_intro {p c}
    (hAddr : AddresseeInClass1595 p c) (hCond : ConditionMet1595 p c)
    : Permission1595Exercisable p c :=
  ⟨hAddr, hCond⟩


theorem power1595A_exercisable_intro {p c}
    (hAddr : AddresseeInClass1595A p c) (hCond : ConditionMet1595A p c)
    : Power1595AExercisable p c :=
  ⟨hAddr, hCond⟩


theorem prohibition1596_violated_intro {p c}
    (hAddr : AddresseeInClass1596 p c) (hCond : ConditionMet1596 p c)
    (hAct : RegulatedActOccurred1596 p c) : Prohibition1596Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1597_violated_intro {p c}
    (hAddr : AddresseeInClass1597 p c) (hCond : ConditionMet1597 p c)
    (hAct : RegulatedActOccurred1597 p c) : Prohibition1597Violated p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T18.Ch77TailCompletion.Deontic
