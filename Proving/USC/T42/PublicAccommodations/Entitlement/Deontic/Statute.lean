












import Proving.USC.T42.PublicAccommodations.Entitlement.Deontic.Types
import Proving.USC.T42.PublicAccommodations.Entitlement.Deontic.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Entitlement.Deontic

open Proving.USC.Common








structure Prohibition2000a (p : Person) (est : Establishment) (c : ComplaintText) : Prop where
  addressee : AddresseeOperatesEstablishment p est c
  condition : EstablishmentIsCovered est c
  notExempt : ¬ IsPrivateClubExempt est c




def ProhibitionViolated2000a (p : Person) (est : Establishment) (c : ComplaintText) : Prop :=
  Prohibition2000a p est c ∧ DiscriminationActOccurred p est c





structure Permission2000a3 (p : Person) (c : ComplaintText) : Prop where
  addressee : IsPersonAggrieved p c
  condition : ProhibitedActEngagedOrImminent c



def PermissionExercised2000a3 (p : Person) (c : ComplaintText) : Prop :=
  Permission2000a3 p c ∧ PreventiveReliefActionInstituted p c






structure Power2000a6 (c : ComplaintText) : Prop where
  condition : ProceedingInstitutedUnderSubchapter c

end Proving.USC.T42.PublicAccommodations.Entitlement.Deontic
