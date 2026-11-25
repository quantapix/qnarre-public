






import Proving.USC.T18.Ch113B.Wmd.Part3.Structure.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part3.Structure

open Proving.USC.Common







axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop





axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop





axiom ConstraintHonored (r : Ref) (c : ComplaintText) : Prop







axiom CrossTitleReferenceResolves (r : Ref) (c : ComplaintText) : Prop






axiom ReferenceTargetIsCurrent (r : Ref) (c : ComplaintText) : Prop






axiom EnumeratedIncorporationsResolve (rs : List Ref) (c : ComplaintText) : Prop





axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop




axiom ExceptionHonored (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop




axiom SavingsClauseRespected (r : Ref) (c : ComplaintText) : Prop






axiom JurisdictionalCircumstanceAttaches (r : Ref) (c : ComplaintText) : Prop





axiom AdoptedStateLawElementsOnly (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Wmd.Part3.Structure
