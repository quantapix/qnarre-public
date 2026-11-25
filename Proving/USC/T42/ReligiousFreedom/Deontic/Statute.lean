













import Proving.USC.Common.Types
import Proving.USC.T42.ReligiousFreedom.Deontic.Types
import Proving.USC.T42.ReligiousFreedom.Deontic.Predicates

namespace Proving.USC.T42.ReligiousFreedom.Deontic

open Proving.USC.Common





structure Obligation1996 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeUnitedStates p c
  condition : ConditionOnOrAfter1978 c



def Obligation1996Breached (p : Person) (a : Act) (c : ComplaintText) : Prop :=
  Obligation1996 p c ∧ ¬ ProtectedTraditionalReligionRight p a c






structure Prohibition1996a (p : Person) (a : Act) (c : ComplaintText) : Prop where
  addressee : AddresseeUnitedStatesOrState p c
  condition : CeremonialPeyoteUseQualifies p a c




def Prohibition1996aViolated (p : Person) (a : Act) (c : ComplaintText) : Prop :=
  Prohibition1996a p a c ∧ PenalizedOnBasisOfCeremonialUse p a c






structure Prohibition1996b (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAdoptionPlacementActor p c
  condition : ConditionInvolvedInPlacements p c




def Prohibition1996bViolated (p : Person) (a : Act) (c : ComplaintText) : Prop :=
  Prohibition1996b p c ∧ DeniedPlacementOnRacialBasis p a c

end Proving.USC.T42.ReligiousFreedom.Deontic
