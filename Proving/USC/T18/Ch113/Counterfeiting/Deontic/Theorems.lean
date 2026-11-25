





import Proving.USC.T18.Ch113.Counterfeiting.Deontic.Statute

namespace Proving.USC.T18.Ch113.Counterfeiting.Deontic

open Proving.USC.Common



theorem prohibition2318_violated_intro {p a c}
    (hAddr : AddresseeInClass2318 p c) (hCond : ConditionMet2318 a c)
    (hAct : RegulatedActOccurred2318 p a c) : Prohibition2318Violated p a c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem prohibition2319_violated_intro {p a c}
    (hAddr : AddresseeInClass2319 p c) (hCond : ConditionMet2319 a c)
    (hAct : RegulatedActOccurred2319 p a c) : Prohibition2319Violated p a c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem prohibition2320_violated_intro {p a c}
    (hAddr : AddresseeInClass2320 p c) (hCond : ConditionMet2320 a c)
    (hAct : RegulatedActOccurred2320 p a c) : Prohibition2320Violated p a c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition2320i_violated_intro {p a c}
    (hAddr : AddresseeInClass2320i p c) (hCond : ConditionMet2320i a c)
    (hAct : RegulatedActOccurred2320i p a c) : Prohibition2320iViolated p a c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem obligation2320h_breached_intro {p c}
    (hAddr : AddresseeInClass2320h p c) (hCond : ConditionMet2320h c)
    (hNotAct : ¬ RegulatedActOccurred2320h p c) : Obligation2320hBreached p c :=
  ⟨⟨hAddr, hCond⟩, hNotAct⟩



theorem permission2318e_intro {p c}
    (hAddr : AddresseeInClass2318e p c) (hCond : ConditionMet2318e c)
    : Permission2318eGranted p c :=
  ⟨hAddr, hCond⟩

end Proving.USC.T18.Ch113.Counterfeiting.Deontic
