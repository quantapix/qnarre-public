










import Proving.USC.T18.Ch1Ch47.Recert.Structure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert.Structure

open Proving.USC.Common






axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop





axiom AllReferencedSectionsExist (rs : List Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop







axiom CrossTitleReferenceResolves (r : Ref) (c : ComplaintText) : Prop






axiom DefinitionScopeSatisfied (r : Ref) (c : ComplaintText) : Prop






axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop









axiom ExceptionHonored (r : Ref) (c : ComplaintText) : Prop






axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop






axiom SavingsClausePreserves (r : Ref) (c : ComplaintText) : Prop







axiom SourceTextEditoriallyDefective (r : Ref) : Prop

end Proving.USC.T18.Ch1Ch47.Recert.Structure
