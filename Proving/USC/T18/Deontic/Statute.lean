





import Proving.USC.T18.Deontic.Predicates

namespace Proving.USC.T18.Deontic
open Proving.USC.Common



structure Prohibition1962c (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass p e c
  condition : ConditionMet e c



def ProhibitionViolated1962c (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition1962c p e c ∧ RegulatedActOccurred p e c

end Proving.USC.T18.Deontic
