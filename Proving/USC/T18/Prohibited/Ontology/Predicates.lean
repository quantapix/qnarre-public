


























import Proving.USC.T18.Prohibited.Ontology.Types

namespace Proving.USC.T18.Prohibited.Ontology

open Proving.USC.Common






axiom IsPerson (p : Person) (c : ComplaintText) : Prop




axiom IsRacketeeringActivity (a : Act) (c : ComplaintText) : Prop




axiom IsUnlawfulDebt (d : UnlawfulDebt) (c : ComplaintText) : Prop





axiom IsRacketeeringIncome (i : Income) (c : ComplaintText) : Prop





axiom AffectsInterstateCommerce (e : Enterprise) (c : ComplaintText) : Prop





axiom HasCommonPurpose (e : Enterprise) (c : ComplaintText) : Prop




axiom HasRelationships (e : Enterprise) (c : ComplaintText) : Prop




axiom HasLongevity (e : Enterprise) (c : ComplaintText) : Prop






axiom HasTwoOrMorePredicateActs (pat : Pattern) (c : ComplaintText) : Prop




axiom ActsAreRelated (pat : Pattern) (c : ComplaintText) : Prop




axiom ActsShowContinuity (pat : Pattern) (c : ComplaintText) : Prop

end Proving.USC.T18.Prohibited.Ontology
