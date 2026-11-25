






import Proving.USC.T18.Elements.Types

namespace Proving.USC.T18.Elements
open Proving.USC.Common



axiom CulpablePersonCapableOfIntent (p : Person) (c : ComplaintText) : Prop


axiom IsEnterprise (e : Entity) (c : ComplaintText) : Prop


axiom EngagedInInterstateCommerce (e : Entity) (c : ComplaintText) : Prop


axiom PersonEnterpriseDistinct (p : Person) (e : Entity) (c : ComplaintText) : Prop


axiom EmployedOrAssociated (p : Person) (e : Entity) (c : ComplaintText) : Prop


axiom ConductsOrParticipates (p : Person) (e : Entity) (c : ComplaintText) : Prop


axiom PatternOfRacketeering (acts : List Act) (c : ComplaintText) : Prop

end Proving.USC.T18.Elements
