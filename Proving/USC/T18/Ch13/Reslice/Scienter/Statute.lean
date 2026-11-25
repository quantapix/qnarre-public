





import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch13.Reslice.Scienter.Types
import Proving.USC.T18.Ch13.Reslice.Scienter.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reslice.Scienter

open Proving.USC.Common





structure ScienterDemand where

  addressee : Person

  required : MentalState









def ScienterDemand.MetBy (d : ScienterDemand) (c : ComplaintText) : Prop :=
  match d.required with
  | .StrictLiability => True
  | r => ∃ rung : MentalState, rung.atLeast r ∧ MentalStateProven d.addressee rung c



def AnimusWithin (p : Person) (classes : List ProtectedClass) (c : ComplaintText) : Prop :=
  ∃ cls : ProtectedClass, cls ∈ classes ∧ MotivatedByProtectedCharacteristic p cls c




def demand245b (p : Person) : ScienterDemand := ⟨p, RequiredMentalState245b⟩

def demand245b1 (p : Person) : ScienterDemand := ⟨p, RequiredMentalState245b1⟩

def demand245b2 (p : Person) : ScienterDemand := ⟨p, RequiredMentalState245b2⟩

def demand245b3 (p : Person) : ScienterDemand := ⟨p, RequiredMentalState245b3⟩

def demand245b4 (p : Person) : ScienterDemand := ⟨p, RequiredMentalState245b4⟩

def demand245b5 (p : Person) : ScienterDemand := ⟨p, RequiredMentalState245b5⟩

def demand245bAggravated (p : Person) : ScienterDemand := ⟨p, RequiredMentalState245bAggravated⟩

def demand247a1 (p : Person) : ScienterDemand := ⟨p, RequiredMentalState247a1⟩

def demand247a2 (p : Person) : ScienterDemand := ⟨p, RequiredMentalState247a2⟩

def demand247b (p : Person) : ScienterDemand := ⟨p, RequiredMentalState247b⟩

def demand247c (p : Person) : ScienterDemand := ⟨p, RequiredMentalState247c⟩

def demand247d (p : Person) : ScienterDemand := ⟨p, RequiredMentalState247d⟩

def demand248a1 (p : Person) : ScienterDemand := ⟨p, RequiredMentalState248a1⟩

def demand248a2 (p : Person) : ScienterDemand := ⟨p, RequiredMentalState248a2⟩

def demand248a3 (p : Person) : ScienterDemand := ⟨p, RequiredMentalState248a3⟩

def demand248b (p : Person) : ScienterDemand := ⟨p, RequiredMentalState248b⟩

def demand248c2 (ag : Person) : ScienterDemand := ⟨ag, RequiredMentalState248c2⟩

def demand248c3 (ag : Person) : ScienterDemand := ⟨ag, RequiredMentalState248c3⟩




def Scienter245b (p : Person) (c : ComplaintText) : Prop :=
  (demand245b p).MetBy c




structure Scienter245b1 (p : Person) (c : ComplaintText) : Prop where

  willful : Scienter245b p c

  aim : ActedBecauseOf p .protectedFederalActivity c
      ∨ ActedInOrderToIntimidateFrom p .protectedFederalActivity c





structure Scienter245b2 (p : Person) (c : ComplaintText) : Prop where

  willful : Scienter245b p c

  animus : AnimusWithin p classes245b2 c

  becauseOfActivity : ActedBecauseOf p .protectedStateOrPrivateActivity c





structure Scienter245b3 (p : Person) (c : ComplaintText) : Prop where

  willful : Scienter245b p c

  circumstance : (demand245b3 p).MetBy c



structure Scienter245b4 (p : Person) (c : ComplaintText) : Prop where

  willful : Scienter245b p c

  aim : ActedBecauseOf p .nondiscriminatoryParticipation c
      ∨ ActedInOrderToIntimidateFrom p .nondiscriminatoryParticipation c




structure Scienter245b5 (p : Person) (c : ComplaintText) : Prop where

  willful : Scienter245b p c

  aim : ActedBecauseOf p .aidingOrEncouragingParticipation c
      ∨ ActedInOrderToIntimidateFrom p .aidingOrEncouragingParticipation c





def Scienter245bAggravated (p : Person) (c : ComplaintText) : Prop :=
  (demand245bAggravated p).MetBy c







def Scienter245aCertification (official : Person) (c : ComplaintText) : Prop :=
  CertifyingOfficialJudgment official c


