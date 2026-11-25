




import Proving.USC.T18.Ch73.Reslice.Structure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch73.Reslice.Structure

open Proving.USC.Common





axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop





axiom TermDefinitionSupplied (t : DefinedTerm) (r : Ref) (c : ComplaintText) : Prop





axiom DefinitionScopeRespected (t : DefinedTerm) (r : Ref) (c : ComplaintText) : Prop




axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop







axiom ExceptionHonored (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop






axiom ParallelClauseReadsConsistently (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch73.Reslice.Structure
