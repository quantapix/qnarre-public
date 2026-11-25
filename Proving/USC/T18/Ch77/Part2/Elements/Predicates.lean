import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part2.Elements.Types

set_option autoImplicit false













namespace Proving.USC.T18.Ch77.Part2.Elements

open Proving.USC.Common







axiom PerformsEnumeratedTraffickingAct
    (p : Person) (v : Person) (a : TraffickingAct) (c : ComplaintText) : Prop





axiom TraffickingActIsAdvertising (a : TraffickingAct) (c : ComplaintText) : Prop





axiom InOrAffectingInterstateOrForeignCommerce
    (a : TraffickingAct) (c : ComplaintText) : Prop




axiom WithinSpecialMaritimeAndTerritorialJurisdiction
    (a : TraffickingAct) (c : ComplaintText) : Prop






axiom ReceivesBenefitOfValue (p : Person) (ven : Venture) (c : ComplaintText) : Prop





axiom AssistsSupportsOrFacilitatesViolation
    (p : Person) (ven : Venture) (c : ComplaintText) : Prop




axiom KnowsVentureViolatesParagraphOne
    (p : Person) (ven : Venture) (c : ComplaintText) : Prop




axiom VentureEngagedInParagraphOneAct (ven : Venture) (c : ComplaintText) : Prop




axiom IndividualsAssociatedInFact (ven : Venture) (c : ComplaintText) : Prop





axiom individualsAssociatedInVenture (ven : Venture) (c : ComplaintText) : Nat





axiom IsSexAct (s : SexAct) (c : ComplaintText) : Prop




axiom AnythingOfValueGivenOrReceivedForAct (s : SexAct) (c : ComplaintText) : Prop






axiom MeansWillBeUsedToCauseCommercialSexAct
    (v : Person) (m : CoerciveMeans) (s : SexAct) (c : ComplaintText) : Prop




axiom WillBeCausedToEngageInCommercialSexAct
    (v : Person) (s : SexAct) (c : ComplaintText) : Prop





axiom victimAgeYearsAtOffense (v : Person) (c : ComplaintText) : Nat





axiom KnowsAggravatingFact (p : Person) (c : ComplaintText) : Prop




axiom RecklesslyDisregardsAggravatingFact (p : Person) (c : ComplaintText) : Prop






axiom ProsecutedUnderParagraphOne (p : Person) (c : ComplaintText) : Prop





axiom ReasonableOpportunityToObserve (p : Person) (v : Person) (c : ComplaintText) : Prop





axiom UsesForce (m : CoerciveMeans) (c : ComplaintText) : Prop



axiom UsesThreatsOfForce (m : CoerciveMeans) (c : ComplaintText) : Prop



axiom UsesFraud (m : CoerciveMeans) (c : ComplaintText) : Prop




axiom ThreatensConsequenceAgainstPerson
    (m : CoerciveMeans) (v : Person) (c : ComplaintText) : Prop




axiom PhysicalRestraintAgainstPerson (v : Person) (c : ComplaintText) : Prop




axiom IsHarmPhysicalOrNonphysical (hm : Harm) (c : ComplaintText) : Prop






axiom SufficientToCompelReasonablePersonSimilarlySituated
    (hm : Harm) (v : Person) (c : ComplaintText) : Prop



axiom IsSchemePlanOrPattern (m : CoerciveMeans) (c : ComplaintText) : Prop





axiom IntendedToCauseBeliefFailureToPerformCausesConsequence
    (m : CoerciveMeans) (v : Person) (c : ComplaintText) : Prop




axiom UsesOrThreatensUseOfLawOrLegalProcess (m : CoerciveMeans) (c : ComplaintText) : Prop




axiom ForPurposeLawWasNotDesigned (m : CoerciveMeans) (c : ComplaintText) : Prop




axiom ExertsPressureToCauseActionOrInaction
    (m : CoerciveMeans) (v : Person) (c : ComplaintText) : Prop






axiom OffenseEffectedByProhibitedMeans
    (p : Person) (v : Person) (m : CoerciveMeans) (c : ComplaintText) : Prop





axiom ObstructsEnforcement (p : Person) (o : ObstructiveAct) (c : ComplaintText) : Prop



axiom AttemptsToObstructEnforcement
    (p : Person) (o : ObstructiveAct) (c : ComplaintText) : Prop




axiom InterferesWithOrPreventsEnforcement
    (p : Person) (o : ObstructiveAct) (c : ComplaintText) : Prop




axiom EnforcementOfThisSection (o : ObstructiveAct) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Part2.Elements
