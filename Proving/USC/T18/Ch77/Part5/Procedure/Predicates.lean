








import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch77.Part5.Procedure.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part5.Procedure

open Proving.USC.Common






axiom ProsecutionCommencedUnderSection1591
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop





axiom ChargedUnderSubsectionA1
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop




axiom ChargedUnderSubsectionA2
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop




axiom ChargedUnderSubsectionD
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop








axiom FederalJurisdictionalNexusProved
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop







axiom ProhibitedTraffickingActProved
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop





axiom VentureBenefitProved
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop







axiom ChargedConductIsAdvertising
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop






axiom KnowledgeOfMeansProved
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop





axiom RecklessDisregardOfMeansProved
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop





axiom KnowledgeOfMinorityProved
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop





axiom RecklessDisregardOfMinorityProved
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop






axiom ReasonableOpportunityToObserveProved
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop









axiom OffenseEffectedByForceFraudOrCoercion
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop





axiom AdjudicationOfGuiltEntered
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop




axiom FineImposedUnderThisTitle
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop





axiom LifeSentenceImposed
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop






axiom EnforcementObstructionProved
    (d : Person) (pr : Prosecution) (c : ComplaintText) : Prop











axiom victimAgeYearsAtOffense (pr : Prosecution) (c : ComplaintText) : Nat







axiom imprisonmentTermYearsImposed (pr : Prosecution) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch77.Part5.Procedure
