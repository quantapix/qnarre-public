import Proving.USC.T42.Ch21Tail.Procedure.Types










set_option autoImplicit false

namespace Proving.USC.T42.Ch21Tail.Procedure

open Proving.USC.Common






axiom ReportStepOccurred (p : Person) (c : ComplaintText) : Prop






axiom ReportedConditionsWithinSubchapter (p : Person) (c : ComplaintText) : Prop





axiom ReportOccurredOnDay (p : Person) (c : ComplaintText) (day : Nat) : Prop





axiom AdverseActionStepOccurred (p : Person) (c : ComplaintText) : Prop




axiom AdverseActionOccurredOnDay (p : Person) (c : ComplaintText) (day : Nat) : Prop





axiom AdverseActionBecauseOfReport (p : Person) (c : ComplaintText) : Prop






axiom IsCoveredInstitution (i : Institution) (c : ComplaintText) : Prop





axiom DeplorableConditionsExist (i : Institution) (c : ComplaintText) : Prop




axiom LitigationTrackInitiated (i : Institution) (c : ComplaintText) : Prop




axiom IsGovernmentAgency (agency : Entity) (c : ComplaintText) : Prop




axiom VoluntaryGoodFaithEffortsUndertaken
    (agency : Entity) (i : Institution) (c : ComplaintText) : Prop





axiom FederalFundsAvailableForImprovement (i : Institution) (c : ComplaintText) : Prop






axiom PriorityGivenToCorrection (i : Institution) (c : ComplaintText) : Prop




axiom UnconstitutionalConditionsCorrected (i : Institution) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch21Tail.Procedure
