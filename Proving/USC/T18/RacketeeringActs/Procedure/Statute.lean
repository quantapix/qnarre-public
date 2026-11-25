












import Proving.USC.T18.RacketeeringActs.Procedure.Predicates

namespace Proving.USC.T18.RacketeeringActs.Procedure

open Proving.USC.Common







def sevenYearDays : Nat := 7 * 365




def withinSevenYears (offenseDay chargeDay : Nat) : Prop :=
  offenseDay ≤ chargeDay ∧ chargeDay - offenseDay ≤ sevenYearDays

instance (offenseDay chargeDay : Nat) : Decidable (withinSevenYears offenseDay chargeDay) := by
  unfold withinSevenYears; infer_instance





structure HobbsCommerceNexus (t : ChargedTransaction) (c : ComplaintText) : Prop where
  affectsCommerce : ObstructsDelaysOrAffectsCommerce t c






structure TravelActNexus (t : ChargedTransaction) (c : ComplaintText) : Prop where
  travelOrFacility : InterstateTravelOrFacilityUse t c





structure LaunderingCommerceNexus (t : ChargedTransaction) (c : ComplaintText) : Prop where
  affectsCommerce : TransactionAffectsCommerce t c






structure WellPosedLaunderingAction
    (t : ChargedTransaction) (p : Person) (c : ComplaintText) : Prop where
  nexus       : TransactionAffectsCommerce t c
  venue       : ProperLaunderingVenue p c
  jurisdiction : ForeignPersonJurisdiction p c ∨ Section1957TerritorialCircumstance p c





structure TimelyLaunderingProsecution
    (offenseDay chargeDay : Nat) (c : ComplaintText) : Prop where
  windowApplies : SevenYearWindowApplies c
  offenseAt     : OffenseCommittedDay offenseDay c
  chargeAt      : ChargeInstitutedDay chargeDay c

  inWindow      : withinSevenYears offenseDay chargeDay

end Proving.USC.T18.RacketeeringActs.Procedure
