






import Proving.USC.T09.Ch1.Structure.Types

set_option autoImplicit false

namespace Proving.USC.T09.Ch1.Structure

open Proving.USC.Common






axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop







axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop






axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop






axiom SavingsClausePreserves (r : Ref) (c : ComplaintText) : Prop







axiom LexSpecialisControls (r : Ref) (c : ComplaintText) : Prop






axiom CrossTitleReferenceResolves (r : Ref) (c : ComplaintText) : Prop






axiom DefinitionSuppliedForTerm (term : String) (r : Ref) (c : ComplaintText) : Prop







axiom TransportationWorkerExclusionApplies (c : ComplaintText) : Prop






axiom PreEnactmentContractExclusionApplies (c : ComplaintText) : Prop

end Proving.USC.T09.Ch1.Structure
