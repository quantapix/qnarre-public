






import Proving.USC.Common.Types
import Proving.USC.T42.Ch6ASchI.Reslice.Structure.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reslice.Structure

open Proving.USC.Common







axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop







axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop







axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop







axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop






axiom SavingsClauseHonored (r : Ref) (c : ComplaintText) : Prop






axiom LexSpecialisControls (r : Ref) (c : ComplaintText) : Prop






axiom PreemptionScopeRespected (r : Ref) (c : ComplaintText) : Prop






axiom MutatisMutandisApplicationResolves (r : Ref) (c : ComplaintText) : Prop







axiom TargetEditoriallyDefective (sr : StatusedRef) (c : ComplaintText) : Prop








axiom PriorLawIncorporationPreserved (sr : StatusedRef) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Reslice.Structure
