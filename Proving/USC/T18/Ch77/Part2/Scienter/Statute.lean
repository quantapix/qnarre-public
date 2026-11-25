







import Proving.USC.T18.Ch77.Part2.Scienter.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part2.Scienter

open Proving.USC.Common








def ScienterAtLeast (p : Person) (t : ScienterTarget) (req : MentalState)
    (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast req ∧ MentalStateProven p t rung c




noncomputable def posture1591 (p : Person) (c : ComplaintText) : ChargingPosture :=
  { underSubsectionA1 := chargedUnderSubsection1591a1 p c
    actIsAdvertising := actConstitutingViolationIsAdvertising1591 p c
    reasonableOpportunityToObserve := reasonableOpportunityToObserve1591c p c }




def Scienter1591a1 (p : Person) (c : ComplaintText) : Prop :=
  ScienterAtLeast p .traffickingAct RequiredMentalState1591a1 c


def Scienter1591a2 (p : Person) (c : ComplaintText) : Prop :=
  ScienterAtLeast p .benefitFromVenture RequiredMentalState1591a2 c



def Scienter1591e4 (p : Person) (c : ComplaintText) : Prop :=
  ScienterAtLeast p .participationInVenture RequiredMentalState1591e4 c




def Scienter1591aMeans (p : Person) (posture : ChargingPosture)
    (c : ComplaintText) : Prop :=
  ScienterAtLeast p .meansOfCompulsion (RequiredMentalState1591aMeans posture) c


def Scienter1591aAge (p : Person) (posture : ChargingPosture)
    (c : ComplaintText) : Prop :=
  ScienterAtLeast p .victimMinority (RequiredMentalState1591aAge posture) c



def Scienter1591e2B (p : Person) (c : ComplaintText) : Prop :=
  ScienterAtLeast p .coercionScheme RequiredMentalState1591e2B c



def Scienter1591e1 (p : Person) (c : ComplaintText) : Prop :=
  ScienterAtLeast p .abuseOfLegalProcess RequiredMentalState1591e1 c





def Scienter1591d (p : Person) (req : MentalState) (c : ComplaintText) : Prop :=
  ScienterAtLeast p .obstruction req c





inductive Scienter1591aCircumstance (p : Person) (posture : ChargingPosture)
    (c : ComplaintText) : Prop where
  | byMeansOfCompulsion (h : Scienter1591aMeans p posture c)
  | byVictimMinority (h : Scienter1591aAge p posture c)





inductive Scienter1591CoercionIntent (p : Person) (c : ComplaintText) : Prop where
  | viaSchemeIntendedToCauseBelief (h : Scienter1591e2B p c)
  | viaAbuseOfLegalProcess (h : Scienter1591e1 p c)



structure Scienter1591a1Culpable (p : Person) (posture : ChargingPosture)
    (c : ComplaintText) : Prop where
  knowingAct : Scienter1591a1 p c
  circumstance : Scienter1591aCircumstance p posture c



structure Scienter1591a2Culpable (p : Person) (posture : ChargingPosture)
    (c : ComplaintText) : Prop where
  knowingBenefit : Scienter1591a2 p c
  knowingParticipation : Scienter1591e4 p c
  circumstance : Scienter1591aCircumstance p posture c


inductive Scienter1591Culpable (p : Person) (posture : ChargingPosture)
    (c : ComplaintText) : Prop where
  | viaSubsectionA1 (h : Scienter1591a1Culpable p posture c)
  | viaSubsectionA2 (h : Scienter1591a2Culpable p posture c)



def Scienter1591 (p : Person) (c : ComplaintText) : Prop :=
  Scienter1591Culpable p (posture1591 p c) c

end Proving.USC.T18.Ch77.Part2.Scienter
