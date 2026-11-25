




import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch75.Reslice.Structure.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch75.Reslice.Structure

open Proving.USC.Common






axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop





axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop





axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop






axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop








axiom DefinitionScopeReachesReferrer (r : Ref) (c : ComplaintText) : Prop






axiom CrossTitleReferenceResolves (r : Ref) (c : ComplaintText) : Prop








axiom ExternalAuthorityIdentified (r : Ref) (c : ComplaintText) : Prop







axiom ConflictingProvisionsReconciled (r : Ref) (c : ComplaintText) : Prop





axiom SavingsClausePreservesActivity (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch75.Reslice.Structure
