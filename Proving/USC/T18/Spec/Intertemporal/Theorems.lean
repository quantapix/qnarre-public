





import Proving.USC.Common.Types
import Proving.USC.T18.Spec.Intertemporal.Types
import Proving.USC.T18.Spec.Intertemporal.Predicates
import Proving.USC.T18.Spec.Intertemporal.Statute

namespace Proving.USC.T18.Spec.Intertemporal

open Proving.USC.Common (ComplaintText)



theorem inEffectForCh96_intro {c : ComplaintText}
    (hW : ActOccurredOnOrAfter ChapterWindow.fromDay c)
    (hP : ActIsPostEnactment c) :
    InEffectForCh96 c :=
  ⟨hW, hP⟩


theorem patternInTime_intro {c : ComplaintText}
    (hA : PatternActAfterEffectiveDate c) :
    PatternInTime c :=
  ⟨hA⟩


theorem ch96GovernsAct_intro {c : ComplaintText}
    (hE : InEffectForCh96 c) (hT : PatternInTime c) :
    Ch96GovernsAct c :=
  ⟨hE, hT⟩

end Proving.USC.T18.Spec.Intertemporal
