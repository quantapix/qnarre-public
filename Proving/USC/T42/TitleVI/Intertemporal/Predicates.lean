












import Proving.USC.T42.TitleVI.Intertemporal.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Intertemporal

open Proving.USC.Common





axiom ActOccurredOnOrAfter (d : Nat) (c : ComplaintText) : Prop






axiom ActIsPostEnactment (c : ComplaintText) : Prop





axiom GrantsRetroactivity (c : ComplaintText) : Prop






axiom ViolationOccursAfterAbrogationDate (c : ComplaintText) : Prop



def StatutoryWindow2000d : EffectiveWindow := ⟨0, none⟩



def StatutoryWindow2000d1 : EffectiveWindow := ⟨0, none⟩






def StatutoryWindow2000d7 : EffectiveWindow := ⟨1, none⟩

end Proving.USC.T42.TitleVI.Intertemporal
