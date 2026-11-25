







import Proving.USC.Common.Types
import Proving.USC.T18.Ch11.EchoReslice.Structure.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Structure

open Proving.USC.Common





axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop






axiom DefinitionConfinedToSection (r : Ref) (c : ComplaintText) : Prop






axiom TitleWideIncorporationResolves (r : Ref) (c : ComplaintText) : Prop





axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop





axiom SavingsClauseHonored (r : Ref) (c : ComplaintText) : Prop






axiom DanglingReferenceResolved (d : DanglingRef) (c : ComplaintText) : Prop







axiom WitnessFeeProvidedByLaw (c : ComplaintText) : Prop





axiom ReasonableTravelAndSubsistenceCost (c : ComplaintText) : Prop





axiom ReasonableValueOfTimeLost (c : ComplaintText) : Prop





axiom ReasonableExpertWitnessFee (c : ComplaintText) : Prop

end Proving.USC.T18.Ch11.EchoReslice.Structure
