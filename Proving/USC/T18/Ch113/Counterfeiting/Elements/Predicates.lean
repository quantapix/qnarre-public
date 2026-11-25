












import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch113.Counterfeiting.Elements.Types

namespace Proving.USC.T18.Ch113.Counterfeiting.Elements

open Proving.USC.Common






axiom TrafficsInLabel (p : Person) (l : Label) (c : ComplaintText) : Prop




axiom IsCounterfeitLabel (l : Label) (c : ComplaintText) : Prop




axiom IsIllicitLabel (l : Label) (c : ComplaintText) : Prop




axiom IsCounterfeitDocumentationOrPackaging (l : Label) (c : ComplaintText) : Prop




axiom AffixedToCoveredWork (l : Label) (w : Work) (c : ComplaintText) : Prop






axiom WithinMaritimeOrAircraftJurisdiction (c : ComplaintText) : Prop




axiom UsedInterstateCommerceFacility (c : ComplaintText) : Prop




axiom LabelAffixedToCopyrightedWork (l : Label) (c : ComplaintText) : Prop



axiom CounterfeitedDocumentationCopyrighted (c : ComplaintText) : Prop





axiom IsCopyrightOwner (p : Person) (c : ComplaintText) : Prop




axiom InjuredOrThreatenedByViolation (p : Person) (c : ComplaintText) : Prop






axiom IsCopyrightedWork (w : Work) (c : ComplaintText) : Prop




axiom InfringedForCommercialAdvantageOrGain (p : Person) (w : Work) (c : ComplaintText) : Prop




axiom InfringedByReproductionOrDistribution (p : Person) (w : Work) (c : ComplaintText) : Prop





axiom InfringedPreReleaseCommercialWork (p : Person) (w : Work) (c : ComplaintText) : Prop





axiom TrafficsInGoods (p : Person) (g : Goods) (c : ComplaintText) : Prop





axiom IsSpuriousMark (m : Mark) (c : ComplaintText) : Prop




axiom MarkIdenticalToRegistered (m : Mark) (c : ComplaintText) : Prop




axiom MarkAppliedToRegisteredGoods (m : Mark) (g : Goods) (c : ComplaintText) : Prop




axiom LikelyToCauseConfusion (m : Mark) (c : ComplaintText) : Prop






axiom KnowinglyUsesCounterfeitMarkOnGoods (p : Person) (m : Mark) (g : Goods) (c : ComplaintText) : Prop




axiom TrafficsCounterfeitLabelsKnowingly (p : Person) (m : Mark) (c : ComplaintText) : Prop




axiom TrafficsCounterfeitMilitaryGood (p : Person) (g : Goods) (c : ComplaintText) : Prop




axiom KnowinglyUsesCounterfeitMarkOnDrug (p : Person) (g : Goods) (c : ComplaintText) : Prop





axiom IsGenuineGoodsRepackaging (p : Person) (g : Goods) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113.Counterfeiting.Elements
