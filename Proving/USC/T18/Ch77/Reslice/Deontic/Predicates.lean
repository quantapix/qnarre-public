










import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Reslice.Deontic.Types

set_option autoImplicit false

open Proving.USC.Common (Person ComplaintText)

namespace Proving.USC.T18.Ch77.Reslice.Deontic










axiom AddresseeWhoever (p : Person) (c : ComplaintText) : Prop





axiom AddresseeGovernment (c : ComplaintText) : Prop








axiom ActedKnowingly1590a (p : Person) (c : ComplaintText) : Prop






axiom TraffickingActOccurred1590a (p : Person) (v : Person) (c : ComplaintText) : Prop







axiom LaborOrServicesInViolationOfChapter1590a (v : Person) (c : ComplaintText) : Prop







axiom AggravatingResultOccurred1590a (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom ObstructedEnforcement1590b (p : Person) (c : ComplaintText) : Prop







axiom AffectsInterstateOrForeignCommerce (p : Person) (c : ComplaintText) : Prop





axiom WithinSpecialMaritimeAndTerritorialJurisdiction (p : Person) (c : ComplaintText) : Prop





axiom ActedKnowingly1591a (p : Person) (c : ComplaintText) : Prop






axiom RecruitmentActOccurred1591a1 (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom BenefitedFromVenture1591a2 (p : Person) (ven : Venture) (c : ComplaintText) : Prop





axiom VentureEngagedInProhibitedAct1591a2 (ven : Venture) (v : Person) (c : ComplaintText) : Prop









axiom KnewProscribedMeansOrMinority1591a (p : Person) (v : Person) (c : ComplaintText) : Prop







axiom RecklesslyDisregardedProscribedMeansOrMinority1591a
    (p : Person) (v : Person) (c : ComplaintText) : Prop







axiom ActConstitutingViolationIsAdvertising1591a (p : Person) (c : ComplaintText) : Prop






axiom EffectedByProscribedMeans1591b1 (p : Person) (v : Person) (c : ComplaintText) : Prop







axiom VictimUnderFourteen1591b1 (v : Person) (c : ComplaintText) : Prop






axiom VictimAtLeastFourteenUnderEighteen1591b2 (v : Person) (c : ComplaintText) : Prop




axiom ProsecutionUnderSubsection1591a1 (p : Person) (c : ComplaintText) : Prop







axiom ReasonableOpportunityToObserve1591c (p : Person) (v : Person) (c : ComplaintText) : Prop







axiom OmitsProofOfAgeKnowledge1591c (c : ComplaintText) : Prop





axiom ObstructedEnforcement1591d (p : Person) (c : ComplaintText) : Prop










axiom IsAbuseOrThreatenedAbuseOfLegalProcess1591e1
    (p : Person) (v : Person) (c : ComplaintText) : Prop








axiom IsCoercion1591e2 (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom IsCommercialSexAct1591e3 (v : Person) (c : ComplaintText) : Prop





axiom IsParticipationInVenture1591e4 (p : Person) (ven : Venture) (c : ComplaintText) : Prop








axiom IsSeriousHarm1591e5 (v : Person) (c : ComplaintText) : Prop





axiom IsVenture1591e6 (ven : Venture) (c : ComplaintText) : Prop







axiom ActedKnowingly1592a (p : Person) (c : ComplaintText) : Prop





axiom DocumentActOccurred1592a
    (p : Person) (d : Document) (v : Person) (c : ComplaintText) : Prop







axiom IsCoveredDocument1592a (d : Document) (v : Person) (c : ComplaintText) : Prop






axiom InCourseOfChapterViolation1592a1 (p : Person) (c : ComplaintText) : Prop







axiom IntentToViolateChapter1592a2 (p : Person) (c : ComplaintText) : Prop







axiom PurposeToPreventOrRestrictLiberty1592a3
    (p : Person) (v : Person) (c : ComplaintText) : Prop







axiom IsSevereFormTraffickingVictim (v : Person) (c : ComplaintText) : Prop





axiom ConductCausedByOrIncidentToTrafficking1592b (p : Person) (c : ComplaintText) : Prop





axiom ObstructedEnforcement1592c (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Reslice.Deontic
