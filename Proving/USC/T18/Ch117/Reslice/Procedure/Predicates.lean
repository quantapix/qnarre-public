











import Proving.USC.T18.Ch117.Reslice.Procedure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Procedure

open Proving.USC.Common





axiom PersonInjured (p : Person) (c : ComplaintText) : Prop




axiom InjuryByReasonOfViolation (p : Person) (d : Person) (c : ComplaintText) : Prop





axiom ViolationOfSubsectionB (d : Person) (c : ComplaintText) : Prop




axiom CivilActionFiled (a : CivilAction) (p : Person) (c : ComplaintText) : Prop




axiom FiledInAppropriateDistrictCourt
    (a : CivilAction) (ct : DistrictCourt) (c : ComplaintText) : Prop







axiom ViolationOfSubsectionB2 (d : Person) (c : ComplaintText) : Prop




axiom RestitutionOrderEntered
    (o : RestitutionOrder) (pr : Prosecution) (c : ComplaintText) : Prop




axiom RestitutionScopeConsistentWith2327b
    (o : RestitutionOrder) (c : ComplaintText) : Prop







axiom ProsecutionCommenced (pr : Prosecution) (d : Person) (c : ComplaintText) : Prop





axiom ChargeUnderSubsectionAOrB1 (pr : Prosecution) (c : ComplaintText) : Prop





axiom PromotionLegalInTargetedJurisdiction (d : Person) (c : ComplaintText) : Prop





axiom DefenseProvenByPreponderance
    (pr : Prosecution) (d : Person) (c : ComplaintText) : Prop





axiom ProsecutionBasedOnIllicitSexualConductG2
    (pr : Prosecution) (c : ComplaintText) : Prop





axiom ReasonableBeliefVictimAtLeast18 (d : Person) (c : ComplaintText) : Prop





axiom DefenseProvenByClearAndConvincing
    (pr : Prosecution) (d : Person) (c : ComplaintText) : Prop






axiom TransportationOrTravelOccurred
    (t : TravelEvent) (d : Person) (c : ComplaintText) : Prop






axiom IntentToEngageInProscribedConduct
    (d : Person) (t : TravelEvent) (c : ComplaintText) : Prop




axiom AttemptedOrConspiredToViolate (d : Person) (c : ComplaintText) : Prop









axiom travelTiming (p : Person) (t : TravelEvent) (c : ComplaintText) : TravelTiming






axiom inchoateTargetSubsection (d : Person) (c : ComplaintText) : Subsection2423

end Proving.USC.T18.Ch117.Reslice.Procedure
