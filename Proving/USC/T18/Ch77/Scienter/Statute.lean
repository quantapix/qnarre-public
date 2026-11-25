import Proving.USC.T18.Ch77.Scienter.Types
import Proving.USC.T18.Ch77.Scienter.Predicates
import Proving.USC.Common.Types
set_option autoImplicit false



































namespace Proving.USC.T18.Ch77.Scienter

open Proving.USC.Common



def ScienterCulpable (required : MentalState) (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast required ∧ MentalStateProven p rung c




structure ScienterDemand (addressee : Person) where
  required : MentalState





def RequiredMentalState1581 : MentalState := .Specific
def scienter1581Demand (p : Person) : ScienterDemand p := ⟨RequiredMentalState1581⟩


def Scienter1581Culpable (p : Person) (c : ComplaintText) : Prop :=
  ScienterCulpable RequiredMentalState1581 p c





def RequiredMentalState1583 : MentalState := .Specific
def scienter1583Demand (p : Person) : ScienterDemand p := ⟨RequiredMentalState1583⟩
def Scienter1583Culpable (p : Person) (c : ComplaintText) : Prop :=
  ScienterCulpable RequiredMentalState1583 p c




def RequiredMentalState1589 : MentalState := .Knowledge



def RequiredMentalState1589Venture : MentalState := .Recklessness
def scienter1589Demand (p : Person) : ScienterDemand p := ⟨RequiredMentalState1589⟩
def Scienter1589Culpable (p : Person) (c : ComplaintText) : Prop :=
  ScienterCulpable RequiredMentalState1589 p c

def Scienter1589VentureCulpable (p : Person) (c : ComplaintText) : Prop :=
  ScienterCulpable RequiredMentalState1589Venture p c




def RequiredMentalState1590 : MentalState := .Knowledge
def scienter1590Demand (p : Person) : ScienterDemand p := ⟨RequiredMentalState1590⟩
def Scienter1590Culpable (p : Person) (c : ComplaintText) : Prop :=
  ScienterCulpable RequiredMentalState1590 p c




def RequiredMentalState1591 : MentalState := .Knowledge


def RequiredMentalState1591Fact : MentalState := .Recklessness
def scienter1591Demand (p : Person) : ScienterDemand p := ⟨RequiredMentalState1591⟩
def Scienter1591Culpable (p : Person) (c : ComplaintText) : Prop :=
  ScienterCulpable RequiredMentalState1591 p c

def Scienter1591FactCulpable (p : Person) (c : ComplaintText) : Prop :=
  ScienterCulpable RequiredMentalState1591Fact p c





def Scienter1591AgeCulpable (p : Person) (c : ComplaintText) : Prop :=
  HadReasonableOpportunityToObserve p c ∨
    ScienterCulpable RequiredMentalState1591Fact p c





def RequiredMentalState1592 : MentalState := .Knowledge


def RequiredMentalState1592Purpose : MentalState := .Specific
def scienter1592Demand (p : Person) : ScienterDemand p := ⟨RequiredMentalState1592⟩
def Scienter1592Culpable (p : Person) (c : ComplaintText) : Prop :=
  ScienterCulpable RequiredMentalState1592 p c

def Scienter1592PurposeCulpable (p : Person) (c : ComplaintText) : Prop :=
  ScienterCulpable RequiredMentalState1592Purpose p c

end Proving.USC.T18.Ch77.Scienter
