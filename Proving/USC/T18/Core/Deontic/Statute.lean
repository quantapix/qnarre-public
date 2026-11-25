














import Proving.USC.T18.Core.Deontic.Types
import Proving.USC.T18.Core.Deontic.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Core.Deontic

open Proving.USC.Common





structure Prohibition1962a (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1962a p c
  condition : ConditionMet1962a e c



def ProhibitionViolated1962a (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition1962a p e c ∧ RegulatedActOccurred1962a p e c




structure Prohibition1962b (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1962b p c
  condition : ConditionMet1962b e c



def ProhibitionViolated1962b (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition1962b p e c ∧ RegulatedActOccurred1962b p e c




structure Prohibition1962c (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1962c p e c
  condition : ConditionMet1962c e c



def ProhibitionViolated1962c (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition1962c p e c ∧ RegulatedActOccurred1962c p e c





structure Prohibition1962d (p : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1962d p c
  condition : ConditionMet1962d ag c



def ProhibitionViolated1962d (p : Person) (ag : Agreement) (c : ComplaintText) : Prop :=
  Prohibition1962d p ag c ∧ RegulatedActOccurred1962d p ag c






inductive Section1962Violated (p : Person) (e : Entity) (ag : Agreement) (c : ComplaintText) : Prop
  | viaA : ProhibitionViolated1962a p e c → Section1962Violated p e ag c
  | viaB : ProhibitionViolated1962b p e c → Section1962Violated p e ag c
  | viaC : ProhibitionViolated1962c p e c → Section1962Violated p e ag c
  | viaD : ProhibitionViolated1962d p ag c → Section1962Violated p e ag c

end Proving.USC.T18.Core.Deontic
