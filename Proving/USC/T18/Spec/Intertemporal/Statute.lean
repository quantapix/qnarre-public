








import Proving.USC.Common.Types
import Proving.USC.T18.Spec.Intertemporal.Types
import Proving.USC.T18.Spec.Intertemporal.Predicates

namespace Proving.USC.T18.Spec.Intertemporal

open Proving.USC.Common (ComplaintText)




structure InEffectForCh96 (c : ComplaintText) : Prop where
  inWindow    : ActOccurredOnOrAfter ChapterWindow.fromDay c
  prospective : ActIsPostEnactment c



structure PatternInTime (c : ComplaintText) : Prop where
  afterEffective : PatternActAfterEffectiveDate c



def Ch96GovernsAct (c : ComplaintText) : Prop :=
  InEffectForCh96 c ∧ PatternInTime c

end Proving.USC.T18.Spec.Intertemporal
