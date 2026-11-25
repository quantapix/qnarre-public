














import Proving.USC.Common.Types
import Proving.USC.T29.MiscProvisions.Deontic.Types
import Proving.USC.T29.MiscProvisions.Deontic.Predicates

namespace Proving.USC.T29.MiscProvisions.Deontic

open Proving.USC.Common





structure Permission163 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass163 p c
  condition : ConditionMet163 p c



def Permission163Held (p : Person) (c : ComplaintText) : Prop :=
  Permission163 p c ∧ RegulatedActOccurred163 p c





structure Permission164a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass164a p c



def Permission164aHeld (p : Person) (lo : LaborOrganization) (c : ComplaintText) : Prop :=
  Permission164a p c ∧ RegulatedActOccurred164a p lo c





structure Power164c (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass164c p c
  condition : ConditionMet164c p c



def Power164cExercised (p : Person) (c : ComplaintText) : Prop :=
  Power164c p c ∧ RegulatedActOccurred164c p c






structure Permission169 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass169 p c
  condition : ConditionMet169 p c




def Permission169Held (p : Person) (lo : LaborOrganization) (c : ComplaintText) : Prop :=
  Permission169 p c ∧ RegulatedActOccurred169 p lo c





structure Power169charge (p : Person) (c : ComplaintText) : Prop where
  condition : ConditionMet169charge p c



def Power169chargeExercised (p : Person) (lo : LaborOrganization) (c : ComplaintText) : Prop :=
  Power169charge p c ∧ RegulatedActOccurred169charge p lo c

end Proving.USC.T29.MiscProvisions.Deontic
