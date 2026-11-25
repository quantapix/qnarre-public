import Proving.USC.Common.Types
import Proving.USC.T18.Ch71.Deontic.Types
import Proving.USC.T18.Ch71.Deontic.Predicates










set_option autoImplicit false

namespace Proving.USC.T18.Ch71.Deontic

open Proving.USC.Common


structure Prohibition1461 (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  condition : IsNonmailableMatter1461 m c

def ProhibitionViolated1461 (p : Person) (m : Matter) (c : ComplaintText) : Prop :=
  Prohibition1461 p m c ∧ KnowinglyMailsNonmailable1461 p m c


structure Prohibition1462 (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  condition : IsObsceneMatter1462 m c
  commerce  : AffectsInterstateOrForeignCommerce p c

def ProhibitionViolated1462 (p : Person) (m : Matter) (c : ComplaintText) : Prop :=
  Prohibition1462 p m c ∧ ImportsOrTransportsObscene1462 p m c


structure Prohibition1463 (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  condition : IsIndecentWrapperMatter1463 m c

def ProhibitionViolated1463 (p : Person) (m : Matter) (c : ComplaintText) : Prop :=
  Prohibition1463 p m c ∧ KnowinglyDepositsWrapper1463 p m c


structure Prohibition1464 (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  condition : IsObsceneOrProfaneLanguage1464 m c

def ProhibitionViolated1464 (p : Person) (m : Matter) (c : ComplaintText) : Prop :=
  Prohibition1464 p m c ∧ UttersByRadio1464 p m c


structure Prohibition1465 (p : Person) (m : Matter) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  condition : IsObsceneMatter1465 m c
  commerce  : AffectsInterstateOrForeignCommerce p c

def ProhibitionViolated1465 (p : Person) (m : Matter) (c : ComplaintText) : Prop :=
  Prohibition1465 p m c ∧ ProducesOrTransportsForDistribution1465 p m c

end Proving.USC.T18.Ch71.Deontic
