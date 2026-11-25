




import Proving.USC.T18.Ch77.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Procedure
open Proving.USC.Common


def guardedTransition_intro (fromState toState : State) (guard : Prop) : GuardedTransition :=
  ⟨fromState, toState, guard⟩

theorem prosecutionInitiated_intro {p : Person} {c : ComplaintText}
    (hConduct : OffenseConductOccurred p c)
    (hCommenced : ProsecutionCommenced p c)
    : ProsecutionInitiated p c :=
  ⟨hConduct, hCommenced⟩

theorem convictionReached_intro {p : Person} {c : ComplaintText}
    (hCommenced : ProsecutionCommenced p c)
    (hConvicted : ConvictionEntered p c)
    : ConvictionReached p c :=
  ⟨hCommenced, hConvicted⟩

theorem basePenaltyTriggered_intro {p : Person} {c : ComplaintText}
    (hConvicted : ConvictionEntered p c)
    : BasePenaltyTriggered p c :=
  ⟨hConvicted⟩

theorem enhancedPenaltyTriggered_intro {p : Person} {c : ComplaintText}
    (hConvicted : ConvictionEntered p c)
    (hAgg : AggravatingCircumstanceEstablished p c)
    : EnhancedPenaltyTriggered p c :=
  ⟨hConvicted, hAgg⟩




theorem timelyProsecution_intro {c : ComplaintText} {offenseDay chargeDay windowDays : Nat}
    (hOffense : OffenseCommittedOnDay c offenseDay)
    (hCharge : ProsecutionCommencedOnDay c chargeDay)
    (hWin : chargeDay - offenseDay ≤ windowDays)
    : TimelyProsecution c offenseDay chargeDay windowDays :=
  ⟨hOffense, hCharge, hWin⟩

theorem exemptionApplies_intro {p : Person} {c : ComplaintText}
    (hVictim : VictimConductIncidentToTrafficking p c)
    : ExemptionApplies p c :=
  ⟨hVictim⟩

theorem ageKnowledgeBurdenRelieved_intro {p : Person} {c : ComplaintText}
    (hObserved : ReasonableOpportunityToObserveAge p c)
    : AgeKnowledgeBurdenRelieved p c :=
  ⟨hObserved⟩



theorem window_decidable_example : (100 : Nat) - 40 ≤ 60 := by decide

end Proving.USC.T18.Ch77.Procedure
