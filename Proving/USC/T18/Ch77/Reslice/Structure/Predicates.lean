import Proving.USC.T18.Ch77.Reslice.Structure.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false










namespace Proving.USC.T18.Ch77.Reslice.Structure

open Proving.USC.Common





axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop








axiom DefinitionalTermResolves (r : Ref) (c : ComplaintText) : Prop






axiom ChapterWideIncorporationHonored (r : Ref) (c : ComplaintText) : Prop






axiom EnumeratedReferencesResolve (rs : List Ref) (c : ComplaintText) : Prop






axiom CrossActReferenceResolves (r : Ref) (c : ComplaintText) : Prop






axiom PenaltyIncorporationHonored (r : Ref) (c : ComplaintText) : Prop









axiom QualifyingProvisionHonored (r : Ref) (c : ComplaintText) : Prop








axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop






axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Reslice.Structure
