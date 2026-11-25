















import Proving.USC.T18.Core.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Core.Ontology

open Proving.USC.Common





axiom IsEnterprise (e : Entity) (c : ComplaintText) : Prop




axiom IsPerson (p : Person) (c : ComplaintText) : Prop




axiom IsRacketeeringActivity (a : Act) (c : ComplaintText) : Prop





axiom IsPatternOfRacketeering (pat : Pattern) (c : ComplaintText) : Prop





axiom IsUnlawfulDebt (d : UnlawfulDebt) (c : ComplaintText) : Prop





axiom IsState (s : State) (c : ComplaintText) : Prop





axiom IsSection1962Violation (v : Section1962Violation) (c : ComplaintText) : Prop

end Proving.USC.T18.Core.Ontology
