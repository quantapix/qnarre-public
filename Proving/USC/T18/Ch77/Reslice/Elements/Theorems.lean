







import Proving.USC.T18.Ch77.Reslice.Elements.Types
import Proving.USC.T18.Ch77.Reslice.Elements.Predicates
import Proving.USC.T18.Ch77.Reslice.Elements.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Reslice.Elements

open Proving.USC.Common (Person ComplaintText ActedWithScienter)



theorem traffickingActus1590a_intro_recruits {d v : Person} {c : ComplaintText}
    (h : RecruitsPerson d v c) : TraffickingActus1590a d v c := .recruits h

theorem traffickingActus1590a_intro_harbors {d v : Person} {c : ComplaintText}
    (h : HarborsPerson d v c) : TraffickingActus1590a d v c := .harbors h

theorem traffickingActus1590a_intro_transports {d v : Person} {c : ComplaintText}
    (h : TransportsPerson d v c) : TraffickingActus1590a d v c := .transports h

theorem traffickingActus1590a_intro_provides {d v : Person} {c : ComplaintText}
    (h : ProvidesPerson d v c) : TraffickingActus1590a d v c := .provides h

theorem traffickingActus1590a_intro_obtains {d v : Person} {c : ComplaintText}
    (h : ObtainsPerson d v c) : TraffickingActus1590a d v c := .obtains h

theorem section1590a_intro {d v : Person} {ls : LaborOrServices} {c : ComplaintText}
    (hCulp : CulpablePersonCapableOfIntent d c) (hKnow : ActedWithScienter d c)
    (hActus : TraffickingActus1590a d v c) (hPurpose : ForLaborOrServices v ls c)
    (hChapter : LaborOrServicesInViolationOfChapter77 ls c) :
    Section1590a d v ls c :=
  ⟨hCulp, hKnow, hActus, hPurpose, hChapter⟩

theorem aggravator1590a_intro_deathResults {d v : Person} {c : ComplaintText}
    (h : DeathResultedFromViolation v c) : Aggravator1590a d v c := .deathResults h

theorem aggravator1590a_intro_kidnapping {d v : Person} {c : ComplaintText}
    (h : ViolationIncludedKidnappingOrAttempt d v c) : Aggravator1590a d v c :=
  .kidnapping h

theorem aggravator1590a_intro_aggravatedSexualAbuse {d v : Person} {c : ComplaintText}
    (h : ViolationIncludedAggravatedSexualAbuseOrAttempt d v c) :
    Aggravator1590a d v c := .aggravatedSexualAbuse h

theorem aggravator1590a_intro_attemptToKill {d v : Person} {c : ComplaintText}
    (h : ViolationIncludedAttemptToKill d v c) : Aggravator1590a d v c :=
  .attemptToKill h

theorem aggravatedSection1590a_intro {d v : Person} {ls : LaborOrServices}
    {c : ComplaintText} (hBase : Section1590a d v ls c)
    (hAgg : Aggravator1590a d v c) : AggravatedSection1590a d v ls c :=
  ⟨hBase, hAgg⟩



theorem obstructionActus_intro_obstructs {d : Person} {e : EnforcementProceeding}
    {c : ComplaintText} (h : ObstructsEnforcement d e c) :
    ObstructionActus d e c := .obstructs h

theorem obstructionActus_intro_attempts {d : Person} {e : EnforcementProceeding}
    {c : ComplaintText} (h : AttemptsToObstructEnforcement d e c) :
    ObstructionActus d e c := .attempts h

theorem obstructionActus_intro_interferes {d : Person} {e : EnforcementProceeding}
    {c : ComplaintText} (h : InterferesWithOrPreventsEnforcement d e c) :
    ObstructionActus d e c := .interferes h

theorem section1590b_intro {d : Person} {e : EnforcementProceeding} {c : ComplaintText}
    (hCulp : CulpablePersonCapableOfIntent d c)
    (hTarget : EnforcementOfSection1590 e c) (hActus : ObstructionActus d e c) :
    Section1590b d e c :=
  ⟨hCulp, hTarget, hActus⟩

theorem section1591d_intro {d : Person} {e : EnforcementProceeding} {c : ComplaintText}
    (hCulp : CulpablePersonCapableOfIntent d c)
    (hTarget : EnforcementOfSection1591 e c) (hActus : ObstructionActus d e c) :
    Section1591d d e c :=
  ⟨hCulp, hTarget, hActus⟩

theorem section1592c_intro {d : Person} {e : EnforcementProceeding} {c : ComplaintText}
    (hCulp : CulpablePersonCapableOfIntent d c)
    (hTarget : EnforcementOfSection1592 e c) (hActus : ObstructionActus d e c) :
    Section1592c d e c :=
  ⟨hCulp, hTarget, hActus⟩



