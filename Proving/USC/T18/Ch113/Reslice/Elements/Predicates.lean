import Proving.USC.T18.Ch113.Reslice.Elements.Types
import Proving.USC.Common.Types
set_option autoImplicit false

namespace Proving.USC.T18.Ch113.Reslice.Elements
open Proving.USC.Common









axiom IsStolenProperty (item : Property) (c : ComplaintText) : Prop


axiom MeetsValueThreshold (item : Property) (c : ComplaintText) : Prop



axiom CrossedStateOrUSBoundaryAfterTheft (item : Property) (c : ComplaintText) : Prop



axiom IsForgedSecurityOrTaxStamp (item : Property) (c : ComplaintText) : Prop



axiom MovingInInterstateOrForeignCommerce (item : Property) (c : ComplaintText) : Prop



axiom IsForgingTool (item : Property) (c : ComplaintText) : Prop


axiom IsVeteransMemorialObject (item : Property) (c : ComplaintText) : Prop



axiom Section2315Conduct (p : Person) (item : Property) (c : ComplaintText) : Prop



axiom KnewStolen (p : Person) (item : Property) (c : ComplaintText) : Prop



axiom KnewForged (p : Person) (item : Property) (c : ComplaintText) : Prop



axiom KnewFittedForForging (p : Person) (item : Property) (c : ComplaintText) : Prop









axiom TraffickingConductLabel (p : Person) (item : Label) (c : ComplaintText) : Prop


axiom ActedKnowingly (p : Person) (c : ComplaintText) : Prop



axiom IsCounterfeitLabel (item : Label) (c : ComplaintText) : Prop



axiom IsIllicitLabel (item : Label) (c : ComplaintText) : Prop





axiom LabelAssociatedWithCoveredWork (item : Label) (c : ComplaintText) : Prop



axiom IsCounterfeitDocumentationOrPackaging (item : Label) (c : ComplaintText) : Prop





axiom Section2318JurisdictionalCircumstance (item : Label) (c : ComplaintText) : Prop


axiom IsCopyrightOwner (p : Person) (c : ComplaintText) : Prop



axiom InjuredOrThreatenedByViolation (p : Person) (c : ComplaintText) : Prop



axiom WithinSection2318Limitations (p : Person) (c : ComplaintText) : Prop







axiom ActedIntentionally (p : Person) (c : ComplaintText) : Prop



axiom TraffickingConductGoods (p : Person) (item : TradeItem) (c : ComplaintText) : Prop



axiom KnowinglyUsesCounterfeitMark (p : Person) (item : TradeItem) (c : ComplaintText) : Prop



axiom KnowsCounterfeitMarkApplied (p : Person) (item : TradeItem) (c : ComplaintText) : Prop



axiom LikelyToCauseConfusion (item : TradeItem) (c : ComplaintText) : Prop


axiom IsCounterfeitMilitaryGoodOrService (item : TradeItem) (c : ComplaintText) : Prop



axiom KnowsCounterfeitMilitary (p : Person) (item : TradeItem) (c : ComplaintText) : Prop





axiom LikelyToCauseSeriousHarm (item : TradeItem) (c : ComplaintText) : Prop



axiom IsDrug (item : TradeItem) (c : ComplaintText) : Prop



axiom AttemptsOrConspiresToViolate (p : Person) (c : ComplaintText) : Prop





axiom MarkIsSpurious (mark : Mark) (c : ComplaintText) : Prop



axiom MarkUsedInTrafficking (mark : Mark) (c : ComplaintText) : Prop



axiom MarkIdenticalOrIndistinguishable (mark : Mark) (c : ComplaintText) : Prop



axiom MarkAppliedToRegisteredGoods (mark : Mark) (c : ComplaintText) : Prop



axiom MarkLikelyToCauseConfusion (mark : Mark) (c : ComplaintText) : Prop




axiom IsSpuriousLanhamDesignation (mark : Mark) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113.Reslice.Elements
