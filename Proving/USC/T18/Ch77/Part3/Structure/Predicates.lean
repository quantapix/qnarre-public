import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part3.Structure.Types

set_option autoImplicit false








namespace Proving.USC.T18.Ch77.Part3.Structure

open Proving.USC.Common





axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop





axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop






axiom TermMeaningImported (t : TermIncorporation) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop





axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop






axiom SavingsClauseHonored (r : Ref) (c : ComplaintText) : Prop





axiom LexSpecialisControls (r : Ref) (c : ComplaintText) : Prop





axiom InternalAntecedentResolves (r : Ref) (c : ComplaintText) : Prop





axiom CrossTitleReferenceResolves (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Part3.Structure
