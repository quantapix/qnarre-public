







import Proving.USC.Common.Types
import Proving.USC.T42.TitleVIIDef.Evidentiary.Types
import Proving.USC.T42.TitleVIIDef.Evidentiary.Predicates
import Proving.USC.T42.TitleVIIDef.Evidentiary.Statute

namespace Proving.USC.T42.TitleVIIDef.Evidentiary

open Proving.USC.Common (ComplaintText)


theorem proof2000e2m_intro {c : ComplaintText}
    (h : BurdenCarried Allocation2000e2m.1 Allocation2000e2m.2.1 c) :
    Proof2000e2m c := ⟨h⟩



theorem proof2000e2k_intro {c : ComplaintText}
    (hp : BurdenCarried Allocation2000e2kPrima.1 Allocation2000e2kPrima.2.1 c)
    (hr : ¬ BurdenCarried Allocation2000e2kRebuttal.1 Allocation2000e2kRebuttal.2.1 c) :
    Proof2000e2k c := ⟨hp, hr⟩


theorem proof2000e2e_intro {c : ComplaintText}
    (h : BurdenCarried Allocation2000e2eBFOQ.1 Allocation2000e2eBFOQ.2.1 c) :
    Proof2000e2e c := ⟨h⟩


theorem proof2000e2h_intro {c : ComplaintText}
    (h : BurdenCarried Allocation2000e2hSeniorityMerit.1 Allocation2000e2hSeniorityMerit.2.1 c) :
    Proof2000e2h c := ⟨h⟩


theorem proof2000e3a_intro {c : ComplaintText}
    (h : BurdenCarried Allocation2000e3a.1 Allocation2000e3a.2.1 c) :
    Proof2000e3a c := ⟨h⟩

end Proving.USC.T42.TitleVIIDef.Evidentiary
