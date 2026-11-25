






















import Proving.USC.T18.Prohibited.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Prohibited.Procedure

open Proving.USC.Common







axiom ClaimAccrued (p : Person) (c : ComplaintText) : Prop





axiom ComplaintFiled (p : Person) (c : ComplaintText) : Prop









axiom ViolationPredicated (t : ViolationTarget) (p : Person) (c : ComplaintText) : Prop







axiom AccrualDay (p : Person) (c : ComplaintText) : Nat






axiom FilingDay (p : Person) (c : ComplaintText) : Nat

end Proving.USC.T18.Prohibited.Procedure
