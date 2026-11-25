









import Proving.USC.T18.Ch77.Elements.Types
import Proving.USC.Common.Predicates
set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Elements
open Proving.USC.Common




axiom CulpablePersonCapableOfIntent (d : Person) (c : ComplaintText) : Prop





axiom ObstructsChapterEnforcement (d : Person) (c : ComplaintText) : Prop





axiom HoldsOrReturnsToPeonage (d : Person) (c : ComplaintText) : Prop




axiom ArrestsWithPeonageIntent (d : Person) (c : ComplaintText) : Prop





axiom KidnapsOrCarriesForSlavery (d : Person) (c : ComplaintText) : Prop





axiom EnticesToPlaceForSlavery (d : Person) (c : ComplaintText) : Prop




axiom ProvidesOrObtainsLabor (d : Person) (c : ComplaintText) : Prop




axiom ByForceOrPhysicalRestraint (d : Person) (c : ComplaintText) : Prop



axiom BySeriousHarmOrThreats (d : Person) (c : ComplaintText) : Prop




axiom ByAbuseOfLegalProcess (d : Person) (c : ComplaintText) : Prop





axiom ByCoerciveScheme (d : Person) (c : ComplaintText) : Prop




axiom KnowinglyBenefitsFromVenture (d : Person) (ven : Venture) (c : ComplaintText) : Prop




axiom VentureEngagedInForcedLabor (ven : Venture) (c : ComplaintText) : Prop




axiom KnewOrRecklesslyDisregardedVentureMeans (d : Person) (c : ComplaintText) : Prop





axiom TraffickingActForLabor (d : Person) (c : ComplaintText) : Prop



axiom ForLaborInViolationOfChapter (d : Person) (c : ComplaintText) : Prop






axiom InCommerceOrSpecialJurisdiction (c : ComplaintText) : Prop




axiom SexTraffickingAct (d : Person) (c : ComplaintText) : Prop





axiom BenefitsFromSexTraffickingVenture (d : Person) (ven : Venture) (c : ComplaintText) : Prop






axiom ByForceFraudOrCoercionToCommercialSex (d : Person) (c : ComplaintText) : Prop






axiom VictimUnderEighteenForCommercialSex (d : Person) (c : ComplaintText) : Prop





axiom TampersWithDocument (d : Person) (doc : Document) (c : ComplaintText) : Prop





axiom DocumentIsIdentityDocumentOfAnother (doc : Document) (c : ComplaintText) : Prop




axiom InCourseOfChapterViolation (d : Person) (c : ComplaintText) : Prop




axiom WithIntentToViolateChapter (d : Person) (c : ComplaintText) : Prop






axiom ToRestrictLibertyOfTraffickingVictim (d : Person) (c : ComplaintText) : Prop







axiom VictimExceptionApplies (d : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Elements
