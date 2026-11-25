














import Proving.USC.Common.Types
import Proving.USC.T42.SchoolDesegregation.Deontic.Types
import Proving.USC.T42.SchoolDesegregation.Deontic.Predicates

namespace Proving.USC.T42.SchoolDesegregation.Deontic

open Proving.USC.Common






structure Power2000c6 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAttorneyGeneral p c
  complaint : SignedWrittenComplaintReceived c
  satisfied : AGSatisfiedMeritAndInability c



def Power2000c6Exercised (p : Person) (c : ComplaintText) : Prop :=
  Power2000c6 p c ∧ AGInstitutedCivilAction p c






structure Permission2000c6b (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAttorneyGeneral p c
  inability : InabilityConditionMet c



def Permission2000c6bExercised (p : Person) (c : ComplaintText) : Prop :=
  Permission2000c6b p c ∧ AGDeemedSignersUnable p c





structure Permission2000c8 (p : Person) (c : ComplaintText) : Prop where
  addressee : AddresseeIsAnyPerson p c
  subject   : DiscriminationInPublicEducation c




def Permission2000c8Exercised (p : Person) (c : ComplaintText) : Prop :=
  Permission2000c8 p c ∧ PersonSuesForRelief p c

end Proving.USC.T42.SchoolDesegregation.Deontic
