











import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T29.MiscProvisions.Elements.Types

namespace Proving.USC.T29.MiscProvisions.Elements

open Proving.USC.Common








axiom ExercisesRightToStrike (p : Person) (a : ConcertedAction) (c : ComplaintText) : Prop





axiom RightToStrikePreserved (a : ConcertedAction) (c : ComplaintText) : Prop







axiom IsSupervisor (p : Person) (c : ComplaintText) : Prop






axiom StateLawProhibitsUnionSecurity (u : UnionSecurityArrangement) (c : ComplaintText) : Prop






axiom BoardMayDeclineJurisdiction (e : Entity) (c : ComplaintText) : Prop







axiom BoardActionNotInvalidated (b : BoardAction) (c : ComplaintText) : Prop








axiom HoldsBonaFideReligiousObjection (p : Person) (c : ComplaintText) : Prop





axiom DemandsUnionSupportAsCondition (p : Person) (u : UnionSecurityArrangement) (c : ComplaintText) : Prop







axiom CharitableSubstitutionSatisfied (p : Person) (u : UnionSecurityArrangement) (c : ComplaintText) : Prop

end Proving.USC.T29.MiscProvisions.Elements
