












import Proving.USC.T42.TitleVI.Intertemporal.Types
import Proving.USC.T42.TitleVI.Intertemporal.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Intertemporal

open Proving.USC.Common



structure InEffectFor2000d (c : ComplaintText) : Prop where
  inWindow    : ActOccurredOnOrAfter StatutoryWindow2000d.fromDay c
  prospective : ActIsPostEnactment c ∨ GrantsRetroactivity c


structure InEffectFor2000d1 (c : ComplaintText) : Prop where
  inWindow    : ActOccurredOnOrAfter StatutoryWindow2000d1.fromDay c
  prospective : ActIsPostEnactment c ∨ GrantsRetroactivity c





structure InEffectFor2000d7 (c : ComplaintText) : Prop where
  inWindow         : ActOccurredOnOrAfter StatutoryWindow2000d7.fromDay c
  prospective      : ActIsPostEnactment c ∨ GrantsRetroactivity c
  afterAbrogation  : ViolationOccursAfterAbrogationDate c




def TitleVIGovernsAct (c : ComplaintText) : Prop :=
  InEffectFor2000d c ∧ InEffectFor2000d1 c ∧ InEffectFor2000d7 c

end Proving.USC.T42.TitleVI.Intertemporal
