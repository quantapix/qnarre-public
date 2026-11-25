












import Proving.USC.T05.Rulemaking.Deontic.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T05.Rulemaking.Deontic

open Proving.USC.Common





structure Obligation553b (a : Agency) (r : Rule) (c : ComplaintText) : Prop where
  addressee : IsAgencyAddressee a c
  applies   : Section553Applies a r c
  noExcept  : NoNoticeException a r c



def Section553bBreached (a : Agency) (r : Rule) (c : ComplaintText) : Prop :=
  Obligation553b a r c ∧ ¬ NoticePublished a r c




structure Obligation553c (a : Agency) (r : Rule) (c : ComplaintText) : Prop where
  addressee : IsAgencyAddressee a c
  applies   : Section553Applies a r c



def Section553cBreached (a : Agency) (r : Rule) (c : ComplaintText) : Prop :=
  Obligation553c a r c ∧ ¬ CommentOpportunityAfforded a r c





structure Obligation553d (a : Agency) (r : Rule) (c : ComplaintText) : Prop where
  addressee : IsAgencyAddressee a c
  applies   : Section553Applies a r c



def Section553dBreached (a : Agency) (r : Rule) (c : ComplaintText) : Prop :=
  Obligation553d a r c ∧ ¬ ThirtyDayDelayObserved a r c




structure Obligation553e (a : Agency) (c : ComplaintText) : Prop where
  addressee : IsAgencyAddressee a c



def Section553eBreached (a : Agency) (c : ComplaintText) : Prop :=
  Obligation553e a c ∧ ¬ PetitionRightAfforded a c






inductive Section553Breached (a : Agency) (r : Rule) (c : ComplaintText) : Prop
  | byNotice    : Section553bBreached a r c → Section553Breached a r c
  | byComment   : Section553cBreached a r c → Section553Breached a r c
  | byDelay     : Section553dBreached a r c → Section553Breached a r c
  | byPetition  : Section553eBreached a c   → Section553Breached a r c

end Proving.USC.T05.Rulemaking.Deontic
