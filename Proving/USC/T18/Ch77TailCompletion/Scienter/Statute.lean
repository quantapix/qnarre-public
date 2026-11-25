












import Proving.USC.T18.Ch77TailCompletion.Scienter.Predicates

namespace Proving.USC.T18.Ch77TailCompletion.Scienter

open Proving.USC.Common




def Scienter (o : Ch77Offense) (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast (RequiredMentalState o) ∧ MentalStateProven p rung c


abbrev Culpable1583 (p : Person) (c : ComplaintText) : Prop := Scienter .s1583 p c

abbrev Culpable1584 (p : Person) (c : ComplaintText) : Prop := Scienter .s1584 p c

abbrev Culpable1593A (p : Person) (c : ComplaintText) : Prop := Scienter .s1593A p c

abbrev Culpable1594 (p : Person) (c : ComplaintText) : Prop := Scienter .s1594 p c

abbrev Culpable1595 (p : Person) (c : ComplaintText) : Prop := Scienter .s1595 p c

abbrev Culpable1597 (p : Person) (c : ComplaintText) : Prop := Scienter .s1597 p c

end Proving.USC.T18.Ch77TailCompletion.Scienter
