








import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part4.Ontology.Types
import Proving.USC.T18.Ch77.Part4.Ontology.Predicates
import Proving.USC.T18.Ch77.Part4.Ontology.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.Ontology

open Proving.USC.Common



theorem abuseOfLegalProcessMembership_intro
    {m : Means} {p : Person} {c : ComplaintText}
    (hUse : IsUseOrThreatenedUseOfLegalProcess m c)
    (hPurpose : IsPurposeLawNotDesignedFor m c)
    (hPressure : ExertsPressureOnAnotherPerson m p c)
    (hTerm : IsAbuseOrThreatenedAbuseOfLegalProcess m c)
    : AbuseOfLegalProcessMembership m p c :=
  ⟨hUse, hPurpose, hPressure, hTerm⟩


theorem seriousHarmMembership_intro
    {h : Harm} {c : ComplaintText}
    (hHarm : IsHarmPhysicalOrNonphysical h c)
    (hCompels : CompelsReasonablePersonToPerformCommercialSexualActivity h c)
    (hTerm : IsSeriousHarm h c)
    : SeriousHarmMembership h c :=
  ⟨hHarm, hCompels, hTerm⟩



theorem coercionMembership_intro
    {m : Means} {p : Person} {h : Harm} {c : ComplaintText}
    (hThreat : ThreatensSeriousHarmToPerson m p h c)
    (hSerious : IsSeriousHarm h c)
    : CoercionMembership m p h c :=
  .threatOfSeriousHarm hThreat hSerious


theorem coercionMembership_intro_physicalRestraint
    {m : Means} {p : Person} {h : Harm} {c : ComplaintText}
    (hRestraint : ThreatensPhysicalRestraintAgainstPerson m p c)
    : CoercionMembership m p h c :=
  .physicalRestraint hRestraint


theorem coercionMembership_intro_schemeOfSeriousHarm
    {m : Means} {p : Person} {h : Harm} {c : ComplaintText}
    (hScheme : SchemeInducingBeliefOfHarmFromNonperformance m p h c)
    (hSerious : IsSeriousHarm h c)
    : CoercionMembership m p h c :=
  .schemeOfSeriousHarm hScheme hSerious


theorem coercionMembership_intro_schemeOfPhysicalRestraint
    {m : Means} {p : Person} {h : Harm} {c : ComplaintText}
    (hScheme : SchemeInducingBeliefOfRestraintFromNonperformance m p c)
    : CoercionMembership m p h c :=
  .schemeOfPhysicalRestraint hScheme




theorem coercionMembership_intro_abuseOfLegalProcess
    {m : Means} {p : Person} {h : Harm} {c : ComplaintText}
    (hAbuse : IsAbuseOrThreatenedAbuseOfLegalProcess m c)
    : CoercionMembership m p h c :=
  .abuseOfLegalProcess hAbuse



theorem coercionTerm_intro
    {m : Means} {p : Person} {h : Harm} {c : ComplaintText}
    (hDefn : CoercionMembership m p h c)
    (hTerm : IsCoercion m c)
    : CoercionTerm m p h c :=
  ⟨hDefn, hTerm⟩


theorem commercialSexActMembership_intro
    {a : Act} {p : Person} {c : ComplaintText}
    (hSexAct : IsSexAct a c)
    (hValue : AnythingOfValueGivenOrReceived a p c)
    (hTerm : IsCommercialSexAct a c)
    : CommercialSexActMembership a p c :=
  ⟨hSexAct, hValue, hTerm⟩


theorem participationInVentureMembership_intro
    {cond : Conduct} {v : Violation} {c : ComplaintText}
    (hAssists : KnowinglyAssistsSupportsOrFacilitates cond v c)
    (hViolation : IsViolationOfSubsectionA1 v c)
    (hTerm : IsParticipationInVenture cond c)
    : ParticipationInVentureMembership cond v c :=
  ⟨hAssists, hViolation, hTerm⟩


theorem ventureMembership_intro
    {v : Venture} {c : ComplaintText}
    (hTwoOrMore : HasTwoOrMoreIndividuals v c)
    (hAssoc : IsAssociatedInFact v c)
    (hTerm : IsVenture v c)
    : VentureMembership v c :=
  ⟨hTwoOrMore, hAssoc, hTerm⟩


theorem section1591a1TermUse_intro
    {m : Means} {a : Act} {c : ComplaintText}
    (hCoercion : IsCoercion m c)
    (hAct : IsCommercialSexAct a c)
    : Section1591a1TermUse m a c :=
  ⟨hCoercion, hAct⟩


theorem section1591a2TermUse_intro
    {cond : Conduct} {v : Venture} {a : Act} {c : ComplaintText}
    (hParticipation : IsParticipationInVenture cond c)
    (hVenture : IsVenture v c)
    (hAct : IsCommercialSexAct a c)
    : Section1591a2TermUse cond v a c :=
  ⟨hParticipation, hVenture, hAct⟩

end Proving.USC.T18.Ch77.Part4.Ontology
