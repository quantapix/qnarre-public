









import Proving.USC.T29.Review.Procedure.Types
import Proving.USC.T29.Review.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T29.Review.Procedure

open Proving.USC.Common


structure Transition where
  from_ : State
  to_   : State





structure TimelyComplaint (proc : UlpProceeding) (c : ComplaintText) : Prop where
  charged   : ChargeFiled proc c
  inWindow  : WithinSixMonthWindow proc c
  served    : ComplaintIssuedAndServed proc c
  fiveDay   : FiveDayNoticeSatisfied proc c



structure OrderReached (ord : BoardOrder) (proc : UlpProceeding) (c : ComplaintText) : Prop where
  heard  : HearingHeldAndRecordFiled proc c
  issued : FinalOrderIssued ord proc c





structure BoardEnforcement (ord : BoardOrder) (proc : UlpProceeding) (c : ComplaintText) : Prop where
  order      : FinalOrderIssued ord proc c
  petitioned : BoardEnforcementPetitionFiled ord proc c
  exhausted  : ObjectionExhausted proc c








structure AggrievedReview (p : Person) (ord : BoardOrder) (proc : UlpProceeding) (c : ComplaintText) : Prop where

  finalOrder : FinalOrderIssued ord proc c

  aggrieved  : PersonAggrievedByFinalOrder p ord c

  petitioned : ReviewPetitionFiledInProperCourt p ord c

  record     : CertifiedRecordFiled p ord c

  exhausted  : ObjectionExhausted proc c




structure TimelyAggrievedReview
    (p : Person) (ord : BoardOrder) (proc : UlpProceeding) (c : ComplaintText) : Prop where
  complaintTimely : TimelyComplaint proc c
  orderReached    : OrderReached ord proc c
  review          : AggrievedReview p ord proc c

end Proving.USC.T29.Review.Procedure
