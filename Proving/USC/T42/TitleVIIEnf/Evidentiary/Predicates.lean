












import Proving.USC.Common.Types
import Proving.USC.T42.TitleVIIEnf.Evidentiary.Types

namespace Proving.USC.T42.TitleVIIEnf.Evidentiary

open Proving.USC.Common (ComplaintText)







axiom BurdenCarried (b : Bearer) (s : Standard) (c : ComplaintText) : Prop






axiom ReasonableCauseFound (b : Bearer) (c : ComplaintText) : Prop






axiom MotivatingFactorProven (c : ComplaintText) : Prop








axiom SameDecisionShown (c : ComplaintText) : Prop







axiom UndueHardshipShown (b : Bearer) (c : ComplaintText) : Prop









axiom GoodFaithRelianceProven (c : ComplaintText) : Prop







axiom FederalSectorBurdenCarried (b : Bearer) (s : Standard) (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVIIEnf.Evidentiary