theorem jurisdictionalNexus1591a1_intro_commerce {d v : Person} {c : ComplaintText}
    (h : InOrAffectingInterstateOrForeignCommerce d v c) :
    JurisdictionalNexus1591a1 d v c := .commerce h

theorem jurisdictionalNexus1591a1_intro_maritime {d v : Person} {c : ComplaintText}
    (h : WithinSpecialMaritimeAndTerritorialJurisdiction d v c) :
    JurisdictionalNexus1591a1 d v c := .maritime h

theorem traffickingActus1591a1_intro_recruits {d v : Person} {c : ComplaintText}
    (h : RecruitsPerson d v c) : TraffickingActus1591a1 d v c := .recruits h

theorem traffickingActus1591a1_intro_entices {d v : Person} {c : ComplaintText}
    (h : EnticesPerson d v c) : TraffickingActus1591a1 d v c := .entices h

theorem traffickingActus1591a1_intro_harbors {d v : Person} {c : ComplaintText}
    (h : HarborsPerson d v c) : TraffickingActus1591a1 d v c := .harbors h

theorem traffickingActus1591a1_intro_transports {d v : Person} {c : ComplaintText}
    (h : TransportsPerson d v c) : TraffickingActus1591a1 d v c := .transports h

theorem traffickingActus1591a1_intro_provides {d v : Person} {c : ComplaintText}
    (h : ProvidesPerson d v c) : TraffickingActus1591a1 d v c := .provides h

theorem traffickingActus1591a1_intro_obtains {d v : Person} {c : ComplaintText}
    (h : ObtainsPerson d v c) : TraffickingActus1591a1 d v c := .obtains h

theorem traffickingActus1591a1_intro_advertises {d v : Person} {c : ComplaintText}
    (h : AdvertisesPerson d v c) : TraffickingActus1591a1 d v c := .advertises h

theorem traffickingActus1591a1_intro_maintains {d v : Person} {c : ComplaintText}
    (h : MaintainsPerson d v c) : TraffickingActus1591a1 d v c := .maintains h

theorem traffickingActus1591a1_intro_patronizes {d v : Person} {c : ComplaintText}
    (h : PatronizesPerson d v c) : TraffickingActus1591a1 d v c := .patronizes h

theorem traffickingActus1591a1_intro_solicits {d v : Person} {c : ComplaintText}
    (h : SolicitsPerson d v c) : TraffickingActus1591a1 d v c := .solicits h

theorem commercialSexAct1591e3_intro {a : SexAct} {c : ComplaintText}
    (hAct : IsSexAct a c) (hValue : AnythingOfValueGivenOrReceived a c) :
    CommercialSexAct1591e3 a c :=
  ⟨hAct, hValue⟩

theorem coercion1591e2_intro_seriousHarmOrRestraint {d v : Person} {c : ComplaintText}
    (h : ThreatsOfSeriousHarmOrPhysicalRestraint d v c) : Coercion1591e2 d v c :=
  .seriousHarmOrRestraint h

theorem coercion1591e2_intro_schemePlanOrPattern {d v : Person} {c : ComplaintText}
    (h : SchemePlanOrPatternInducingBeliefOfSeriousHarm d v c) :
    Coercion1591e2 d v c := .schemePlanOrPattern h

theorem coercion1591e2_intro_abuseOfLegalProcess {d v : Person} {c : ComplaintText}
    (h : AbuseOrThreatenedAbuseOfLawOrLegalProcess d v c) : Coercion1591e2 d v c :=
  .abuseOfLegalProcess h

theorem prohibitedMeans1591_intro_force {d v : Person} {c : ComplaintText}
    (h : MeansOfForce d v c) : ProhibitedMeans1591 d v c := .force h

theorem prohibitedMeans1591_intro_threatsOfForce {d v : Person} {c : ComplaintText}
    (h : ThreatsOfForce d v c) : ProhibitedMeans1591 d v c := .threatsOfForce h

theorem prohibitedMeans1591_intro_fraud {d v : Person} {c : ComplaintText}
    (h : MeansOfFraud d v c) : ProhibitedMeans1591 d v c := .fraud h

theorem prohibitedMeans1591_intro_coercion {d v : Person} {c : ComplaintText}
    (h : Coercion d v c) : ProhibitedMeans1591 d v c := .coercion h

theorem meansRoute1591_intro {d v : Person} {a : SexAct} {c : ComplaintText}
    (hMeans : ProhibitedMeans1591 d v c) (hCsa : IsCommercialSexAct a c)
    (hCause : MeansWillBeUsedToCausePersonToEngage d v a c) :
    MeansRoute1591 d v a c :=
  ⟨hMeans, hCsa, hCause⟩

