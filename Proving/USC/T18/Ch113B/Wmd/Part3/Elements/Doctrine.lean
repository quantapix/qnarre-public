









import Proving.USC.Common.Tactic
import Proving.USC.T18.Ch113B.Wmd.Part3.Elements.Statute

set_option autoImplicit false

open Proving.USC.Common

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Elements

@[grind →] theorem wmd_of_destructiveDevice
    {w : Weapon} {c : ComplaintText} (h : IsDestructiveDevice w c) :
    WeaponOfMassDestruction2332aC2 w c := .destructiveDevice h

@[grind →] theorem wmd_of_chemical
    {w : Weapon} {c : ComplaintText} (h : IsChemicalWeapon w c) :
    WeaponOfMassDestruction2332aC2 w c := .chemical h

@[grind →] theorem wmd_of_biological
    {w : Weapon} {c : ComplaintText} (h : IsBiologicalWeapon w c) :
    WeaponOfMassDestruction2332aC2 w c := .biological h

@[grind →] theorem wmd_of_radiological
    {w : Weapon} {c : ComplaintText} (h : IsRadiologicalWeapon w c) :
    WeaponOfMassDestruction2332aC2 w c := .radiological h

@[grind →] theorem transcending_of_situs
    {o : Offense} {c : ComplaintText}
    (h1 : ConductOccurredWithinUnitedStates o c)
    (h2 : ConductOccurredOutsideUnitedStates o c) :
    ConductTranscendingNationalBoundaries o c := ⟨h1, h2⟩



example {w : Weapon} {c : ComplaintText} (h : IsChemicalWeapon w c) :
    IsWeaponOfMassDestruction w c := by prove_element

example {w : Weapon} {c : ComplaintText} (h : IsRadiologicalWeapon w c) :
    IsWeaponOfMassDestruction w c := by prove_element


example {o : Offense} {c : ComplaintText}
    (h1 : ConductOccurredWithinUnitedStates o c)
    (h2 : ConductOccurredOutsideUnitedStates o c) :
    ConductTranscendingNationalBoundaries o c := by prove_element

end Proving.USC.T18.Ch113B.Wmd.Part3.Elements
