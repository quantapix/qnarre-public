













import Proving.USC.T18.Ch113B.Wmd.Elements.Statute
import Proving.USC.Common.Tactic

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Elements

open Proving.USC.Common



@[grind →] theorem wmd_of_destructiveDevice {w : Weapon} {c : ComplaintText}
    (h : IsDestructiveDevice921 w c) : WeaponOfMassDestruction2332aC2 w c :=
  .destructiveDevice h

@[grind →] theorem wmd_of_chemical {w : Weapon} {c : ComplaintText}
    (h : IsToxicChemicalWeapon w c) : WeaponOfMassDestruction2332aC2 w c :=
  .chemical h

@[grind →] theorem wmd_of_biological {w : Weapon} {c : ComplaintText}
    (h : IsBiologicalWeapon w c) : WeaponOfMassDestruction2332aC2 w c :=
  .biological h

@[grind →] theorem wmd_of_radiological {w : Weapon} {c : ComplaintText}
    (h : IsRadiologicalWeapon w c) : WeaponOfMassDestruction2332aC2 w c :=
  .radiological h

example {w : Weapon} {c : ComplaintText} (h : IsDestructiveDevice921 w c) :
    IsWeaponOfMassDestruction w c := by prove_element

example {w : Weapon} {c : ComplaintText} (h : IsBiologicalWeapon w c) :
    IsWeaponOfMassDestruction w c := by prove_element



@[grind →] theorem transcendsNationalBoundaries2332bG1_of_prongs {c : ComplaintText}
    (hIn : ConductOccursWithinTheUnitedStates c)
    (hOut : ConductOccursOutsideTheUnitedStates c) :
    TranscendsNationalBoundaries2332bG1 c :=
  ⟨hIn, hOut⟩

example {c : ComplaintText}
    (hIn : ConductOccursWithinTheUnitedStates c)
    (hOut : ConductOccursOutsideTheUnitedStates c) :
    ConductTranscendingNationalBoundaries c := by prove_element



@[grind →] theorem federalCrimeOfTerrorism2332bG5_of_prongs {o : Offense} {c : ComplaintText}
    (hMotive : CalculatedToInfluenceOrRetaliateAgainstGovernment o c)
    (hEnum : ViolatesEnumeratedTerrorismOffense o c) :
    FederalCrimeOfTerrorism2332bG5 o c :=
  ⟨hMotive, hEnum⟩

example {o : Offense} {c : ComplaintText}
    (hMotive : CalculatedToInfluenceOrRetaliateAgainstGovernment o c)
    (hEnum : ViolatesEnumeratedTerrorismOffense o c) :
    FederalCrimeOfTerrorism o c := by prove_element

end Proving.USC.T18.Ch113B.Wmd.Elements
