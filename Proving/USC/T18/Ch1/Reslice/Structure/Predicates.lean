








import Proving.USC.T18.Ch1.Reslice.Structure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1.Reslice.Structure

open Proving.USC.Common





axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop








axiom ReferenceDangling (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop






axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop






axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop






axiom SavingsClausePreserves (r : Ref) (c : ComplaintText) : Prop







axiom DefinitionScopeHonored (r : Ref) (c : ComplaintText) : Prop







axiom LexSpecialisControls (r : Ref) (c : ComplaintText) : Prop






axiom EditorialCorrectionApplied (n : EditorialNote) (c : ComplaintText) : Prop













axiom dangling_excludes_existence (r : Ref) (c : ComplaintText) :
    ReferenceDangling r c → ¬ ReferencedSectionExists r c







axiom expressException_displaces_s23Scope (c : ComplaintText) :
    ExceptionApplies edge_23_exceptAsProvided_open c →
    ¬ DefinitionScopeHonored edge_title18_incorporates_23 c

end Proving.USC.T18.Ch1.Reslice.Structure
