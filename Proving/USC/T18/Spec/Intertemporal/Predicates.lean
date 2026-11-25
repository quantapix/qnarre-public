









import Proving.USC.Common.Types
import Proving.USC.T18.Spec.Intertemporal.Types

namespace Proving.USC.T18.Spec.Intertemporal

open Proving.USC.Common (ComplaintText)





def ChapterWindow : EffectiveWindow := ⟨0, none⟩



axiom ActOccurredOnOrAfter (d : Nat) (c : ComplaintText) : Prop




axiom ActIsPostEnactment (c : ComplaintText) : Prop






axiom PatternActAfterEffectiveDate (c : ComplaintText) : Prop

end Proving.USC.T18.Spec.Intertemporal
