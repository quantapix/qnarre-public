







import Proving.USC.T18.CommercePredicates.Deontic.Statute

namespace Proving.USC.T18.CommercePredicates.Deontic

open Proving.USC.Common




theorem prohibition1958Violated_intro {p f c}
    (hAddr : AddresseeInClass1958 p c) (hCond : ConditionMet1958 p c)
    (hAct : RegulatedActOccurred1958 p f c) : Prohibition1958Violated p f c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩




theorem prohibition1960Violated_intro {p b c}
    (hAddr : AddresseeInClass1960 p b c) (hCond : ConditionMet1960 b c)
    (hAct : RegulatedActOccurred1960 p b c) : Prohibition1960Violated p b c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T18.CommercePredicates.Deontic
