import Proving.USC.T18.Ch113.Reslice.Scienter.Predicates

set_option autoImplicit false














namespace Proving.USC.T18.Ch113.Reslice.Scienter

open Proving.USC.Common



structure Scienter2315 where
  addressee : Person
  required  : MentalState := RequiredMentalState2315


def Scienter2315Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState2315 ∧ MentalStateProven p rung c



structure Scienter2318 where
  addressee : Person
  required  : MentalState := RequiredMentalState2318


def Scienter2318Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState2318 ∧ MentalStateProven p rung c




structure Scienter2320a where
  addressee       : Person
  requiredTraffic : MentalState := RequiredMentalState2320aTraffic
  requiredMark    : MentalState := RequiredMentalState2320aMark



def Scienter2320aCulpable (p : Person) (c : ComplaintText) : Prop :=
  (∃ rung : MentalState, rung.atLeast RequiredMentalState2320aTraffic ∧ MentalStateProven p rung c)
  ∧ (∃ rung : MentalState, rung.atLeast RequiredMentalState2320aMark ∧ MarkKnowledgeProven p rung c)



structure Scienter2320b2 where
  addressee : Person
  required  : MentalState := RequiredMentalState2320b2



def Scienter2320b2Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState2320b2 ∧ MentalStateProven p rung c

end Proving.USC.T18.Ch113.Reslice.Scienter
