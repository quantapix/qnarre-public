








import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch113.Counterfeiting.Elements.Types
import Proving.USC.T18.Ch113.Counterfeiting.Elements.Predicates

namespace Proving.USC.T18.Ch113.Counterfeiting.Elements

open Proving.USC.Common





inductive CoveredLabel2318b (l : Label) (c : ComplaintText) : Prop where
  | counterfeitLabel (h : IsCounterfeitLabel l c)
  | illicitLabel (h : IsIllicitLabel l c)
  | counterfeitDocPackaging (h : IsCounterfeitDocumentationOrPackaging l c)


inductive Circumstance2318c (l : Label) (c : ComplaintText) : Prop where
  | maritimeOrAircraft (h : WithinMaritimeOrAircraftJurisdiction c)
  | interstateFacility (h : UsedInterstateCommerceFacility c)
  | affixedToCopyrighted (h : LabelAffixedToCopyrightedWork l c)
  | documentationCopyrighted (h : CounterfeitedDocumentationCopyrighted c)



structure Section2318Offense (p : Person) (l : Label) (w : Work) (c : ComplaintText) : Prop where
  traffics     : TrafficsInLabel p l c
  scienter     : ActedWithScienter p c
  labelKind    : CoveredLabel2318b l c
  affixed      : AffixedToCoveredWork l w c
  circumstance : Circumstance2318c l c




structure Section2318CivilClaim (p d : Person) (l : Label) (w : Work) (c : ComplaintText) : Prop where
  violation : Section2318Offense d l w c
  owner     : IsCopyrightOwner p c
  injury    : InjuredOrThreatenedByViolation p c
  causation : ProximateCause p c
  timely    : WithinLimitations p c




inductive InfringementRoute2319 (p : Person) (w : Work) (c : ComplaintText) : Prop where
  | commercialGain (h : InfringedForCommercialAdvantageOrGain p w c)
  | reproductionDistribution (h : InfringedByReproductionOrDistribution p w c)
  | preRelease (h : InfringedPreReleaseCommercialWork p w c)



structure Section2319Offense (p : Person) (w : Work) (c : ComplaintText) : Prop where
  work    : IsCopyrightedWork w c
  willful : ActedWithScienter p c
  route   : InfringementRoute2319 p w c






structure CounterfeitMark2320f (m : Mark) (g : Goods) (c : ComplaintText) : Prop where
  spurious   : IsSpuriousMark m c
  identical  : MarkIdenticalToRegistered m c
  registered : MarkAppliedToRegisteredGoods m g c
  confusion  : LikelyToCauseConfusion m c



abbrev IsCounterfeitMark (m : Mark) (g : Goods) (c : ComplaintText) : Prop :=
  CounterfeitMark2320f m g c


inductive TraffickingRoute2320a (p : Person) (m : Mark) (g : Goods) (c : ComplaintText) : Prop where
  | goods (h : KnowinglyUsesCounterfeitMarkOnGoods p m g c)
  | labels (h : TrafficsCounterfeitLabelsKnowingly p m c)
  | military (h : TrafficsCounterfeitMilitaryGood p g c)
  | drug (h : KnowinglyUsesCounterfeitMarkOnDrug p g c)




structure Section2320Offense (p : Person) (m : Mark) (g : Goods) (c : ComplaintText) : Prop where
  scienter       : ActedWithScienter p c
  traffics       : TrafficsInGoods p g c
  mark           : IsCounterfeitMark m g c
  route          : TraffickingRoute2320a p m g c
  notRepackaging : ¬ IsGenuineGoodsRepackaging p g c

end Proving.USC.T18.Ch113.Counterfeiting.Elements
