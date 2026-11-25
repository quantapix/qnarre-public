







import Proving.USC.T18.Ch77.Part2.Ontology.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part2.Ontology

open Proving.USC.Common






axiom IsAbuseOrThreatenedAbuseOfLegalProcess
    (a : AbuseOfLegalProcess) (c : ComplaintText) : Prop




axiom IsLawOrLegalProcess (lp : LegalProcess) (c : ComplaintText) : Prop





axiom UsedForPurposeNotDesigned
    (a : AbuseOfLegalProcess) (lp : LegalProcess) (c : ComplaintText) : Prop




axiom ExertsPressureOnAnotherPerson
    (a : AbuseOfLegalProcess) (p : Person) (c : ComplaintText) : Prop






axiom IsCoercion (x : Coercion) (c : ComplaintText) : Prop



axiom ThreatensSeriousHarm
    (x : Coercion) (h : SeriousHarm) (c : ComplaintText) : Prop





axiom ThreatensOrAppliesPhysicalRestraint (x : Coercion) (c : ComplaintText) : Prop





axiom SchemeInducingBeliefOfSeriousHarm
    (x : Coercion) (h : SeriousHarm) (c : ComplaintText) : Prop





axiom SchemeInducingBeliefOfPhysicalRestraint
    (x : Coercion) (c : ComplaintText) : Prop






axiom IsCommercialSexAct (x : CommercialSexAct) (c : ComplaintText) : Prop




axiom IsSexAct (sa : SexAct) (c : ComplaintText) : Prop




axiom IsAnythingOfValue (v : ThingOfValue) (c : ComplaintText) : Prop




axiom ValueGivenOrReceivedOnAccountOfSexAct
    (x : CommercialSexAct) (sa : SexAct) (v : ThingOfValue) (p : Person)
    (c : ComplaintText) : Prop






axiom IsParticipationInVenture (x : ParticipationInVenture) (c : ComplaintText) : Prop




axiom KnowinglyAssistsSupportsOrFacilitates
    (x : ParticipationInVenture) (t : TraffickingConduct) (c : ComplaintText) : Prop




axiom IsViolationOfSubsectionA1 (t : TraffickingConduct) (c : ComplaintText) : Prop






axiom IsSeriousHarm (h : SeriousHarm) (c : ComplaintText) : Prop




axiom IsHarmPhysicalOrNonphysical (h : SeriousHarm) (c : ComplaintText) : Prop






axiom CompelsReasonablePersonToPerformCommercialSexualActivity
    (h : SeriousHarm) (p : Person) (c : ComplaintText) : Prop






axiom IsVenture (v : Venture) (c : ComplaintText) : Prop



axiom AssociatedInFact (v : Venture) (c : ComplaintText) : Prop






axiom IsLegalEntity (v : Venture) (c : ComplaintText) : Prop





axiom individualsInVenture (v : Venture) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch77.Part2.Ontology
