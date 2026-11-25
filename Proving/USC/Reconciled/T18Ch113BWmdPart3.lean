









































































import Proving.USC.T18.Ch113B.Wmd.Part3.Elements.Statute

set_option autoImplicit false

namespace Proving.USC.Reconciled

open Proving.USC.Common
open Proving.USC.T18.Ch113B.Wmd.Part3





abbrev IsWeaponOfMassDestruction2332a
    (w : Elements.Weapon) (c : ComplaintText) : Prop :=
  Elements.WeaponOfMassDestruction2332aC2 w c





abbrev Section2332aTargetCircumstance
    (o : Elements.Offense) (t : Elements.Target) (c : ComplaintText) : Prop :=
  Elements.Section2332aTargetCircumstance o t c



abbrev Section2332aA
    (p : Person) (w : Elements.Weapon) (ag : Agreement) (o : Elements.Offense)
    (t : Elements.Target) (c : ComplaintText) : Prop :=
  Elements.Section2332aA p w ag o t c



abbrev Section2332aB
    (p : Person) (w : Elements.Weapon) (ag : Agreement) (o : Elements.Offense)
    (c : ComplaintText) : Prop :=
  Elements.Section2332aB p w ag o c


abbrev Section2332aViolation
    (p : Person) (w : Elements.Weapon) (ag : Agreement) (o : Elements.Offense)
    (t : Elements.Target) (c : ComplaintText) : Prop :=
  Elements.Section2332aViolation p w ag o t c



abbrev Section2332aDeathAggravator
    (p : Person) (w : Elements.Weapon) (ag : Agreement) (o : Elements.Offense)
    (t : Elements.Target) (c : ComplaintText) : Prop :=
  Elements.Section2332aDeathAggravator p w ag o t c







abbrev ConductTranscendingNationalBoundaries
    (o : Elements.Offense) (c : ComplaintText) : Prop :=
  Elements.ConductTranscendingNationalBoundaries o c


abbrev Section2332bCircumstance
    (o : Elements.Offense) (c : ComplaintText) : Prop :=
  Elements.Section2332bCircumstance o c


abbrev Section2332bProhibitedConduct
    (p : Person) (v : Person) (pr : Elements.PropertyItem) (c : ComplaintText) :
    Prop :=
  Elements.Section2332bProhibitedConduct p v pr c



abbrev Section2332bA1
    (p : Person) (v : Person) (pr : Elements.PropertyItem)
    (o : Elements.Offense) (c : ComplaintText) : Prop :=
  Elements.Section2332bA1 p v pr o c




abbrev Section2332bA2
    (p : Person) (o : Elements.Offense) (c : ComplaintText) : Prop :=
  Elements.Section2332bA2 p o c


abbrev Section2332bOffense
    (p : Person) (v : Person) (pr : Elements.PropertyItem)
    (o : Elements.Offense) (c : ComplaintText) : Prop :=
  Elements.Section2332bOffense p v pr o c


abbrev Section2332bDeathAggravator
    (p : Person) (v : Person) (pr : Elements.PropertyItem)
    (o : Elements.Offense) (c : ComplaintText) : Prop :=
  Elements.Section2332bDeathAggravator p v pr o c





abbrev Section2332bJurisdictionOverParticipant
    (p : Person) (o : Elements.Offense) (c : ComplaintText) : Prop :=
  Elements.Section2332bJurisdictionOverParticipant p o c





abbrev FederalCrimeOfTerrorism
    (o : Elements.Offense) (c : ComplaintText) : Prop :=
  Elements.FederalCrimeOfTerrorism o c

end Proving.USC.Reconciled
