





import Proving.USC.T05.Rulemaking.Elements.Statute

namespace Proving.USC.T05.Rulemaking.Elements

open Proving.USC.Common


theorem adequateNotice_intro {r c}
    (hPub : NoticePublishedInFederalRegister r c)
    (hTPN : NoticeStatesTimePlaceNature r c)
    (hAuth : NoticeReferencesLegalAuthority r c)
    (hTerms : NoticeStatesTermsOrSubstance r c)
    (hNotExempt : NoticeNotExempt r c) :
    AdequateNotice r c :=
  ⟨hPub, hTPN, hAuth, hTerms, hNotExempt⟩


theorem section553Informal_intro {r c}
    (hApplies : Section553Applies r c)
    (hNotice : AdequateNotice r c)
    (hComment : OpportunityToCommentAfforded r c)
    (hBasis : ConciseGeneralStatementIncorporated r c)
    (hDeferred : ThirtyDayDeferredEffectiveDate r c)
    (hPetition : RightToPetitionForRulemaking r c) :
    Section553Informal r c :=
  ⟨hApplies, hNotice, hComment, hBasis, hDeferred, hPetition⟩


theorem section553Formal_intro {r c}
    (hApplies : Section553Applies r c)
    (hOnRecord : FormalRulemakingRequiredOnRecord r c)
    (hHearing : FormalHearingProceduresSatisfied r c)
    (hDeferred : ThirtyDayDeferredEffectiveDate r c)
    (hPetition : RightToPetitionForRulemaking r c) :
    Section553Formal r c :=
  ⟨hApplies, hOnRecord, hHearing, hDeferred, hPetition⟩


theorem validSection553Rulemaking_informal_intro {r c}
    (h : Section553Informal r c) : ValidSection553Rulemaking r c :=
  .informal h


theorem validSection553Rulemaking_formal_intro {r c}
    (h : Section553Formal r c) : ValidSection553Rulemaking r c :=
  .formal h

end Proving.USC.T05.Rulemaking.Elements
