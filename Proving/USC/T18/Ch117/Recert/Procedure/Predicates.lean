
















import Proving.USC.T18.Ch117.Recert.Procedure.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Procedure

open Proving.USC.Common








axiom ViolationOfSubsectionB (defendant : Person) (c : ComplaintText) : Prop





axiom InjuredByReasonOfViolation (plaintiff defendant : Person) (c : ComplaintText) : Prop





axiom FiledInUnitedStatesDistrictCourt (plaintiff : Person) (c : ComplaintText) : Prop





axiom AccrualDay (plaintiff : Person) (c : ComplaintText) : Nat




axiom FilingDay (plaintiff : Person) (c : ComplaintText) : Nat









axiom ConvictedUnderSubsectionB2 (defendant : Person) (c : ComplaintText) : Prop




axiom RestitutionOrdered (defendant : Person) (c : ComplaintText) : Prop




axiom RestitutionScopeConsistentWithSection2327b (defendant : Person) (c : ComplaintText) : Prop








axiom CourtShallOrderRestitution (defendant : Person) (c : ComplaintText) : Prop







axiom ChargeUnderSubsectionAOrB1 (defendant : Person) (c : ComplaintText) : Prop






axiom ChargedUnderSubsectionB2Only (defendant : Person) (c : ComplaintText) : Prop





axiom PromotionLegalInTargetedJurisdiction (defendant : Person) (c : ComplaintText) : Prop






axiom ProvedByPreponderance (defendant : Person) (c : ComplaintText) : Prop








axiom IntentionToEngageInProscribedActivity (defendant : Person) (c : ComplaintText) : Prop




axiom TravelStartDay (defendant : Person) (c : ComplaintText) : Nat




axiom TravelEndDay (defendant : Person) (c : ComplaintText) : Nat




axiom IntentHeldDay (defendant : Person) (c : ComplaintText) : Nat






axiom AttemptedOrConspiredToViolate (defendant : Person) (c : ComplaintText) : Prop





axiom TargetSubsectionWithinAToE (defendant : Person) (c : ComplaintText) : Prop





axiom PunishableAsCompletedViolation (defendant : Person) (c : ComplaintText) : Prop








axiom ProsecutionBasedOnCommercialSexActProng (defendant : Person) (c : ComplaintText) : Prop





axiom ReasonableBeliefVictimAtLeast18 (defendant : Person) (c : ComplaintText) : Prop




axiom EstablishedByClearAndConvincingEvidence (defendant : Person) (c : ComplaintText) : Prop







axiom restitutionDuty_of_convictionB2 :
    ∀ (defendant : Person) (c : ComplaintText),
      ConvictedUnderSubsectionB2 defendant c → CourtShallOrderRestitution defendant c






axiom defenseUnavailable_forSubsectionB2Only :
    ∀ (defendant : Person) (c : ComplaintText),
      ChargedUnderSubsectionB2Only defendant c → ¬ ChargeUnderSubsectionAOrB1 defendant c




axiom inchoatePunishable_sameManner :
    ∀ (defendant : Person) (c : ComplaintText),
      AttemptedOrConspiredToViolate defendant c →
      TargetSubsectionWithinAToE defendant c →
      PunishableAsCompletedViolation defendant c

end Proving.USC.T18.Ch117.Recert.Procedure
