









import Proving.USC.Common.Types
import Proving.USC.T42.EqualRights.Intertemporal.Types
import Proving.USC.T42.EqualRights.Intertemporal.Predicates

namespace Proving.USC.T42.EqualRights.Intertemporal

open Proving.USC.Common


structure InEffectFor1981 (c : ComplaintText) : Prop where
  inWindow    : ActOccurredOnOrAfter (StatutoryWindow .s1981).fromDay c
  beforeSunset : ActWithinSunset (StatutoryWindow .s1981).untilDay c
  prospective : ActIsPostEnactment c




structure InEffectFor1981bc (c : ComplaintText) : Prop where
  inWindow    : ActOccurredOnOrAfter (StatutoryWindow .s1981bc).fromDay c
  beforeSunset : ActWithinSunset (StatutoryWindow .s1981bc).untilDay c
  prospective : ActIsPostEnactment c



structure InEffectFor1981a (c : ComplaintText) : Prop where
  inWindow    : ActOccurredOnOrAfter (StatutoryWindow .s1981a).fromDay c
  beforeSunset : ActWithinSunset (StatutoryWindow .s1981a).untilDay c
  prospective : ActIsPostEnactment c


structure InEffectFor1982 (c : ComplaintText) : Prop where
  inWindow    : ActOccurredOnOrAfter (StatutoryWindow .s1982).fromDay c
  beforeSunset : ActWithinSunset (StatutoryWindow .s1982).untilDay c
  prospective : ActIsPostEnactment c



def EqualRightsGovernsAct (c : ComplaintText) : Prop :=
  InEffectFor1981 c ∧ InEffectFor1981bc c ∧ InEffectFor1981a c ∧ InEffectFor1982 c

end Proving.USC.T42.EqualRights.Intertemporal
