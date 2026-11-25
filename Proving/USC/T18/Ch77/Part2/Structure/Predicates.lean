import Proving.USC.T18.Ch77.Part2.Structure.Types

set_option autoImplicit false













namespace Proving.USC.T18.Ch77.Part2.Structure

open Proving.USC.Common





axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop





axiom SubsectionReferenceResolves (r : Ref) (c : ComplaintText) : Prop





axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop





axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop




axiom ExceptionHonored (r : Ref) (c : ComplaintText) : Prop






axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop





axiom DefinedTermIsUsed (t : DefinedTerm) (c : ComplaintText) : Prop





axiom danglingReferenceCount (c : ComplaintText) : Nat

end Proving.USC.T18.Ch77.Part2.Structure
