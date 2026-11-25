








import Proving.USC.T29.Procedure.Types
import Proving.USC.T29.Procedure.Predicates
import Proving.USC.T29.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T29.Procedure

open Proving.USC.Common


theorem timelyComplaintIssuance_intro {ch c}
    (hCharged : ChargeFiled ch c)
    (hWindow : WithinSixMonthWindow ch c)
    (hIssued : ComplaintIssuedAndServed ch c) :
    TimelyComplaintIssuance ch c :=
  ⟨hCharged, hWindow, hIssued⟩


theorem timelyHearing_intro {ch c}
    (hFiveDays : HearingAfterFiveDays ch c)
    (hHeld : HearingHeld ch c) :
    TimelyHearing ch c :=
  ⟨hFiveDays, hHeld⟩


theorem properCourtReview_intro {o c}
    (hPetition : CourtPetitionFiled o c)
    (hExhausted : ObjectionExhausted o c) :
    ProperCourtReview o c :=
  ⟨hPetition, hExhausted⟩


theorem validInvestigatoryStep_intro {s c}
    (hSubpena : SubpenaServedTimely s c)
    (hService : ProcessServedValidly c) :
    ValidInvestigatoryStep s c :=
  ⟨hSubpena, hService⟩


theorem obstructionOffense_intro {p c}
    (hObstructed : ObstructedBoard p c) :
    ObstructionOffense p c :=
  ⟨hObstructed⟩


theorem timelyEnforcement_intro {ch o c}
    (hComplaint : TimelyComplaintIssuance ch c)
    (hHearing : TimelyHearing ch c)
    (hOrder : OrderIssued o c)
    (hReview : ProperCourtReview o c) :
    TimelyEnforcement ch o c :=
  ⟨hComplaint, hHearing, hOrder, hReview⟩



theorem reachable_inCourtReview_intro {ch o c}
    (hCharged : ChargeFiled ch c)
    (hComplaint : TimelyComplaintIssuance ch c)
    (hHearing : TimelyHearing ch c)
    (hOrder : OrderIssued o c)
    (hReview : ProperCourtReview o c) :
    Reachable ch o c State.InCourtReview :=
  .toReview
    (.toOrder
      (.toHeard
        (.toComplaint (.start hCharged) hComplaint)
        hHearing)
      hOrder)
    hReview

end Proving.USC.T29.Procedure
