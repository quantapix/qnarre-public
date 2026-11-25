




import Proving.USC.T42.Ch21Tail.Ontology.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.Ch21Tail.Ontology

open Proving.USC.Common




axiom IsReportingPerson (p : Person) (c : ComplaintText) : Prop




axiom IsReportableCondition (cond : InstitutionalCondition) (c : ComplaintText) : Prop




axiom IsRetaliation (r : RetaliatoryAct) (c : ComplaintText) : Prop




axiom IsCoveredInstitution (inst : Institution) (c : ComplaintText) : Prop




axiom DeprivesConstitutionalRight (cond : InstitutionalCondition) (c : ComplaintText) : Prop




axiom DeprivesFederalStatutoryRight (cond : InstitutionalCondition) (c : ComplaintText) : Prop




axiom IsFederalFunds (fund : Funds) (c : ComplaintText) : Prop




axiom IsGovernmentAgency (e : Entity) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21Tail.Ontology
