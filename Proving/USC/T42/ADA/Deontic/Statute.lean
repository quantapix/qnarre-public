



















import Proving.USC.T42.ADA.Deontic.Types
import Proving.USC.T42.ADA.Deontic.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.ADA.Deontic

open Proving.USC.Common






structure Prohibition12112 (a : CoveredAddressee) (i : ProtectedIndividual)
    (c : ComplaintText) : Prop where
  addressee : AddresseeInClass12112 a c
  condition : ConditionMet12112 i c



def Prohibition12112Violated (a : CoveredAddressee) (i : ProtectedIndividual)
    (c : ComplaintText) : Prop :=
  Prohibition12112 a i c ∧ RegulatedActOccurred12112 a i c





structure Obligation12112b5 (a : CoveredAddressee) (i : ProtectedIndividual)
    (c : ComplaintText) : Prop where
  addressee : AddresseeInClass12112 a c
  condition : ConditionMet12112 i c
  noExcuse  : ¬ UndueHardship12112b5 a i c



def Obligation12112b5Breached (a : CoveredAddressee) (i : ProtectedIndividual)
    (c : ComplaintText) : Prop :=
  Obligation12112b5 a i c ∧ ¬ AccommodationProvided12112b5 a i c





structure Prohibition12112d (a : CoveredAddressee) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass12112d a c



def Prohibition12112dViolated (a : CoveredAddressee) (i : ProtectedIndividual)
    (c : ComplaintText) : Prop :=
  Prohibition12112d a c ∧ RegulatedActOccurred12112d a i c





structure Prohibition12132 (a : CoveredAddressee) (i : ProtectedIndividual)
    (c : ComplaintText) : Prop where
  addressee : AddresseeInClass12132 a c
  condition : ConditionMet12132 i c



def Prohibition12132Violated (a : CoveredAddressee) (i : ProtectedIndividual)
    (c : ComplaintText) : Prop :=
  Prohibition12132 a i c ∧ RegulatedActOccurred12132 a i c






structure Prohibition12182 (a : CoveredAddressee) (i : ProtectedIndividual)
    (c : ComplaintText) : Prop where
  addressee : AddresseeInClass12182 a c
  condition : ConditionMet12182 i c
  noThreat  : ¬ DirectThreat12182 i c



def Prohibition12182Violated (a : CoveredAddressee) (i : ProtectedIndividual)
    (c : ComplaintText) : Prop :=
  Prohibition12182 a i c ∧ RegulatedActOccurred12182 a i c





structure Obligation12182b2 (a : CoveredAddressee) (i : ProtectedIndividual)
    (c : ComplaintText) : Prop where
  addressee : AddresseeInClass12182 a c
  condition : ConditionMet12182 i c
  noExcuse  : ¬ FundamentalAlteration12182b2 a i c



def Obligation12182b2Breached (a : CoveredAddressee) (i : ProtectedIndividual)
    (c : ComplaintText) : Prop :=
  Obligation12182b2 a i c ∧ ¬ ModificationProvided12182b2 a i c





structure Prohibition12203a (a : CoveredAddressee) (i : ProtectedIndividual)
    (c : ComplaintText) : Prop where
  addressee : AddresseeInClass12203a a c
  condition : ConditionMet12203a i c



def Prohibition12203aViolated (a : CoveredAddressee) (i : ProtectedIndividual)
    (c : ComplaintText) : Prop :=
  Prohibition12203a a i c ∧ RegulatedActOccurred12203a a i c








structure Prohibition12203b (i : ProtectedIndividual) (c : ComplaintText) : Prop where
  condition : ConditionMet12203b i c



def Prohibition12203bViolated (i : ProtectedIndividual) (c : ComplaintText) : Prop :=
  Prohibition12203b i c ∧ RegulatedActOccurred12203b i c








inductive ADANormBroken (c : ComplaintText) : Prop
  | t1Discrim   (a i) : Prohibition12112Violated a i c → ADANormBroken c
  | t1Accommod  (a i) : Obligation12112b5Breached a i c → ADANormBroken c
  | t1MedInquiry (a i) : Prohibition12112dViolated a i c → ADANormBroken c
  | t2Discrim   (a i) : Prohibition12132Violated a i c → ADANormBroken c
  | t3Discrim   (a i) : Prohibition12182Violated a i c → ADANormBroken c
  | t3Modify    (a i) : Obligation12182b2Breached a i c → ADANormBroken c
  | retaliation (a i) : Prohibition12203aViolated a i c → ADANormBroken c
  | coercion    (i)   : Prohibition12203bViolated i c → ADANormBroken c

end Proving.USC.T42.ADA.Deontic
