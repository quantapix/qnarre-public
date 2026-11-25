




import Proving.USC.T18.Ch31.Elements.Predicates

namespace Proving.USC.T18.Ch31.Elements
open Proving.USC.Common





structure TakingRoute659 (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  takes    : UnlawfullyTakesOrEmbezzles p prop c
  shipment : GoodsMovingAsInterstateShipment prop c
  intent   : IntentToConvertToOwnUse p c



structure ReceivingRoute659 (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  receives : ReceivesOrPossesses p prop c
  shipment : GoodsMovingAsInterstateShipment prop c
  knows    : KnowsPropertyStolen p c


inductive Section659Conduct (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  | taking    (h : TakingRoute659 p prop c)    : Section659Conduct p prop c
  | receiving (h : ReceivingRoute659 p prop c) : Section659Conduct p prop c



structure Section659 (p : Person) (prop : Property) (c : ComplaintText) : Prop where
  conduct : Section659Conduct p prop c
  noBar   : NoStateJudgmentBar p c





structure Section664 (p : Person) (prop : Property) (plan : BenefitPlan) (c : ComplaintText) : Prop where
  embezzles : EmbezzlesOrConverts p prop c
  planAsset : IsPlanAsset prop plan c
  erisaPlan : IsERISABenefitPlan plan c
  willful   : ActsWillfully p c

end Proving.USC.T18.Ch31.Elements
