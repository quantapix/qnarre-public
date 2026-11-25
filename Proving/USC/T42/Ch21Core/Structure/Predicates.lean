






import Proving.USC.T42.Ch21Core.Structure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch21Core.Structure

open Proving.USC.Common





axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop






axiom SubordinationRespected (r : Ref) (c : ComplaintText) : Prop







axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop





axiom SavingsClausePreserved (r : Ref) (c : ComplaintText) : Prop






axiom LexSpecialisControls (r : Ref) (c : ComplaintText) : Prop









axiom CrossTitleReferenceResolves (r : Ref) (c : ComplaintText) : Prop





axiom DefinitionalScopeRespected (r : Ref) (c : ComplaintText) : Prop






axiom EnumeratedIncorporationMembership (r : Ref) (c : ComplaintText) : Prop







axiom DisclaimerScopeHonored (r : Ref) (c : ComplaintText) : Prop







axiom OpenEndedIncorporationIdentified (r : Ref) (c : ComplaintText) : Prop







axiom EditorialDefectReadingApplied (locus : Cite) (reading : String)
    (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21Core.Structure
