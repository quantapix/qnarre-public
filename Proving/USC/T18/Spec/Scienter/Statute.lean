












import Proving.USC.Common.Types
import Proving.USC.T18.Spec.Scienter.Types
import Proving.USC.T18.Spec.Scienter.Predicates

namespace Proving.USC.T18.Spec.Scienter

open Proving.USC.Common





def Reaches (p : Person) (c : ComplaintText) (required : MentalState) : Prop :=
  ∃ proven : MentalState, proven.atLeast required ∧ MentalStateProven p proven c



def Scienter1962a (p : Person) (c : ComplaintText) : Prop :=
  Reaches p c RequiredMentalState1962a


def Scienter1962b (p : Person) (c : ComplaintText) : Prop :=
  Reaches p c RequiredMentalState1962b


def Scienter1962c (p : Person) (c : ComplaintText) : Prop :=
  Reaches p c RequiredMentalState1962c


def Scienter1962d (p : Person) (c : ComplaintText) : Prop :=
  Reaches p c RequiredMentalState1962d



def Scienter1963c (p : Person) (c : ComplaintText) : Prop :=
  Reaches p c RequiredMentalState1963c



def Culpable1962a (p : Person) (c : ComplaintText) : Prop := Scienter1962a p c
def Culpable1962b (p : Person) (c : ComplaintText) : Prop := Scienter1962b p c
def Culpable1962c (p : Person) (c : ComplaintText) : Prop := Scienter1962c p c
def Culpable1962d (p : Person) (c : ComplaintText) : Prop := Scienter1962d p c
def Culpable1963c (p : Person) (c : ComplaintText) : Prop := Scienter1963c p c

end Proving.USC.T18.Spec.Scienter