theorem minorityRoute1591_intro {v : Person} {a : SexAct} {c : ComplaintText}
    (hAge : ageOfPersonAtTimeOfOffense v c < 18) (hCsa : IsCommercialSexAct a c)
    (hCause : WillBeCausedToEngageInCommercialSexAct v a c) :
    MinorityRoute1591 v a c :=
  ⟨hAge, hCsa, hCause⟩

theorem mensLevel1591a_intro_knowing {d v : Person} {c : ComplaintText}
    (h : ActedWithScienter d c) : MensLevel1591a d v c := .knowing h

theorem mensLevel1591a_intro_recklessDisregard {d v : Person} {c : ComplaintText}
    (h : ActedInRecklessDisregard d c) (hNotAd : ¬ AdvertisesPerson d v c) :
    MensLevel1591a d v c := .recklessDisregard h hNotAd

theorem mensRea1591a_intro_means {d v : Person} {a : SexAct} {c : ComplaintText}
    (hLevel : MensLevel1591a d v c) (hRoute : MeansRoute1591 d v a c) :
    MensRea1591a d v a c := .means hLevel hRoute

theorem mensRea1591a_intro_minority {d v : Person} {a : SexAct} {c : ComplaintText}
    (hLevel : MensLevel1591a d v c) (hRoute : MinorityRoute1591 v a c) :
    MensRea1591a d v a c := .minority hLevel hRoute

theorem mensRea1591a1_intro_proved {d v : Person} {a : SexAct} {c : ComplaintText}
    (h : MensRea1591a d v a c) : MensRea1591a1 d v a c := .proved h

theorem mensRea1591a1_intro_minorityObserved {d v : Person} {a : SexAct}
    {c : ComplaintText} (h : HadReasonableOpportunityToObserve d v c)
    (hRoute : MinorityRoute1591 v a c) : MensRea1591a1 d v a c :=
  .minorityObserved h hRoute

theorem section1591a1_intro {d v : Person} {a : SexAct} {c : ComplaintText}
    (hCulp : CulpablePersonCapableOfIntent d c)
    (hJur : JurisdictionalNexus1591a1 d v c)
    (hActus : TraffickingActus1591a1 d v c) (hMens : MensRea1591a1 d v a c) :
    Section1591a1 d v a c :=
  ⟨hCulp, hJur, hActus, hMens⟩

theorem venture1591e6_intro {ven : Venture} {c : ComplaintText}
    (hTwo : HasTwoOrMoreIndividuals ven c) (hAssoc : AssociatedInFact ven c) :
    Venture1591e6 ven c :=
  ⟨hTwo, hAssoc⟩

theorem participationInVenture1591e4_intro_assists {d : Person} {ven : Venture}
    {c : ComplaintText} (h : KnowinglyAssistsVenture d ven c) :
    ParticipationInVenture1591e4 d ven c := .assists h

theorem participationInVenture1591e4_intro_supports {d : Person} {ven : Venture}
    {c : ComplaintText} (h : KnowinglySupportsVenture d ven c) :
    ParticipationInVenture1591e4 d ven c := .supports h

theorem participationInVenture1591e4_intro_facilitates {d : Person} {ven : Venture}
    {c : ComplaintText} (h : KnowinglyFacilitatesVenture d ven c) :
    ParticipationInVenture1591e4 d ven c := .facilitates h

theorem section1591a2_intro {d v : Person} {a : SexAct} {ven : Venture}
    {c : ComplaintText} (hCulp : CulpablePersonCapableOfIntent d c)
    (hVenture : IsVenture ven c) (hPart : ParticipatesInVenture d ven c)
    (hBenefit : BenefitsFinanciallyOrReceivesAnythingOfValue d ven c)
    (hVentureAct : VentureEngagedInActDescribedInParagraph1 ven c)
    (hMens : MensRea1591a d v a c) : Section1591a2 d v a ven c :=
  ⟨hCulp, hVenture, hPart, hBenefit, hVentureAct, hMens⟩

theorem section1591a_intro_conductRoute {d v : Person} {a : SexAct} {ven : Venture}
    {c : ComplaintText} (h : Section1591a1 d v a c) : Section1591a d v a ven c :=
  .conductRoute h

theorem section1591a_intro_benefitRoute {d v : Person} {a : SexAct} {ven : Venture}
    {c : ComplaintText} (h : Section1591a2 d v a ven c) : Section1591a d v a ven c :=
  .benefitRoute h

