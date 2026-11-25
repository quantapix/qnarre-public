








import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Trafficking.Elements.Types

namespace Proving.USC.T18.Trafficking.Elements

open Proving.USC.Common













axiom HoldsOrReturnsToPeonage (p : Person) (v : Person) (c : ComplaintText) : Prop




axiom ConditionOfPeonage (v : Person) (c : ComplaintText) : Prop






axiom ObtainedLaborOrServices (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom MeansForceOrRestraint (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom MeansSeriousHarm (p : Person) (v : Person) (c : ComplaintText) : Prop



axiom MeansAbuseOfLegalProcess (p : Person) (v : Person) (c : ComplaintText) : Prop




axiom MeansCoerciveScheme (p : Person) (v : Person) (c : ComplaintText) : Prop




axiom BenefitsFromForcedLaborVenture (p : Person) (e : Entity) (c : ComplaintText) : Prop






axiom RecruitsHarborsTransports (p : Person) (v : Person) (a : TraffickingAct) (c : ComplaintText) : Prop





axiom ForChapter77Violation (v : Person) (c : ComplaintText) : Prop






axiom SexTraffickingAct (p : Person) (v : Person) (a : TraffickingAct) (c : ComplaintText) : Prop




axiom BenefitsFromSexTraffickingVenture (p : Person) (e : Entity) (c : ComplaintText) : Prop




axiom CommercialSexAct (v : Person) (c : ComplaintText) : Prop




axiom ByForceFraudOrCoercion (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom VictimUnder18 (v : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Trafficking.Elements
