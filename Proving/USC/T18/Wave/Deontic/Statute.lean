

















import Proving.USC.T18.Wave.Deontic.Predicates

namespace Proving.USC.T18.Wave.Deontic

open Proving.USC.Common





structure Prohibition1962a (p : Person) (e : Enterprise) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1962a p c
  condition : EnterpriseAffectsCommerce e c



def ProhibitionViolated1962a (p : Person) (e : Enterprise) (c : ComplaintText) : Prop :=
  Prohibition1962a p e c ∧ RegulatedActOccurred1962a p e c
    ∧ (SecuritiesSafeHarbor1962a p e c → False)





structure Prohibition1962b (p : Person) (e : Enterprise) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1962b p c
  condition : EnterpriseAffectsCommerce e c



def ProhibitionViolated1962b (p : Person) (e : Enterprise) (c : ComplaintText) : Prop :=
  Prohibition1962b p e c ∧ RegulatedActOccurred1962b p e c





structure Prohibition1962c (p : Person) (e : Enterprise) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass1962c p e c
  condition : EnterpriseAffectsCommerce e c



def ProhibitionViolated1962c (p : Person) (e : Enterprise) (c : ComplaintText) : Prop :=
  Prohibition1962c p e c ∧ RegulatedActOccurred1962c p e c






def ProhibitionViolated1962d (p : Person) (c : ComplaintText) : Prop :=
  ConspiredToViolate1962d p c






inductive RicoProhibitionViolated (p : Person) (c : ComplaintText) : Prop
  | viaA (e : Enterprise) (h : ProhibitionViolated1962a p e c) : RicoProhibitionViolated p c
  | viaB (e : Enterprise) (h : ProhibitionViolated1962b p e c) : RicoProhibitionViolated p c
  | viaC (e : Enterprise) (h : ProhibitionViolated1962c p e c) : RicoProhibitionViolated p c
  | viaD (h : ProhibitionViolated1962d p c) : RicoProhibitionViolated p c








structure CriminalForfeiture1963 (p : Person) (c : ComplaintText) : Prop where
  violated   : ViolatedSection1962 p c
  forfeitable : HoldsForfeitableInterest1963 p c








def CivilRemedy1964c (p : Person) (c : ComplaintText) : Prop :=
  InjuredByViolation1964c p c ∧ (SecuritiesFraudBar1964c p c → False)

end Proving.USC.T18.Wave.Deontic
