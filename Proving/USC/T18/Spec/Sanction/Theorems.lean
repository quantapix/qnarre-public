








import Proving.USC.T18.Spec.Sanction.Types
import Proving.USC.T18.Spec.Sanction.Predicates
import Proving.USC.T18.Spec.Sanction.Statute

namespace Proving.USC.T18.Spec.Sanction

open Proving.USC.Common (ComplaintText)



theorem sanction1963aImprisonment_intro {c : ComplaintText} (s : Sanction)
    (hH : WithinRange s Imprisonment1963a) (hT : TriggersSection1962 c)
    (hP : SanctionSought s c) :
    Sanction1963aImprisonment s c :=
  ⟨hH, hT, hP⟩


theorem sanction1963aImprisonmentLife_intro {c : ComplaintText} (s : Sanction)
    (hH : WithinRange s ImprisonmentLife1963a) (hT : TriggersSection1962 c)
    (hL : PredicateCarriesLife c) (hP : SanctionSought s c) :
    Sanction1963aImprisonmentLife s c :=
  ⟨hH, hT, hL, hP⟩



theorem sanction1963aForfeiture_intro {c : ComplaintText}
    (hT : TriggersSection1962 c) (hR : WithinForfeitureReach c) :
    Sanction1963aForfeiture c :=
  ⟨hT, hR⟩



theorem sanction1964cTreble_intro {c : ComplaintText} (s : Sanction)
    (hH : WithinRange s Treble1964c) (hT : TriggersSection1962 c)
    (hP : SanctionSought s c) :
    Sanction1964cTreble s c :=
  ⟨hH, hT, hP⟩



theorem chapterCriminalSanction_intro {c : ComplaintText} (s : Sanction)
    (hI : Sanction1963aImprisonment s c) (hF : Sanction1963aForfeiture c) :
    ChapterCriminalSanction c :=
  .standard s hI hF

end Proving.USC.T18.Spec.Sanction
