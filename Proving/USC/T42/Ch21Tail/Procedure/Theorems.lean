import Proving.USC.T42.Ch21Tail.Procedure.Statute













set_option autoImplicit false

namespace Proving.USC.T42.Ch21Tail.Procedure

open Proving.USC.Common




theorem section1997dRetaliationEstablished_intro
    {p : Person} {c : ComplaintText} {reportDay adverseDay : Nat}
    (hReported : ReportStepOccurred p c)
    (hReportDate : ReportOccurredOnDay p c reportDay)
    (hWithin : ReportedConditionsWithinSubchapter p c)
    (hAdverse : AdverseActionStepOccurred p c)
    (hAdverseDate : AdverseActionOccurredOnDay p c adverseDay)
    (hFor : AdverseActionBecauseOfReport p c)
    (hOrdered : ReportPrecedesAdverseAction reportDay adverseDay) :
    Section1997dRetaliationEstablished p c reportDay adverseDay :=
  ⟨hReported, hReportDate, hWithin, hAdverse, hAdverseDate, hFor, hOrdered⟩



theorem reportPrecedesAdverseAction_of_le {reportDay adverseDay : Nat}
    (h : reportDay ≤ adverseDay) : ReportPrecedesAdverseAction reportDay adverseDay := h



example : ReportPrecedesAdverseAction 100 250 := by decide



theorem section1997dRetaliationEstablished_reachable
    {p : Person} {c : ComplaintText} {reportDay adverseDay : Nat}
    (h : Section1997dRetaliationEstablished p c reportDay adverseDay) :
    ReachableUnder1997d p c reportDay adverseDay .RetaliationEstablished :=
  .established
    (.adverseAction
      (.protectedReport
        (.reported .start h.reported h.reportDate)
        h.withinSubchapter)
      h.adverseAction h.adverseDate)
    h.forSoReporting h.ordered




theorem correctionTrackTaken_litigation_intro
    {i : Institution} {c : ComplaintText}
    (h : LitigationTrackInitiated i c) : CorrectionTrackTaken i c :=
  .litigation h


theorem correctionTrackTaken_voluntary_intro
    {i : Institution} {c : ComplaintText} {agency : Entity}
    (hAgency : IsGovernmentAgency agency c)
    (hEfforts : VoluntaryGoodFaithEffortsUndertaken agency i c) :
    CorrectionTrackTaken i c :=
  .voluntary agency hAgency hEfforts


theorem section1997gPriorityRecommended_intro
    {i : Institution} {c : ComplaintText}
    (hCovered : IsCoveredInstitution i c)
    (hConditions : DeplorableConditionsExist i c)
    (hTrack : CorrectionTrackTaken i c)
    (hFunds : FederalFundsAvailableForImprovement i c)
    (hPriority : PriorityGivenToCorrection i c) :
    Section1997gPriorityRecommended i c :=
  ⟨hCovered, hConditions, hTrack, hFunds, hPriority⟩



theorem section1997gPriorityRecommended_reachable
    {i : Institution} {c : ComplaintText}
    (h : Section1997gPriorityRecommended i c) :
    ReachableUnder1997g i c .PriorityAssigned :=
  .priorityAssigned
    (.correctionInitiated (.conditionsExist h.covered h.conditions) h.track)
    h.fundsAvailable h.priority




theorem redirectionMandated_unreachable {i : Institution} {c : ComplaintText} :
    ¬ ReachableUnder1997g i c .RedirectionMandated := by
  intro h
  cases h

end Proving.USC.T42.Ch21Tail.Procedure
