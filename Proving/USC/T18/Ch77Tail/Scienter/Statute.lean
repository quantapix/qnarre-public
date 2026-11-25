









import Proving.USC.T18.Ch77Tail.Scienter.Predicates

namespace Proving.USC.T18.Ch77Tail.Scienter

open Proving.USC.Common



structure Scienter1582 (p : Person) (c : ComplaintText) where
  proven   : MentalState
  reaches  : proven.atLeast RequiredMentalState1582
  grounded : MentalStateProven p proven c



def Culpable1582 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState1582 ∧ MentalStateProven p rung c



structure Scienter1585 (p : Person) (c : ComplaintText) where
  proven   : MentalState
  reaches  : proven.atLeast RequiredMentalState1585
  grounded : MentalStateProven p proven c

def Culpable1585 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState1585 ∧ MentalStateProven p rung c



structure Scienter1586 (p : Person) (c : ComplaintText) where
  proven   : MentalState
  reaches  : proven.atLeast RequiredMentalState1586
  grounded : MentalStateProven p proven c

def Culpable1586 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState1586 ∧ MentalStateProven p rung c



structure Scienter1587 (p : Person) (c : ComplaintText) where
  proven   : MentalState
  reaches  : proven.atLeast RequiredMentalState1587
  grounded : MentalStateProven p proven c

def Culpable1587 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState1587 ∧ MentalStateProven p rung c



structure Scienter1588 (p : Person) (c : ComplaintText) where
  proven   : MentalState
  reaches  : proven.atLeast RequiredMentalState1588
  grounded : MentalStateProven p proven c

def Culpable1588 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState1588 ∧ MentalStateProven p rung c



structure Scienter1592 (p : Person) (c : ComplaintText) where
  proven   : MentalState
  reaches  : proven.atLeast RequiredMentalState1592
  grounded : MentalStateProven p proven c

def Culpable1592 (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState1592 ∧ MentalStateProven p rung c

end Proving.USC.T18.Ch77Tail.Scienter
