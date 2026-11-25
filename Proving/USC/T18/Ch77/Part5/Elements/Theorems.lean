import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part5.Elements.Statute

set_option autoImplicit false








namespace Proving.USC.T18.Ch77.Part5.Elements

open Proving.USC.Common



theorem traffickingConduct1591a1_recruits_intro {d act v c} (h : Recruits d act v c) :
    TraffickingConduct1591a1 d act v c := .recruits h
theorem traffickingConduct1591a1_entices_intro {d act v c} (h : Entices d act v c) :
    TraffickingConduct1591a1 d act v c := .entices h
theorem traffickingConduct1591a1_harbors_intro {d act v c} (h : Harbors d act v c) :
    TraffickingConduct1591a1 d act v c := .harbors h
theorem traffickingConduct1591a1_transports_intro {d act v c} (h : Transports d act v c) :
    TraffickingConduct1591a1 d act v c := .transports h
theorem traffickingConduct1591a1_provides_intro {d act v c} (h : Provides d act v c) :
    TraffickingConduct1591a1 d act v c := .provides h
theorem traffickingConduct1591a1_obtains_intro {d act v c} (h : Obtains d act v c) :
    TraffickingConduct1591a1 d act v c := .obtains h
theorem traffickingConduct1591a1_advertises_intro {d act v c} (h : Advertises d act v c) :
    TraffickingConduct1591a1 d act v c := .advertises h
theorem traffickingConduct1591a1_maintains_intro {d act v c} (h : Maintains d act v c) :
    TraffickingConduct1591a1 d act v c := .maintains h
theorem traffickingConduct1591a1_patronizes_intro {d act v c} (h : Patronizes d act v c) :
    TraffickingConduct1591a1 d act v c := .patronizes h
theorem traffickingConduct1591a1_solicits_intro {d act v c} (h : Solicits d act v c) :
    TraffickingConduct1591a1 d act v c := .solicits h



theorem commerceOrMaritimeNexus_commerce_intro {act c}
    (h : InOrAffectingInterstateOrForeignCommerce act c) : CommerceOrMaritimeNexus act c :=
  .commerce h
theorem commerceOrMaritimeNexus_maritime_intro {act c}
    (h : WithinSpecialMaritimeAndTerritorialJurisdiction act c) :
    CommerceOrMaritimeNexus act c := .maritime h



theorem coercion1591e2_threats_intro {v c} (h : ThreatsOfSeriousHarmOrPhysicalRestraint v c) :
    Coercion1591e2 v c := .threats h
theorem coercion1591e2_scheme_intro {v c} (h : SchemeCausingBeliefOfSeriousHarmOrRestraint v c) :
    Coercion1591e2 v c := .scheme h
theorem coercion1591e2_process_intro {v c} (h : AbuseOrThreatenedAbuseOfLawOrLegalProcess v c) :
    Coercion1591e2 v c := .process h

theorem commercialSexAct1591e3_intro {sx c} (hAct : IsSexAct sx c)
    (hValue : AnythingOfValueGivenOrReceived sx c) : CommercialSexAct1591e3 sx c :=
  ⟨hAct, hValue⟩

theorem venture1591e6_intro {ven c} (hGroup : GroupOfTwoOrMoreIndividuals ven c)
    (hAssoc : AssociatedInFact ven c) : Venture1591e6 ven c := ⟨hGroup, hAssoc⟩



theorem prohibitedMeans1591_force_intro {d v c} (h : MeansOfForce d v c) :
    ProhibitedMeans1591 d v c := .force h
theorem prohibitedMeans1591_threats_intro {d v c} (h : MeansOfThreatsOfForce d v c) :
    ProhibitedMeans1591 d v c := .threats h
theorem prohibitedMeans1591_fraud_intro {d v c} (h : MeansOfFraud d v c) :
    ProhibitedMeans1591 d v c := .fraud h
theorem prohibitedMeans1591_coercion_intro {d v c} (h : IsCoercion v c) :
    ProhibitedMeans1591 d v c := .coercion h

theorem meansRoute1591a_intro {d v sx c} (hMeans : ProhibitedMeans1591 d v c)
    (hCommercial : IsCommercialSexAct sx c) (hCaused : WillBeCausedToEngageInSexAct v sx c) :
    MeansRoute1591a d v sx c := ⟨hMeans, hCommercial, hCaused⟩

theorem minorityRoute1591a_intro {v sx c} (hMinor : UnderAge18 v c)
    (hCommercial : IsCommercialSexAct sx c) (hCaused : WillBeCausedToEngageInSexAct v sx c) :
    MinorityRoute1591a v sx c := ⟨hMinor, hCommercial, hCaused⟩



