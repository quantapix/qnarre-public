





import Proving.USC.Common.Types
import Proving.USC.T18.Ch117.Recert.Structure.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Structure

open Proving.USC.Common





axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop




axiom ReferencedChapterExists (r : Ref) (c : ComplaintText) : Prop




axiom CrossTitleReferenceResolves (r : Ref) (c : ComplaintText) : Prop






axiom InternalSubsectionReferenceResolves (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop







axiom DefinitionalTermBound (r : Ref) (c : ComplaintText) : Prop





axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop






axiom ExceptionHonored (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop





axiom SavingsClausePreserves (r : Ref) (c : ComplaintText) : Prop





axiom SectionLocalDefinitionControls (r : Ref) (c : ComplaintText) : Prop






axiom EditorialDefectDoesNotDefeatReference (n : EditorialNote) (c : ComplaintText) : Prop






axiom OpenReferenceScopeDetermined (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch117.Recert.Structure
