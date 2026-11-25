






import Proving.USC.Common.Types
import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Structure.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Structure

open Proving.USC.Common







axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop







axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop






axiom SavingsClauseRespected (r : Ref) (c : ComplaintText) : Prop






axiom SpecificProvisionControls (r : Ref) (c : ComplaintText) : Prop









axiom CrossTitleReferenceResolves (r : Ref) (c : ComplaintText) : Prop








axiom DefinitionSuppliedByReferencedSection (r : Ref) (c : ComplaintText) : Prop





axiom ChapterDefinitionInScope (r : Ref) (c : ComplaintText) : Prop







axiom InternalSubsectionReferenceResolves (r : Ref) (c : ComplaintText) : Prop







axiom RegulatoryReferenceResolves (r : Ref) (c : ComplaintText) : Prop





axiom PenaltyIncorporationResolves (r : Ref) (c : ComplaintText) : Prop








axiom ReferenceTargetIsDangling (r : Ref) (c : ComplaintText) : Prop







axiom DefinitionalGapUnfilled (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Structure
