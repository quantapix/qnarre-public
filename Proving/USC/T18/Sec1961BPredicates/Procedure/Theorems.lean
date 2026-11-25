










import Proving.USC.T18.Sec1961BPredicates.Procedure.Statute

namespace Proving.USC.T18.Sec1961BPredicates.Procedure

open Proving.USC.Common



theorem federalJurisdictionTransition_intro {c}
    (hConduct : ConductOccurred c) (hCirc : FederalCircumstanceMet c) :
    FederalJurisdictionTransition c :=
  ⟨hConduct, hCirc⟩


theorem continuousOperationDurationMet_intro {n c}
    (hSpan : OperationSpanIs n c) (hExceeds : ExceedsThirtyDays n) :
    ContinuousOperationDurationMet n c :=
  ⟨hSpan, hExceeds⟩


theorem fivePersonScaleMet_intro {k c}
    (hCount : PersonCountIs k c) (hAtLeast : AtLeastFivePersons k) :
    FivePersonScaleMet k c :=
  ⟨hCount, hAtLeast⟩


theorem probableCausePresumption_intro {k n c}
    (hWarrant : WarrantSought c) (hScale : FivePersonScaleMet k c)
    (hOp : OperationSpanIs n c) (hTwo : AtLeastTwoSuccessiveDays n) :
    ProbableCausePresumption k n c :=
  ⟨hWarrant, hScale, hOp, hTwo⟩


theorem carrierDiscontinuanceDuty_intro {c}
    (hNotified : WrittenNotificationServed c)
    (hNotice : ReasonableNoticeToSubscriber c)
    (hDisc : FacilityDiscontinued c) :
    CarrierDiscontinuanceDuty c :=
  ⟨hNotified, hNotice, hDisc⟩


theorem carrierSafeHarbor_intro {c}
    (hNotified : WrittenNotificationServed c)
    (hCompliance : ActDoneInComplianceWithNotice c) :
    CarrierSafeHarbor c :=
  ⟨hNotified, hCompliance⟩


theorem forfeitureProcess_intro {pr c}
    (hUsed : PropertyUsedInViolation pr c) (hSeized : PropertySeized pr c)
    (hAdj : ForfeitureAdjudicated pr c) :
    ForfeitureProcess pr c :=
  ⟨hUsed, hSeized, hAdj⟩


theorem mandatoryForfeitureOnConviction_intro {pr c}
    (hConv : ConvictionEntered c) (hUsed : PropertyUsedInViolation pr c)
    (hAdj : ForfeitureAdjudicated pr c) :
    MandatoryForfeitureOnConviction pr c :=
  ⟨hConv, hUsed, hAdj⟩


theorem recidivistEnhancement_intro {d₁ d₂ c}
    (hPrior : PriorConvictionFinalDay d₁ c) (hCurrent : CurrentOffenseDay d₂ c)
    (hAfter : OffenseAfterPriorFinal d₁ d₂) :
    RecidivistEnhancement d₁ d₂ c :=
  ⟨hPrior, hCurrent, hAfter⟩




theorem exceedsThirtyDays_demo : ExceedsThirtyDays 45 := by
  unfold ExceedsThirtyDays; decide


theorem atLeastFivePersons_demo : AtLeastFivePersons 6 := by
  unfold AtLeastFivePersons; decide



theorem offenseAfterPriorFinal_demo : OffenseAfterPriorFinal 100 250 := by
  unfold OffenseAfterPriorFinal; omega

end Proving.USC.T18.Sec1961BPredicates.Procedure
