






import Proving.USC.Common.Types
import Proving.USC.T42.TitleVIIEnf.Evidentiary.Types
import Proving.USC.T42.TitleVIIEnf.Evidentiary.Predicates
import Proving.USC.T42.TitleVIIEnf.Evidentiary.Statute

namespace Proving.USC.T42.TitleVIIEnf.Evidentiary

open Proving.USC.Common (ComplaintText)


theorem proof2000e5b_intro {c : ComplaintText}
    (h : ReasonableCauseFound alloc2000e5b.bearer c) : Proof2000e5b c :=
  ⟨h⟩


theorem proof2000e5g1_intro {c : ComplaintText}
    (h : BurdenCarried alloc2000e5g1.bearer alloc2000e5g1.standard c) :
    Proof2000e5g1 c :=
  ⟨h⟩


theorem proof2000e5g2B_intro {c : ComplaintText}
    (h : MotivatingFactorProven c) : Proof2000e5g2B c :=
  ⟨h⟩


theorem proof2000e6a_intro {c : ComplaintText}
    (h : ReasonableCauseFound alloc2000e6a.bearer c) : Proof2000e6a c :=
  ⟨h⟩


theorem proof2000e8c_intro {c : ComplaintText}
    (h : UndueHardshipShown alloc2000e8c.bearer c) : Proof2000e8c c :=
  ⟨h⟩


theorem proof2000e12b_intro {c : ComplaintText}
    (h : GoodFaithRelianceProven c) : Proof2000e12b c :=
  ⟨h⟩


theorem proof2000e16d_intro {c : ComplaintText}
    (h : FederalSectorBurdenCarried alloc2000e16d.bearer alloc2000e16d.standard c) :
    Proof2000e16d c :=
  ⟨h⟩




theorem section2000e5g1Established_intro {c : ComplaintText}
    (h : Proof2000e5g1 c) : Section2000e5g1Established c :=
  h



theorem section2000e5g2BFullRelief_intro {c : ComplaintText}
    (hp : Proof2000e5g2B c) (hs : ¬ SameDecisionShown c) :
    Section2000e5g2BFullRelief c :=
  ⟨hp, hs⟩



theorem section2000e5g2BLimitedRelief_intro {c : ComplaintText}
    (hp : Proof2000e5g2B c) (hs : SameDecisionShown c) :
    Section2000e5g2BLimitedRelief c :=
  ⟨hp, hs⟩


theorem section2000e12bBars_intro {c : ComplaintText}
    (h : Proof2000e12b c) : Section2000e12bBars c :=
  h


theorem privateMeritsEstablished_intro {c : ComplaintText}
    (hm : Section2000e5g1Established c) (hb : ¬ Section2000e12bBars c) :
    PrivateMeritsEstablished c :=
  ⟨hm, hb⟩


theorem federalSectorMeritsEstablished_intro {c : ComplaintText}
    (hp : Proof2000e16d c) (hb : ¬ Section2000e12bBars c) :
    FederalSectorMeritsEstablished c :=
  ⟨hp, hb⟩

end Proving.USC.T42.TitleVIIEnf.Evidentiary
