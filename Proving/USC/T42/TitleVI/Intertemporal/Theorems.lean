






import Proving.USC.T42.TitleVI.Intertemporal.Types
import Proving.USC.T42.TitleVI.Intertemporal.Predicates
import Proving.USC.T42.TitleVI.Intertemporal.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVI.Intertemporal

open Proving.USC.Common

theorem inEffectFor2000d_intro {c}
    (hW : ActOccurredOnOrAfter StatutoryWindow2000d.fromDay c)
    (hP : ActIsPostEnactment c ∨ GrantsRetroactivity c) :
    InEffectFor2000d c := ⟨hW, hP⟩

theorem inEffectFor2000d1_intro {c}
    (hW : ActOccurredOnOrAfter StatutoryWindow2000d1.fromDay c)
    (hP : ActIsPostEnactment c ∨ GrantsRetroactivity c) :
    InEffectFor2000d1 c := ⟨hW, hP⟩

theorem inEffectFor2000d7_intro {c}
    (hW : ActOccurredOnOrAfter StatutoryWindow2000d7.fromDay c)
    (hP : ActIsPostEnactment c ∨ GrantsRetroactivity c)
    (hA : ViolationOccursAfterAbrogationDate c) :
    InEffectFor2000d7 c := ⟨hW, hP, hA⟩

theorem titleVIGovernsAct_intro {c}
    (h0 : InEffectFor2000d c) (h1 : InEffectFor2000d1 c) (h7 : InEffectFor2000d7 c) :
    TitleVIGovernsAct c := ⟨h0, h1, h7⟩

end Proving.USC.T42.TitleVI.Intertemporal
