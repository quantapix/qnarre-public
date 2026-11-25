






import Proving.USC.T05.Rulemaking.Deontic.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T05.Rulemaking.Deontic

open Proving.USC.Common



theorem section553bBreached_intro {a r c}
    (hAddr : IsAgencyAddressee a c) (hApplies : Section553Applies a r c)
    (hNoExcept : NoNoticeException a r c) (hNoNotice : ¬ NoticePublished a r c)
    : Section553bBreached a r c :=
  ⟨⟨hAddr, hApplies, hNoExcept⟩, hNoNotice⟩


theorem section553cBreached_intro {a r c}
    (hAddr : IsAgencyAddressee a c) (hApplies : Section553Applies a r c)
    (hNoComment : ¬ CommentOpportunityAfforded a r c)
    : Section553cBreached a r c :=
  ⟨⟨hAddr, hApplies⟩, hNoComment⟩


theorem section553dBreached_intro {a r c}
    (hAddr : IsAgencyAddressee a c) (hApplies : Section553Applies a r c)
    (hNoDelay : ¬ ThirtyDayDelayObserved a r c)
    : Section553dBreached a r c :=
  ⟨⟨hAddr, hApplies⟩, hNoDelay⟩


theorem section553eBreached_intro {a c}
    (hAddr : IsAgencyAddressee a c) (hNoPetition : ¬ PetitionRightAfforded a c)
    : Section553eBreached a c :=
  ⟨⟨hAddr⟩, hNoPetition⟩


theorem section553Breached_intro {a r c}
    (h : Section553bBreached a r c) : Section553Breached a r c :=
  Section553Breached.byNotice h

end Proving.USC.T05.Rulemaking.Deontic
