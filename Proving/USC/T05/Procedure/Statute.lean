











import Proving.USC.T05.Procedure.Types
import Proving.USC.T05.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T05.Procedure

open Proving.USC.Common






structure TimelyNotice (proc : AgencyProceeding) (c : ComplaintText) : Prop where
  required : AdjudicationRequiredOnRecord proc c
  noticed  : NoticeTimelyGiven proc c




structure ProperHearing (proc : AgencyProceeding) (c : ComplaintText) : Prop where
  heard          : HearingHeldBeforePresider proc c
  burdenMet      : BurdenOfProofMet proc c
  exclusiveRecord : DecisionOnExclusiveRecord proc c




structure ProperDecision (proc : AgencyProceeding) (c : ComplaintText) : Prop where
  exParteHonored : ExParteProhibitionHonored proc c
  decided        : InitialDecisionRendered proc c
  finalized      : BecameFinalAgencyAction proc c




structure LawfulFormalAdjudication (proc : AgencyProceeding) (c : ComplaintText) : Prop where
  notice   : TimelyNotice proc c
  hearing  : ProperHearing proc c
  decision : ProperDecision proc c







structure ReviewableAgencyAction
    (p : Person) (act : AgencyAction) (c : ComplaintText) : Prop where
  notPrecluded   : ReviewNotPrecluded act c
  finalNoRemedy  : FinalAndNoAdequateRemedy act c
  aggrieved      : PersonAggrieved p act c
  reviewObtained : JudicialReviewObtained p act c






inductive Reachable (proc : AgencyProceeding) (c : ComplaintText) : State → Prop
  | start :
      AdjudicationRequiredOnRecord proc c →
      Reachable proc c State.AdjudicationRequired
  | toNotice :
      Reachable proc c State.AdjudicationRequired →
      NoticeTimelyGiven proc c →
      Reachable proc c State.NoticeGiven
  | toHearing :
      Reachable proc c State.NoticeGiven →
      HearingHeldBeforePresider proc c →
      Reachable proc c State.HearingHeld
  | toRecordClosed :
      Reachable proc c State.HearingHeld →
      DecisionOnExclusiveRecord proc c →
      Reachable proc c State.RecordClosed
  | toInitialDecision :
      Reachable proc c State.RecordClosed →
      InitialDecisionRendered proc c →
      Reachable proc c State.InitialDecision
  | toFinal :
      Reachable proc c State.InitialDecision →
      BecameFinalAgencyAction proc c →
      Reachable proc c State.FinalAgencyAction

end Proving.USC.T05.Procedure
