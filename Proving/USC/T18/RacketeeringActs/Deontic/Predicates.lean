













import Proving.USC.T18.RacketeeringActs.Deontic.Types

namespace Proving.USC.T18.RacketeeringActs.Deontic

open Proving.USC.Common













axiom IsEnumeratedRacketeeringOffense (o : Offense) (c : ComplaintText) : Prop











axiom WhoeverAddressee (p : Person) (c : ComplaintText) : Prop




axiom ObstructedOrAffectedCommerce (p : Person) (c : ComplaintText) : Prop





axiom ByRobbery (p : Person) (c : ComplaintText) : Prop





axiom ByExtortion (p : Person) (c : ComplaintText) : Prop













axiom TraveledOrUsedInterstateFacility (p : Person) (c : ComplaintText) : Prop






axiom IntentToAidUnlawfulActivity (p : Person) (c : ComplaintText) : Prop






axiom IsUnlawfulActivity (p : Person) (c : ComplaintText) : Prop















axiom ConductedFinancialTransaction (p : Person) (t : Transaction) (c : ComplaintText) : Prop





axiom KnewProceedsUnlawful (p : Person) (t : Transaction) (c : ComplaintText) : Prop






axiom InvolvedSpecifiedUnlawfulActivity (t : Transaction) (c : ComplaintText) : Prop





axiom IntentToPromoteSUA (p : Person) (t : Transaction) (c : ComplaintText) : Prop





axiom DesignedToConceal (p : Person) (t : Transaction) (c : ComplaintText) : Prop





axiom DesignedToAvoidReporting (p : Person) (t : Transaction) (c : ComplaintText) : Prop















axiom EngagedInMonetaryTransaction (p : Person) (t : Transaction) (c : ComplaintText) : Prop





axiom IsCriminallyDerivedProperty (t : Transaction) (c : ComplaintText) : Prop





axiom Section1957CircumstanceMet (p : Person) (c : ComplaintText) : Prop





axiom TransactedPropertyValue (t : Transaction) (c : ComplaintText) : Nat

end Proving.USC.T18.RacketeeringActs.Deontic
