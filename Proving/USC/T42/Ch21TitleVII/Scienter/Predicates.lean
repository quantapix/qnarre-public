







import Proving.USC.T42.Ch21TitleVII.Scienter.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Scienter

open Proving.USC.Common













def RequiredMentalState : ScienterElement → Option MentalState

  | .disparateTreatment2000e2a                  => none
  | .retaliation2000e3a                         => none
  | .federalPersonnelAction2000e16a             => none
  | .governmentEmployeePersonnelAction2000e16b  => none
  | .killingCommissionPersonnel2000e13          => none


  | .disparateImpact2000e2k1                    => some .strictLiability
  | .scoreAdjustment2000e2l                     => some .strictLiability
  | .discriminatoryAdvertisement2000e3b         => some .strictLiability
  | .commissionDisclosure2000e5b                => some .strictLiability
  | .commissionOfficerDisclosure2000e8e         => some .strictLiability

  | .seniorityOrMeritDifferential2000e2h        => some .specific
  | .abilityTestDesign2000e2h                   => some .specific
  | .controlledSubstanceRule2000e2k3            => some .specific
  | .seniorityAdoption2000e5e2                  => some .specific
  | .remedialIntentionalPractice2000e5g1        => some .specific
  | .patternOrPractice2000e6a                   => some .specific
  | .noticePosting2000e10                       => some .specific







def MotivatingFactorGoverns : ScienterElement → Bool
  | .disparateTreatment2000e2a                  => true
  | .retaliation2000e3a                         => true
  | .federalPersonnelAction2000e16a             => true
  | .governmentEmployeePersonnelAction2000e16b  => true
  | _                                           => false









axiom ProvenMentalState (actor : Person) (elem : ScienterElement)
    (rung : MentalState) (c : ComplaintText) : Prop







axiom ProtectedTraitMotivatingFactor (actor : Person) (c : ComplaintText) : Prop







axiom SameDecisionAbsentImpermissibleFactor (actor : Person) (c : ComplaintText) : Prop







axiom GoodFaithRelianceOnCommissionInterpretation (actor : Person) (c : ComplaintText) : Prop






axiom GoodFaithRelianceOnCommissionFilingInstructions (actor : Person) (c : ComplaintText) : Prop







axiom ReasonableCauseToBelieve (enforcer : Entity) (c : ComplaintText) : Prop








axiom DiscriminatoryPurposeApparentOnFace (actor : Person) (c : ComplaintText) : Prop






axiom ActsAsAgentOf (agent principal : Person) (c : ComplaintText) : Prop








axiom ControlsForeignCorporation (employer corp : Person) (c : ComplaintText) : Prop








axiom EmployeeKnowinglyUsesControlledSubstance (individual : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21TitleVII.Scienter
