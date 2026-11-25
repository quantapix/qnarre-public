import Proving.USC.T18.Ch73.Scienter.Types
import Proving.USC.T18.Ch73.Scienter.Predicates
import Proving.USC.Common.Types
set_option autoImplicit false













namespace Proving.USC.T18.Ch73.Scienter

open Proving.USC.Common



structure ScienterDemand where
  required : MentalState
  element  : ScienterElement
  deriving DecidableEq



def demand1503 : ScienterDemand := ⟨RequiredMentalState1503, .OffenseConduct⟩


def demand1512 : ScienterDemand := ⟨RequiredMentalState1512, .OffenseConduct⟩



def demand1512Circumstance : ScienterDemand :=
  ⟨RequiredMentalState1512Circumstance, .JurisdictionalCircumstance⟩


def demand1513 : ScienterDemand := ⟨RequiredMentalState1513, .OffenseConduct⟩



def Scienter1503 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState1503 ∧ MentalStateProven p rung c


def Scienter1512 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState1512 ∧ MentalStateProven p rung c




def Scienter1512CircumstanceCulpable : Prop := True


def Scienter1513 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState1513 ∧ MentalStateProven p rung c

end Proving.USC.T18.Ch73.Scienter
