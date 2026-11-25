










import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part5.Ontology.Types
import Proving.USC.T18.Ch77.Part5.Ontology.Predicates
import Proving.USC.T18.Ch77.Part5.Ontology.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part5.Ontology

open Proving.USC.Common



theorem abuseOfLegalProcessMembership_intro
    {u : LegalProcessAbuse} {c : ComplaintText}
    (useOrThreat : IsUseOrThreatenedUseOfLawOrLegalProcess u c)
    (purposeNotDesigned : ForPurposeLawWasNotDesigned u c)
    (pressure : ExertsPressureToCauseActionOrInaction u c)
    (member : IsAbuseOrThreatenedAbuseOfLegalProcess u c) :
    AbuseOfLegalProcessMembership u c :=
  ⟨useOrThreat, purposeNotDesigned, pressure, member⟩


theorem coercionMembership_intro_threatOfSeriousHarm
    {m : CoerciveMeans} {c : ComplaintText} {h : HarmInstance} {p : Person}
    (threat : ThreatensSeriousHarmToPerson m h p c)
    (serious : IsSeriousHarm h c)
    (member : IsCoercion m c) :
    CoercionMembership m c :=
  .threatOfSeriousHarm h p threat serious member


theorem coercionMembership_intro_physicalRestraint
    {m : CoerciveMeans} {c : ComplaintText} {p : Person}
    (restraint : ThreatensPhysicalRestraintAgainstPerson m p c)
    (member : IsCoercion m c) :
    CoercionMembership m c :=
  .physicalRestraint p restraint member



theorem coercionMembership_intro_schemePlanOrPattern
    {m : CoerciveMeans} {c : ComplaintText} {h : HarmInstance}
    (scheme : IsSchemePlanOrPattern m c)
    (belief : IntendedToCauseBeliefOfSeriousHarmOrRestraint m h c)
    (serious : IsSeriousHarm h c)
    (member : IsCoercion m c) :
    CoercionMembership m c :=
  .schemePlanOrPattern h scheme belief serious member


theorem coercionMembership_intro_abuseOfLegalProcess
    {m : CoerciveMeans} {c : ComplaintText} {u : LegalProcessAbuse}
    (consists : MeansConsistsOfLegalProcessAbuse m u c)
    (abuse : IsAbuseOrThreatenedAbuseOfLegalProcess u c)
    (member : IsCoercion m c) :
    CoercionMembership m c :=
  .abuseOfLegalProcess u consists abuse member



theorem coercionMembership_intro_fromAbuseMembership
    {m : CoerciveMeans} {c : ComplaintText} {u : LegalProcessAbuse}
    (hAbuse : AbuseOfLegalProcessMembership u c)
    (consists : MeansConsistsOfLegalProcessAbuse m u c)
    (member : IsCoercion m c) :
    CoercionMembership m c :=
  .abuseOfLegalProcess u consists hAbuse.member member




theorem coercionMembership_intro_fromSeriousHarmMembership
    {m : CoerciveMeans} {c : ComplaintText} {h : HarmInstance} {p : Person}
    (hHarm : SeriousHarmMembership h p c)
    (threat : ThreatensSeriousHarmToPerson m h p c)
    (member : IsCoercion m c) :
    CoercionMembership m c :=
  .threatOfSeriousHarm h p threat hHarm.member member



theorem commercialSexActMembership_intro
    {a : SexAct} {v : ThingOfValue} {p : Person} {c : ComplaintText}
    (sexAct : IsSexAct a c)
    (valueItem : IsThingOfValue v c)
    (onAccountOf : ThingOfValueGivenOrReceivedOnAccountOf v a p c)
    (member : IsCommercialSexAct a c) :
    CommercialSexActMembership a v p c :=
  ⟨sexAct, valueItem, onAccountOf, member⟩



theorem participationInVentureMembership_intro
    {x : VentureParticipation} {c : ComplaintText}
    (knowingAssistance : KnowinglyAssistsSupportsOrFacilitates x c)
    (underlyingViolation : AssistsViolationOfSubsectionA1 x c)
    (member : IsParticipationInAVenture x c) :
    ParticipationInVentureMembership x c :=
  ⟨knowingAssistance, underlyingViolation, member⟩



theorem seriousHarmMembership_intro
    {h : HarmInstance} {p : Person} {c : ComplaintText}
    (harm : IsHarmPhysicalOrNonphysical h c)
    (compels : SufficientlySeriousToCompelReasonablePerson h p c)
    (member : IsSeriousHarm h c) :
    SeriousHarmMembership h p c :=
  ⟨harm, compels, member⟩



theorem ventureMembership_intro
    {v : Venture} {c : ComplaintText}
    (twoOrMore : HasTwoOrMoreIndividuals v c)
    (associatedInFact : AssociatedInFact v c)
    (member : IsVenture v c) :
    VentureMembership v c :=
  ⟨twoOrMore, associatedInFact, member⟩





theorem ventureMembership_intro_irrespectiveOfLegalEntity
    {v : Venture} {c : ComplaintText}
    (twoOrMore : HasTwoOrMoreIndividuals v c)
    (associatedInFact : AssociatedInFact v c)
    (member : IsVenture v c)
    (_entityStatus : IsLegalEntity v c ∨ ¬ IsLegalEntity v c) :
    VentureMembership v c :=
  ⟨twoOrMore, associatedInFact, member⟩

end Proving.USC.T18.Ch77.Part5.Ontology
