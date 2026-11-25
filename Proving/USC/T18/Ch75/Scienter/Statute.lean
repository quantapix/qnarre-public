














import Proving.USC.Common.Types
import Proving.USC.T18.Ch75.Scienter.Types
import Proving.USC.T18.Ch75.Scienter.Predicates

namespace Proving.USC.T18.Ch75.Scienter

open Proving.USC.Common (Person ComplaintText MentalState)



structure ScienterDemand (off : Ch75Offense) where
  addressee : Person
  required  : MentalState := RequiredMentalState off



def Culpable (off : Ch75Offense) (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast (RequiredMentalState off) ∧ MentalStateProven p rung c





def Scienter1542 (p : Person) (c : ComplaintText) : Prop := Culpable .s1542 p c


def Scienter1543 (p : Person) (c : ComplaintText) : Prop := Culpable .s1543 p c


def Scienter1544 (p : Person) (c : ComplaintText) : Prop := Culpable .s1544 p c


def Scienter1546a (p : Person) (c : ComplaintText) : Prop := Culpable .s1546a p c


def Scienter1546b (p : Person) (c : ComplaintText) : Prop := Culpable .s1546b p c

end Proving.USC.T18.Ch75.Scienter
