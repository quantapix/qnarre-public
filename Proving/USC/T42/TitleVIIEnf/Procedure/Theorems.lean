







import Proving.USC.T42.TitleVIIEnf.Procedure.Types
import Proving.USC.T42.TitleVIIEnf.Procedure.Predicates
import Proving.USC.T42.TitleVIIEnf.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIEnf.Procedure

open Proving.USC.Common


theorem timelyChargeFiling_intro {p ch c}
    (hPractice : PracticeOccurred p c) (hFiled : ChargeFiled ch c)
    (hWindow : WithinChargeFilingWindow ch c) : TimelyChargeFiling p ch c :=
  ⟨hPractice, hFiled, hWindow⟩


theorem timelyService_intro {ch r c}
    (hFiled : ChargeFiled ch c) (hServed : ServiceWithinTenDays ch r c)
    : TimelyService ch r c :=
  ⟨hFiled, hServed⟩


theorem deferralSatisfied_intro {a c}
    (hApplies : DeferralStateApplies a c) (hElapsed : StateDeferralPeriodElapsed a c)
    : DeferralSatisfied a c :=
  ⟨hApplies, hElapsed⟩


theorem conciliationComplete_intro {ch c}
    (hInv : InvestigationConducted ch c) (hCause : ReasonableCauseFound ch c)
    (hConc : ConciliationAttempted ch c) : ConciliationComplete ch c :=
  ⟨hInv, hCause, hConc⟩


theorem timelyPrivateSuit_intro {ch act c}
    (hNotice : RightToSueNoticeIssued ch c) (hFiled : CivilActionFiled act c)
    (hWindow : WithinNinetyDaySuitWindow act c) (hVenue : VenueProper act c)
    : TimelyPrivateSuit ch act c :=
  ⟨hNotice, hFiled, hWindow, hVenue⟩


theorem federalSectorTimelySuit_intro {p act c}
    (hCovered : FederalSectorEmployee p c) (hExhausted : FederalSectorExhaustionMet p c)
    (hFiled : CivilActionFiled act c) (hVenue : VenueProper act c)
    : FederalSectorTimelySuit p act c :=
  ⟨hCovered, hExhausted, hFiled, hVenue⟩


theorem patternOrPracticeSuit_intro {p act c}
    (hCause : PatternOrPracticeCause p c) (hFiled : PatternOrPracticeActionFiled act c)
    : PatternOrPracticeSuit p act c :=
  ⟨hCause, hFiled⟩


theorem timelyTitleVIIPrivateAction_intro {p ch r act c}
    (hCharge : TimelyChargeFiling p ch c) (hService : TimelyService ch r c)
    (hConc : ConciliationComplete ch c) (hSuit : TimelyPrivateSuit ch act c)
    : TimelyTitleVIIPrivateAction p ch r act c :=
  ⟨hCharge, hService, hConc, hSuit⟩


theorem reachable_suit_intro {p ch r act c}
    (h : TimelyTitleVIIPrivateAction p ch r act c)
    : Reachable p ch r act c State.SuitFiled :=
  Reachable.suit h

end Proving.USC.T42.TitleVIIEnf.Procedure
