







import Proving.USC.Common.Types
import Proving.USC.T42.Ch21TitleVII.Structure.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch21TitleVII.Structure

open Proving.USC.Common (ComplaintText)






axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop







axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop





axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop








axiom SubordinationHonored (r : Ref) (c : ComplaintText) : Prop






axiom SavingsPreserved (r : Ref) (c : ComplaintText) : Prop







axiom SpecificControls (r : Ref) (c : ComplaintText) : Prop







axiom ConstructionLimitObserved (r : Ref) (c : ComplaintText) : Prop







axiom DefinedTermResolves (term : String) (r : Ref) (c : ComplaintText) : Prop









axiom CrossTitleReferenceResolves (r : Ref) (c : ComplaintText) : Prop






axiom ReferenceChainClosed (rs : List Ref) (c : ComplaintText) : Prop








axiom DefectiveReferenceReadAsCorrected (r : Ref) (c : ComplaintText) : Prop







axiom RemedyReferenceResolves (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21TitleVII.Structure
