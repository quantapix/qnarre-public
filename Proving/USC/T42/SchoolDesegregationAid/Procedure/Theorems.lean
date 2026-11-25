








import Proving.USC.T42.SchoolDesegregationAid.Procedure.Statute

namespace Proving.USC.T42.SchoolDesegregationAid.Procedure

open Proving.USC.Common


theorem entryApplied_intro {a c}
    (hEligible : IsEligibleApplicant a c)
    (hFiled : AssistanceApplicationFiled a c) :
    EntryApplied a c :=
  ⟨hEligible, hFiled⟩



theorem considerationStep_intro {p c}
    (hConsidered : MandatoryFactorsConsidered p c) :
    ConsiderationStep p c :=
  ⟨hConsidered⟩



theorem awardStep_intro {p c}
    (hConsidered : MandatoryFactorsConsidered p c)
    (hAwarded : AssistanceAwarded p c) :
    AwardStep p c :=
  ⟨hConsidered, hAwarded⟩



theorem paymentStep_intro {p c}
    (hAwarded : AssistanceAwarded p c)
    (hAdjusted : PriorAdjustmentsApplied p c)
    (hPaid : PaymentMade p c) :
    PaymentStep p c :=
  ⟨hAwarded, hAdjusted, hPaid⟩



theorem pipelineCompleted_intro {a p c}
    (hEligible : IsEligibleApplicant a c)
    (hFiled : AssistanceApplicationFiled a c)
    (hConsidered : MandatoryFactorsConsidered p c)
    (hAwarded : AssistanceAwarded p c)
    (hAdjusted : PriorAdjustmentsApplied p c)
    (hPaid : PaymentMade p c) :
    PipelineCompleted a p c :=
  ⟨hEligible, hFiled, hConsidered, hAwarded, hAdjusted, hPaid⟩


theorem costRuleApplied_intro {q c}
    (hSubchapter : IsSubchapterProceeding q c)
    (hLiable : UnitedStatesLiableForCosts q c) :
    CostRuleApplied q c :=
  ⟨hSubchapter, hLiable⟩




theorem paid_reachable_of_pipeline {a p c}
    (h : PipelineCompleted a p c) :
    Reachable a p c State.Paid :=
  Reachable.paid
    (Reachable.awarded
      (Reachable.considered
        (Reachable.applied ⟨h.eligible, h.filed⟩)
        ⟨h.considered⟩)
      ⟨h.considered, h.awarded⟩)
    ⟨h.awarded, h.adjusted, h.paid⟩

end Proving.USC.T42.SchoolDesegregationAid.Procedure