theorem circumstanceEstablished1591a_knowingMeans_intro {d act v sx c}
    (hk : KnowsOfProhibitedCircumstance d v c) (h : MeansRoute1591a d v sx c) :
    CircumstanceEstablished1591a d act v sx c := .knowingMeans hk h

theorem circumstanceEstablished1591a_recklessMeans_intro {d act v sx c}
    (hr : RecklesslyDisregardsProhibitedCircumstance d v c)
    (hna : ¬ ViolatingActIsAdvertising act c) (h : MeansRoute1591a d v sx c) :
    CircumstanceEstablished1591a d act v sx c := .recklessMeans hr hna h

theorem circumstanceEstablished1591a_knowingMinority_intro {d act v sx c}
    (hk : KnowsOfProhibitedCircumstance d v c) (h : MinorityRoute1591a v sx c) :
    CircumstanceEstablished1591a d act v sx c := .knowingMinority hk h

theorem circumstanceEstablished1591a_recklessMinority_intro {d act v sx c}
    (hr : RecklesslyDisregardsProhibitedCircumstance d v c)
    (hna : ¬ ViolatingActIsAdvertising act c) (h : MinorityRoute1591a v sx c) :
    CircumstanceEstablished1591a d act v sx c := .recklessMinority hr hna h

theorem circumstanceEstablished1591a1_general_intro {d act v sx c}
    (h : CircumstanceEstablished1591a d act v sx c) :
    CircumstanceEstablished1591a1 d act v sx c := .general h

theorem circumstanceEstablished1591a1_observedMinority_intro {d act v sx c}
    (hObs : HadReasonableOpportunityToObservePerson d v c) (h : MinorityRoute1591a v sx c) :
    CircumstanceEstablished1591a1 d act v sx c := .observedMinority hObs h



theorem section1591a1_intro {d act v sx c} (hKnowingly : ActedWithScienter d c)
    (hConduct : PerformsTraffickingAct d act v c)
    (hNexus : HasFederalJurisdictionalNexus act c)
    (hCircumstance : CircumstanceEstablished1591a1 d act v sx c) :
    Section1591a1 d act v sx c :=
  ⟨hKnowingly, hConduct, hNexus, hCircumstance⟩

theorem section1591a2_intro {d ven act v sx c} (hKnowingly : ActedWithScienter d c)
    (hBenefit : BenefitsFinanciallyOrReceivesAnythingOfValue d ven c)
    (hParticipation : ParticipatesInVenture d ven c) (hVenture : IsVenture ven c)
    (hVentureViolation : VentureEngagedInAct1591a1 ven act c)
    (hCircumstance : CircumstanceEstablished1591a d act v sx c) :
    Section1591a2 d ven act v sx c :=
  ⟨hKnowingly, hBenefit, hParticipation, hVenture, hVentureViolation, hCircumstance⟩

theorem violation1591a_conduct_intro {d ven act v sx c} (h : Section1591a1 d act v sx c) :
    Violation1591a d ven act v sx c := .conductRoute h

theorem violation1591a_benefit_intro {d ven act v sx c} (h : Section1591a2 d ven act v sx c) :
    Violation1591a d ven act v sx c := .benefitRoute h



theorem penaltyTier1591b1_byMeans_intro {d ven act v sx c}
    (hv : Violation1591a d ven act v sx c) (h : OffenseEffectedByProhibitedMeans d v c) :
    PenaltyTier1591b1 d ven act v sx c := .byMeans hv h

theorem penaltyTier1591b1_underFourteen_intro {d ven act v sx c}
    (hv : Violation1591a d ven act v sx c) (h : UnderAge14 v c) :
    PenaltyTier1591b1 d ven act v sx c := .underFourteen hv h

theorem penaltyTier1591b2_intro {d ven act v sx c} (hv : Violation1591a d ven act v sx c)
    (hNot : ¬ OffenseEffectedByProhibitedMeans d v c) (hAge : AtLeast14AndUnder18 v c) :
    PenaltyTier1591b2 d ven act v sx c := ⟨hv, hNot, hAge⟩



theorem obstructiveConduct1591d_obstructs_intro {d oa c} (h : ObstructsEnforcement d oa c) :
    ObstructiveConduct1591d d oa c := .obstructs h
theorem obstructiveConduct1591d_attempts_intro {d oa c}
    (h : AttemptsToObstructEnforcement d oa c) : ObstructiveConduct1591d d oa c := .attempts h
theorem obstructiveConduct1591d_interferes_intro {d oa c}
    (h : InterferesWithOrPreventsEnforcement d oa c) : ObstructiveConduct1591d d oa c :=
  .interferes h

theorem section1591d_intro {d oa c} (hConduct : ObstructsEnforcementOfSection1591 d oa c) :
    Section1591d d oa c := ⟨hConduct⟩

end Proving.USC.T18.Ch77.Part5.Elements
