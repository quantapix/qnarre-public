














import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.RacketeeringActs.Elements.Types

namespace Proving.USC.T18.RacketeeringActs.Elements

open Proving.USC.Common







axiom ActIsEnumeratedRacketeering (a : Act) (c : ComplaintText) : Prop




axiom ActsRelated (acts : List Act) (c : ComplaintText) : Prop




axiom ActsContinuous (acts : List Act) (c : ComplaintText) : Prop




axiom PredicateActCount (acts : List Act) (c : ComplaintText) : Nat




axiom PredicateActSpanDays (acts : List Act) (c : ComplaintText) : Nat






axiom IsRobbery (a : Act) (c : ComplaintText) : Prop




axiom IsExtortion (a : Act) (c : ComplaintText) : Prop





axiom AffectsCommerce (a : Act) (c : ComplaintText) : Prop






axiom TravelsOrUsesFacility (a : Act) (c : ComplaintText) : Prop





axiom PromotesUnlawfulActivity (a : Act) (c : ComplaintText) : Prop





axiom TravelActIntent (a : Act) (c : ComplaintText) : Prop




axiom PerformsOvertAct (a : Act) (c : ComplaintText) : Prop








axiom ConductsFinancialTransaction (t : Txn) (c : ComplaintText) : Prop






axiom InvolvesProceeds (pr : Property) (c : ComplaintText) : Prop





axiom DerivedFromSpecifiedUnlawfulActivity (pr : Property) (c : ComplaintText) : Prop








axiom EngagesMonetaryTransaction (t : Txn) (c : ComplaintText) : Prop





axiom IsCriminallyDerivedProperty (pr : Property) (c : ComplaintText) : Prop





axiom CdpDerivedFromSpecifiedUnlawfulActivity (pr : Property) (c : ComplaintText) : Prop





axiom TransactionValueDollars (t : Txn) (c : ComplaintText) : Nat




axiom Section1957Jurisdiction (t : Txn) (c : ComplaintText) : Prop

end Proving.USC.T18.RacketeeringActs.Elements
