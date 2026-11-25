













import Proving.USC.T05.Rulemaking.Deontic.Types
import Proving.USC.Common.Types

namespace Proving.USC.T05.Rulemaking.Deontic

open Proving.USC.Common





axiom IsAgencyAddressee (a : Agency) (c : ComplaintText) : Prop







axiom Section553Applies (a : Agency) (r : Rule) (c : ComplaintText) : Prop







axiom NoNoticeException (a : Agency) (r : Rule) (c : ComplaintText) : Prop







axiom NoticePublished (a : Agency) (r : Rule) (c : ComplaintText) : Prop





axiom CommentOpportunityAfforded (a : Agency) (r : Rule) (c : ComplaintText) : Prop





axiom ThirtyDayDelayObserved (a : Agency) (r : Rule) (c : ComplaintText) : Prop




axiom PetitionRightAfforded (a : Agency) (c : ComplaintText) : Prop

end Proving.USC.T05.Rulemaking.Deontic
