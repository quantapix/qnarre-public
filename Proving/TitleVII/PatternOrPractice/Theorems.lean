









import Proving.TitleVII.PatternOrPractice.Statute

namespace Proving.TitleVII.PatternOrPractice

open Proving.TitleVII



theorem patternOrPracticeAction_intro
    {e : Enforcer} {r : Respondent} {c : ComplaintText}
    (hAuthorized : IsAuthorizedPatternOrPracticeEnforcer e c)
    (hReasonable : EnforcerHasReasonableCause e r c)
    (hPattern    : PatternOrPracticeOfResistance r c)
    (hIntent     : IntendedToDenyRights r c)
    (hBrings     : EnforcerBringsPatternOrPracticeAction e r c)
    : PatternOrPracticeAction e r c :=
  { authorizedEnforcer := hAuthorized
    reasonableCause := hReasonable
    patternOrPractice := hPattern
    intentToDeny := hIntent
    brings := hBrings }



theorem validPatternOrPracticeAction_ofEnforcer
    {e : Enforcer} {r : Respondent} {c : ComplaintText}
    (h : PatternOrPracticeAction e r c)
    : ValidPatternOrPracticeAction r c :=
  ValidPatternOrPracticeAction.viaEnforcer e h

end Proving.TitleVII.PatternOrPractice
