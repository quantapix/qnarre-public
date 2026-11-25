



import Proving.USC.T18.Ch11.EchoReslice.Scienter.Types
import Proving.USC.T18.Ch11.EchoReslice.Scienter.Predicates
import Proving.USC.T18.Ch11.EchoReslice.Scienter.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Scienter

open Proving.USC.Common








theorem mentalState_atLeast_refl (a : MentalState) : MentalState.atLeast a a :=
  Nat.le_refl a.rank


theorem mentalState_atLeast_trans {a b d : MentalState}
    (hab : MentalState.atLeast a b) (hbd : MentalState.atLeast b d) :
    MentalState.atLeast a d :=
  Nat.le_trans hbd hab



theorem specific_atLeast_knowledge :
    MentalState.atLeast MentalState.Specific MentalState.Knowledge := by decide


theorem knowledge_atLeast_recklessness :
    MentalState.atLeast MentalState.Knowledge MentalState.Recklessness := by decide




theorem knowledge_not_atLeast_specific :
    ¬ MentalState.atLeast MentalState.Knowledge MentalState.Specific := by decide





theorem reachesRung_intro {p : Person} {c : ComplaintText} {required : MentalState}
    (rung : MentalState) (hOrd : MentalState.atLeast rung required)
    (hProven : MentalStateProven p rung c) : ReachesRung p required c :=
  ⟨rung, hOrd, hProven⟩


theorem reachesParagraphRung_intro {p : Person} {c : ComplaintText} {para : Paragraph201}
    (rung : MentalState) (hOrd : MentalState.atLeast rung (RequiredMentalState para))
    (hProven : MentalStateProven p rung c) : ReachesParagraphRung p para c :=
  ⟨rung, hOrd, hProven⟩


theorem reachesRung_weaken {p : Person} {c : ComplaintText} {required stricter : MentalState}
    (hOrd : MentalState.atLeast stricter required) (h : ReachesRung p stricter c) :
    ReachesRung p required c :=
  h.elim fun rung hr => ⟨rung, Nat.le_trans hOrd hr.1, hr.2⟩




theorem briberyRung_reaches_gratuityRung {p : Person} {c : ComplaintText}
    (h : ReachesParagraphRung p .b1A c) : ReachesParagraphRung p .c1A c :=
  reachesRung_weaken (by decide) h



theorem purposeToInfluenceOfficialAct_intro {giver : Person} {c : ComplaintText}
    (hRung : ReachesParagraphRung giver .b1A c)
    (hObjective : IntendsToInfluenceOfficialAct giver c) :
    PurposeToInfluenceOfficialAct giver c := ⟨hRung, hObjective⟩

theorem purposeToDefraudUnitedStates_intro {giver : Person} {c : ComplaintText}
    (hRung : ReachesParagraphRung giver .b1B c)
    (hObjective : IntendsToInduceFraudOnUnitedStates giver c) :
    PurposeToDefraudUnitedStates giver c := ⟨hRung, hObjective⟩

theorem purposeToInduceBreachOfLawfulDuty_intro {giver : Person} {c : ComplaintText}
    (hRung : ReachesParagraphRung giver .b1C c)
    (hObjective : IntendsToInduceBreachOfLawfulDuty giver c) :
    PurposeToInduceBreachOfLawfulDuty giver c := ⟨hRung, hObjective⟩

theorem briberyGiverPurpose201b1_intro {giver : Person} {c : ComplaintText}
    (h : PurposeToInfluenceOfficialAct giver c ∨ PurposeToDefraudUnitedStates giver c ∨
         PurposeToInduceBreachOfLawfulDuty giver c) :
    BriberyGiverPurpose201b1 giver c :=
  match h with
  | .inl h => .influenceOfficialAct h
  | .inr (.inl h) => .fraudOnUnitedStates h
  | .inr (.inr h) => .breachOfLawfulDuty h



theorem bargainForInfluenceInOfficialAct_intro {official : Person} {c : ComplaintText}
    (hRung : ReachesParagraphRung official .b2A c)
    (hBargain : HoldsQuidProQuoUnderstanding official c)
    (hObjective : AcceptsInReturnForInfluenceInOfficialAct official c) :
    BargainForInfluenceInOfficialAct official c := ⟨hRung, hBargain, hObjective⟩

