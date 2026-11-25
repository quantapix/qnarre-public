














import Proving.USC.T42.TitleVIIEnf.Elements.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.TitleVIIEnf.Elements

open Proving.USC.Common






axiom IsAggrievedPerson (p : Person) (c : ComplaintText) : Prop





axiom IsCoveredRespondent (r : Respondent) (c : ComplaintText) : Prop





axiom UnlawfulEmploymentPractice (r : Respondent) (c : ComplaintText) : Prop




axiom ChargeFiledWithEEOC (ch : Charge) (r : Respondent) (c : ComplaintText) : Prop







axiom ChargeTimelyFiled (ch : Charge) (c : ComplaintText) : Prop





axiom RightToSueExhausted (ch : Charge) (c : ComplaintText) : Prop






axiom SuitTimelyFiled (p : Person) (c : ComplaintText) : Prop







axiom NoGoodFaithRelianceDefense (r : Respondent) (c : ComplaintText) : Prop






axiom PatternOrPracticeOfResistance (pp : PatternOrPractice) (c : ComplaintText) : Prop




axiom IntendedToDenyRights (pp : PatternOrPractice) (c : ComplaintText) : Prop





axiom EnforcerHasReasonableCause (pp : PatternOrPractice) (c : ComplaintText) : Prop








axiom IsCoveredFederalEmployee (p : Person) (c : ComplaintText) : Prop





axiom FederalAdministrativeExhaustion (p : Person) (c : ComplaintText) : Prop






axiom FederalSuitTimelyFiled (p : Person) (c : ComplaintText) : Prop







axiom IsRecordkeepingCoveredEntity (r : Respondent) (c : ComplaintText) : Prop





axiom RecordkeepingUndueHardship (r : Respondent) (c : ComplaintText) : Prop




axiom ExemptionApplicationDenied (r : Respondent) (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVIIEnf.Elements
