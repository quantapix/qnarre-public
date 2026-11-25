



import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch42Ch95.Scienter.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Scienter

open Proving.USC.Common







axiom MentalStateProven
    (p : Person) (el : ScienterElement) (rung : MentalState) (c : ComplaintText) : Prop













axiom RungShownByStatutoryProofRoute
    (p : Person) (el : ScienterElement) (rung : MentalState) (c : ComplaintText) : Prop







axiom SharedUnderstandingOfViolentConsequence
    (creditor debtor : Person) (c : ComplaintText) : Prop







axiom BeliefObjectivelyReasonable
    (p : Person) (el : ScienterElement) (c : ComplaintText) : Prop









axiom KnowsUnlawfulActivityGenerically (p : Person) (c : ComplaintText) : Prop









axiom ConspiratorialPurposeToCommitOffense
    (p : Person) (el : ScienterElement) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch42Ch95.Scienter
