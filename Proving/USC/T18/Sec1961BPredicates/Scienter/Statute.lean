














import Proving.USC.T18.Sec1961BPredicates.Scienter.Predicates

namespace Proving.USC.T18.Sec1961BPredicates.Scienter

open Proving.USC.Common (Person ComplaintText)



structure Scienter2314 (p : Person) (proven : MentalState) (c : ComplaintText) : Prop where
  reaches  : proven.atLeast RequiredMentalState2314
  grounded : MentalStateProven p proven c


def Section2314Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, Scienter2314 p rung c


structure Scienter2315 (p : Person) (proven : MentalState) (c : ComplaintText) : Prop where
  reaches  : proven.atLeast RequiredMentalState2315
  grounded : MentalStateProven p proven c

def Section2315Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, Scienter2315 p rung c


structure Scienter1028 (p : Person) (proven : MentalState) (c : ComplaintText) : Prop where
  reaches  : proven.atLeast RequiredMentalState1028
  grounded : MentalStateProven p proven c

def Section1028Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, Scienter1028 p rung c


structure Scienter1029 (p : Person) (proven : MentalState) (c : ComplaintText) : Prop where
  reaches  : proven.atLeast RequiredMentalState1029
  grounded : MentalStateProven p proven c

def Section1029Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, Scienter1029 p rung c


structure Scienter1955 (p : Person) (proven : MentalState) (c : ComplaintText) : Prop where
  reaches  : proven.atLeast RequiredMentalState1955
  grounded : MentalStateProven p proven c

def Section1955Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, Scienter1955 p rung c


structure Scienter1084 (p : Person) (proven : MentalState) (c : ComplaintText) : Prop where
  reaches  : proven.atLeast RequiredMentalState1084
  grounded : MentalStateProven p proven c

def Section1084Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, Scienter1084 p rung c

end Proving.USC.T18.Sec1961BPredicates.Scienter
