












import Proving.USC.T42.TitleVIIEnf.Procedure.Types
import Proving.USC.T42.TitleVIIEnf.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIEnf.Procedure

open Proving.USC.Common





structure TimelyChargeFiling (p : Person) (ch : Charge) (c : ComplaintText) : Prop where
  practice : PracticeOccurred p c
  filed    : ChargeFiled ch c
  inWindow : WithinChargeFilingWindow ch c



structure TimelyService (ch : Charge) (r : Respondent) (c : ComplaintText) : Prop where
  filed   : ChargeFiled ch c
  served  : ServiceWithinTenDays ch r c




structure DeferralSatisfied (a : DeferralAgency) (c : ComplaintText) : Prop where
  applies  : DeferralStateApplies a c
  elapsed  : StateDeferralPeriodElapsed a c




structure ConciliationComplete (ch : Charge) (c : ComplaintText) : Prop where
  investigated : InvestigationConducted ch c
  cause        : ReasonableCauseFound ch c
  conciliated  : ConciliationAttempted ch c





structure TimelyPrivateSuit (ch : Charge) (act : CivilAction) (c : ComplaintText) : Prop where
  notice   : RightToSueNoticeIssued ch c
  filed    : CivilActionFiled act c
  inWindow : WithinNinetyDaySuitWindow act c
  venue    : VenueProper act c






structure FederalSectorTimelySuit (p : Person) (act : CivilAction) (c : ComplaintText) : Prop where
  covered    : FederalSectorEmployee p c
  exhausted  : FederalSectorExhaustionMet p c
  filed      : CivilActionFiled act c
  venue      : VenueProper act c


structure PatternOrPracticeSuit (p : Person) (act : CivilAction) (c : ComplaintText) : Prop where
  cause  : PatternOrPracticeCause p c
  filed  : PatternOrPracticeActionFiled act c








structure TimelyTitleVIIPrivateAction
    (p : Person) (ch : Charge) (r : Respondent) (act : CivilAction) (c : ComplaintText) : Prop where
  charge       : TimelyChargeFiling p ch c
  service      : TimelyService ch r c
  conciliation : ConciliationComplete ch c
  suit         : TimelyPrivateSuit ch act c







inductive Reachable (p : Person) (ch : Charge) (r : Respondent) (act : CivilAction) (c : ComplaintText)
    : State → Prop
  | practice :
      PracticeOccurred p c → Reachable p ch r act c State.PracticeOccurred
  | filed :
      TimelyChargeFiling p ch c → Reachable p ch r act c State.ChargeFiled
  | served :
      TimelyChargeFiling p ch c → TimelyService ch r c →
        Reachable p ch r act c State.ServiceComplete
  | conciliated :
      TimelyChargeFiling p ch c → TimelyService ch r c → ConciliationComplete ch c →
        Reachable p ch r act c State.Conciliated
  | suit :
      TimelyTitleVIIPrivateAction p ch r act c → Reachable p ch r act c State.SuitFiled

end Proving.USC.T42.TitleVIIEnf.Procedure
