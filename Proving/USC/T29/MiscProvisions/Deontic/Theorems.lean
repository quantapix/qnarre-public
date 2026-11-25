







import Proving.USC.Common.Types
import Proving.USC.T29.MiscProvisions.Deontic.Types
import Proving.USC.T29.MiscProvisions.Deontic.Predicates
import Proving.USC.T29.MiscProvisions.Deontic.Statute

namespace Proving.USC.T29.MiscProvisions.Deontic

open Proving.USC.Common


theorem permission163Held_intro {p c}
    (hAddr : AddresseeInClass163 p c) (hCond : ConditionMet163 p c)
    (hAct : RegulatedActOccurred163 p c) : Permission163Held p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permission164aHeld_intro {p lo c}
    (hAddr : AddresseeInClass164a p c)
    (hAct : RegulatedActOccurred164a p lo c) : Permission164aHeld p lo c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem power164cExercised_intro {p c}
    (hAddr : AddresseeInClass164c p c) (hCond : ConditionMet164c p c)
    (hAct : RegulatedActOccurred164c p c) : Power164cExercised p c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem permission169Held_intro {p lo c}
    (hAddr : AddresseeInClass169 p c) (hCond : ConditionMet169 p c)
    (hAct : RegulatedActOccurred169 p lo c) : Permission169Held p lo c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem power169chargeExercised_intro {p lo c}
    (hCond : ConditionMet169charge p c)
    (hAct : RegulatedActOccurred169charge p lo c) : Power169chargeExercised p lo c :=
  ⟨⟨hCond⟩, hAct⟩

end Proving.USC.T29.MiscProvisions.Deontic
