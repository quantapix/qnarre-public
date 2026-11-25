
















import Proving.USC.T08.Procedure.Types

namespace Proving.USC.T08.Procedure

open Proving.USC.Common





axiom ArrestByAuthorizedOfficer (p : Person) (c : ComplaintText) : Prop





axiom VenueDistrictQualifies (p : Person) (c : ComplaintText) : Prop




axiom PropertyUsedInViolation (cv : Conveyance) (c : ComplaintText) : Prop



axiom SeizureEffected (cv : Conveyance) (c : ComplaintText) : Prop




axiom ForfeitureUnderChapter46 (cv : Conveyance) (c : ComplaintText) : Prop




axiom WitnessUnavailable (c : ComplaintText) : Prop



axiom WitnessAvailableForCrossExam (c : ComplaintText) : Prop



axiom DepositionCompliesWithFRE (dep : Deposition) (c : ComplaintText) : Prop





axiom PriorAuthorizationStatusPrimaFacie (c : ComplaintText) : Prop





axiom QualifyingHireCount (c : ComplaintText) (n : Nat) : Prop





axiom HiringWindowDays (c : ComplaintText) (d : Nat) : Prop

end Proving.USC.T08.Procedure
