








import Proving.USC.T18.Ch117.Procedure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch117.Procedure

open Proving.USC.Common








axiom HarboringForProhibitedPurpose (p : Person) (c : ComplaintText) : Prop





axiom filingDates (p : Person) (c : ComplaintText) : FilingDates




axiom StatementFiledWithCommissioner (p : Person) (c : ComplaintText) : Prop





axiom StatementContentComplete (p : Person) (c : ComplaintText) : Prop




axiom StatementOnFile (p : Person) (c : ComplaintText) : Prop




axiom NonFilingRebutted (p : Person) (c : ComplaintText) : Prop






axiom CrossDesignationRequested (p : Person) (c : ComplaintText) : Prop




axiom UnderminesAdministrationOfJustice (p : Person) (c : ComplaintText) : Prop




axiom RequestDenied (p : Person) (c : ComplaintText) : Prop




axiom DenialReasonSubmitted (p : Person) (c : ComplaintText) : Prop




axiom denialReasonDates (p : Person) (c : ComplaintText) : DenialReasonDates






axiom InjuredByViolation (p : Person) (c : ComplaintText) : Prop



axiom CivilActionFiled (p : Person) (c : ComplaintText) : Prop




axiom ProperDistrictCourtVenue (p : Person) (c : ComplaintText) : Prop






axiom WithinLimitations (p : Person) (c : ComplaintText) : Prop







axiom ConvictedUnderChapter117 (p : Person) (c : ComplaintText) : Prop




axiom AtSentencing (p : Person) (c : ComplaintText) : Prop





axiom PriorSexOffenseConviction (p : Person) (c : ComplaintText) : Prop




axiom Section3559eApplies (p : Person) (c : ComplaintText) : Prop







def WithinFiveBusinessDays (p : Person) (c : ComplaintText) : Prop :=
  (filingDates p c).filedDay - (filingDates p c).commencedDay ≤ 5



def WithinSixtyDays (p : Person) (c : ComplaintText) : Prop :=
  (denialReasonDates p c).reasonSubmittedDay - (denialReasonDates p c).receivedDay ≤ 60



def PresumedFailureToFile (p : Person) (c : ComplaintText) : Prop :=
  ¬ StatementOnFile p c ∧ ¬ NonFilingRebutted p c




def RecidivistEnhancementTriggered (p : Person) (c : ComplaintText) : Prop :=
  PriorSexOffenseConviction p c ∧ ¬ Section3559eApplies p c

end Proving.USC.T18.Ch117.Procedure
