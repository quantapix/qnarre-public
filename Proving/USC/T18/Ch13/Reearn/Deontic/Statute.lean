











import Proving.USC.T18.Ch13.Reearn.Deontic.Types
import Proving.USC.T18.Ch13.Reearn.Deontic.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reearn.Deontic

open Proving.USC.Common






structure Prohibition245a1 (pr : Prosecution) (c : ComplaintText) : Prop where
  addressee : AddresseeIsUnitedStatesProsecutor245a1 pr c
  uncertified : ¬ CertificationRequirementSatisfied245a1 pr c



def ProhibitionViolated245a1 (pr : Prosecution) (c : ComplaintText) : Prop :=
  Prohibition245a1 pr c ∧ RegulatedActOccurred245a1 pr c






structure Power245a2 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsFederalInvestigator245a2 p c
  act : InvestigationOfSuspectedViolation245a2 p c





inductive ConditionMet245b (v : Person) (a : ProtectedActivity) (c : ComplaintText) : Prop where


  | federalNexus (h : FederalElectoralOrBenefitNexus245b1 v a c) : ConditionMet245b v a c


  | protectedStatus (h : RacialOrReligiousStatusNexus245b2 v a c) : ConditionMet245b v a c


  | riotCommerce (h : RiotOrCivilDisorderCommerceNexus245b3 v a c) : ConditionMet245b v a c


  | participation (h : NondiscriminatoryParticipationNexus245b4 v a c) : ConditionMet245b v a c


  | citizenEncouragement (h : CitizenEncouragementNexus245b5 v a c) : ConditionMet245b v a c




structure Prohibition245b (p : Person) (v : Person) (a : ProtectedActivity)
    (c : ComplaintText) : Prop where
  addressee : AddresseeInClass245b p c
  condition : ConditionMet245b v a c





def ProhibitionViolated245b (p : Person) (v : Person) (a : ProtectedActivity)
    (c : ComplaintText) : Prop :=
  Prohibition245b p v a c ∧ RegulatedActOccurred245b p v c ∧
    ¬ LawEnforcementDutyExemption245c p c ∧
    ¬ SmallLodgingProprietorExemption245b p a c






inductive RegulatedAct247a (p : Person) (v : Person) (rp : ReligiousProperty)
    (c : ComplaintText) : Prop where


  | propertyDamage (h : RegulatedActOccurred247a1 p rp c) : RegulatedAct247a p v rp c


  | freeExerciseObstruction (h : RegulatedActOccurred247a2 p v c) : RegulatedAct247a p v rp c



structure Prohibition247a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass247a p c
  condition : InterstateOrForeignCommerceCircumstance247b c



def ProhibitionViolated247a (p : Person) (v : Person) (rp : ReligiousProperty)
    (c : ComplaintText) : Prop :=
  Prohibition247a p c ∧ RegulatedAct247a p v rp c






structure Prohibition247c (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass247c p c



def ProhibitionViolated247c (p : Person) (rp : ReligiousProperty)
    (c : ComplaintText) : Prop :=
  Prohibition247c p c ∧ RegulatedActOccurred247c p rp c





structure Prohibition247e (pr : Prosecution) (c : ComplaintText) : Prop where
  addressee : AddresseeIsUnitedStatesProsecutor247e pr c
  uncertified : ¬ CertificationRequirementSatisfied247e pr c



def ProhibitionViolated247e (pr : Prosecution) (c : ComplaintText) : Prop :=
  Prohibition247e pr c ∧ RegulatedActOccurred247e pr c





structure Prohibition247g (pr : Prosecution) (c : ComplaintText) : Prop where
  untimely : ¬ ChargedWithinSevenYears247g pr c



def ProhibitionViolated247g (pr : Prosecution) (c : ComplaintText) : Prop :=
  Prohibition247g pr c ∧ NoncapitalProsecutionUndertaken247g pr c




inductive RegulatedAct248a (p : Person) (v : Person) (f : Facility)
    (c : ComplaintText) : Prop where


  | reproductiveHealth (h : ReproductiveHealthServicesInterference248a1 p v c) :
      RegulatedAct248a p v f c


  | religiousExercise (h : ReligiousExerciseInterference248a2 p v c) :
      RegulatedAct248a p v f c


  | propertyDamage (h : ProtectedPropertyDamage248a3 p f c) : RegulatedAct248a p v f c


structure Prohibition248a (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass248a p c





def ProhibitionViolated248a (p : Person) (v : Person) (f : Facility)
    (c : ComplaintText) : Prop :=
  Prohibition248a p c ∧ RegulatedAct248a p v f c ∧
    ¬ ParentalGuardianExemption248a p v c ∧
    ¬ FirstAmendmentProtectedExpressiveConduct248d1 p c






structure Permission248c1 (v : Person) (c : ComplaintText) : Prop where
  aggrieved : AggrievedByProhibitedConduct248c1 v c
  standing : StandingLimitationSatisfied248c1 v c




def PermissionExercised248c1 (v : Person) (ca : CivilAction) (c : ComplaintText) : Prop :=
  Permission248c1 v c ∧ CivilActionCommenced248c1 v ca c



structure Power248c1b (ca : CivilAction) (c : ComplaintText) : Prop where
  addressee : AdjudicatingCourtInAction248c1b ca c
  act : ReliefAwardAuthorized248c1b ca c




structure Power248c2 (c : ComplaintText) : Prop where
  condition : AttorneyGeneralReasonableCause248c2 c



def PowerExercised248c2 (ca : CivilAction) (c : ComplaintText) : Prop :=
  Power248c2 c ∧ UnitedStatesCivilActionCommenced248c2 ca c



structure Power248c3 (c : ComplaintText) : Prop where
  condition : StateAttorneyGeneralReasonableCause248c3 c



def PowerExercised248c3 (ca : CivilAction) (c : ComplaintText) : Prop :=
  Power248c3 c ∧ StateParensPatriaeActionCommenced248c3 ca c

end Proving.USC.T18.Ch13.Reearn.Deontic
