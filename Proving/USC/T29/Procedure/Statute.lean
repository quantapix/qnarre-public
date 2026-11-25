












import Proving.USC.T29.Procedure.Types
import Proving.USC.T29.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T29.Procedure

open Proving.USC.Common


structure Transition where
  fromState : State
  toState   : State







structure TimelyComplaintIssuance (ch : Charge) (c : ComplaintText) : Prop where
  charged  : ChargeFiled ch c
  inWindow : WithinSixMonthWindow ch c
  issued   : ComplaintIssuedAndServed ch c




structure TimelyHearing (ch : Charge) (c : ComplaintText) : Prop where
  fiveDays : HearingAfterFiveDays ch c
  held     : HearingHeld ch c




structure ProperCourtReview (o : BoardOrder) (c : ComplaintText) : Prop where
  petition  : CourtPetitionFiled o c
  exhausted : ObjectionExhausted o c






structure ValidInvestigatoryStep (s : Subpena) (c : ComplaintText) : Prop where
  subpena : SubpenaServedTimely s c
  service : ProcessServedValidly c





structure ObstructionOffense (p : Person) (c : ComplaintText) : Prop where
  obstructed : ObstructedBoard p c








structure TimelyEnforcement (ch : Charge) (o : BoardOrder) (c : ComplaintText) : Prop where
  complaint   : TimelyComplaintIssuance ch c
  hearing     : TimelyHearing ch c
  orderIssued : OrderIssued o c
  review      : ProperCourtReview o c




inductive Reachable (ch : Charge) (o : BoardOrder) (c : ComplaintText) : State → Prop

  | start (h : ChargeFiled ch c) : Reachable ch o c State.Charged

  | timeBar (h : ChargeFiled ch c) (hLate : ¬ WithinSixMonthWindow ch c) :
      Reachable ch o c State.TimeBarred

  | toComplaint (hPrev : Reachable ch o c State.Charged)
      (h : TimelyComplaintIssuance ch c) : Reachable ch o c State.ComplaintIssued

  | toHeard (hPrev : Reachable ch o c State.ComplaintIssued)
      (h : TimelyHearing ch c) : Reachable ch o c State.HeardAndAdjudicated

  | toOrder (hPrev : Reachable ch o c State.HeardAndAdjudicated)
      (h : OrderIssued o c) : Reachable ch o c State.OrderIssued

  | toReview (hPrev : Reachable ch o c State.OrderIssued)
      (h : ProperCourtReview o c) : Reachable ch o c State.InCourtReview

end Proving.USC.T29.Procedure
