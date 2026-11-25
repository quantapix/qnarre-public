







import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part5.Ontology.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part5.Ontology

open Proving.USC.Common






axiom IsUseOrThreatenedUseOfLawOrLegalProcess (u : LegalProcessAbuse)
    (c : ComplaintText) : Prop




axiom ForPurposeLawWasNotDesigned (u : LegalProcessAbuse)
    (c : ComplaintText) : Prop





axiom ExertsPressureToCauseActionOrInaction (u : LegalProcessAbuse)
    (c : ComplaintText) : Prop




axiom IsAbuseOrThreatenedAbuseOfLegalProcess (u : LegalProcessAbuse)
    (c : ComplaintText) : Prop







axiom ThreatensSeriousHarmToPerson (m : CoerciveMeans) (h : HarmInstance)
    (p : Person) (c : ComplaintText) : Prop




axiom ThreatensPhysicalRestraintAgainstPerson (m : CoerciveMeans) (p : Person)
    (c : ComplaintText) : Prop




axiom IsSchemePlanOrPattern (m : CoerciveMeans) (c : ComplaintText) : Prop





axiom IntendedToCauseBeliefOfSeriousHarmOrRestraint (m : CoerciveMeans)
    (h : HarmInstance) (c : ComplaintText) : Prop





axiom MeansConsistsOfLegalProcessAbuse (m : CoerciveMeans)
    (u : LegalProcessAbuse) (c : ComplaintText) : Prop




axiom IsCoercion (m : CoerciveMeans) (c : ComplaintText) : Prop






axiom IsSexAct (a : SexAct) (c : ComplaintText) : Prop





axiom IsThingOfValue (v : ThingOfValue) (c : ComplaintText) : Prop




axiom ThingOfValueGivenOrReceivedOnAccountOf (v : ThingOfValue) (a : SexAct)
    (p : Person) (c : ComplaintText) : Prop



axiom IsCommercialSexAct (a : SexAct) (c : ComplaintText) : Prop






axiom KnowinglyAssistsSupportsOrFacilitates (x : VentureParticipation)
    (c : ComplaintText) : Prop






axiom AssistsViolationOfSubsectionA1 (x : VentureParticipation)
    (c : ComplaintText) : Prop



axiom IsParticipationInAVenture (x : VentureParticipation)
    (c : ComplaintText) : Prop






axiom IsHarmPhysicalOrNonphysical (h : HarmInstance) (c : ComplaintText) : Prop






axiom SufficientlySeriousToCompelReasonablePerson (h : HarmInstance)
    (p : Person) (c : ComplaintText) : Prop



axiom IsSeriousHarm (h : HarmInstance) (c : ComplaintText) : Prop






axiom HasTwoOrMoreIndividuals (v : Venture) (c : ComplaintText) : Prop




axiom AssociatedInFact (v : Venture) (c : ComplaintText) : Prop







axiom IsLegalEntity (v : Venture) (c : ComplaintText) : Prop



axiom IsVenture (v : Venture) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Part5.Ontology
