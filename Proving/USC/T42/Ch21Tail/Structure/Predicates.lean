import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.Ch21Tail.Structure.Types

set_option autoImplicit false











namespace Proving.USC.T42.Ch21Tail.Structure

open Proving.USC.Common





axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop






axiom SavingsClausePreserved (r : Ref) (c : ComplaintText) : Prop






axiom ReportedConditionWithinSubchapterScope (c : ComplaintText) : Prop





axiom InstitutionCoveredBySubchapter (e : Entity) (c : ComplaintText) : Prop






axiom ConstitutionalOrFederalRightsReferenceResolves (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21Tail.Structure
