






import Proving.USC.Common.Types
import Proving.USC.T42.ReligiousFreedom.Deontic.Types
import Proving.USC.T42.ReligiousFreedom.Deontic.Predicates
import Proving.USC.T42.ReligiousFreedom.Deontic.Statute

namespace Proving.USC.T42.ReligiousFreedom.Deontic

open Proving.USC.Common



theorem obligation1996Breached_intro {p a c}
    (hAddr : AddresseeUnitedStates p c) (hCond : ConditionOnOrAfter1978 c)
    (hNot : ¬ ProtectedTraditionalReligionRight p a c) :
    Obligation1996Breached p a c :=
  ⟨⟨hAddr, hCond⟩, hNot⟩



theorem prohibition1996aViolated_intro {p a c}
    (hAddr : AddresseeUnitedStatesOrState p c) (hCond : CeremonialPeyoteUseQualifies p a c)
    (hAct : PenalizedOnBasisOfCeremonialUse p a c) :
    Prohibition1996aViolated p a c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩



theorem prohibition1996bViolated_intro {p a c}
    (hAddr : AddresseeAdoptionPlacementActor p c) (hCond : ConditionInvolvedInPlacements p c)
    (hAct : DeniedPlacementOnRacialBasis p a c) :
    Prohibition1996bViolated p a c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩

end Proving.USC.T42.ReligiousFreedom.Deontic
