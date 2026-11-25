







import Proving.USC.Common.Types
import Proving.USC.T42.EqualRights.Sanction.Types
import Proving.USC.T42.EqualRights.Sanction.Predicates
import Proving.USC.T42.EqualRights.Sanction.Statute

namespace Proving.USC.T42.EqualRights.Sanction

open Proving.USC.Common


theorem sanction1981aA_intro {c : ComplaintText} {s : Sanction}
    (hB : RespondentSizeBracket 14 100 c) (hPu : PunitiveEligible c)
    (hP : SanctionSought s c) (hH : WithinRange s (StatutoryCap 14 100)) :
    Sanction1981a_A s c := ⟨hB, hPu, hP, hH⟩


theorem sanction1981aB_intro {c : ComplaintText} {s : Sanction}
    (hB : RespondentSizeBracket 100 200 c) (hPu : PunitiveEligible c)
    (hP : SanctionSought s c) (hH : WithinRange s (StatutoryCap 100 200)) :
    Sanction1981a_B s c := ⟨hB, hPu, hP, hH⟩


theorem sanction1981aC_intro {c : ComplaintText} {s : Sanction}
    (hB : RespondentSizeBracket 200 500 c) (hPu : PunitiveEligible c)
    (hP : SanctionSought s c) (hH : WithinRange s (StatutoryCap 200 500)) :
    Sanction1981a_C s c := ⟨hB, hPu, hP, hH⟩


theorem sanction1981aD_intro {c : ComplaintText} {s : Sanction}
    (hB : RespondentSizeBracket 500 0 c) (hPu : PunitiveEligible c)
    (hP : SanctionSought s c) (hH : WithinRange s (StatutoryCap 500 0)) :
    Sanction1981a_D s c := ⟨hB, hPu, hP, hH⟩


theorem sanction1981aCapped_introA {c : ComplaintText} {s : Sanction}
    (h : Sanction1981a_A s c) : Sanction1981aCapped s c := .bracketA h

end Proving.USC.T42.EqualRights.Sanction
