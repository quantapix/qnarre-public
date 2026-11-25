












import Proving.USC.T08.Inadmissibility.Scienter.Predicates

namespace Proving.USC.T08.Inadmissibility.Scienter

open Proving.USC.Common (MentalState)




structure Scienter1324aA1A where

  addressee : Person

  required  : MentalState := RequiredMentalState1324aA1A


structure Scienter1324aA2 where
  addressee : Person
  required  : MentalState := RequiredMentalState1324aA2


structure Scienter1324aA1B where
  addressee : Person
  required  : MentalState := RequiredMentalState1324aA1B


structure Scienter1324aF1 where
  addressee : Person
  required  : MentalState := RequiredMentalState1324aF1




structure Scienter1182A6Ci where
  addressee : Person
  required  : MentalState := RequiredMentalState1182A6Ci


structure Scienter1182A6Ei where
  addressee : Person
  required  : MentalState := RequiredMentalState1182A6Ei


structure Scienter1182A2Ci where
  addressee : Person
  required  : MentalState := RequiredMentalState1182A2Ci








def Culpable (addressee : Person) (required : MentalState) (c : ComplaintText) : Prop :=
  ∃ rung : MentalState, rung.atLeast required ∧ MentalStateProven addressee rung c

def Scienter1324aA1A.culpable (s : Scienter1324aA1A) (c : ComplaintText) : Prop :=
  Culpable s.addressee s.required c

def Scienter1324aA2.culpable (s : Scienter1324aA2) (c : ComplaintText) : Prop :=
  Culpable s.addressee s.required c

def Scienter1324aA1B.culpable (s : Scienter1324aA1B) (c : ComplaintText) : Prop :=
  Culpable s.addressee s.required c

def Scienter1324aF1.culpable (s : Scienter1324aF1) (c : ComplaintText) : Prop :=
  Culpable s.addressee s.required c

def Scienter1182A6Ci.culpable (s : Scienter1182A6Ci) (c : ComplaintText) : Prop :=
  Culpable s.addressee s.required c

def Scienter1182A6Ei.culpable (s : Scienter1182A6Ei) (c : ComplaintText) : Prop :=
  Culpable s.addressee s.required c

def Scienter1182A2Ci.culpable (s : Scienter1182A2Ci) (c : ComplaintText) : Prop :=
  Culpable s.addressee s.required c

end Proving.USC.T08.Inadmissibility.Scienter
