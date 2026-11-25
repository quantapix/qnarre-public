












import Proving.USC.T42.ADA.Deontic.Types
import Proving.USC.T42.ADA.Deontic.Predicates
import Proving.USC.T42.ADA.Deontic.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.ADA.Deontic

open Proving.USC.Common


theorem prohibition12112Violated_intro {a i c}
    (hAddr : AddresseeInClass12112 a c) (hCond : ConditionMet12112 i c)
    (hAct : RegulatedActOccurred12112 a i c) : Prohibition12112Violated a i c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem obligation12112b5Breached_intro {a i c}
    (hAddr : AddresseeInClass12112 a c) (hCond : ConditionMet12112 i c)
    (hNoExcuse : ¬ UndueHardship12112b5 a i c)
    (hNoAct : ¬ AccommodationProvided12112b5 a i c) :
    Obligation12112b5Breached a i c :=
  ⟨⟨hAddr, hCond, hNoExcuse⟩, hNoAct⟩


theorem prohibition12112dViolated_intro {a i c}
    (hAddr : AddresseeInClass12112d a c)
    (hAct : RegulatedActOccurred12112d a i c) : Prohibition12112dViolated a i c :=
  ⟨⟨hAddr⟩, hAct⟩


theorem prohibition12132Violated_intro {a i c}
    (hAddr : AddresseeInClass12132 a c) (hCond : ConditionMet12132 i c)
    (hAct : RegulatedActOccurred12132 a i c) : Prohibition12132Violated a i c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition12182Violated_intro {a i c}
    (hAddr : AddresseeInClass12182 a c) (hCond : ConditionMet12182 i c)
    (hNoThreat : ¬ DirectThreat12182 i c)
    (hAct : RegulatedActOccurred12182 a i c) : Prohibition12182Violated a i c :=
  ⟨⟨hAddr, hCond, hNoThreat⟩, hAct⟩


theorem obligation12182b2Breached_intro {a i c}
    (hAddr : AddresseeInClass12182 a c) (hCond : ConditionMet12182 i c)
    (hNoExcuse : ¬ FundamentalAlteration12182b2 a i c)
    (hNoAct : ¬ ModificationProvided12182b2 a i c) :
    Obligation12182b2Breached a i c :=
  ⟨⟨hAddr, hCond, hNoExcuse⟩, hNoAct⟩


theorem prohibition12203aViolated_intro {a i c}
    (hAddr : AddresseeInClass12203a a c) (hCond : ConditionMet12203a i c)
    (hAct : RegulatedActOccurred12203a a i c) : Prohibition12203aViolated a i c :=
  ⟨⟨hAddr, hCond⟩, hAct⟩


theorem prohibition12203bViolated_intro {i c}
    (hCond : ConditionMet12203b i c)
    (hAct : RegulatedActOccurred12203b i c) : Prohibition12203bViolated i c :=
  ⟨⟨hCond⟩, hAct⟩

end Proving.USC.T42.ADA.Deontic
