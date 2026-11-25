









import Proving.USC.Common.Types
import Proving.USC.T18.Ch113.Reslice.Deontic.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch113.Reslice.Deontic

open Proving.USC.Common




structure Prohibition2315 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  condition : ConditionMet2315 p c
  commerce  : EngagedInInterstateCommerce c



def ProhibitionViolated2315 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2315 p c ∧ RegulatedActOccurred2315 p c




structure Prohibition2318 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  condition : ConditionMet2318 p c



def ProhibitionViolated2318 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2318 p c ∧ RegulatedActOccurred2318 p c




structure Prohibition2320 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAnyPerson p c
  condition : ConditionMet2320 p c



def ProhibitionViolated2320 (p : Person) (c : ComplaintText) : Prop :=
  Prohibition2320 p c ∧ RegulatedActOccurred2320 p c




structure Permission2318e (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeCopyrightOwner p c
  condition : PermissionCondition2318e p c



def PermissionExercised2318e (p : Person) (c : ComplaintText) : Prop :=
  Permission2318e p c ∧ PermittedActCivilAction2318e p c




structure Obligation2320h (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeAttorneyGeneral p c
  condition : ObligationCondition2320h c



def ObligationBreached2320h (p : Person) (c : ComplaintText) : Prop :=
  Obligation2320h p c ∧ ¬ ObligatedActReportAccounting2320h p c

end Proving.USC.T18.Ch113.Reslice.Deontic
