






import Proving.USC.T18.Ontology.Types

namespace Proving.USC.T18.Ontology
open Proving.USC.Common



axiom IsPerson (p : Person) (c : ComplaintText) : Prop


axiom IsEnterprise (e : Entity) (c : ComplaintText) : Prop


axiom IsRacketeeringActivity (c : ComplaintText) : Prop


axiom IsPatternOfRacketeering (c : ComplaintText) : Prop

end Proving.USC.T18.Ontology
