






import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Trafficking.Elements.Types
import Proving.USC.T18.Trafficking.Elements.Predicates
import Proving.USC.T18.Trafficking.Elements.Statute

namespace Proving.USC.T18.Trafficking.Elements

open Proving.USC.Common


theorem section1581_intro {p v c}
    (hScien : ActedWithScienter p c) (hHolds : HoldsOrReturnsToPeonage p v c)
    (hCond : ConditionOfPeonage v c) : Section1581 p v c :=
  ⟨hScien, hHolds, hCond⟩


theorem section1589a_intro {p v c}
    (hScien : ActedWithScienter p c) (hObt : ObtainedLaborOrServices p v c)
    (hMeans : ForcedLaborMeans p v c) : Section1589a p v c :=
  ⟨hScien, hObt, hMeans⟩


theorem section1589b_intro {p e c}
    (hScien : ActedWithScienter p c) (hBen : BenefitsFromForcedLaborVenture p e c) :
    Section1589b p e c :=
  ⟨hScien, hBen⟩


theorem section1590_intro {p v a c}
    (hScien : ActedWithScienter p c) (hTraf : RecruitsHarborsTransports p v a c)
    (hFor : ForChapter77Violation v c) : Section1590 p v a c :=
  ⟨hScien, hTraf, hFor⟩


theorem section1591a1_intro {p v e a c}
    (hScien : ActedWithScienter p c) (hCom : EngagedInInterstateCommerce e c)
    (hAct : SexTraffickingAct p v a c) (hCsa : CommercialSexAct v c)
    (hRoute : SexTraffickingRoute p v c) : Section1591a1 p v e a c :=
  ⟨hScien, hCom, hAct, hCsa, hRoute⟩


theorem section1591a2_intro {p v e c}
    (hScien : ActedWithScienter p c) (hBen : BenefitsFromSexTraffickingVenture p e c)
    (hCsa : CommercialSexAct v c) : Section1591a2 p v e c :=
  ⟨hScien, hBen, hCsa⟩

end Proving.USC.T18.Trafficking.Elements