inductive Scienter245Theory (p : Person) (c : ComplaintText) : Prop

  | federallyProtectedActivity : Scienter245b1 p c → Scienter245Theory p c

  | protectedActivityWithAnimus : Scienter245b2 p c → Scienter245Theory p c

  | riotOrCivilDisorder : Scienter245b3 p c → Scienter245Theory p c

  | nondiscriminatoryParticipation : Scienter245b4 p c → Scienter245Theory p c

  | aidingOrEncouragingParticipation : Scienter245b5 p c → Scienter245Theory p c



def Scienter245Culpable (p : Person) (c : ComplaintText) : Prop :=
  Scienter245Theory p c






def Scienter247b (p : Person) (c : ComplaintText) : Prop :=
  (demand247b p).MetBy c




structure Scienter247a1 (p : Person) (c : ComplaintText) : Prop where

  intentional : (demand247a1 p).MetBy c

  becauseOfReligiousCharacter : ActedBecauseOf p .religiousCharacterOfProperty c

  commerceCircumstance : Scienter247b p c





structure Scienter247a2 (p : Person) (c : ComplaintText) : Prop where

  intentional : (demand247a2 p).MetBy c

  objectOfIntent : IntendedResult p .freeExerciseOfReligion c

  commerceCircumstance : Scienter247b p c





structure Scienter247c (p : Person) (c : ComplaintText) : Prop where

  intentional : (demand247c p).MetBy c

  animus : AnimusWithin p classes247c c



def Scienter247dGrading (p : Person) (c : ComplaintText) : Prop :=
  (demand247d p).MetBy c




def Scienter247eCertification (official : Person) (c : ComplaintText) : Prop :=
  CertifyingOfficialJudgment official c


inductive Scienter247Theory (p : Person) (c : ComplaintText) : Prop

  | damageBecauseOfReligiousCharacter : Scienter247a1 p c → Scienter247Theory p c

  | obstructionOfFreeExercise : Scienter247a2 p c → Scienter247Theory p c

  | damageBecauseOfRaceColorOrEthnicity : Scienter247c p c → Scienter247Theory p c



def Scienter247Culpable (p : Person) (c : ComplaintText) : Prop :=
  Scienter247Theory p c







structure Scienter248a1 (p : Person) (c : ComplaintText) : Prop where

  intentional : (demand248a1 p).MetBy c

  aim : ActedBecauseOf p .reproductiveHealthServices c
      ∨ ActedInOrderToIntimidateFrom p .reproductiveHealthServices c




structure Scienter248a2 (p : Person) (c : ComplaintText) : Prop where

  intentional : (demand248a2 p).MetBy c

  objectOfIntent : IntendedResult p .freeExerciseOfReligion c



inductive Scienter248a3 (p : Person) (c : ComplaintText) : Prop


  | facilityBecauseOfServices :
      (demand248a3 p).MetBy c →
      ActedBecauseOf p .reproductiveHealthServices c →
      Scienter248a3 p c


  | placeOfReligiousWorship :
      (demand248a3 p).MetBy c →
      IntendedResult p .placeOfReligiousWorship c →
      Scienter248a3 p c




def Scienter248bGrading (p : Person) (c : ComplaintText) : Prop :=
  (demand248b p).MetBy c





def Scienter248c2Enforcement (ag : Person) (c : ComplaintText) : Prop :=
  (demand248c2 ag).MetBy c



def Scienter248c3Enforcement (ag : Person) (c : ComplaintText) : Prop :=
  (demand248c3 ag).MetBy c


inductive Scienter248Theory (p : Person) (c : ComplaintText) : Prop

  | reproductiveHealthAccess : Scienter248a1 p c → Scienter248Theory p c

  | religiousFreedomExercise : Scienter248a2 p c → Scienter248Theory p c

  | propertyOfFacilityOrWorshipPlace : Scienter248a3 p c → Scienter248Theory p c



def Scienter248Culpable (p : Person) (c : ComplaintText) : Prop :=
  Scienter248Theory p c





inductive Ch13ScienterEstablished (p : Person) (c : ComplaintText) : Prop

  | federallyProtectedActivities : Scienter245Culpable p c → Ch13ScienterEstablished p c

  | religiousProperty : Scienter247Culpable p c → Ch13ScienterEstablished p c

  | clinicAccess : Scienter248Culpable p c → Ch13ScienterEstablished p c

end Proving.USC.T18.Ch13.Reslice.Scienter
