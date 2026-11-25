








import Proving.USC.T18.Ch117.Procedure.Types
import Proving.USC.T18.Ch117.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch117.Procedure

open Proving.USC.Common




structure TimelyAlienStatementFiling (p : Person) (c : ComplaintText) : Prop where
  harboring : HarboringForProhibitedPurpose p c
  filed     : StatementFiledWithCommissioner p c
  complete  : StatementContentComplete p c
  inWindow  : WithinFiveBusinessDays p c



structure FilingDutyBreached (p : Person) (c : ComplaintText) : Prop where
  harboring : HarboringForProhibitedPurpose p c
  untimely  : ¬ WithinFiveBusinessDays p c



structure NonFilingPresumptionStands (p : Person) (c : ComplaintText) : Prop where
  harboring : HarboringForProhibitedPurpose p c
  presumed  : PresumedFailureToFile p c




structure TimelyDenialReason (p : Person) (c : ComplaintText) : Prop where
  requested : CrossDesignationRequested p c
  denied    : RequestDenied p c
  submitted : DenialReasonSubmitted p c
  inWindow  : WithinSixtyDays p c



structure TimelyCivilAction (p : Person) (c : ComplaintText) : Prop where
  accrued  : InjuredByViolation p c
  filed    : CivilActionFiled p c
  venue    : ProperDistrictCourtVenue p c
  inWindow : WithinLimitations p c




structure MandatorySentencingOrders (p : Person) (c : ComplaintText) : Prop where
  convicted    : ConvictedUnderChapter117 p c
  atSentencing : AtSentencing p c



structure RecidivistEnhancement (p : Person) (c : ComplaintText) : Prop where
  convicted : ConvictedUnderChapter117 p c
  triggered : RecidivistEnhancementTriggered p c



inductive ProceduralOutcome (p : Person) (c : ComplaintText) : Prop
  | timelyFiling      : TimelyAlienStatementFiling p c   → ProceduralOutcome p c
  | filingBreach      : FilingDutyBreached p c           → ProceduralOutcome p c
  | presumptionStands : NonFilingPresumptionStands p c   → ProceduralOutcome p c
  | timelyDenial      : TimelyDenialReason p c           → ProceduralOutcome p c
  | timelyCivilAction : TimelyCivilAction p c            → ProceduralOutcome p c
  | sentencingOrders  : MandatorySentencingOrders p c    → ProceduralOutcome p c
  | recidivist        : RecidivistEnhancement p c        → ProceduralOutcome p c

end Proving.USC.T18.Ch117.Procedure
