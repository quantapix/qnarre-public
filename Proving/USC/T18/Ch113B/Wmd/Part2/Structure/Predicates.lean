import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch113B.Wmd.Part2.Structure.Types








set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Structure

open Proving.USC.Common





axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop









axiom ReferencedSubdivisionExists (r : Ref) (c : ComplaintText) : Prop






axiom InternalCrossReferenceResolves (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop









axiom ReferenceScopeIsCoextensive (r : Ref) (c : ComplaintText) : Prop





axiom EnumeratedRosterFullyResolves (r : Ref) (c : ComplaintText) : Prop







axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop





axiom SavingsClausePreserved (r : Ref) (c : ComplaintText) : Prop






axiom PenaltyPrescriptionCoversConduct (r : Ref) (c : ComplaintText) : Prop






axiom AdoptedStateLawLimitedToElements (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Wmd.Part2.Structure
