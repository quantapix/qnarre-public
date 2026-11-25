












import Proving.USC.T18.RacketeeringActs.Procedure.Types

namespace Proving.USC.T18.RacketeeringActs.Procedure

open Proving.USC.Common








axiom ObstructsDelaysOrAffectsCommerce (t : ChargedTransaction) (c : ComplaintText) : Prop






axiom InterstateTravelOrFacilityUse (t : ChargedTransaction) (c : ComplaintText) : Prop








axiom TransactionAffectsCommerce (t : ChargedTransaction) (c : ComplaintText) : Prop








axiom ProperLaunderingVenue (p : Person) (c : ComplaintText) : Prop






axiom ForeignPersonJurisdiction (p : Person) (c : ComplaintText) : Prop






axiom Section1957TerritorialCircumstance (p : Person) (c : ComplaintText) : Prop













axiom OffenseCommittedDay (d : Nat) (c : ComplaintText) : Prop




axiom ChargeInstitutedDay (d : Nat) (c : ComplaintText) : Prop





axiom SevenYearWindowApplies (c : ComplaintText) : Prop

end Proving.USC.T18.RacketeeringActs.Procedure
