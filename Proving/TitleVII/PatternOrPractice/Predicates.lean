























import Proving.TitleVII.Types

namespace Proving.TitleVII.PatternOrPractice

open Proving.TitleVII





axiom IsAuthorizedPatternOrPracticeEnforcer (e : Enforcer) (c : ComplaintText) : Prop






axiom EnforcerHasReasonableCause (e : Enforcer) (r : Respondent) (c : ComplaintText) : Prop






axiom PatternOrPracticeOfResistance (r : Respondent) (c : ComplaintText) : Prop




axiom IntendedToDenyRights (r : Respondent) (c : ComplaintText) : Prop




axiom EnforcerBringsPatternOrPracticeAction (e : Enforcer) (r : Respondent) (c : ComplaintText) : Prop

end Proving.TitleVII.PatternOrPractice
