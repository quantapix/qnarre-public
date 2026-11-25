


























import Proving.USC.Common.Types
import Proving.USC.T08.Scienter.Types
import Proving.USC.T08.Scienter.Predicates

namespace Proving.USC.T08.Scienter

open Proving.USC.Common (MentalState)






def RequiredMentalState1324_a1Ai : MentalState := .Knowledge





def RequiredMentalState1324_transportHarborEncourage : MentalState := .Recklessness




def RequiredMentalState1324_financialGain : MentalState := .Specific




def RequiredMentalState1324_a2 : MentalState := .Recklessness




def RequiredMentalState1324_a3 : MentalState := .Knowledge



def RequiredMentalState1327 : MentalState := .Knowledge



def RequiredMentalState1328 : MentalState := .Specific












def Scienter1324_a1Ai (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState1324_a1Ai ∧ MentalStateProven p rung c



def Scienter1324_transportHarborEncourage (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState,
    rung.atLeast RequiredMentalState1324_transportHarborEncourage ∧ MentalStateProven p rung c


def Scienter1324_financialGain (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState,
    rung.atLeast RequiredMentalState1324_financialGain ∧ MentalStateProven p rung c


def Scienter1324_a2 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState1324_a2 ∧ MentalStateProven p rung c


def Scienter1324_a3 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState1324_a3 ∧ MentalStateProven p rung c


def Scienter1327 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState1327 ∧ MentalStateProven p rung c


def Scienter1328 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState1328 ∧ MentalStateProven p rung c

end Proving.USC.T08.Scienter
