









import Proving.USC.T18.Ch77.Reslice.Elements.Types
import Proving.USC.T18.Ch77.Reslice.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Reslice.Elements

open Proving.USC.Common (Person ComplaintText ActedWithScienter)






inductive TraffickingActus1590a (d v : Person) (c : ComplaintText) : Prop where
  | recruits (h : RecruitsPerson d v c)
  | harbors (h : HarborsPerson d v c)
  | transports (h : TransportsPerson d v c)
  | provides (h : ProvidesPerson d v c)
  | obtains (h : ObtainsPerson d v c)



structure Section1590a (d v : Person) (ls : LaborOrServices) (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent d c
  scienter : ActedWithScienter d c
  actus : TraffickingActus1590a d v c
  purpose : ForLaborOrServices v ls c
  chapterViolation : LaborOrServicesInViolationOfChapter77 ls c



inductive Aggravator1590a (d v : Person) (c : ComplaintText) : Prop where
  | deathResults (h : DeathResultedFromViolation v c)
  | kidnapping (h : ViolationIncludedKidnappingOrAttempt d v c)
  | aggravatedSexualAbuse (h : ViolationIncludedAggravatedSexualAbuseOrAttempt d v c)
  | attemptToKill (h : ViolationIncludedAttemptToKill d v c)



structure AggravatedSection1590a (d v : Person) (ls : LaborOrServices)
    (c : ComplaintText) : Prop where
  base : Section1590a d v ls c
  aggravator : Aggravator1590a d v c









inductive ObstructionActus (d : Person) (e : EnforcementProceeding)
    (c : ComplaintText) : Prop where
  | obstructs (h : ObstructsEnforcement d e c)
  | attempts (h : AttemptsToObstructEnforcement d e c)
  | interferes (h : InterferesWithOrPreventsEnforcement d e c)


structure Section1590b (d : Person) (e : EnforcementProceeding)
    (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent d c
  targetSection : EnforcementOfSection1590 e c
  actus : ObstructionActus d e c


structure Section1591d (d : Person) (e : EnforcementProceeding)
    (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent d c
  targetSection : EnforcementOfSection1591 e c
  actus : ObstructionActus d e c


structure Section1592c (d : Person) (e : EnforcementProceeding)
    (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent d c
  targetSection : EnforcementOfSection1592 e c
  actus : ObstructionActus d e c





inductive JurisdictionalNexus1591a1 (d v : Person) (c : ComplaintText) : Prop where
  | commerce (h : InOrAffectingInterstateOrForeignCommerce d v c)
  | maritime (h : WithinSpecialMaritimeAndTerritorialJurisdiction d v c)




inductive TraffickingActus1591a1 (d v : Person) (c : ComplaintText) : Prop where
  | recruits (h : RecruitsPerson d v c)
  | entices (h : EnticesPerson d v c)
  | harbors (h : HarborsPerson d v c)
  | transports (h : TransportsPerson d v c)
  | provides (h : ProvidesPerson d v c)
  | obtains (h : ObtainsPerson d v c)
  | advertises (h : AdvertisesPerson d v c)
  | maintains (h : MaintainsPerson d v c)
  | patronizes (h : PatronizesPerson d v c)
  | solicits (h : SolicitsPerson d v c)



structure CommercialSexAct1591e3 (a : SexAct) (c : ComplaintText) : Prop where
  sexAct : IsSexAct a c
  valueExchanged : AnythingOfValueGivenOrReceived a c


abbrev IsCommercialSexAct (a : SexAct) (c : ComplaintText) : Prop :=
  CommercialSexAct1591e3 a c


inductive Coercion1591e2 (d v : Person) (c : ComplaintText) : Prop where
  | seriousHarmOrRestraint (h : ThreatsOfSeriousHarmOrPhysicalRestraint d v c)
  | schemePlanOrPattern (h : SchemePlanOrPatternInducingBeliefOfSeriousHarm d v c)
  | abuseOfLegalProcess (h : AbuseOrThreatenedAbuseOfLawOrLegalProcess d v c)


abbrev Coercion (d v : Person) (c : ComplaintText) : Prop := Coercion1591e2 d v c




inductive ProhibitedMeans1591 (d v : Person) (c : ComplaintText) : Prop where
  | force (h : MeansOfForce d v c)
  | threatsOfForce (h : ThreatsOfForce d v c)
  | fraud (h : MeansOfFraud d v c)
  | coercion (h : Coercion d v c)



structure MeansRoute1591 (d v : Person) (a : SexAct) (c : ComplaintText) : Prop where
  means : ProhibitedMeans1591 d v c
  commercialSexAct : IsCommercialSexAct a c
  causation : MeansWillBeUsedToCausePersonToEngage d v a c




structure MinorityRoute1591 (v : Person) (a : SexAct) (c : ComplaintText) : Prop where
  underEighteen : ageOfPersonAtTimeOfOffense v c < 18
  commercialSexAct : IsCommercialSexAct a c
  willBeCaused : WillBeCausedToEngageInCommercialSexAct v a c






inductive MensLevel1591a (d v : Person) (c : ComplaintText) : Prop where
  | knowing (h : ActedWithScienter d c)
  | recklessDisregard (h : ActedInRecklessDisregard d c)
      (hNotAdvertising : ¬ AdvertisesPerson d v c)


inductive MensRea1591a (d v : Person) (a : SexAct) (c : ComplaintText) : Prop where
  | means (level : MensLevel1591a d v c) (route : MeansRoute1591 d v a c)
  | minority (level : MensLevel1591a d v c) (route : MinorityRoute1591 v a c)





inductive MensRea1591a1 (d v : Person) (a : SexAct) (c : ComplaintText) : Prop where
  | proved (h : MensRea1591a d v a c)
  | minorityObserved (h : HadReasonableOpportunityToObserve d v c)
      (route : MinorityRoute1591 v a c)


structure Section1591a1 (d v : Person) (a : SexAct) (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent d c
  jurisdiction : JurisdictionalNexus1591a1 d v c
  actus : TraffickingActus1591a1 d v c
  mens : MensRea1591a1 d v a c



structure Venture1591e6 (ven : Venture) (c : ComplaintText) : Prop where
  twoOrMore : HasTwoOrMoreIndividuals ven c
  associated : AssociatedInFact ven c


abbrev IsVenture (ven : Venture) (c : ComplaintText) : Prop := Venture1591e6 ven c



inductive ParticipationInVenture1591e4 (d : Person) (ven : Venture)
    (c : ComplaintText) : Prop where
  | assists (h : KnowinglyAssistsVenture d ven c)
  | supports (h : KnowinglySupportsVenture d ven c)
  | facilitates (h : KnowinglyFacilitatesVenture d ven c)


abbrev ParticipatesInVenture (d : Person) (ven : Venture) (c : ComplaintText) : Prop :=
  ParticipationInVenture1591e4 d ven c



structure Section1591a2 (d v : Person) (a : SexAct) (ven : Venture)
    (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent d c
  venture : IsVenture ven c
  participation : ParticipatesInVenture d ven c
  benefit : BenefitsFinanciallyOrReceivesAnythingOfValue d ven c
  ventureAct : VentureEngagedInActDescribedInParagraph1 ven c
  mens : MensRea1591a d v a c


inductive Section1591a (d v : Person) (a : SexAct) (ven : Venture)
    (c : ComplaintText) : Prop where
  | conductRoute (h : Section1591a1 d v a c)
  | benefitRoute (h : Section1591a2 d v a ven c)



inductive Punishment1591b1 (d v : Person) (c : ComplaintText) : Prop where
  | byProhibitedMeans (h : OffenseEffectedByProhibitedMeans d v c)
  | underFourteen (h : ageOfPersonAtTimeOfOffense v c < 14)



structure Punishment1591b2 (d v : Person) (c : ComplaintText) : Prop where
  notByProhibitedMeans : ¬ OffenseEffectedByProhibitedMeans d v c
  attainedFourteen : 14 ≤ ageOfPersonAtTimeOfOffense v c
  underEighteen : ageOfPersonAtTimeOfOffense v c < 18





inductive DocumentActus1592a (d : Person) (doc : IdentificationDocument)
    (c : ComplaintText) : Prop where
  | destroys (h : DestroysDocument d doc c)
  | conceals (h : ConcealsDocument d doc c)
  | removes (h : RemovesDocument d doc c)
  | confiscates (h : ConfiscatesDocument d doc c)
  | possesses (h : PossessesDocument d doc c)




inductive CoveredDocument1592a (doc : IdentificationDocument)
    (c : ComplaintText) : Prop where
  | passportOrImmigration (h : IsPassportOrImmigrationDocument doc c)
  | governmentIdentification (h : IsGovernmentIdentificationDocument doc c)




structure LibertyRestrictionRoute1592a3 (d v : Person) (c : ComplaintText) : Prop where
  purpose : ToPreventOrRestrictLibertyToMoveOrTravel d v c
  withoutLawfulAuthority : ¬ ActedWithLawfulAuthority d c
  toMaintainLabor : InOrderToMaintainLaborOrServices d v c
  victimStatus : IsVictimOfSevereFormOfTrafficking v c


inductive Circumstance1592a (d v : Person) (c : ComplaintText) : Prop where
  | inCourseOfViolation (h : InTheCourseOfChapterTraffickingViolation d c)
  | withIntentToViolate (h : WithIntentToViolateChapterTraffickingSection d c)
  | libertyRestriction (h : LibertyRestrictionRoute1592a3 d v c)




structure Exemption1592b (d : Person) (c : ComplaintText) : Prop where
  victimStatus : IsVictimOfSevereFormOfTrafficking d c
  causedByOrIncident : ConductCausedByOrIncidentToTrafficking d c



structure Section1592a (d v : Person) (doc : IdentificationDocument)
    (c : ComplaintText) : Prop where
  culpable : CulpablePersonCapableOfIntent d c
  scienter : ActedWithScienter d c
  actus : DocumentActus1592a d doc c
  document : CoveredDocument1592a doc c
  ofAnother : DocumentOfAnotherPerson doc v c
  circumstance : Circumstance1592a d v c
  notExempt : ¬ Exemption1592b d c

end Proving.USC.T18.Ch77.Reslice.Elements