theorem bargainForFraudOnUnitedStates_intro {official : Person} {c : ComplaintText}
    (hRung : ReachesParagraphRung official .b2B c)
    (hBargain : HoldsQuidProQuoUnderstanding official c)
    (hObjective : AcceptsInReturnForFraudOnUnitedStates official c) :
    BargainForFraudOnUnitedStates official c := ⟨hRung, hBargain, hObjective⟩

theorem bargainForBreachOfOfficialDuty_intro {official : Person} {c : ComplaintText}
    (hRung : ReachesParagraphRung official .b2C c)
    (hBargain : HoldsQuidProQuoUnderstanding official c)
    (hObjective : AcceptsInReturnForBreachOfOfficialDuty official c) :
    BargainForBreachOfOfficialDuty official c := ⟨hRung, hBargain, hObjective⟩

theorem officialBargain201b2_intro {official : Person} {c : ComplaintText}
    (h : BargainForInfluenceInOfficialAct official c ∨ BargainForFraudOnUnitedStates official c ∨
         BargainForBreachOfOfficialDuty official c) :
    OfficialBargain201b2 official c :=
  match h with
  | .inl h => .influenceInOfficialAct h
  | .inr (.inl h) => .fraudOnUnitedStates h
  | .inr (.inr h) => .breachOfOfficialDuty h



theorem purposeToInfluenceTestimony_intro {giver : Person} {c : ComplaintText}
    (hRung : ReachesParagraphRung giver .b3Influence c)
    (hObjective : IntendsToInfluenceTestimony giver c) :
    PurposeToInfluenceTestimony giver c := ⟨hRung, hObjective⟩

theorem purposeToInduceAbsence_intro {giver : Person} {c : ComplaintText}
    (hRung : ReachesParagraphRung giver .b3Absence c)
    (hObjective : IntendsToInduceAbsenceFromProceeding giver c) :
    PurposeToInduceAbsence giver c := ⟨hRung, hObjective⟩

theorem witnessBriberyGiverPurpose201b3_intro {giver : Person} {c : ComplaintText}
    (h : PurposeToInfluenceTestimony giver c ∨ PurposeToInduceAbsence giver c) :
    WitnessBriberyGiverPurpose201b3 giver c :=
  match h with
  | .inl h => .influenceTestimony h
  | .inr h => .induceAbsence h



theorem bargainForInfluenceInTestimony_intro {witness : Person} {c : ComplaintText}
    (hRung : ReachesParagraphRung witness .b4Influence c)
    (hBargain : HoldsQuidProQuoUnderstanding witness c)
    (hObjective : AcceptsInReturnForInfluenceInTestimony witness c) :
    BargainForInfluenceInTestimony witness c := ⟨hRung, hBargain, hObjective⟩

theorem bargainForAbsence_intro {witness : Person} {c : ComplaintText}
    (hRung : ReachesParagraphRung witness .b4Absence c)
    (hBargain : HoldsQuidProQuoUnderstanding witness c)
    (hObjective : AcceptsInReturnForAbsenceFromProceeding witness c) :
    BargainForAbsence witness c := ⟨hRung, hBargain, hObjective⟩

theorem witnessBargain201b4_intro {witness : Person} {c : ComplaintText}
    (h : BargainForInfluenceInTestimony witness c ∨ BargainForAbsence witness c) :
    WitnessBargain201b4 witness c :=
  match h with
  | .inl h => .influenceInTestimony h
  | .inr h => .absence h



theorem scienter201b1_intro {giver : Person} {c : ComplaintText}
    (hCorrupt : ActsCorruptly giver c) (hPurpose : BriberyGiverPurpose201b1 giver c) :
    Scienter201b1 giver c := ⟨hCorrupt, hPurpose⟩

theorem scienter201b2_intro {official : Person} {c : ComplaintText}
    (hCorrupt : ActsCorruptly official c) (hBargain : OfficialBargain201b2 official c) :
    Scienter201b2 official c := ⟨hCorrupt, hBargain⟩

