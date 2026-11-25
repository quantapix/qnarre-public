














import Proving.TitleVII.Types

namespace Proving.TitleVII











axiom IsAggrievedPerson (p : Person) (c : ComplaintText) : Prop




axiom ChargeFiledWithEEOC (ch : Charge) (p : Person) (r : Respondent) (c : ComplaintText) : Prop




axiom ChargeAllegesUnlawfulPractice (ch : Charge) (r : Respondent) (c : ComplaintText) : Prop





axiom ChargeTimelyFiled (ch : Charge) (c : ComplaintText) : Prop













axiom RightToSueExhausted (p : Person) (ch : Charge) (c : ComplaintText) : Prop



axiom SuitTimelyFiled (p : Person) (c : ComplaintText) : Prop










axiom ConciliationFailed (ch : Charge) (c : ComplaintText) : Prop





axiom RespondentHasClass (r : Respondent) (k : RespondentClass) (c : ComplaintText) : Prop



axiom EnforcerBringsCivilAction (e : Enforcer) (r : Respondent) (c : ComplaintText) : Prop

end Proving.TitleVII
