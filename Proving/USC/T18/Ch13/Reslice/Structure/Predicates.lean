import Proving.USC.T18.Ch13.Reslice.Structure.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false









namespace Proving.USC.T18.Ch13.Reslice.Structure

open Proving.USC.Common






axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop







axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop








axiom SubjectToConstraintSatisfied (r : Ref) (c : ComplaintText) : Prop









axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop





axiom ExceptionHonored (r : Ref) (c : ComplaintText) : Prop







axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop





axiom OverrideHonored (r : Ref) (c : ComplaintText) : Prop










axiom SavingsClausePreserved (r : Ref) (c : ComplaintText) : Prop






axiom LexSpecialisControls (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch13.Reslice.Structure
