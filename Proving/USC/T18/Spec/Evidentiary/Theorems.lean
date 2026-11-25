






import Proving.USC.Common.Types
import Proving.USC.T18.Spec.Evidentiary.Types
import Proving.USC.T18.Spec.Evidentiary.Predicates
import Proving.USC.T18.Spec.Evidentiary.Statute

namespace Proving.USC.T18.Spec.Evidentiary

open Proving.USC.Common (ComplaintText)


theorem section1964c_intro {c : ComplaintText}
    (carried : BurdenCarried Allocation1964c.1 Allocation1964c.2.1 c) :
    Section1964cEstablished c :=
  ⟨carried⟩



theorem section1964d_intro {c : ComplaintText}
    (presumed : PresumptionApplies Allocation1964d.2.2 c)
    (carried : BurdenCarried Allocation1964d.1 Allocation1964d.2.1 c) :
    Section1964dEstablished c :=
  ⟨presumed, carried⟩



theorem section1968e_intro {c : ComplaintText}
    (presumed : PresumptionApplies Allocation1968e.2.2 c)
    (notRebutted : ¬ PresumptionRebutted Allocation1968e.2.2 c) :
    Section1968eEstablished c :=
  ⟨presumed, notRebutted⟩


theorem section1963_intro {c : ComplaintText}
    (carried : BurdenCarried Allocation1963.1 Allocation1963.2.1 c) :
    Section1963Established c :=
  ⟨carried⟩

end Proving.USC.T18.Spec.Evidentiary
