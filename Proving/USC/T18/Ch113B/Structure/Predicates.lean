







import Proving.USC.T18.Ch113B.Structure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Structure

open Proving.USC.Common





axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop







axiom ReferencedSubsectionExists (r : Ref) (c : ComplaintText) : Prop







axiom ReferenceTargetIsCurrent (r : Ref) (c : ComplaintText) : Prop





axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop







axiom BorrowedDefinitionScopeCompatible (r : Ref) (c : ComplaintText) : Prop





axiom ChapterDefinitionGoverns (r : Ref) (c : ComplaintText) : Prop





axiom SectionLocalDefinitionControls (r : Ref) (c : ComplaintText) : Prop





axiom PenaltyIncorporationResolves (r : Ref) (c : ComplaintText) : Prop






axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop




axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop





axiom SavingsClausePreserves (r : Ref) (c : ComplaintText) : Prop





axiom AdoptionScopeRespected (r : Ref) (c : ComplaintText) : Prop






axiom EnumeratedPredicateOffense (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch113B.Structure
