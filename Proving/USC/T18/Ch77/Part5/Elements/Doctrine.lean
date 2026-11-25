import Proving.USC.Common.Tactic
import Proving.USC.T18.Ch77.Part5.Elements.Statute

set_option autoImplicit false









namespace Proving.USC.T18.Ch77.Part5.Elements

open Proving.USC.Common



@[grind →] theorem conduct_of_recruits {d act v c} (h : Recruits d act v c) :
    TraffickingConduct1591a1 d act v c := .recruits h
@[grind →] theorem conduct_of_entices {d act v c} (h : Entices d act v c) :
    TraffickingConduct1591a1 d act v c := .entices h
@[grind →] theorem conduct_of_harbors {d act v c} (h : Harbors d act v c) :
    TraffickingConduct1591a1 d act v c := .harbors h
@[grind →] theorem conduct_of_transports {d act v c} (h : Transports d act v c) :
    TraffickingConduct1591a1 d act v c := .transports h
@[grind →] theorem conduct_of_provides {d act v c} (h : Provides d act v c) :
    TraffickingConduct1591a1 d act v c := .provides h
@[grind →] theorem conduct_of_obtains {d act v c} (h : Obtains d act v c) :
    TraffickingConduct1591a1 d act v c := .obtains h
@[grind →] theorem conduct_of_advertises {d act v c} (h : Advertises d act v c) :
    TraffickingConduct1591a1 d act v c := .advertises h
@[grind →] theorem conduct_of_maintains {d act v c} (h : Maintains d act v c) :
    TraffickingConduct1591a1 d act v c := .maintains h
@[grind →] theorem conduct_of_patronizes {d act v c} (h : Patronizes d act v c) :
    TraffickingConduct1591a1 d act v c := .patronizes h
@[grind →] theorem conduct_of_solicits {d act v c} (h : Solicits d act v c) :
    TraffickingConduct1591a1 d act v c := .solicits h



@[grind →] theorem nexus_of_commerce {act c}
    (h : InOrAffectingInterstateOrForeignCommerce act c) : CommerceOrMaritimeNexus act c :=
  .commerce h
@[grind →] theorem nexus_of_maritime {act c}
    (h : WithinSpecialMaritimeAndTerritorialJurisdiction act c) :
    CommerceOrMaritimeNexus act c := .maritime h



@[grind →] theorem coercion_of_threats {v c}
    (h : ThreatsOfSeriousHarmOrPhysicalRestraint v c) : Coercion1591e2 v c := .threats h
@[grind →] theorem coercion_of_scheme {v c}
    (h : SchemeCausingBeliefOfSeriousHarmOrRestraint v c) : Coercion1591e2 v c := .scheme h
@[grind →] theorem coercion_of_process {v c}
    (h : AbuseOrThreatenedAbuseOfLawOrLegalProcess v c) : Coercion1591e2 v c := .process h



@[grind →] theorem commercialSexAct_intro' {sx c} (h1 : IsSexAct sx c)
    (h2 : AnythingOfValueGivenOrReceived sx c) : CommercialSexAct1591e3 sx c := ⟨h1, h2⟩



@[grind →] theorem venture_intro' {ven c} (h1 : GroupOfTwoOrMoreIndividuals ven c)
    (h2 : AssociatedInFact ven c) : Venture1591e6 ven c := ⟨h1, h2⟩



@[grind →] theorem obstruction_of_obstructs {d oa c} (h : ObstructsEnforcement d oa c) :
    ObstructiveConduct1591d d oa c := .obstructs h
@[grind →] theorem obstruction_of_attempts {d oa c} (h : AttemptsToObstructEnforcement d oa c) :
    ObstructiveConduct1591d d oa c := .attempts h
@[grind →] theorem obstruction_of_interferes {d oa c}
    (h : InterferesWithOrPreventsEnforcement d oa c) : ObstructiveConduct1591d d oa c :=
  .interferes h



example {d act v c} (h : Harbors d act v c) : PerformsTraffickingAct d act v c := by
  prove_element

example {act c} (h : InOrAffectingInterstateOrForeignCommerce act c) :
    HasFederalJurisdictionalNexus act c := by prove_element

example {v c} (h : AbuseOrThreatenedAbuseOfLawOrLegalProcess v c) : IsCoercion v c := by
  prove_element

example {sx c} (h1 : IsSexAct sx c) (h2 : AnythingOfValueGivenOrReceived sx c) :
    IsCommercialSexAct sx c := by prove_element

example {ven c} (h1 : GroupOfTwoOrMoreIndividuals ven c) (h2 : AssociatedInFact ven c) :
    IsVenture ven c := by prove_element

example {d oa c} (h : AttemptsToObstructEnforcement d oa c) :
    ObstructsEnforcementOfSection1591 d oa c := by prove_element



theorem underAge18_of_underAge14 {v c} (h : UnderAge14 v c) : UnderAge18 v c := by
  unfold UnderAge14 UnderAge18 at *; omega

theorem underAge18_of_ageBand {v c} (h : AtLeast14AndUnder18 v c) : UnderAge18 v c := by
  unfold AtLeast14AndUnder18 UnderAge18 at *; omega

end Proving.USC.T18.Ch77.Part5.Elements
