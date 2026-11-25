import Proving.USC.T18.Ch11.Reslice.Procedure.Types
import Proving.USC.T18.Ch11.Reslice.Procedure.Predicates
import Proving.USC.T18.Ch11.Reslice.Procedure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch11.Reslice.Procedure

open Proving.USC.Common


theorem untimelyPostEmploymentContact_intro {p : Person} {c : ComplaintText}
    (hFormer : FormerOfficerOrEmployee p c) (hTerm : ServiceTerminated p c)
    (hContact : RestrictedContactMade p c) (hWindow : ContactWithinRestrictedPeriod p c)
    (hApplies : PostEmploymentRestrictionApplies p c) :
    UntimelyPostEmploymentContact p c :=
  ⟨hFormer, hTerm, hContact, hWindow, hApplies⟩


theorem civilEnforcementEstablished_intro {p : Person} {c : ComplaintText}
    (hAction : CivilEnforcementActionBrought p c) (hProven : ProvenByPreponderance p c) :
    CivilEnforcementEstablished p c :=
  ⟨hAction, hProven⟩


theorem injunctiveReliefEstablished_intro {p : Person} {c : ComplaintText}
    (hPetition : InjunctivePetitionFiled p c) (hFound : CourtFoundOffenseConduct p c) :
    InjunctiveReliefEstablished p c :=
  ⟨hPetition, hFound⟩


theorem voidingRecoveryAuthorized_intro {p : Person} {c : ComplaintText}
    (hConviction : FinalConvictionEntered p c) (hRescission : RescissionDeclared p c) :
    VoidingRecoveryAuthorized p c :=
  ⟨hConviction, hRescission⟩



theorem conflictSafeHarborSatisfied_intro {p : Person} {c : ComplaintText}
    (hDisclosed : FinancialInterestDisclosedInAdvance p c)
    (hDetermination : AdvanceWrittenDeterminationReceived p c) :
    ConflictSafeHarborSatisfied p c :=
  ⟨hDisclosed, hDetermination⟩



theorem continuingEnterpriseAccumulation_intro {p : Person} {c : ComplaintText}
    (hSeries : SeriesOfPredicateViolations p c)
    (hReceipts : ReceiptsThresholdWithinTwentyFourMonths p c) :
    ContinuingEnterpriseAccumulation p c :=
  ⟨hSeries, hReceipts⟩


theorem procurementFeeDisclosureSatisfied_intro {p : Person} {c : ComplaintText}
    (hFee : FeeDisclosedInWritingInApplication p c) :
    ProcurementFeeDisclosureSatisfied p c :=
  ⟨hFee⟩



theorem reachBarred {p : Person} {c : ComplaintText}
    (hTerm : ServiceTerminated p c) (hContact : RestrictedContactMade p c)
    (hWindow : ContactWithinRestrictedPeriod p c)
    (hApplies : PostEmploymentRestrictionApplies p c) :
    Reachable p c State.Barred :=
  .barred (.terminate .inService hTerm) hContact hWindow hApplies



theorem window_decide_within : WithinDayWindow 700 730 := by decide



theorem window_decide_outside : ¬ WithinDayWindow 800 730 := by decide

end Proving.USC.T18.Ch11.Reslice.Procedure
