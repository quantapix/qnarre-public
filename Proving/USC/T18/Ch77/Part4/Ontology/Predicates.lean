









import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part4.Ontology.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.Ontology

open Proving.USC.Common






axiom IsAbuseOrThreatenedAbuseOfLegalProcess (m : Means) (c : ComplaintText) : Prop




axiom IsUseOrThreatenedUseOfLegalProcess (m : Means) (c : ComplaintText) : Prop




axiom IsPurposeLawNotDesignedFor (m : Means) (c : ComplaintText) : Prop





axiom ExertsPressureOnAnotherPerson (m : Means) (p : Person) (c : ComplaintText) : Prop






axiom IsCoercion (m : Means) (c : ComplaintText) : Prop




axiom ThreatensSeriousHarmToPerson (m : Means) (p : Person) (h : Harm) (c : ComplaintText) : Prop




axiom ThreatensPhysicalRestraintAgainstPerson (m : Means) (p : Person) (c : ComplaintText) : Prop





axiom SchemeInducingBeliefOfHarmFromNonperformance
    (m : Means) (p : Person) (h : Harm) (c : ComplaintText) : Prop





axiom SchemeInducingBeliefOfRestraintFromNonperformance
    (m : Means) (p : Person) (c : ComplaintText) : Prop






axiom IsCommercialSexAct (a : Act) (c : ComplaintText) : Prop




axiom IsSexAct (a : Act) (c : ComplaintText) : Prop




axiom AnythingOfValueGivenOrReceived (a : Act) (p : Person) (c : ComplaintText) : Prop






axiom IsParticipationInVenture (cond : Conduct) (c : ComplaintText) : Prop




axiom KnowinglyAssistsSupportsOrFacilitates
    (cond : Conduct) (v : Violation) (c : ComplaintText) : Prop




axiom IsViolationOfSubsectionA1 (v : Violation) (c : ComplaintText) : Prop






axiom IsSeriousHarm (h : Harm) (c : ComplaintText) : Prop




axiom IsHarmPhysicalOrNonphysical (h : Harm) (c : ComplaintText) : Prop







axiom CompelsReasonablePersonToPerformCommercialSexualActivity
    (h : Harm) (c : ComplaintText) : Prop






axiom IsVenture (v : Venture) (c : ComplaintText) : Prop




axiom HasTwoOrMoreIndividuals (v : Venture) (c : ComplaintText) : Prop





axiom IsAssociatedInFact (v : Venture) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Part4.Ontology
