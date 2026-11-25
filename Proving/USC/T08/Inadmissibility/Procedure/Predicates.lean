













import Proving.USC.T08.Inadmissibility.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T08.Inadmissibility.Procedure

open Proving.USC.Common







axiom UnlawfulPresenceDays (a : Alien) (c : ComplaintText) : Nat




axiom DepartureDay (a : Alien) (c : ComplaintText) : Nat




axiom SeeksAdmissionDay (a : Alien) (c : ComplaintText) : Nat




axiom FinalOrderDay (e : Entity) (c : ComplaintText) : Nat




axiom PetitionFilingDay (e : Entity) (c : ComplaintText) : Nat






axiom Departed (a : Alien) (c : ComplaintText) : Prop




axiom SeeksReadmission (a : Alien) (c : ComplaintText) : Prop





axiom ConsentToReapply (a : Alien) (c : ComplaintText) : Prop





axiom NoticeAndHearingAfforded (e : Entity) (c : ComplaintText) : Prop




axiom FinalOrderIssued (e : Entity) (c : ComplaintText) : Prop




axiom PetitionFiled (e : Entity) (c : ComplaintText) : Prop

end Proving.USC.T08.Inadmissibility.Procedure
