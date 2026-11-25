import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part2.Elements.Types
import Proving.USC.T18.Ch77.Part2.Elements.Predicates
import Proving.USC.T18.Ch77.Part2.Elements.Statute

set_option autoImplicit false










namespace Proving.USC.T18.Ch77.Part2.Elements

open Proving.USC.Common



theorem seriousHarm1591e5_intro {hm v c}
    (hHarm : IsHarmPhysicalOrNonphysical hm c)
    (hSuff : SufficientToCompelReasonablePersonSimilarlySituated hm v c) :
    SeriousHarm1591e5 hm v c :=
  ⟨hHarm, hSuff⟩

theorem seriousHarmOrRestraint1591e2_intro_seriousHarm {hm v c}
    (h : SeriousHarm1591e5 hm v c) : SeriousHarmOrRestraint1591e2 hm v c :=
  .seriousHarm h

theorem seriousHarmOrRestraint1591e2_intro_physicalRestraint {hm v c}
    (h : PhysicalRestraintAgainstPerson v c) : SeriousHarmOrRestraint1591e2 hm v c :=
  .physicalRestraint h

theorem abuseOfLegalProcess1591e1_intro {m v c}
    (hUse : UsesOrThreatensUseOfLawOrLegalProcess m c)
    (hPurpose : ForPurposeLawWasNotDesigned m c)
    (hPressure : ExertsPressureToCauseActionOrInaction m v c) :
    AbuseOfLegalProcess1591e1 m v c :=
  ⟨hUse, hPurpose, hPressure⟩

theorem coercion1591e2A_intro {m hm v c}
    (hThreat : ThreatensConsequenceAgainstPerson m v c)
    (hConseq : SeriousHarmOrRestraint1591e2 hm v c) :
    Coercion1591e2A m hm v c :=
  ⟨hThreat, hConseq⟩

theorem coercion1591e2B_intro {m hm v c}
    (hScheme : IsSchemePlanOrPattern m c)
    (hIntent : IntendedToCauseBeliefFailureToPerformCausesConsequence m v c)
    (hConseq : SeriousHarmOrRestraint1591e2 hm v c) :
    Coercion1591e2B m hm v c :=
  ⟨hScheme, hIntent, hConseq⟩

theorem coercion1591e2_intro_threatsOfSeriousHarm {m hm v c}
    (h : Coercion1591e2A m hm v c) : Coercion1591e2 m hm v c :=
  .threatsOfSeriousHarm h

theorem coercion1591e2_intro_schemePlanOrPattern {m hm v c}
    (h : Coercion1591e2B m hm v c) : Coercion1591e2 m hm v c :=
  .schemePlanOrPattern h

theorem coercion1591e2_intro_abuseOfLegalProcess {m hm v c}
    (h : AbuseOfLegalProcess1591e1 m v c) : Coercion1591e2 m hm v c :=
  .abuseOfLegalProcess h

theorem commercialSexAct1591e3_intro {s c}
    (hAct : IsSexAct s c) (hValue : AnythingOfValueGivenOrReceivedForAct s c) :
    CommercialSexAct1591e3 s c :=
  ⟨hAct, hValue⟩

theorem venture1591e6_intro {ven c}
    (hCount : 2 ≤ individualsAssociatedInVenture ven c)
    (hAssoc : IndividualsAssociatedInFact ven c) :
    Venture1591e6 ven c :=
  ⟨hCount, hAssoc⟩

theorem participationInVenture1591e4_intro {p ven c}
    (hConduct : AssistsSupportsOrFacilitatesViolation p ven c)
    (hKnows : KnowsVentureViolatesParagraphOne p ven c) :
    ParticipationInVenture1591e4 p ven c :=
  ⟨hConduct, hKnows⟩



theorem prohibitedMeans1591_intro_force {m hm v c}
    (h : UsesForce m c) : ProhibitedMeans1591 m hm v c :=
  .force h

theorem prohibitedMeans1591_intro_threatsOfForce {m hm v c}
    (h : UsesThreatsOfForce m c) : ProhibitedMeans1591 m hm v c :=
  .threatsOfForce h

theorem prohibitedMeans1591_intro_fraud {m hm v c}
    (h : UsesFraud m c) : ProhibitedMeans1591 m hm v c :=
  .fraud h

theorem prohibitedMeans1591_intro_coercion {m hm v c}
    (h : Coercion1591e2 m hm v c) : ProhibitedMeans1591 m hm v c :=
  .coercion h



theorem jurisdictionalNexus1591a1_intro_commerce {a c}
    (h : InOrAffectingInterstateOrForeignCommerce a c) : JurisdictionalNexus1591a1 a c :=
  .commerce h

theorem jurisdictionalNexus1591a1_intro_maritimeOrTerritorial {a c}
    (h : WithinSpecialMaritimeAndTerritorialJurisdiction a c) : JurisdictionalNexus1591a1 a c :=
  .maritimeOrTerritorial h

theorem section1591a1_intro {p v a c}
    (hKnow : ActedWithScienter p c)
    (hJur : JurisdictionalNexus1591a1 a c)
    (hAct : PerformsEnumeratedTraffickingAct p v a c) :
    Section1591a1 p v a c :=
  ⟨hKnow, hJur, hAct⟩

theorem section1591a2_intro {p ven c}
    (hKnow : ActedWithScienter p c)
    (hBenefit : ReceivesBenefitOfValue p ven c)
    (hPart : ParticipationInVenture1591e4 p ven c)
    (hVenture : Venture1591e6 ven c)
    (hPredicate : VentureEngagedInParagraphOneAct ven c) :
    Section1591a2 p ven c :=
  ⟨hKnow, hBenefit, hPart, hVenture, hPredicate⟩

