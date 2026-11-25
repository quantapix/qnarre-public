






import Proving.USC.T18.Ch113B.MaterialSupport.Structure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.Structure

open Proving.USC.Common







axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop





axiom ConstraintHonored (r : Ref) (c : ComplaintText) : Prop





axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop





axiom SavingsClausePreserved (r : Ref) (c : ComplaintText) : Prop





axiom LexSpecialisControls (r : Ref) (c : ComplaintText) : Prop





axiom CatalogIncorporationResolves (rs : List Ref) (c : ComplaintText) : Prop





axiom DefinitionChainResolves (ch : Chain) (c : ComplaintText) : Prop





axiom CarveOutExcludesTarget (r : Ref) (c : ComplaintText) : Prop





axiom CrossReferenceDangling (r : Ref) (c : ComplaintText) : Prop






axiom ScrivenersCorrectionApplied (r : Ref) (c : ComplaintText) : Prop








axiom DefinedTermMatchesDefinition (r : Ref) (c : ComplaintText) : Prop





axiom unresolvedReferenceCount (rs : List Ref) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch113B.MaterialSupport.Structure
