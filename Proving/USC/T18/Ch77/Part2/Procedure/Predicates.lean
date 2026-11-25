import Proving.USC.T18.Ch77.Part2.Procedure.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part2.Procedure

open Proving.USC.Common (Person ComplaintText)














axiom ChargedConductAlleged (o : Offense) (c : ComplaintText) : Prop




axiom InterstateOrForeignCommerceNexus (o : Offense) (c : ComplaintText) : Prop





axiom WithinSpecialMaritimeAndTerritorialJurisdiction
    (o : Offense) (c : ComplaintText) : Prop





axiom ChargesFiled (pr : Prosecution) (dfn : Person) (c : ComplaintText) : Prop






axiom ProsecutionUnderSubsectionA1 (pr : Prosecution) (c : ComplaintText) : Prop





axiom DefendantHadReasonableOpportunityToObserve
    (dfn : Person) (victim : Person) (c : ComplaintText) : Prop






axiom ActConstitutingViolationIsAdvertising (o : Offense) (c : ComplaintText) : Prop






axiom GovernmentProvedKnowledgeOfCoerciveMeans
    (pr : Prosecution) (c : ComplaintText) : Prop





axiom GovernmentProvedRecklessDisregardOfCoerciveMeans
    (pr : Prosecution) (c : ComplaintText) : Prop





axiom GovernmentProvedKnowledgeOfMinority (pr : Prosecution) (c : ComplaintText) : Prop





axiom GovernmentProvedRecklessDisregardOfMinority
    (pr : Prosecution) (c : ComplaintText) : Prop






axiom OffenseEffectedByForceThreatsFraudOrCoercion
    (o : Offense) (c : ComplaintText) : Prop




axiom ConvictionEntered (pr : Prosecution) (dfn : Person) (c : ComplaintText) : Prop




axiom FineImposedUnderThisTitle (pr : Prosecution) (c : ComplaintText) : Prop






axiom LifeImprisonmentImposed (pr : Prosecution) (c : ComplaintText) : Prop




axiom ImprisonmentImposed (pr : Prosecution) (c : ComplaintText) : Prop




axiom ObstructsEnforcementOfSection1591 (dfn : Person) (c : ComplaintText) : Prop











axiom ageOfVictimAtOffense (victim : Person) (o : Offense) (c : ComplaintText) : Nat







axiom imprisonmentYearsImposed (pr : Prosecution) (c : ComplaintText) : Nat

end Proving.USC.T18.Ch77.Part2.Procedure
