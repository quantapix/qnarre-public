















import Proving.TitleVII.Predicates

namespace Proving.TitleVII







structure ChargePhase
    (ch : Charge) (p : Person) (r : Respondent) (c : ComplaintText) : Prop where
  aggrieved : IsAggrievedPerson p c
  filed     : ChargeFiledWithEEOC ch p r c
  alleges   : ChargeAllegesUnlawfulPractice ch r c
  timely    : ChargeTimelyFiled ch c







structure PrivateRightOfAction
    (p : Person) (r : Respondent) (ch : Charge) (c : ComplaintText) : Prop where
  charge     : ChargePhase ch p r c
  exhausted  : RightToSueExhausted p ch c
  timelySuit : SuitTimelyFiled p c








structure PublicEnforcementAction
    (e : Enforcer) (k : RespondentClass)
    (p : Person) (r : Respondent) (ch : Charge) (c : ComplaintText) : Prop where
  charge         : ChargePhase ch p r c
  conciliation   : ConciliationFailed ch c
  respClass      : RespondentHasClass r k c
  properEnforcer : e = ProperEnforcerFor k
  brings         : EnforcerBringsCivilAction e r c







inductive ValidTitleVIIEnforcement
    (p : Person) (r : Respondent) (ch : Charge) (c : ComplaintText) : Prop where
  | viaPrivateRight
      (h : PrivateRightOfAction p r ch c) :
      ValidTitleVIIEnforcement p r ch c
  | viaPublicEnforcement
      (e : Enforcer) (k : RespondentClass)
      (h : PublicEnforcementAction e k p r ch c) :
      ValidTitleVIIEnforcement p r ch c

end Proving.TitleVII
