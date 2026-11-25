









import Proving.USC.T18.Ch25.Deontic.Predicates
import Proving.USC.T18.Ch25.Deontic.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch25.Deontic

open Proving.USC.Common



structure Prohibition471 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsPerson p c
  condition : IntentToDefraud p c



def ProhibitionViolated471 (p : Person) (o : Obligation) (c : ComplaintText) : Prop :=
  Prohibition471 p c ∧ ForgesObligation p o c


structure Prohibition472 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsPerson p c
  condition : IntentToDefraud p c



def ProhibitionViolated472 (p : Person) (o : Obligation) (c : ComplaintText) : Prop :=
  Prohibition472 p c ∧ IsCounterfeitObligationOfUS o c ∧ UttersCounterfeit p o c


structure Prohibition473 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsPerson p c
  condition : IntentToPassAsGenuine p c



def ProhibitionViolated473 (p : Person) (o : Obligation) (c : ComplaintText) : Prop :=
  Prohibition473 p c ∧ IsCounterfeitObligationOfUS o c ∧ DealsInCounterfeit p o c

end Proving.USC.T18.Ch25.Deontic
