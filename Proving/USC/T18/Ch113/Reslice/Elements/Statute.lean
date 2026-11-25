import Proving.USC.T18.Ch113.Reslice.Elements.Predicates
import Proving.USC.Common.Types
set_option autoImplicit false

namespace Proving.USC.T18.Ch113.Reslice.Elements
open Proving.USC.Common







structure Section2315Stolen (p : Person) (item : Property) (c : ComplaintText) : Prop where
  stolen   : IsStolenProperty item c
  value    : MeetsValueThreshold item c
  crossed  : CrossedStateOrUSBoundaryAfterTheft item c
  conduct  : Section2315Conduct p item c
  scienter : KnewStolen p item c


structure Section2315Forged (p : Person) (item : Property) (c : ComplaintText) : Prop where
  forged   : IsForgedSecurityOrTaxStamp item c
  commerce : MovingInInterstateOrForeignCommerce item c
  conduct  : Section2315Conduct p item c
  scienter : KnewForged p item c


structure Section2315Tool (p : Person) (item : Property) (c : ComplaintText) : Prop where
  tool     : IsForgingTool item c
  commerce : MovingInInterstateOrForeignCommerce item c
  conduct  : Section2315Conduct p item c
  scienter : KnewFittedForForging p item c


structure Section2315Veterans (p : Person) (item : Property) (c : ComplaintText) : Prop where
  vetObject : IsVeteransMemorialObject item c
  crossed   : CrossedStateOrUSBoundaryAfterTheft item c
  conduct   : Section2315Conduct p item c
  scienter  : KnewStolen p item c


inductive Section2315Offense (p : Person) (item : Property) (c : ComplaintText) : Prop where
  | stolen   (h : Section2315Stolen p item c)
  | forged   (h : Section2315Forged p item c)
  | tool     (h : Section2315Tool p item c)
  | veterans (h : Section2315Veterans p item c)







inductive Section2318Object (item : Label) (c : ComplaintText) : Prop where
  | counterfeitLabel  (h : IsCounterfeitLabel item c) (assoc : LabelAssociatedWithCoveredWork item c)
  | illicitLabel      (h : IsIllicitLabel item c) (assoc : LabelAssociatedWithCoveredWork item c)
  | counterfeitDocPkg (h : IsCounterfeitDocumentationOrPackaging item c)



structure Section2318Offense (p : Person) (item : Label) (c : ComplaintText) : Prop where
  conduct      : TraffickingConductLabel p item c
  knowingly    : ActedKnowingly p c
  object       : Section2318Object item c
  jurisdiction : Section2318JurisdictionalCircumstance item c



structure Section2318CivilClaim (p : Person) (item : Label) (c : ComplaintText) : Prop where
  owner       : IsCopyrightOwner p c
  injury      : InjuredOrThreatenedByViolation p c
  violation   : Section2318Offense p item c
  limitations : WithinSection2318Limitations p c






structure CounterfeitMark1A (mark : Mark) (c : ComplaintText) : Prop where
  spurious          : MarkIsSpurious mark c
  usedInTrafficking : MarkUsedInTrafficking mark c
  identical         : MarkIdenticalOrIndistinguishable mark c
  applied           : MarkAppliedToRegisteredGoods mark c
  likelyConfusion   : MarkLikelyToCauseConfusion mark c



inductive CounterfeitMarkKind (mark : Mark) (c : ComplaintText) : Prop where
  | registeredMark    (h : CounterfeitMark1A mark c)
  | lanhamDesignation (h : IsSpuriousLanhamDesignation mark c)


abbrev IsCounterfeitMark (mark : Mark) (c : ComplaintText) : Prop := CounterfeitMarkKind mark c


structure Section2320Goods (p : Person) (item : TradeItem) (mark : Mark) (c : ComplaintText) : Prop where
  intent            : ActedIntentionally p c
  conduct           : TraffickingConductGoods p item c
  usesMark          : KnowinglyUsesCounterfeitMark p item c
  markIsCounterfeit : IsCounterfeitMark mark c



structure Section2320Labels (p : Person) (item : TradeItem) (mark : Mark) (c : ComplaintText) : Prop where
  intent            : ActedIntentionally p c
  conduct           : TraffickingConductGoods p item c
  knowsApplied      : KnowsCounterfeitMarkApplied p item c
  markIsCounterfeit : IsCounterfeitMark mark c
  confusion         : LikelyToCauseConfusion item c



structure Section2320Military (p : Person) (item : TradeItem) (c : ComplaintText) : Prop where
  intent   : ActedIntentionally p c
  conduct  : TraffickingConductGoods p item c
  military : IsCounterfeitMilitaryGoodOrService item c
  knowsMil : KnowsCounterfeitMilitary p item c
  harm     : LikelyToCauseSeriousHarm item c


structure Section2320Drug (p : Person) (item : TradeItem) (mark : Mark) (c : ComplaintText) : Prop where
  intent            : ActedIntentionally p c
  conduct           : TraffickingConductGoods p item c
  drug              : IsDrug item c
  usesMark          : KnowinglyUsesCounterfeitMark p item c
  markIsCounterfeit : IsCounterfeitMark mark c


structure Section2320Inchoate (p : Person) (c : ComplaintText) : Prop where
  intent   : ActedIntentionally p c
  attempts : AttemptsOrConspiresToViolate p c



inductive Section2320Offense (p : Person) (item : TradeItem) (mark : Mark) (c : ComplaintText) : Prop where
  | goods    (h : Section2320Goods p item mark c)
  | labels   (h : Section2320Labels p item mark c)
  | military (h : Section2320Military p item c)
  | drug     (h : Section2320Drug p item mark c)
  | inchoate (h : Section2320Inchoate p c)

end Proving.USC.T18.Ch113.Reslice.Elements
