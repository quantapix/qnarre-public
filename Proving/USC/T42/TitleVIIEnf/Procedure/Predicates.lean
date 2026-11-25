











import Proving.USC.T42.TitleVIIEnf.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIEnf.Procedure

open Proving.USC.Common






axiom PracticeOccurred (p : Person) (c : ComplaintText) : Prop





axiom ChargeFiled (ch : Charge) (c : ComplaintText) : Prop





axiom WithinChargeFilingWindow (ch : Charge) (c : ComplaintText) : Prop




axiom ServiceWithinTenDays (ch : Charge) (r : Respondent) (c : ComplaintText) : Prop







axiom DeferralStateApplies (a : DeferralAgency) (c : ComplaintText) : Prop





axiom StateDeferralPeriodElapsed (a : DeferralAgency) (c : ComplaintText) : Prop






axiom InvestigationConducted (ch : Charge) (c : ComplaintText) : Prop




axiom ReasonableCauseFound (ch : Charge) (c : ComplaintText) : Prop





axiom ConciliationAttempted (ch : Charge) (c : ComplaintText) : Prop







axiom RightToSueNoticeIssued (ch : Charge) (c : ComplaintText) : Prop



axiom CivilActionFiled (act : CivilAction) (c : ComplaintText) : Prop




axiom WithinNinetyDaySuitWindow (act : CivilAction) (c : ComplaintText) : Prop





axiom VenueProper (act : CivilAction) (c : ComplaintText) : Prop







axiom FederalSectorEmployee (p : Person) (c : ComplaintText) : Prop





axiom FederalSectorExhaustionMet (p : Person) (c : ComplaintText) : Prop







axiom PatternOrPracticeCause (p : Person) (c : ComplaintText) : Prop




axiom PatternOrPracticeActionFiled (act : CivilAction) (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVIIEnf.Procedure
