






import Proving.USC.T18.Ch77.Part2.Ontology.Types
import Proving.USC.T18.Ch77.Part2.Ontology.Predicates
import Proving.USC.T18.Ch77.Part2.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part2.Ontology

open Proving.USC.Common


theorem abuseOfLegalProcessMembership_intro
    {a : AbuseOfLegalProcess} {lp : LegalProcess} {p : Person} {c : ComplaintText}
    (hMember : IsAbuseOrThreatenedAbuseOfLegalProcess a c)
    (hProcess : IsLawOrLegalProcess lp c)
    (hNotAsDesigned : UsedForPurposeNotDesigned a lp c)
    (hPressure : ExertsPressureOnAnotherPerson a p c) :
    AbuseOfLegalProcessMembership a lp p c :=
  ⟨hMember, hProcess, hNotAsDesigned, hPressure⟩


theorem coercionRoute_intro
    {x : Coercion} {h : SeriousHarm} {a : AbuseOfLegalProcess} {c : ComplaintText}
    (hSeriousHarm : IsSeriousHarm h c) (hThreat : ThreatensSeriousHarm x h c) :
    CoercionRoute x h a c :=
  CoercionRoute.threatOfSeriousHarm hSeriousHarm hThreat


theorem coercionRoute_intro_physicalRestraint
    {x : Coercion} {h : SeriousHarm} {a : AbuseOfLegalProcess} {c : ComplaintText}
    (hRestraint : ThreatensOrAppliesPhysicalRestraint x c) :
    CoercionRoute x h a c :=
  CoercionRoute.physicalRestraint hRestraint


theorem coercionRoute_intro_schemeOfSeriousHarm
    {x : Coercion} {h : SeriousHarm} {a : AbuseOfLegalProcess} {c : ComplaintText}
    (hSeriousHarm : IsSeriousHarm h c)
    (hScheme : SchemeInducingBeliefOfSeriousHarm x h c) :
    CoercionRoute x h a c :=
  CoercionRoute.schemeOfSeriousHarm hSeriousHarm hScheme


theorem coercionRoute_intro_schemeOfPhysicalRestraint
    {x : Coercion} {h : SeriousHarm} {a : AbuseOfLegalProcess} {c : ComplaintText}
    (hScheme : SchemeInducingBeliefOfPhysicalRestraint x c) :
    CoercionRoute x h a c :=
  CoercionRoute.schemeOfPhysicalRestraint hScheme



theorem coercionRoute_intro_abuseOfLegalProcess
    {x : Coercion} {h : SeriousHarm} {a : AbuseOfLegalProcess} {c : ComplaintText}
    (hAbuse : IsAbuseOrThreatenedAbuseOfLegalProcess a c) :
    CoercionRoute x h a c :=
  CoercionRoute.abuseOfLegalProcess hAbuse


theorem coercionMembership_intro
    {x : Coercion} {h : SeriousHarm} {a : AbuseOfLegalProcess} {c : ComplaintText}
    (hMember : IsCoercion x c) (hRoute : CoercionRoute x h a c) :
    CoercionMembership x h a c :=
  ⟨hMember, hRoute⟩


theorem commercialSexActMembership_intro
    {x : CommercialSexAct} {sa : SexAct} {v : ThingOfValue} {p : Person}
    {c : ComplaintText}
    (hMember : IsCommercialSexAct x c) (hSexAct : IsSexAct sa c)
    (hValue : IsAnythingOfValue v c)
    (hOnAccountOf : ValueGivenOrReceivedOnAccountOfSexAct x sa v p c) :
    CommercialSexActMembership x sa v p c :=
  ⟨hMember, hSexAct, hValue, hOnAccountOf⟩


theorem participationInVentureMembership_intro
    {x : ParticipationInVenture} {t : TraffickingConduct} {c : ComplaintText}
    (hMember : IsParticipationInVenture x c)
    (hKnowingly : KnowinglyAssistsSupportsOrFacilitates x t c)
    (hViolation : IsViolationOfSubsectionA1 t c) :
    ParticipationInVentureMembership x t c :=
  ⟨hMember, hKnowingly, hViolation⟩


theorem seriousHarmMembership_intro
    {h : SeriousHarm} {p : Person} {c : ComplaintText}
    (hMember : IsSeriousHarm h c) (hHarm : IsHarmPhysicalOrNonphysical h c)
    (hCompels : CompelsReasonablePersonToPerformCommercialSexualActivity h p c) :
    SeriousHarmMembership h p c :=
  ⟨hMember, hHarm, hCompels⟩




theorem ventureMembership_intro
    {v : Venture} {c : ComplaintText}
    (hMember : IsVenture v c) (hCount : 2 ≤ individualsInVenture v c)
    (hInFact : AssociatedInFact v c) :
    VentureMembership v c :=
  ⟨hMember, hCount, hInFact⟩





theorem ventureMembership_intro_nonEntity
    {v : Venture} {c : ComplaintText}
    (hMember : IsVenture v c) (hCount : 2 ≤ individualsInVenture v c)
    (hInFact : AssociatedInFact v c) (_hNotEntity : ¬ IsLegalEntity v c) :
    VentureMembership v c :=
  ⟨hMember, hCount, hInFact⟩


theorem section1591a1TermUsage_intro
    {x : Coercion} {h : SeriousHarm} {a : AbuseOfLegalProcess}
    {csa : CommercialSexAct} {sa : SexAct} {val : ThingOfValue} {p : Person}
    {c : ComplaintText}
    (hCoercion : CoercionMembership x h a c)
    (hCsa : CommercialSexActMembership csa sa val p c) :
    Section1591a1TermUsage x h a csa sa val p c :=
  ⟨hCoercion, hCsa⟩


theorem section1591a2TermUsage_intro
    {pv : ParticipationInVenture} {v : Venture} {t : TraffickingConduct}
    {c : ComplaintText}
    (hVenture : VentureMembership v c)
    (hParticipation : ParticipationInVentureMembership pv t c) :
    Section1591a2TermUsage pv v t c :=
  ⟨hVenture, hParticipation⟩

end Proving.USC.T18.Ch77.Part2.Ontology
