









import Proving.USC.Common.Types
import Proving.USC.T05.Deontic.Types
import Proving.USC.T05.Deontic.Predicates
import Proving.USC.T05.Deontic.Statute

namespace Proving.USC.T05.Deontic

open Proving.USC.Common



theorem obligation554b_breached_intro {p a c}
    (hAddr : AddresseeInClass554b p c) (hCond : ConditionMet554 c)
    (hNoAct : ¬ RegulatedActOccurred554b p a c) : Obligation554bBreached p a c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩


theorem prohibition554d_violated_intro {p a c}
    (hAddr : AddresseeInClass554d p c) (hCond : ConditionMet554 c)
    (hAct : RegulatedActOccurred554d p a c) : Prohibition554dViolated p a c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation556d_breached_intro {p a c}
    (hAddr : AddresseeInClass556d p c) (hCond : ConditionMet556 c)
    (hNoAct : ¬ RegulatedActOccurred556d p a c) : Obligation556dBreached p a c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩


theorem prohibition557d_violated_intro {p a c}
    (hAddr : AddresseeInClass557d p c) (hCond : ConditionMet557d c)
    (hAct : RegulatedActOccurred557d p a c) : Prohibition557dViolated p a c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation557dC_breached_intro {p a c}
    (hAddr : AddresseeInClass557d p c) (hCond : ConditionMet557d c)
    (hNoAct : ¬ RegulatedActOccurred557dC p a c) : Obligation557dCBreached p a c :=
  ⟨⟨hAddr, hCond⟩, hNoAct⟩


theorem permission702_available_intro {p a c}
    (hAddr : AddresseeInClass702 p c) (hAvail : PermittedActAvailable702 p a c)
    (hRev : ConditionMet704 a c) : Permission702Available p a c :=
  ⟨⟨hAddr⟩, hAvail, hRev⟩


theorem power706_exercisable_intro {p a c}
    (hAddr : AddresseeInClass706 p c) (hAct : RegulatedActOccurred706 p a c)
    : Power706Exercisable p a c :=
  ⟨⟨hAddr⟩, hAct⟩

end Proving.USC.T05.Deontic
