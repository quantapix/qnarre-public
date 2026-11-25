








import Proving.USC.T18.Ch77.Reslice.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Reslice.Elements

open Proving.USC.Common (Person ComplaintText ActedWithScienter)






axiom CulpablePersonCapableOfIntent (d : Person) (c : ComplaintText) : Prop







axiom RecruitsPerson (d v : Person) (c : ComplaintText) : Prop



axiom EnticesPerson (d v : Person) (c : ComplaintText) : Prop



axiom HarborsPerson (d v : Person) (c : ComplaintText) : Prop



axiom TransportsPerson (d v : Person) (c : ComplaintText) : Prop



axiom ProvidesPerson (d v : Person) (c : ComplaintText) : Prop



axiom ObtainsPerson (d v : Person) (c : ComplaintText) : Prop





axiom AdvertisesPerson (d v : Person) (c : ComplaintText) : Prop




axiom MaintainsPerson (d v : Person) (c : ComplaintText) : Prop



axiom PatronizesPerson (d v : Person) (c : ComplaintText) : Prop



axiom SolicitsPerson (d v : Person) (c : ComplaintText) : Prop






axiom ForLaborOrServices (v : Person) (ls : LaborOrServices) (c : ComplaintText) : Prop





axiom LaborOrServicesInViolationOfChapter77 (ls : LaborOrServices) (c : ComplaintText) : Prop



axiom DeathResultedFromViolation (v : Person) (c : ComplaintText) : Prop




axiom ViolationIncludedKidnappingOrAttempt (d v : Person) (c : ComplaintText) : Prop




axiom ViolationIncludedAggravatedSexualAbuseOrAttempt (d v : Person) (c : ComplaintText) : Prop



axiom ViolationIncludedAttemptToKill (d v : Person) (c : ComplaintText) : Prop







axiom InOrAffectingInterstateOrForeignCommerce (d v : Person) (c : ComplaintText) : Prop




axiom WithinSpecialMaritimeAndTerritorialJurisdiction (d v : Person) (c : ComplaintText) : Prop







axiom ActedInRecklessDisregard (d : Person) (c : ComplaintText) : Prop





axiom HadReasonableOpportunityToObserve (d v : Person) (c : ComplaintText) : Prop





axiom MeansOfForce (d v : Person) (c : ComplaintText) : Prop



axiom ThreatsOfForce (d v : Person) (c : ComplaintText) : Prop



axiom MeansOfFraud (d v : Person) (c : ComplaintText) : Prop





axiom ThreatsOfSeriousHarmOrPhysicalRestraint (d v : Person) (c : ComplaintText) : Prop





axiom SchemePlanOrPatternInducingBeliefOfSeriousHarm (d v : Person) (c : ComplaintText) : Prop




axiom AbuseOrThreatenedAbuseOfLawOrLegalProcess (d v : Person) (c : ComplaintText) : Prop




axiom MeansWillBeUsedToCausePersonToEngage (d v : Person) (a : SexAct) (c : ComplaintText) : Prop




axiom WillBeCausedToEngageInCommercialSexAct (v : Person) (a : SexAct) (c : ComplaintText) : Prop




axiom OffenseEffectedByProhibitedMeans (d v : Person) (c : ComplaintText) : Prop





axiom IsSexAct (a : SexAct) (c : ComplaintText) : Prop




axiom AnythingOfValueGivenOrReceived (a : SexAct) (c : ComplaintText) : Prop





axiom HasTwoOrMoreIndividuals (ven : Venture) (c : ComplaintText) : Prop




axiom AssociatedInFact (ven : Venture) (c : ComplaintText) : Prop



axiom KnowinglyAssistsVenture (d : Person) (ven : Venture) (c : ComplaintText) : Prop



axiom KnowinglySupportsVenture (d : Person) (ven : Venture) (c : ComplaintText) : Prop



axiom KnowinglyFacilitatesVenture (d : Person) (ven : Venture) (c : ComplaintText) : Prop




axiom BenefitsFinanciallyOrReceivesAnythingOfValue (d : Person) (ven : Venture) (c : ComplaintText) : Prop




axiom VentureEngagedInActDescribedInParagraph1 (ven : Venture) (c : ComplaintText) : Prop







axiom ageOfPersonAtTimeOfOffense (v : Person) (c : ComplaintText) : Nat





axiom DestroysDocument (d : Person) (doc : IdentificationDocument) (c : ComplaintText) : Prop



axiom ConcealsDocument (d : Person) (doc : IdentificationDocument) (c : ComplaintText) : Prop



axiom RemovesDocument (d : Person) (doc : IdentificationDocument) (c : ComplaintText) : Prop



axiom ConfiscatesDocument (d : Person) (doc : IdentificationDocument) (c : ComplaintText) : Prop



axiom PossessesDocument (d : Person) (doc : IdentificationDocument) (c : ComplaintText) : Prop




axiom IsPassportOrImmigrationDocument (doc : IdentificationDocument) (c : ComplaintText) : Prop




axiom IsGovernmentIdentificationDocument (doc : IdentificationDocument) (c : ComplaintText) : Prop




axiom DocumentOfAnotherPerson (doc : IdentificationDocument) (v : Person) (c : ComplaintText) : Prop




axiom InTheCourseOfChapterTraffickingViolation (d : Person) (c : ComplaintText) : Prop





axiom WithIntentToViolateChapterTraffickingSection (d : Person) (c : ComplaintText) : Prop




axiom ToPreventOrRestrictLibertyToMoveOrTravel (d v : Person) (c : ComplaintText) : Prop





axiom ActedWithLawfulAuthority (d : Person) (c : ComplaintText) : Prop




axiom InOrderToMaintainLaborOrServices (d v : Person) (c : ComplaintText) : Prop





axiom IsVictimOfSevereFormOfTrafficking (v : Person) (c : ComplaintText) : Prop




axiom ConductCausedByOrIncidentToTrafficking (d : Person) (c : ComplaintText) : Prop





axiom ObstructsEnforcement (d : Person) (e : EnforcementProceeding) (c : ComplaintText) : Prop




axiom AttemptsToObstructEnforcement (d : Person) (e : EnforcementProceeding) (c : ComplaintText) : Prop




axiom InterferesWithOrPreventsEnforcement (d : Person) (e : EnforcementProceeding) (c : ComplaintText) : Prop



axiom EnforcementOfSection1590 (e : EnforcementProceeding) (c : ComplaintText) : Prop



axiom EnforcementOfSection1591 (e : EnforcementProceeding) (c : ComplaintText) : Prop



axiom EnforcementOfSection1592 (e : EnforcementProceeding) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Reslice.Elements
