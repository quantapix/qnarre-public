






import Proving.USC.T29.Review.Procedure.Types
import Proving.USC.T29.Review.Procedure.Predicates
import Proving.USC.T29.Review.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T29.Review.Procedure

open Proving.USC.Common


theorem timelyComplaint_intro {proc c}
    (hCharged : ChargeFiled proc c) (hWindow : WithinSixMonthWindow proc c)
    (hServed : ComplaintIssuedAndServed proc c) (hFiveDay : FiveDayNoticeSatisfied proc c)
    : TimelyComplaint proc c :=
  ⟨hCharged, hWindow, hServed, hFiveDay⟩


theorem orderReached_intro {ord proc c}
    (hHeard : HearingHeldAndRecordFiled proc c) (hIssued : FinalOrderIssued ord proc c)
    : OrderReached ord proc c :=
  ⟨hHeard, hIssued⟩


theorem boardEnforcement_intro {ord proc c}
    (hOrder : FinalOrderIssued ord proc c)
    (hPet : BoardEnforcementPetitionFiled ord proc c)
    (hExh : ObjectionExhausted proc c)
    : BoardEnforcement ord proc c :=
  ⟨hOrder, hPet, hExh⟩


theorem aggrievedReview_intro {p ord proc c}
    (hFinal : FinalOrderIssued ord proc c)
    (hAggr : PersonAggrievedByFinalOrder p ord c)
    (hPet : ReviewPetitionFiledInProperCourt p ord c)
    (hRec : CertifiedRecordFiled p ord c)
    (hExh : ObjectionExhausted proc c)
    : AggrievedReview p ord proc c :=
  ⟨hFinal, hAggr, hPet, hRec, hExh⟩


theorem timelyAggrievedReview_intro {p ord proc c}
    (hComplaint : TimelyComplaint proc c)
    (hOrder : OrderReached ord proc c)
    (hReview : AggrievedReview p ord proc c)
    : TimelyAggrievedReview p ord proc c :=
  ⟨hComplaint, hOrder, hReview⟩

end Proving.USC.T29.Review.Procedure
