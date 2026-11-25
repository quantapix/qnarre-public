







import Proving.USC.T42.EqualRights.Reslice.Structure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Reslice.Structure

open Proving.USC.Common






axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom CrossReferenceResolvable (r : Ref) : Prop







axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop







axiom SubordinationSatisfied (r : Ref) (c : ComplaintText) : Prop







axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop









axiom ExceptionHonored (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop





axiom SavingsClauseRespected (r : Ref) (c : ComplaintText) : Prop





axiom EnforcementProceedingUnder (r : Ref) (p : EnforcementProceeding)
    (c : ComplaintText) : Prop








axiom DefinedTermCarriesBorrowedMeaning (t : IncorporatedTerm) (r : Ref)
    (c : ComplaintText) : Prop

end Proving.USC.T42.EqualRights.Reslice.Structure
