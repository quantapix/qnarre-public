import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Deontic.Types
import Proving.USC.T18.Ch77.Deontic.Predicates
set_option autoImplicit false













namespace Proving.USC.T18.Ch77.Deontic

open Proving.USC.Common




structure Prohibition1581a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c


def Prohibition1581aViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1581a p c ∧ PeonageActOccurred1581 p c


structure Prohibition1581b (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c


def Prohibition1581bViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1581b p c ∧ ObstructsEnforcement p c




structure Prohibition1583a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c


def Prohibition1583aViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1583a p c ∧ EnticementIntoSlaveryActOccurred1583 p c




structure Prohibition1589a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter  : ActedKnowingly p c


def Prohibition1589aViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1589a p c ∧ ForcedLaborActOccurred1589a p c


structure Prohibition1589b (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter  : ActedKnowingly p c
  venture   : VentureEngagedInForcedLabor1589b e c


def Prohibition1589bViolated (p : Person) (e : Entity) (c : ComplaintText) : Prop :=
  Prohibition1589b p e c ∧ BenefitFromForcedLaborVentureActOccurred1589b p e c




structure Prohibition1590a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c
  scienter  : ActedKnowingly p c


def Prohibition1590aViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1590a p c ∧ TraffickingForLaborActOccurred1590a p c


structure Prohibition1590b (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c


def Prohibition1590bViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1590b p c ∧ ObstructsEnforcement p c





structure Prohibition1591a (p : Person) (c : ComplaintText) : Prop where
  addressee  : AddresseeWhoever p c
  scienter   : ActedKnowingly p c
  interstate : AffectsInterstateCommerce p c
  means      : MeansForceFraudOrMinor1591 p c


def Prohibition1591aViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1591a p c ∧ SexTraffickingActOccurred1591a p c


structure Prohibition1591d (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c


def Prohibition1591dViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1591d p c ∧ ObstructsEnforcement p c





structure Prohibition1592a (p : Person) (c : ComplaintText) : Prop where
  addressee   : AddresseeWhoever p c
  scienter    : ActedKnowingly p c
  furtherance : InFurtheranceOfTrafficking1592 p c
  noException : ¬ VictimExceptionApplies1592 p c


def Prohibition1592aViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1592a p c ∧ DocumentTraffickingActOccurred1592a p c




structure Permission1592b (p : Person) (c : ComplaintText) : Prop where
  exception : VictimExceptionApplies1592 p c


structure Prohibition1592c (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeWhoever p c


def Prohibition1592cViolated (p : Person) (c : ComplaintText) : Prop :=
  Prohibition1592c p c ∧ ObstructsEnforcement p c






inductive Chapter77Offense (p : Person) (c : ComplaintText) : Prop where
  | peonage                : Prohibition1581aViolated p c → Chapter77Offense p c
  | peonageObstruct        : Prohibition1581bViolated p c → Chapter77Offense p c
  | enticement             : Prohibition1583aViolated p c → Chapter77Offense p c
  | forcedLabor            : Prohibition1589aViolated p c → Chapter77Offense p c
  | forcedLaborBenefit (e : Entity) : Prohibition1589bViolated p e c → Chapter77Offense p c
  | trafficking            : Prohibition1590aViolated p c → Chapter77Offense p c
  | traffickingObstruct    : Prohibition1590bViolated p c → Chapter77Offense p c
  | sexTrafficking         : Prohibition1591aViolated p c → Chapter77Offense p c
  | sexTraffickingObstruct : Prohibition1591dViolated p c → Chapter77Offense p c
  | documentConduct        : Prohibition1592aViolated p c → Chapter77Offense p c
  | documentObstruct       : Prohibition1592cViolated p c → Chapter77Offense p c

end Proving.USC.T18.Ch77.Deontic
