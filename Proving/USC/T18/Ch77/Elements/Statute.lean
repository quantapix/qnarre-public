








import Proving.USC.T18.Ch77.Elements.Predicates
set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Elements
open Proving.USC.Common





inductive Section1581aConduct (d : Person) (c : ComplaintText) : Prop where
  | holds   (h : HoldsOrReturnsToPeonage d c)
  | arrests (h : ArrestsWithPeonageIntent d c)



structure Section1581a (d : Person) (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent d c
  conduct  : Section1581aConduct d c





inductive Section1583aConduct (d : Person) (c : ComplaintText) : Prop where
  | kidnaps   (h : KidnapsOrCarriesForSlavery d c)
  | entices   (h : EnticesToPlaceForSlavery d c)
  | obstructs (h : ObstructsChapterEnforcement d c)



structure Section1583a (d : Person) (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent d c
  conduct  : Section1583aConduct d c




inductive ForcedLaborMeans (d : Person) (c : ComplaintText) : Prop where
  | force        (h : ByForceOrPhysicalRestraint d c)
  | seriousHarm  (h : BySeriousHarmOrThreats d c)
  | legalProcess (h : ByAbuseOfLegalProcess d c)
  | scheme       (h : ByCoerciveScheme d c)



structure Section1589a (d : Person) (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent d c
  scienter : ActedWithScienter d c
  obtains  : ProvidesOrObtainsLabor d c
  means    : ForcedLaborMeans d c




structure Section1589b (d : Person) (ven : Venture) (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent d c
  benefits : KnowinglyBenefitsFromVenture d ven c
  venture  : VentureEngagedInForcedLabor ven c
  scienter : KnewOrRecklesslyDisregardedVentureMeans d c





structure Section1590a (d : Person) (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent d c
  scienter : ActedWithScienter d c
  act      : TraffickingActForLabor d c
  purpose  : ForLaborInViolationOfChapter d c




inductive Section1591Conduct (d : Person) (ven : Venture) (c : ComplaintText) : Prop where
  | direct      (h : SexTraffickingAct d c)
  | beneficiary (h : BenefitsFromSexTraffickingVenture d ven c)



inductive Section1591Predicate (d : Person) (c : ComplaintText) : Prop where
  | byMeans (h : ByForceFraudOrCoercionToCommercialSex d c)
  | minor   (h : VictimUnderEighteenForCommercialSex d c)




structure Section1591a (d : Person) (ven : Venture) (c : ComplaintText) : Prop where
  culpable     : CulpablePersonCapableOfIntent d c
  scienter     : ActedWithScienter d c
  jurisdiction : InCommerceOrSpecialJurisdiction c
  conduct      : Section1591Conduct d ven c
  predicate    : Section1591Predicate d c




inductive Section1592Purpose (d : Person) (c : ComplaintText) : Prop where
  | inCourse        (h : InCourseOfChapterViolation d c)
  | withIntent      (h : WithIntentToViolateChapter d c)
  | restrictLiberty (h : ToRestrictLibertyOfTraffickingVictim d c)




structure Section1592a (d : Person) (doc : Document) (c : ComplaintText) : Prop where
  culpable          : CulpablePersonCapableOfIntent d c
  scienter          : ActedWithScienter d c
  tampers           : TampersWithDocument d doc c
  identityDocument  : DocumentIsIdentityDocumentOfAnother doc c
  purpose           : Section1592Purpose d c
  notVictimExcepted : ¬ VictimExceptionApplies d c





structure ObstructionOffense (d : Person) (c : ComplaintText) : Prop where
  culpable  : CulpablePersonCapableOfIntent d c
  obstructs : ObstructsChapterEnforcement d c

end Proving.USC.T18.Ch77.Elements
