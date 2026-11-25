import Proving.USC.Common.Types
import Proving.USC.T42.Ch6ASchI.Part2.Procedure.Types












namespace Proving.USC.T42.Ch6ASchI.Part2.Procedure

open Proving.USC.Common





opaque YearsOfServiceAboveJunior (p : Person) (c : ComplaintText) : Nat





opaque InternshipCreditYears (p : Person) (c : ComplaintText) : Nat



opaque AgeInYears (p : Person) (c : ComplaintText) : Nat



opaque YearsOfActiveService (p : Person) (c : ComplaintText) : Nat



opaque YearsOfCommissionedService (p : Person) (c : ComplaintText) : Nat






axiom FoundQualified (p : Person) (c : ComplaintText) : Prop



axiom AppliedForRetirement (p : Person) (c : ComplaintText) : Prop



axiom ReleasedForRetirement (p : Person) (c : ComplaintText) : Prop




axiom PreviouslyPresentedFlag (p : Person) (c : ComplaintText) : Prop



axiom WarOrEmergencyProclaimed (p : Person) (c : ComplaintText) : Prop




axiom ExecutiveOrderMilitarizingCorps (p : Person) (c : ComplaintText) : Prop





axiom ServiceInWartimeOrOnMilitaryDetail (p : Person) (c : ComplaintText) : Prop




axiom DetailRequestMade (p : Person) (c : ComplaintText) : Prop



axiom AdvisoryCommitteeAppointed (p : Person) (c : ComplaintText) : Prop




axiom AppointmentWithoutPoliticalAffiliation (p : Person) (c : ComplaintText) : Prop




axiom RegulationsPrescribed (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Part2.Procedure
