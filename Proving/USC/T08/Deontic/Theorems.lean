









import Proving.USC.T08.Deontic.Statute

namespace Proving.USC.T08.Deontic

open Proving.USC.Common



theorem prohibition1324_violated_intro {p a c}
    (hAddr : AddresseeInClass1324 p c) (hCond : ConditionMet1324 a c)
    (hAct : RegulatedActOccurred1324 p a c) : ProhibitionViolated1324 p a c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem prohibition1327_violated_intro {p a c}
    (hAddr : AddresseeInClass1327 p c) (hCond : ConditionMet1327 a c)
    (hAct : RegulatedActOccurred1327 p a c) : ProhibitionViolated1327 p a c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem prohibition1328_violated_intro {p a c}
    (hAddr : AddresseeInClass1328 p c) (hCond : ConditionMet1328 a c)
    (hAct : RegulatedActOccurred1328 p a c) : ProhibitionViolated1328 p a c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T08.Deontic
