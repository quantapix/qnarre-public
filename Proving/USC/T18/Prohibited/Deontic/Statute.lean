
















import Proving.USC.T18.Prohibited.Deontic.Types
import Proving.USC.T18.Prohibited.Deontic.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Prohibited.Deontic

open Proving.USC.Common





structure AddresseeInClass1962a (p : Person) (c : ComplaintText) : Prop where
  income    : ReceivedPatternIncome p c
  principal : ParticipatedAsPrincipal p c


structure Prohibition1962a (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1962a p c
  condition : EnterpriseAffectsCommerce e c



def ProhibitionViolated1962a (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition1962a p e c ∧ UsedOrInvestedIncome p e c





structure Prohibition1962b (e : Entity) (c : ComplaintText) : Prop where
  condition : EnterpriseAffectsCommerce e c



def ProhibitionViolated1962b (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition1962b e c ∧ AcquiredOrMaintainedInterest p e c






inductive AddresseeInClass1962c (p : Person) (e : Entity) (c : ComplaintText) : Prop
  | employed   : EmployedByEnterprise p e c → AddresseeInClass1962c p e c
  | associated : AssociatedWithEnterprise p e c → AddresseeInClass1962c p e c


structure Prohibition1962c (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1962c p e c
  condition : EnterpriseAffectsCommerce e c



def ProhibitionViolated1962c (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition1962c p e c ∧ ConductedAffairsThroughPattern p e c





def ProhibitionViolated1962d (p : Person) (ag : Agreement) (c : ComplaintText) : Prop :=
  ConspiredToViolate p ag c

end Proving.USC.T18.Prohibited.Deontic
