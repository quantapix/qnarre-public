




import Proving.USC.T42.Ch21TitleVII.Scienter.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Scienter

open Proving.USC.Common








def AttributedMentalState (actor : Person) (elem : ScienterElement)
    (rung : MentalState) (c : ComplaintText) : Prop :=
  ProvenMentalState actor elem rung c
  ∨ (∃ corp : Person, ControlsForeignCorporation actor corp c
        ∧ ProvenMentalState corp elem rung c)
  ∨ (∃ agent : Person, ActsAsAgentOf agent actor c
        ∧ ProvenMentalState agent elem rung c)





def ScienterFloorStated (elem : ScienterElement) : Prop :=
  (RequiredMentalState elem).isSome = true



def ScienterSatisfied (actor : Person) (elem : ScienterElement)
    (c : ComplaintText) : Prop :=
  ∀ req : MentalState, RequiredMentalState elem = some req →
    ∃ rung : MentalState, rung.atLeast req ∧ AttributedMentalState actor elem rung c



def Culpable (actor : Person) (elem : ScienterElement) (c : ComplaintText) : Prop :=
  ScienterFloorStated elem ∧ ScienterSatisfied actor elem c








inductive ScienterEstablished (actor : Person) (elem : ScienterElement)
    (c : ComplaintText) : Prop
  | byRungProof (rung req : MentalState)
      (hreq : RequiredMentalState elem = some req)
      (hreach : rung.atLeast req)
      (hproven : AttributedMentalState actor elem rung c)
  | byMotivatingFactor
      (hsilent : RequiredMentalState elem = none)
      (hgov : MotivatingFactorGoverns elem = true)
      (hmf : ProtectedTraitMotivatingFactor actor c)





def Culpable2000e2h (actor : Person) (c : ComplaintText) : Prop :=
  Culpable actor .seniorityOrMeritDifferential2000e2h c



def CulpableAbilityTest2000e2h (actor : Person) (c : ComplaintText) : Prop :=
  Culpable actor .abilityTestDesign2000e2h c



def Culpable2000e2k3 (actor : Person) (c : ComplaintText) : Prop :=
  Culpable actor .controlledSubstanceRule2000e2k3 c


def Culpable2000e2k1 (actor : Person) (c : ComplaintText) : Prop :=
  Culpable actor .disparateImpact2000e2k1 c


def Culpable2000e2l (actor : Person) (c : ComplaintText) : Prop :=
  Culpable actor .scoreAdjustment2000e2l c


def Culpable2000e3b (actor : Person) (c : ComplaintText) : Prop :=
  Culpable actor .discriminatoryAdvertisement2000e3b c



def Culpable2000e5e2 (actor : Person) (c : ComplaintText) : Prop :=
  Culpable actor .seniorityAdoption2000e5e2 c




def Culpable2000e5g1 (actor : Person) (c : ComplaintText) : Prop :=
  Culpable actor .remedialIntentionalPractice2000e5g1 c


def Culpable2000e5b (actor : Person) (c : ComplaintText) : Prop :=
  Culpable actor .commissionDisclosure2000e5b c



def Culpable2000e8e (actor : Person) (c : ComplaintText) : Prop :=
  Culpable actor .commissionOfficerDisclosure2000e8e c


def Culpable2000e6a (actor : Person) (c : ComplaintText) : Prop :=
  Culpable actor .patternOrPractice2000e6a c


def Culpable2000e10b (actor : Person) (c : ComplaintText) : Prop :=
  Culpable actor .noticePosting2000e10 c






def MotivatingFactorEstablished2000e2m (actor : Person) (c : ComplaintText) : Prop :=
  ProtectedTraitMotivatingFactor actor c



def MixedMotiveReliefLimited2000e5g2B (actor : Person) (c : ComplaintText) : Prop :=
  ProtectedTraitMotivatingFactor actor c ∧ SameDecisionAbsentImpermissibleFactor actor c




def GoodFaithBar2000e12b (actor : Person) (c : ComplaintText) : Prop :=
  GoodFaithRelianceOnCommissionInterpretation actor c
  ∨ GoodFaithRelianceOnCommissionFilingInstructions actor c


def EnforcerReasonableCause (enforcer : Entity) (c : ComplaintText) : Prop :=
  ReasonableCauseToBelieve enforcer c

end Proving.USC.T42.Ch21TitleVII.Scienter
