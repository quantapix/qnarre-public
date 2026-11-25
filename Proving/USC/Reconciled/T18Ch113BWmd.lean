


































































import Proving.USC.T18.Ch113B.Wmd.Elements.Statute
import Proving.USC.T18.Ch113B.Wmd.Deontic.Statute
import Proving.USC.T18.Ch113B.Wmd.Bridge

set_option autoImplicit false

namespace Proving.USC.Reconciled

namespace T18Ch113BWmd

open Proving.USC.Common
open Proving.USC.T18.Ch113B.Wmd








abbrev Section2332aA (p v : Person) (r : Elements.Property) (w : Elements.Weapon)
    (c : ComplaintText) : Prop :=
  Elements.Section2332aA p v r w c



abbrev Section2332aB (p : Person) (w : Elements.Weapon) (c : ComplaintText) : Prop :=
  Elements.Section2332aB p w c




abbrev IsWeaponOfMassDestruction (w : Elements.Weapon) (c : ComplaintText) : Prop :=
  Elements.WeaponOfMassDestruction2332aC2 w c



abbrev Section2332aADeathResults (p v : Person) (r : Elements.Property)
    (w : Elements.Weapon) (c : ComplaintText) : Prop :=
  Elements.Section2332aADeathResults p v r w c


abbrev Section2332aBDeathResults (p : Person) (w : Elements.Weapon)
    (c : ComplaintText) : Prop :=
  Elements.Section2332aBDeathResults p w c







abbrev Section2332bA1 (p v : Person) (r : Elements.Property) (c : ComplaintText) : Prop :=
  Elements.Section2332bA1 p v r c














abbrev Section2332bA2 (p : Person) (c : ComplaintText) : Prop :=
  Elements.Section2332bA2 p c




abbrev Section2332bA2Deontic (p : Person) (cd : Deontic.Conduct) (t : Deontic.Target)
    (c : ComplaintText) : Prop :=
  Deontic.Prohibition2332bA2Violated p cd t c



abbrev ConductTranscendingNationalBoundaries (c : ComplaintText) : Prop :=
  Elements.TranscendsNationalBoundaries2332bG1 c



abbrev Circumstance2332bB1 (v : Person) (r : Elements.Property) (c : ComplaintText) : Prop :=
  Elements.Circumstance2332bB1 v r c



abbrev Jurisdiction2332bB2 (p : Person) (c : ComplaintText) : Prop :=
  Elements.Jurisdiction2332bB2 p c


abbrev Section2332bA1DeathResults (p v : Person) (r : Elements.Property)
    (c : ComplaintText) : Prop :=
  Elements.Section2332bA1DeathResults p v r c






abbrev FederalCrimeOfTerrorism (o : Elements.Offense) (c : ComplaintText) : Prop :=
  Elements.FederalCrimeOfTerrorism2332bG5 o c

end T18Ch113BWmd

end Proving.USC.Reconciled
