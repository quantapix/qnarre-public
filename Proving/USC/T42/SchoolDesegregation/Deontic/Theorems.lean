









import Proving.USC.Common.Types
import Proving.USC.T42.SchoolDesegregation.Deontic.Types
import Proving.USC.T42.SchoolDesegregation.Deontic.Predicates
import Proving.USC.T42.SchoolDesegregation.Deontic.Statute

namespace Proving.USC.T42.SchoolDesegregation.Deontic

open Proving.USC.Common




theorem power2000c6Exercised_intro {p c}
    (hAddr : AddresseeIsAttorneyGeneral p c)
    (hCompl : SignedWrittenComplaintReceived c)
    (hSat : AGSatisfiedMeritAndInability c)
    (hAct : AGInstitutedCivilAction p c) :
    Power2000c6Exercised p c :=
  ⟨⟨hAddr, hCompl, hSat⟩, hAct⟩



theorem permission2000c6bExercised_intro {p c}
    (hAddr : AddresseeIsAttorneyGeneral p c)
    (hInab : InabilityConditionMet c)
    (hAct : AGDeemedSignersUnable p c) :
    Permission2000c6bExercised p c :=
  ⟨⟨hAddr, hInab⟩, hAct⟩



theorem permission2000c8Exercised_intro {p c}
    (hAddr : AddresseeIsAnyPerson p c)
    (hSubj : DiscriminationInPublicEducation c)
    (hAct : PersonSuesForRelief p c) :
    Permission2000c8Exercised p c :=
  ⟨⟨hAddr, hSubj⟩, hAct⟩

end Proving.USC.T42.SchoolDesegregation.Deontic
