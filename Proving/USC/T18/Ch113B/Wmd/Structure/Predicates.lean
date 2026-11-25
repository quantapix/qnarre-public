




import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.Wmd.Structure.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Structure

open Proving.USC.Common







axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop





axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop






axiom SavingsClauseRespected (r : Ref) (c : ComplaintText) : Prop





axiom DefinitionScopeRespected (r : Ref) (c : ComplaintText) : Prop





axiom AllReferencedSectionsExist (rs : List Ref) (c : ComplaintText) : Prop




axiom AllIncorporationsHonored (rs : List Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Wmd.Structure
