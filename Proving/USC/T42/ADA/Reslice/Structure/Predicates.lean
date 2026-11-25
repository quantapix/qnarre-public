






import Proving.USC.T42.ADA.Reslice.Structure.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.ADA.Reslice.Structure

open Proving.USC.Common








axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop





axiom TermDefinedInReferencedSection (t : BorrowedTerm) (r : Ref) (c : ComplaintText) : Prop







axiom InternalCrossReferenceResolves (r : Ref) (c : ComplaintText) : Prop







axiom EnclosingScopeReferenceResolves (r : Ref) (c : ComplaintText) : Prop






axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop






axiom SubjectToConstraintSatisfied (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T42.ADA.Reslice.Structure