theorem traffickingConduct1591a_intro_direct {p v a ven c}
    (h : Section1591a1 p v a c) : TraffickingConduct1591a p v a ven c :=
  .direct h

theorem traffickingConduct1591a_intro_beneficiary {p v a ven c}
    (h : Section1591a2 p ven c) : TraffickingConduct1591a p v a ven c :=
  .beneficiary h



theorem culpableMentalState1591a_intro_knowing {p a c}
    (h : KnowsAggravatingFact p c) : CulpableMentalState1591a p a c :=
  .knowing h

theorem culpableMentalState1591a_intro_recklessDisregard {p a c}
    (h : RecklesslyDisregardsAggravatingFact p c)
    (hNotAdvertising : ¬ TraffickingActIsAdvertising a c) :
    CulpableMentalState1591a p a c :=
  .recklessDisregard h hNotAdvertising

theorem minorityMensRea1591_intro_proven {p v a c}
    (h : CulpableMentalState1591a p a c) : MinorityMensRea1591 p v a c :=
  .proven h

theorem minorityMensRea1591_intro_relievedByObservation {p v a c}
    (hProsecution : ProsecutedUnderParagraphOne p c)
    (hOpportunity : ReasonableOpportunityToObserve p v c) :
    MinorityMensRea1591 p v a c :=
  .relievedByObservation hProsecution hOpportunity

theorem meansTheory1591a_intro {p v a m hm s c}
    (hMeans : ProhibitedMeans1591 m hm v c)
    (hCause : MeansWillBeUsedToCauseCommercialSexAct v m s c)
    (hCommercial : CommercialSexAct1591e3 s c)
    (hMental : CulpableMentalState1591a p a c) :
    MeansTheory1591a p v a m hm s c :=
  ⟨hMeans, hCause, hCommercial, hMental⟩

theorem minorityTheory1591a_intro {p v a s c}
    (hAge : victimAgeYearsAtOffense v c < 18)
    (hCause : WillBeCausedToEngageInCommercialSexAct v s c)
    (hCommercial : CommercialSexAct1591e3 s c)
    (hMental : MinorityMensRea1591 p v a c) :
    MinorityTheory1591a p v a s c :=
  ⟨hAge, hCause, hCommercial, hMental⟩

theorem aggravatingFact1591a_intro_byMeans {p v a ven m hm s c}
    (h : MeansTheory1591a p v a m hm s c) : AggravatingFact1591a p v a ven m hm s c :=
  .byMeans h

theorem aggravatingFact1591a_intro_byMinority {p v a ven m hm s c}
    (h : MinorityTheory1591a p v a s c) : AggravatingFact1591a p v a ven m hm s c :=
  .byMinority h



theorem section1591a_intro {p v a ven m hm s c}
    (hConduct : TraffickingConduct1591a p v a ven c)
    (hAggravating : AggravatingFact1591a p v a ven m hm s c) :
    Section1591a p v a ven m hm s c :=
  ⟨hConduct, hAggravating⟩



theorem enhancedPenaltyFact1591b1_intro_effectedByMeans {p v m c}
    (h : OffenseEffectedByProhibitedMeans p v m c) : EnhancedPenaltyFact1591b1 p v m c :=
  .effectedByMeans h

theorem enhancedPenaltyFact1591b1_intro_underFourteen {p v m c}
    (h : victimAgeYearsAtOffense v c < 14) : EnhancedPenaltyFact1591b1 p v m c :=
  .underFourteen h

theorem section1591b1_intro {p v a ven m hm s c}
    (hOffense : Section1591a p v a ven m hm s c)
    (hTrigger : EnhancedPenaltyFact1591b1 p v m c) :
    Section1591b1 p v a ven m hm s c :=
  ⟨hOffense, hTrigger⟩

theorem section1591b2_intro {p v a ven m hm s c}
    (hOffense : Section1591a p v a ven m hm s c)
    (hNotEffected : ¬ OffenseEffectedByProhibitedMeans p v m c)
    (hAtLeast14 : 14 ≤ victimAgeYearsAtOffense v c)
    (hUnder18 : victimAgeYearsAtOffense v c < 18) :
    Section1591b2 p v a ven m hm s c :=
  ⟨hOffense, hNotEffected, hAtLeast14, hUnder18⟩

theorem penaltyTier1591b_intro_tierOne {p v a ven m hm s c}
    (h : Section1591b1 p v a ven m hm s c) : PenaltyTier1591b p v a ven m hm s c :=
  .tierOne h

theorem penaltyTier1591b_intro_tierTwo {p v a ven m hm s c}
    (h : Section1591b2 p v a ven m hm s c) : PenaltyTier1591b p v a ven m hm s c :=
  .tierTwo h



theorem obstructionConduct1591d_intro_obstructs {p o c}
    (h : ObstructsEnforcement p o c) : ObstructionConduct1591d p o c :=
  .obstructs h

theorem obstructionConduct1591d_intro_attempts {p o c}
    (h : AttemptsToObstructEnforcement p o c) : ObstructionConduct1591d p o c :=
  .attempts h

theorem obstructionConduct1591d_intro_interferesOrPrevents {p o c}
    (h : InterferesWithOrPreventsEnforcement p o c) : ObstructionConduct1591d p o c :=
  .interferesOrPrevents h

theorem section1591d_intro {p o c}
    (hConduct : ObstructionConduct1591d p o c)
    (hTarget : EnforcementOfThisSection o c) :
    Section1591d p o c :=
  ⟨hConduct, hTarget⟩

end Proving.USC.T18.Ch77.Part2.Elements
