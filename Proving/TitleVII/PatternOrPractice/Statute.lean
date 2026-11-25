













import Proving.TitleVII.PatternOrPractice.Predicates

namespace Proving.TitleVII.PatternOrPractice

open Proving.TitleVII







structure PatternOrPracticeAction
    (e : Enforcer) (r : Respondent) (c : ComplaintText) : Prop where
  authorizedEnforcer : IsAuthorizedPatternOrPracticeEnforcer e c
  reasonableCause    : EnforcerHasReasonableCause e r c
  patternOrPractice  : PatternOrPracticeOfResistance r c
  intentToDeny       : IntendedToDenyRights r c
  brings             : EnforcerBringsPatternOrPracticeAction e r c







inductive ValidPatternOrPracticeAction
    (r : Respondent) (c : ComplaintText) : Prop where
  | viaEnforcer
      (e : Enforcer)
      (h : PatternOrPracticeAction e r c) :
      ValidPatternOrPracticeAction r c

end Proving.TitleVII.PatternOrPractice
