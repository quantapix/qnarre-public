





import Proving.USC.T18.Ch3.Elements.Types
import Proving.USC.T18.Ch3.Elements.Predicates
import Proving.USC.T18.Ch3.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Ch3.Elements
open Proving.USC.Common



theorem section41_intro {p c}
    (hCulp : IsCulpablePerson p c) (hRefuge : OnProtectedRefugeLand c)
    (hAct : Section41Act c) (hNotComp : ¬ InComplianceWithRegulations c) :
    Section41 p c :=
  ⟨hCulp, hRefuge, hAct, hNotComp⟩



theorem section42_intro {p c}
    (hCulp : IsCulpablePerson p c) (hHook : FederalJurisdictionalNexus c)
    (hAct : ImportsOrShipsInjuriousSpecies c) (hInj : IsInjuriousSpecies c)
    (hNotExempt : ¬ ImportationExempt c) :
    Section42 p c :=
  ⟨hCulp, hHook, hAct, hInj, hNotExempt⟩

theorem section42c_intro {p c}
    (hCulp : IsCulpablePerson p c) (hScienter : ActedWithScienter p c)
    (hHook : FederalJurisdictionalNexus c) (hAct : TransportsUnderInhumaneConditions c) :
    Section42c p c :=
  ⟨hCulp, hScienter, hHook, hAct⟩



theorem animalEnterprise_of_commercial {e c}
    (h : IsCommercialOrAcademicAnimalEnterprise e c) : IsAnimalEnterprise e c :=
  .commercial h
theorem animalEnterprise_of_venue {e c}
    (h : IsAnimalVenueEnterprise e c) : IsAnimalEnterprise e c :=
  .venue h
theorem animalEnterprise_of_fair {e c}
    (h : IsAgriculturalFairEvent e c) : IsAnimalEnterprise e c :=
  .fair h

theorem courseOfConduct_intro {c} (n : Nat)
    (hCont : HasContinuityOfPurpose c) (hActs : NumberOfConductActs n c) (hn : 2 ≤ n) :
    CourseOfConduct c :=
  ⟨hCont, ⟨n, hActs, hn⟩⟩



example {c}
    (hCont : HasContinuityOfPurpose c) (hActs : NumberOfConductActs 3 c) :
    CourseOfConduct c :=
  ⟨hCont, ⟨3, hActs, by omega⟩⟩

theorem placesInFearByCourseOfConduct_intro {c}
    (hFear : IntentionallyPlacesInReasonableFear c) (hCourse : CourseOfConduct c) :
    PlacesInFearByCourseOfConduct c :=
  ⟨hFear, hCourse⟩

theorem section43_intro {p e c}
    (hCulp : IsCulpablePerson p c)
    (hInterstate : TravelsOrUsesInterstateCommerceFacility p c)
    (hPurpose : PurposeToDamageAnimalEnterprise p c)
    (hEnt : IsAnimalEnterprise e c) (hAct : Section43PredicateAct c)
    (hNotProt : ¬ IsProtectedExpressiveConduct c) :
    Section43 p e c :=
  ⟨hCulp, hInterstate, hPurpose, hEnt, hAct, hNotProt⟩



theorem section47_intro {p c}
    (hCulp : IsCulpablePerson p c) (hPurpose : PurposeToTakeProtectedEquine p c)
    (hEquine : IsProtectedWildEquine c) (hPublic : OnPublicLandOrRange c)
    (hAct : Section47Act c) :
    Section47 p c :=
  ⟨hCulp, hPurpose, hEquine, hPublic, hAct⟩



theorem isAnimalCrushVideo_intro {v c}
    (hDepicts : DepictsAnimalCrushing v c) (hObscene : VideoIsObscene v c) :
    IsAnimalCrushVideo v c :=
  ⟨hDepicts, hObscene⟩

theorem section48_intro {p c}
    (hCulp : IsCulpablePerson p c) (hScienter : ActedWithScienter p c)
    (hNexus : HasInterstateOrSMTJNexus c) (hAct : Section48Act c)
    (hNotExempt : ¬ Section48ExemptConduct c) :
    Section48 p c :=
  ⟨hCulp, hScienter, hNexus, hAct, hNotExempt⟩



theorem section49_intro {p c}
    (hCulp : IsCulpablePerson p c) (hHook : FederalJurisdictionalNexus c)
    (hViol : ViolatedAnimalWelfareActFightingProhibition c) :
    Section49 p c :=
  ⟨hCulp, hHook, hViol⟩

end Proving.USC.T18.Ch3.Elements
