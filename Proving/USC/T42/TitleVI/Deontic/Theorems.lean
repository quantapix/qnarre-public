







import Proving.USC.Common.Types
import Proving.USC.T42.TitleVI.Deontic.Types
import Proving.USC.T42.TitleVI.Deontic.Predicates
import Proving.USC.T42.TitleVI.Deontic.Statute

namespace Proving.USC.T42.TitleVI.Deontic

open Proving.USC.Common



theorem prohibition2000dViolated_intro {p e c}
    (hAddr : AddresseeInClass2000d p c)
    (hCond : ConditionFederalAssistance2000d e c)
    (hAct : RegulatedActOccurred2000d p e c) :
    Prohibition2000dViolated p e c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem power2000d1Exercised_intro {a c}
    (hAddr : AddresseeInClass2000d1 a c)
    (hAct : RegulatedActOccurred2000d1 a c) :
    Power2000d1Exercised a c :=
  ⟨⟨hAddr⟩, hAct⟩



theorem prohibition2000d1Violated_intro {a c}
    (hAddr : AddresseeInClass2000d1 a c)
    (hCond : ConditionPrematureAction2000d1 a c) :
    Prohibition2000d1Violated a c :=
  ⟨⟨hAddr⟩, hCond⟩



theorem prohibition2000d7Violated_intro {s t c}
    (hAddr : AddresseeInClass2000d7 s c)
    (hCond : ConditionAfterEffectiveDate2000d7 s t c)
    (hAct : RegulatedActOccurred2000d7 s c) :
    Prohibition2000d7Violated s t c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T42.TitleVI.Deontic
