






import Proving.USC.T20.Ch38.Reearn.Structure.Types

set_option autoImplicit false

namespace Proving.USC.T20.Ch38.Reearn.Structure

open Proving.USC.Common




axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop





axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop




axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop






axiom ExceptionHonored (r : Ref) (c : ComplaintText) : Prop




axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop




axiom SavingsClauseRespected (r : Ref) (c : ComplaintText) : Prop




axiom CrossTitleReferenceResolves (r : Ref) (c : ComplaintText) : Prop




axiom DefinitionalScopeSatisfied (r : Ref) (c : ComplaintText) : Prop




axiom LexSpecialisControls (r : Ref) (c : ComplaintText) : Prop







axiom OpenReferenceClassIdentified (r : Ref) (c : ComplaintText) : Prop






axiom danglingReferenceCount (c : ComplaintText) : Nat

end Proving.USC.T20.Ch38.Reearn.Structure
