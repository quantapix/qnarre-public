




import Proving.USC.T18.Ch31.Elements.Statute

namespace Proving.USC.T18.Ch31.Elements
open Proving.USC.Common


theorem takingRoute659_intro {p prop c}
    (hTakes : UnlawfullyTakesOrEmbezzles p prop c)
    (hShip : GoodsMovingAsInterstateShipment prop c)
    (hIntent : IntentToConvertToOwnUse p c) : TakingRoute659 p prop c :=
  ⟨hTakes, hShip, hIntent⟩


theorem receivingRoute659_intro {p prop c}
    (hRecv : ReceivesOrPossesses p prop c)
    (hShip : GoodsMovingAsInterstateShipment prop c)
    (hKnows : KnowsPropertyStolen p c) : ReceivingRoute659 p prop c :=
  ⟨hRecv, hShip, hKnows⟩


theorem section659_intro {p prop c}
    (hConduct : Section659Conduct p prop c)
    (hNoBar : NoStateJudgmentBar p c) : Section659 p prop c :=
  ⟨hConduct, hNoBar⟩


theorem section664_intro {p prop plan c}
    (hEmb : EmbezzlesOrConverts p prop c)
    (hAsset : IsPlanAsset prop plan c)
    (hPlan : IsERISABenefitPlan plan c)
    (hWillful : ActsWillfully p c) : Section664 p prop plan c :=
  ⟨hEmb, hAsset, hPlan, hWillful⟩

end Proving.USC.T18.Ch31.Elements
