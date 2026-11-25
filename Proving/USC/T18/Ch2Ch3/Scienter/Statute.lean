import Proving.USC.T18.Ch2Ch3.Scienter.Predicates
set_option autoImplicit false
namespace Proving.USC.T18.Ch2Ch3.Scienter

open Proving.USC.Common


















structure Scienter32 where
  actor : Person
  required : MentalState := RequiredMentalState32


def Scienter32Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState32 ∧ MentalStateProven p rung c


structure Scienter36 where
  actor : Person
  required : MentalState := RequiredMentalState36


def Scienter36Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState36 ∧ MentalStateProven p rung c


structure Scienter37 where
  actor : Person
  required : MentalState := RequiredMentalState37


def Scienter37Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState37 ∧ MentalStateProven p rung c


structure Scienter38 where
  actor : Person
  required : MentalState := RequiredMentalState38


def Scienter38Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState38 ∧ MentalStateProven p rung c


structure Scienter39Ba1 where
  actor : Person
  required : MentalState := RequiredMentalState39Ba1


def Scienter39Ba1Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState39Ba1 ∧ MentalStateProven p rung c


structure Scienter39Ba2 where
  actor : Person
  required : MentalState := RequiredMentalState39Ba2


def Scienter39Ba2Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState39Ba2 ∧ MentalStateProven p rung c


structure Scienter39Bb where
  actor : Person
  required : MentalState := RequiredMentalState39Bb


def Scienter39BbCulpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState39Bb ∧ MentalStateProven p rung c


structure Scienter40A where
  actor : Person
  required : MentalState := RequiredMentalState40A



def Scienter40ACulpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState40A ∧ MentalStateProven p rung c


structure Scienter42b where
  actor : Person
  required : MentalState := RequiredMentalState42b



def Scienter42bCulpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState42b ∧ MentalStateProven p rung c


structure Scienter42c where
  actor : Person
  required : MentalState := RequiredMentalState42c


def Scienter42cCulpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState42c ∧ MentalStateProven p rung c


structure Scienter43 where
  actor : Person
  required : MentalState := RequiredMentalState43



def Scienter43Culpable (p : Person) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast RequiredMentalState43 ∧ MentalStateProven p rung c

end Proving.USC.T18.Ch2Ch3.Scienter
