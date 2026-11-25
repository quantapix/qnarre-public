





import Proving.USC.T18.Ch13.Reearn.Structure.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reearn.Structure






axiom ReferencedSectionExists (r : Ref) (c : ComplaintText) : Prop







axiom IncorporationHonored (r : Ref) (c : ComplaintText) : Prop






axiom DefinedTermResolves (r : Ref) (t : DefinedTerm) (c : ComplaintText) : Prop






axiom ConditionPrecedentSatisfied (r : Ref) (c : ComplaintText) : Prop









axiom ExceptionApplies (r : Ref) (c : ComplaintText) : Prop








axiom ExceptionHonored (r : Ref) (c : ComplaintText) : Prop






axiom OverrideTriggered (r : Ref) (c : ComplaintText) : Prop







axiom OverrideHonored (r : Ref) (c : ComplaintText) : Prop







axiom SavingsClauseRespected (r : Ref) (l : PreservedLaw) (c : ComplaintText) : Prop





axiom LexSpecialisControls (r : Ref) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch13.Reearn.Structure
