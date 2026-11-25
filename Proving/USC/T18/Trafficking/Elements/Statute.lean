







import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Trafficking.Elements.Types
import Proving.USC.T18.Trafficking.Elements.Predicates

namespace Proving.USC.T18.Trafficking.Elements

open Proving.USC.Common




structure Section1581 (p : Person) (v : Person) (c : ComplaintText) : Prop where
  scienter  : ActedWithScienter p c
  holds     : HoldsOrReturnsToPeonage p v c
  condition : ConditionOfPeonage v c





inductive ForcedLaborMeans (p : Person) (v : Person) (c : ComplaintText) : Prop where
  | forceOrRestraint  (h : MeansForceOrRestraint p v c)
  | seriousHarm       (h : MeansSeriousHarm p v c)
  | abuseOfProcess    (h : MeansAbuseOfLegalProcess p v c)
  | coerciveScheme    (h : MeansCoerciveScheme p v c)


structure Section1589a (p : Person) (v : Person) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  obtained : ObtainedLaborOrServices p v c
  means    : ForcedLaborMeans p v c


structure Section1589b (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  scienter : ActedWithScienter p c
  benefits : BenefitsFromForcedLaborVenture p e c


inductive Section1589 (p : Person) (v : Person) (e : Entity) (c : ComplaintText) : Prop where
  | extract (h : Section1589a p v c)
  | benefit (h : Section1589b p e c)





structure Section1590 (p : Person) (v : Person) (a : TraffickingAct) (c : ComplaintText) : Prop where
  scienter   : ActedWithScienter p c
  traffics   : RecruitsHarborsTransports p v a c
  forViolation : ForChapter77Violation v c





inductive SexTraffickingRoute (p : Person) (v : Person) (c : ComplaintText) : Prop where
  | byMeans   (h : ByForceFraudOrCoercion p v c)
  | byAge      (h : VictimUnder18 v c)




structure Section1591a1 (p : Person) (v : Person) (e : Entity) (a : TraffickingAct) (c : ComplaintText) : Prop where
  scienter   : ActedWithScienter p c
  commerce   : EngagedInInterstateCommerce e c
  act        : SexTraffickingAct p v a c
  commercial : CommercialSexAct v c
  route      : SexTraffickingRoute p v c


structure Section1591a2 (p : Person) (v : Person) (e : Entity) (c : ComplaintText) : Prop where
  scienter   : ActedWithScienter p c
  benefits   : BenefitsFromSexTraffickingVenture p e c
  commercial : CommercialSexAct v c


inductive Section1591 (p : Person) (v : Person) (e : Entity) (a : TraffickingAct) (c : ComplaintText) : Prop where
  | perpetrate (h : Section1591a1 p v e a c)
  | benefit     (h : Section1591a2 p v e c)





inductive ValidTraffickingClaim
    (p : Person) (v : Person) (e : Entity) (a : TraffickingAct) (c : ComplaintText) : Prop where
  | peonage     (h : Section1581 p v c)
  | forcedLabor (h : Section1589 p v e c)
  | trafficking (h : Section1590 p v a c)
  | sexTrafficking (h : Section1591 p v e a c)

end Proving.USC.T18.Trafficking.Elements
