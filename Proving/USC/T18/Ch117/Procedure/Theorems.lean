







import Proving.USC.T18.Ch117.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch117.Procedure

open Proving.USC.Common


theorem timelyAlienStatementFiling_intro {p : Person} {c : ComplaintText}
    (hHarbor : HarboringForProhibitedPurpose p c)
    (hFiled : StatementFiledWithCommissioner p c)
    (hComplete : StatementContentComplete p c)
    (hWindow : WithinFiveBusinessDays p c) :
    TimelyAlienStatementFiling p c :=
  ⟨hHarbor, hFiled, hComplete, hWindow⟩


theorem filingDutyBreached_intro {p : Person} {c : ComplaintText}
    (hHarbor : HarboringForProhibitedPurpose p c)
    (hUntimely : ¬ WithinFiveBusinessDays p c) :
    FilingDutyBreached p c :=
  ⟨hHarbor, hUntimely⟩



theorem nonFilingPresumptionStands_intro {p : Person} {c : ComplaintText}
    (hHarbor : HarboringForProhibitedPurpose p c)
    (hPresumed : PresumedFailureToFile p c) :
    NonFilingPresumptionStands p c :=
  ⟨hHarbor, hPresumed⟩


theorem timelyDenialReason_intro {p : Person} {c : ComplaintText}
    (hRequested : CrossDesignationRequested p c)
    (hDenied : RequestDenied p c)
    (hSubmitted : DenialReasonSubmitted p c)
    (hWindow : WithinSixtyDays p c) :
    TimelyDenialReason p c :=
  ⟨hRequested, hDenied, hSubmitted, hWindow⟩



theorem timelyCivilAction_intro {p : Person} {c : ComplaintText}
    (hAccrued : InjuredByViolation p c)
    (hFiled : CivilActionFiled p c)
    (hVenue : ProperDistrictCourtVenue p c)
    (hWindow : WithinLimitations p c) :
    TimelyCivilAction p c :=
  ⟨hAccrued, hFiled, hVenue, hWindow⟩


theorem mandatorySentencingOrders_intro {p : Person} {c : ComplaintText}
    (hConvicted : ConvictedUnderChapter117 p c)
    (hAtSentencing : AtSentencing p c) :
    MandatorySentencingOrders p c :=
  ⟨hConvicted, hAtSentencing⟩


theorem recidivistEnhancement_intro {p : Person} {c : ComplaintText}
    (hConvicted : ConvictedUnderChapter117 p c)
    (hTriggered : RecidivistEnhancementTriggered p c) :
    RecidivistEnhancement p c :=
  ⟨hConvicted, hTriggered⟩

end Proving.USC.T18.Ch117.Procedure
