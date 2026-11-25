






import Proving.USC.T05.Rulemaking.Elements.Predicates

namespace Proving.USC.T05.Rulemaking.Elements

open Proving.USC.Common




structure AdequateNotice (r : Rule) (c : ComplaintText) : Prop where
  published         : NoticePublishedInFederalRegister r c
  timePlaceNature   : NoticeStatesTimePlaceNature r c
  legalAuthority    : NoticeReferencesLegalAuthority r c
  termsOrSubstance  : NoticeStatesTermsOrSubstance r c
  notExempt         : NoticeNotExempt r c





structure Section553Informal (r : Rule) (c : ComplaintText) : Prop where
  applies            : Section553Applies r c
  notice             : AdequateNotice r c
  commentOpportunity : OpportunityToCommentAfforded r c
  basisAndPurpose    : ConciseGeneralStatementIncorporated r c
  deferredEffective  : ThirtyDayDeferredEffectiveDate r c
  petitionRight      : RightToPetitionForRulemaking r c






structure Section553Formal (r : Rule) (c : ComplaintText) : Prop where
  applies           : Section553Applies r c
  onRecordRequired  : FormalRulemakingRequiredOnRecord r c
  hearingSatisfied  : FormalHearingProceduresSatisfied r c
  deferredEffective : ThirtyDayDeferredEffectiveDate r c
  petitionRight     : RightToPetitionForRulemaking r c



inductive ValidSection553Rulemaking (r : Rule) (c : ComplaintText) : Prop
  | informal (h : Section553Informal r c) : ValidSection553Rulemaking r c
  | formal   (h : Section553Formal r c)   : ValidSection553Rulemaking r c

end Proving.USC.T05.Rulemaking.Elements
