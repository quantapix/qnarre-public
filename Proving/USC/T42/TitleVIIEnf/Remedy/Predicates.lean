













import Proving.USC.T42.TitleVIIEnf.Remedy.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.TitleVIIEnf.Remedy

open Proving.USC.Common







axiom ChargeTimelyFiled (p : Person) (c : ComplaintText) : Prop






axiom ExhaustedAdministrativeRemedies (p : Person) (c : ComplaintText) : Prop






axiom IsAggrievedPerson (p : Person) (c : ComplaintText) : Prop






axiom RespondentIsGovernment (p : Person) (c : ComplaintText) : Prop






axiom IntentionalViolationFound (p : Person) (c : ComplaintText) : Prop







axiom PatternOrPracticePleaded (p : Person) (c : ComplaintText) : Prop







axiom GoodFaithRelianceDefense (p : Person) (c : ComplaintText) : Prop








axiom CommissionEnforcementAuthority (e : Entity) (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVIIEnf.Remedy
