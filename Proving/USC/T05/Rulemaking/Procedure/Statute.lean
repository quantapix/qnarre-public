












import Proving.USC.Common.Types
import Proving.USC.T05.Rulemaking.Procedure.Types
import Proving.USC.T05.Rulemaking.Procedure.Predicates

namespace Proving.USC.T05.Rulemaking.Procedure

open Proving.USC.Common






structure NoticeTransition (a : Agency) (r : Rule) : Prop where
  applies  : Section553Applies a r
  notice   : NoticePublished a r
  contents : NoticeContentsComplete a r



structure CommentTransition (a : Agency) (r : Rule) : Prop where
  opened  : CommentOpportunityGiven a r




structure AdoptionTransition (a : Agency) (r : Rule) : Prop where
  considered : BasisAndPurposeStated a r




structure EffectiveDateTransition (a : Agency) (r : Rule) : Prop where
  timely  : WithinThirtyDayWindow a r ∨ ThirtyDayExceptionApplies a r





structure LawfulRuleAdoption (a : Agency) (r : Rule) : Prop where
  notice   : NoticeTransition a r
  comment  : CommentTransition a r
  adoption : AdoptionTransition a r
  petition : PetitionRightAfforded a r




structure EffectiveRuleTimely (a : Agency) (r : Rule) : Prop where
  lawful    : LawfulRuleAdoption a r
  effective : EffectiveDateTransition a r





inductive Reachable (a : Agency) (r : Rule) : State → Prop
  | initiated : Reachable a r State.Initiated
  | exempt    : NoticeExemptionInvoked a r → Reachable a r State.Exempt
  | notice    : Reachable a r State.Initiated → NoticeTransition a r →
                Reachable a r State.NoticePublished
  | comment   : Reachable a r State.NoticePublished → CommentTransition a r →
                Reachable a r State.CommentPeriodOpen
  | adopt     : Reachable a r State.CommentPeriodOpen → AdoptionTransition a r →
                Reachable a r State.RuleAdopted
  | effective : Reachable a r State.RuleAdopted → EffectiveDateTransition a r →
                Reachable a r State.Effective

end Proving.USC.T05.Rulemaking.Procedure