theorem punishment1591b1_intro_byProhibitedMeans {d v : Person} {c : ComplaintText}
    (h : OffenseEffectedByProhibitedMeans d v c) : Punishment1591b1 d v c :=
  .byProhibitedMeans h

theorem punishment1591b1_intro_underFourteen {d v : Person} {c : ComplaintText}
    (h : ageOfPersonAtTimeOfOffense v c < 14) : Punishment1591b1 d v c :=
  .underFourteen h

theorem punishment1591b2_intro {d v : Person} {c : ComplaintText}
    (hNotMeans : ¬ OffenseEffectedByProhibitedMeans d v c)
    (hFourteen : 14 ≤ ageOfPersonAtTimeOfOffense v c)
    (hEighteen : ageOfPersonAtTimeOfOffense v c < 18) : Punishment1591b2 d v c :=
  ⟨hNotMeans, hFourteen, hEighteen⟩



theorem documentActus1592a_intro_destroys {d : Person} {doc : IdentificationDocument}
    {c : ComplaintText} (h : DestroysDocument d doc c) :
    DocumentActus1592a d doc c := .destroys h

theorem documentActus1592a_intro_conceals {d : Person} {doc : IdentificationDocument}
    {c : ComplaintText} (h : ConcealsDocument d doc c) :
    DocumentActus1592a d doc c := .conceals h

theorem documentActus1592a_intro_removes {d : Person} {doc : IdentificationDocument}
    {c : ComplaintText} (h : RemovesDocument d doc c) :
    DocumentActus1592a d doc c := .removes h

theorem documentActus1592a_intro_confiscates {d : Person}
    {doc : IdentificationDocument} {c : ComplaintText}
    (h : ConfiscatesDocument d doc c) : DocumentActus1592a d doc c := .confiscates h

theorem documentActus1592a_intro_possesses {d : Person} {doc : IdentificationDocument}
    {c : ComplaintText} (h : PossessesDocument d doc c) :
    DocumentActus1592a d doc c := .possesses h

theorem coveredDocument1592a_intro_passportOrImmigration
    {doc : IdentificationDocument} {c : ComplaintText}
    (h : IsPassportOrImmigrationDocument doc c) : CoveredDocument1592a doc c :=
  .passportOrImmigration h

theorem coveredDocument1592a_intro_governmentIdentification
    {doc : IdentificationDocument} {c : ComplaintText}
    (h : IsGovernmentIdentificationDocument doc c) : CoveredDocument1592a doc c :=
  .governmentIdentification h

theorem libertyRestrictionRoute1592a3_intro {d v : Person} {c : ComplaintText}
    (hPurpose : ToPreventOrRestrictLibertyToMoveOrTravel d v c)
    (hNoAuthority : ¬ ActedWithLawfulAuthority d c)
    (hMaintain : InOrderToMaintainLaborOrServices d v c)
    (hVictim : IsVictimOfSevereFormOfTrafficking v c) :
    LibertyRestrictionRoute1592a3 d v c :=
  ⟨hPurpose, hNoAuthority, hMaintain, hVictim⟩

theorem circumstance1592a_intro_inCourseOfViolation {d v : Person} {c : ComplaintText}
    (h : InTheCourseOfChapterTraffickingViolation d c) : Circumstance1592a d v c :=
  .inCourseOfViolation h

theorem circumstance1592a_intro_withIntentToViolate {d v : Person} {c : ComplaintText}
    (h : WithIntentToViolateChapterTraffickingSection d c) :
    Circumstance1592a d v c := .withIntentToViolate h

theorem circumstance1592a_intro_libertyRestriction {d v : Person} {c : ComplaintText}
    (h : LibertyRestrictionRoute1592a3 d v c) : Circumstance1592a d v c :=
  .libertyRestriction h

theorem exemption1592b_intro {d : Person} {c : ComplaintText}
    (hVictim : IsVictimOfSevereFormOfTrafficking d c)
    (hCaused : ConductCausedByOrIncidentToTrafficking d c) : Exemption1592b d c :=
  ⟨hVictim, hCaused⟩

theorem section1592a_intro {d v : Person} {doc : IdentificationDocument}
    {c : ComplaintText} (hCulp : CulpablePersonCapableOfIntent d c)
    (hKnow : ActedWithScienter d c) (hActus : DocumentActus1592a d doc c)
    (hDoc : CoveredDocument1592a doc c)
    (hOfAnother : DocumentOfAnotherPerson doc v c)
    (hCirc : Circumstance1592a d v c) (hNotExempt : ¬ Exemption1592b d c) :
    Section1592a d v doc c :=
  ⟨hCulp, hKnow, hActus, hDoc, hOfAnother, hCirc, hNotExempt⟩

end Proving.USC.T18.Ch77.Reslice.Elements
