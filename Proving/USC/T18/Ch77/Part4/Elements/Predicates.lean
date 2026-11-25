import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part4.Elements.Types

set_option autoImplicit false














namespace Proving.USC.T18.Ch77.Part4.Elements

open Proving.USC.Common






axiom PerformsProhibitedTraffickingAct
    (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop





axiom ViolationActIsAdvertising (act : TraffickingAct) (c : ComplaintText) : Prop




axiom InOrAffectingInterstateOrForeignCommerce
    (act : TraffickingAct) (c : ComplaintText) : Prop




axiom WithinSpecialMaritimeAndTerritorialJurisdiction
    (act : TraffickingAct) (c : ComplaintText) : Prop






axiom BenefitsFinanciallyOrReceivesValue
    (d : Person) (ven : Venture) (c : ComplaintText) : Prop





axiom ventureMemberCount (ven : Venture) (c : ComplaintText) : Nat




axiom MembersAssociatedInFact (ven : Venture) (c : ComplaintText) : Prop




axiom ParticipatesInVenture (d : Person) (ven : Venture) (c : ComplaintText) : Prop




axiom VentureEngagedInParagraphOneAct
    (ven : Venture) (act : TraffickingAct) (c : ComplaintText) : Prop







axiom KnowsMeansWillBeUsed (d : Person) (v : Person) (c : ComplaintText) : Prop






axiom RecklesslyDisregardsMeansWillBeUsed
    (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom KnowsVictimUnderageAndWillBeCaused
    (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom RecklesslyDisregardsVictimUnderageAndWillBeCaused
    (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom HadReasonableOpportunityToObserve
    (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom WillBeCausedToEngageInCommercialSexAct (v : Person) (c : ComplaintText) : Prop





axiom victimAgeYearsAtOffense (v : Person) (c : ComplaintText) : Nat





axiom UsesForce (d : Person) (v : Person) (c : ComplaintText) : Prop



axiom ThreatensForce (d : Person) (v : Person) (c : ComplaintText) : Prop



axiom UsesFraud (d : Person) (v : Person) (c : ComplaintText) : Prop



axiom ThreatensSeriousHarmToAnyPerson
    (d : Person) (v : Person) (c : ComplaintText) : Prop



axiom ThreatensOrUsesPhysicalRestraint
    (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom EmploysSchemeCausingBeliefOfSeriousHarm
    (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom HarmThreatenedOrInflicted (v : Person) (c : ComplaintText) : Prop






axiom SufficientlySeriousToCompelReasonablePerson
    (v : Person) (c : ComplaintText) : Prop




axiom UsesOrThreatensLegalProcess (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom UsesLegalProcessForPurposeNotDesigned
    (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom ExertsPressureToCauseOrPreventAction
    (d : Person) (v : Person) (c : ComplaintText) : Prop







axiom OffenseEffectedByThoseMeans (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom VictimSubjectOfEnumeratedActUnderSubsectionB
    (d : Person) (act : TraffickingAct) (v : Person) (c : ComplaintText) : Prop





axiom ObstructsEnforcement (d : Person) (oact : ObstructionAct) (c : ComplaintText) : Prop




axiom AttemptsToObstructEnforcement
    (d : Person) (oact : ObstructionAct) (c : ComplaintText) : Prop




axiom InterferesWithOrPreventsEnforcement
    (d : Person) (oact : ObstructionAct) (c : ComplaintText) : Prop





axiom TargetsEnforcementOfSection1591 (oact : ObstructionAct) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Part4.Elements
