







import Proving.USC.T42.Deontic.Statute

namespace Proving.USC.T42.Deontic

open Proving.USC.Common


theorem prohibition1981_violated_intro {p k c}
    (hAddr : AddresseeInClass1981 p k c) (hCond : ConditionMet1981 p k c)
    (hAct : RegulatedActOccurred1981 p k c) : ProhibitionViolated1981 p k c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permission1981a_exercisable_intro {p c}
    (hAddr : AddresseeInClass1981a p c) (hCond : ConditionMet1981a p c)
    : PermissionExercisable1981a p c :=
  ⟨hAddr, hCond⟩


theorem obligation1983_triggered_intro {p r c}
    (hAddr : AddresseeInClass1983 p c) (hCond : ConditionMet1983 p r c)
    (hAct : RegulatedActOccurred1983 p r c) : Obligation1983Triggered p r c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition1985_violated_intro {a p c}
    (hAddr : AddresseeInClass1985 a c) (hCond : ConditionMet1985 a c)
    (hAct : RegulatedActOccurred1985 a p c) : ProhibitionViolated1985 a p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation1986_breached_intro {p a c}
    (hAddr : AddresseeInClass1986 p a c) (hCond : ConditionMet1986 p a c)
    (hNeglect : ¬ RegulatedActOccurred1986 p a c) : Obligation1986Breached p a c :=
  ⟨⟨hAddr, hCond⟩, hNeglect⟩


theorem prohibition2000d_violated_intro {p prog c}
    (hAddr : AddresseeInClass2000d p prog c) (hCond : ConditionMet2000d prog c)
    (hAct : RegulatedActOccurred2000d p prog c) : ProhibitionViolated2000d p prog c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem power2000d1_exercised_intro {e prog c}
    (hAddr : AddresseeInClass2000d1 e prog c) (hCond : ConditionMet2000d1 e prog c)
    (hAct : RegulatedActOccurred2000d1 e prog c) : Power2000d1Exercised e prog c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition2000d7_violated_intro {e t c}
    (hAddr : AddresseeInClass2000d7 e c) (hCond : ConditionMet2000d7 e t c)
    (hAct : RegulatedActOccurred2000d7 e c) : ProhibitionViolated2000d7 e t c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T42.Deontic
