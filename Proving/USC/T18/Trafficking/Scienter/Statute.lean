













import Proving.USC.T18.Trafficking.Scienter.Predicates

namespace Proving.USC.T18.Trafficking.Scienter

open Proving.USC.Common (MentalState Person ComplaintText MentalStateProven)



def CulpableAt (required : MentalState) (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast required ∧ MentalStateProven p rung c



def Scienter1581 (p : Person) (c : ComplaintText) : Prop :=
  CulpableAt RequiredMentalState1581 p c


def Scienter1589a (p : Person) (c : ComplaintText) : Prop :=
  CulpableAt RequiredMentalState1589a p c



def Scienter1589b (p : Person) (c : ComplaintText) : Prop :=
  CulpableAt RequiredMentalState1589b p c


def Scienter1590 (p : Person) (c : ComplaintText) : Prop :=
  CulpableAt RequiredMentalState1590 p c


def Scienter1591 (p : Person) (c : ComplaintText) : Prop :=
  CulpableAt RequiredMentalState1591 p c



def Scienter1591cAge (p : Person) (c : ComplaintText) : Prop :=
  CulpableAt RequiredMentalState1591cAge p c


def Section1581Culpable (p : Person) (c : ComplaintText) : Prop := Scienter1581 p c



def Section1589Culpable (p : Person) (c : ComplaintText) : Prop :=
  Scienter1589a p c ∨ Scienter1589b p c


def Section1590Culpable (p : Person) (c : ComplaintText) : Prop := Scienter1590 p c



def Section1591Culpable (p : Person) (c : ComplaintText) : Prop := Scienter1591 p c

end Proving.USC.T18.Trafficking.Scienter