theorem scienter201b3_intro {giver : Person} {c : ComplaintText}
    (hCorrupt : ActsCorruptly giver c)
    (hPurpose : WitnessBriberyGiverPurpose201b3 giver c)
    (hNotExempt : ¬ PaymentIsExemptWitnessFeeOrExpense giver c) :
    Scienter201b3 giver c := ⟨hCorrupt, hPurpose, hNotExempt⟩

theorem scienter201b4_intro {witness : Person} {c : ComplaintText}
    (hCorrupt : ActsCorruptly witness c)
    (hBargain : WitnessBargain201b4 witness c)
    (hNotExempt : ¬ PaymentIsExemptWitnessFeeOrExpense witness c) :
    Scienter201b4 witness c := ⟨hCorrupt, hBargain, hNotExempt⟩

theorem scienter201c1A_intro {giver : Person} {c : ComplaintText}
    (hRung : ReachesParagraphRung giver .c1A c)
    (hLinkage : KnowsValueIsForOrBecauseOfOfficialAct giver c)
    (hNotLawful : NotAuthorizedByLawForProperDischargeOfDuty giver c) :
    Scienter201c1A giver c := ⟨hRung, hLinkage, hNotLawful⟩

theorem scienter201c1B_intro {official : Person} {c : ComplaintText}
    (hRung : ReachesParagraphRung official .c1B c)
    (hLinkage : KnowsValueIsForOrBecauseOfOfficialAct official c)
    (hNotLawful : NotAuthorizedByLawForProperDischargeOfDuty official c) :
    Scienter201c1B official c := ⟨hRung, hLinkage, hNotLawful⟩

theorem scienter201c2_intro {giver : Person} {c : ComplaintText}
    (hRung : ReachesParagraphRung giver .c2 c)
    (hLinkage : KnowsValueIsForOrBecauseOfTestimony giver c)
    (hNotExempt : ¬ PaymentIsExemptWitnessFeeOrExpense giver c) :
    Scienter201c2 giver c := ⟨hRung, hLinkage, hNotExempt⟩

theorem scienter201c3_intro {witness : Person} {c : ComplaintText}
    (hRung : ReachesParagraphRung witness .c3 c)
    (hLinkage : KnowsValueIsForOrBecauseOfTestimony witness c)
    (hNotExempt : ¬ PaymentIsExemptWitnessFeeOrExpense witness c) :
    Scienter201c3 witness c := ⟨hRung, hLinkage, hNotExempt⟩



theorem briberyTierScienter201_intro {p : Person} {c : ComplaintText}
    (h : Scienter201b1 p c ∨ Scienter201b2 p c ∨ Scienter201b3 p c ∨ Scienter201b4 p c) :
    BriberyTierScienter201 p c :=
  match h with
  | .inl h => .giver h
  | .inr (.inl h) => .official h
  | .inr (.inr (.inl h)) => .witnessGiver h
  | .inr (.inr (.inr h)) => .witnessReceiver h

theorem gratuityTierScienter201_intro {p : Person} {c : ComplaintText}
    (h : Scienter201c1A p c ∨ Scienter201c1B p c ∨ Scienter201c2 p c ∨ Scienter201c3 p c) :
    GratuityTierScienter201 p c :=
  match h with
  | .inl h => .giver h
  | .inr (.inl h) => .official h
  | .inr (.inr (.inl h)) => .witnessGiver h
  | .inr (.inr (.inr h)) => .witnessReceiver h

theorem section201Culpable_intro {p : Person} {c : ComplaintText}
    (h : BriberyTierScienter201 p c ∨ GratuityTierScienter201 p c) :
    Section201Culpable p c :=
  match h with
  | .inl h => .bribery h
  | .inr h => .gratuity h

theorem gratuityWithoutBargain201_intro {p : Person} {c : ComplaintText}
    (hGratuity : GratuityTierScienter201 p c)
    (hNoBargain : ¬ HoldsQuidProQuoUnderstanding p c) :
    GratuityWithoutBargain201 p c := ⟨hGratuity, hNoBargain⟩



theorem gratuityWithoutBargain201_culpable {p : Person} {c : ComplaintText}
    (h : GratuityWithoutBargain201 p c) : Section201Culpable p c :=
  .gratuity h.1

end Proving.USC.T18.Ch11.EchoReslice.Scienter
