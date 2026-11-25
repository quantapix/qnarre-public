










import Proving.USC.T42.EqualRights.Scienter.Types
import Proving.USC.T42.EqualRights.Scienter.Predicates

namespace Proving.USC.T42.EqualRights.Scienter

open Proving.USC.Common




structure ReachesRequired (p : Person) (required : MentalState)
    (c : ComplaintText) (proven : MentalState) : Prop where
  reaches  : proven.atLeast required
  grounded : MentalStateProven p proven c


def Scienter1981 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung, ReachesRequired p RequiredMentalState1981 c rung


def Scienter1981a_a (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung, ReachesRequired p RequiredMentalState1981a_a c rung



def Scienter1981a_b (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung, ReachesRequired p RequiredMentalState1981a_b c rung


def Scienter1982 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung, ReachesRequired p RequiredMentalState1982 c rung


def Culpable1981 (p : Person) (c : ComplaintText) : Prop := Scienter1981 p c


def Culpable1981a_a (p : Person) (c : ComplaintText) : Prop := Scienter1981a_a p c


def Culpable1981a_b (p : Person) (c : ComplaintText) : Prop := Scienter1981a_b p c


def Culpable1982 (p : Person) (c : ComplaintText) : Prop := Scienter1982 p c

end Proving.USC.T42.EqualRights.Scienter
