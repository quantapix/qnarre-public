















import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T42.EqualRights.Recert.Structure.Types

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Recert.Structure

open Proving.USC.Common






axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop






axiom CrossTitleReferenceResolves (r : Ref) (c : ComplaintText) : Prop







axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop







axiom InternalDefinitionGoverns (r : Ref) (c : ComplaintText) : Prop






axiom ConstraintFromReferencedSectionRespected (r : Ref) (c : ComplaintText) : Prop








axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop









axiom ExceptionHonored (r : Ref) (c : ComplaintText) : Prop








axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop





axiom SavingsClausePreserves (r : Ref) (c : ComplaintText) : Prop





axiom AntecedentSectionSatisfied (r : Ref) (c : ComplaintText) : Prop






axiom SectionEnumeratedInReferenceList (r : Ref) (c : ComplaintText) : Prop








axiom OpenEndedIncorporationAnchored (r : Ref) (c : ComplaintText) : Prop






axiom BorrowedLawSuitable (r : Ref) (c : ComplaintText) : Prop





axiom BorrowedLawNotInconsistent (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T42.EqualRights.Recert.Structure
