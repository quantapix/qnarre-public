













import Proving.USC.T29.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T29.Procedure

open Proving.USC.Common







axiom ChargeFiled (ch : Charge) (c : ComplaintText) : Prop







axiom WithinSixMonthWindow (ch : Charge) (c : ComplaintText) : Prop





axiom ComplaintIssuedAndServed (ch : Charge) (c : ComplaintText) : Prop





axiom HearingAfterFiveDays (ch : Charge) (c : ComplaintText) : Prop





axiom HearingHeld (ch : Charge) (c : ComplaintText) : Prop




axiom OrderIssued (o : BoardOrder) (c : ComplaintText) : Prop








axiom CourtPetitionFiled (o : BoardOrder) (c : ComplaintText) : Prop






axiom ObjectionExhausted (o : BoardOrder) (c : ComplaintText) : Prop








axiom SubpenaServedTimely (s : Subpena) (c : ComplaintText) : Prop





axiom ProcessServedValidly (c : ComplaintText) : Prop








axiom ObstructedBoard (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T29.Procedure
