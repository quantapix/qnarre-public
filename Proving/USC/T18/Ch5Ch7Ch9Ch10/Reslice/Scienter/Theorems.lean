










import Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Scienter.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Scienter

open Proving.USC.Common





theorem meetsRequirement_intro {req rung : MentalState} {p : Person}
    {c : ComplaintText} (hReach : rung.atLeast req)
    (hProv : MentalStateProven p rung c) : MeetsRequirement req p c :=
  ⟨rung, hReach, hProv⟩



theorem meetsRequirement_of_decide {req rung : MentalState} {p : Person}
    {c : ComplaintText} (hDec : decide (rung.atLeast req) = true)
    (hProv : MentalStateProven p rung c) : MeetsRequirement req p c :=
  ⟨rung, of_decide_eq_true hDec, hProv⟩



theorem meetsRequirement_mono {req req' : MentalState} {p : Person}
    {c : ComplaintText} (hOrd : req.atLeast req')
    (h : MeetsRequirement req p c) : MeetsRequirement req' p c :=
  match h with
  | ⟨rung, hReach, hProv⟩ => ⟨rung, MentalState.atLeast_trans hReach hOrd, hProv⟩



theorem scienter111Aggravator_intro {p : Person} {c : ComplaintText}
    (hPurpose : SpecificPurposeProven p .ToCommitAnotherFelony c) :
    Scienter111Aggravator p c := hPurpose

theorem scienter112b_intro {p : Person} {c : ComplaintText}
    (hWillful : WillfulnessProven p c) : Scienter112b p c := hWillful

theorem scienter112b3_intro {p : Person} {c : ComplaintText}
    (hWillful : WillfulnessProven p c)
    (hPurpose : SpecificPurposeProven p .ToViolateForeignOfficialProtection c) :
    Scienter112b3 p c := ⟨hWillful, hPurpose⟩

theorem scienter113a1_intro {p : Person} {c : ComplaintText}
    (hPurpose : SpecificPurposeProven p .ToCommitMurder c) :
    Scienter113a1 p c := hPurpose

theorem scienter113a2_intro {p : Person} {c : ComplaintText}
    (hPurpose : SpecificPurposeProven p .ToCommitAnotherFelony c) :
    Scienter113a2 p c := hPurpose

theorem scienter113a3_intro {p : Person} {c : ComplaintText}
    (hPurpose : SpecificPurposeProven p .ToDoBodilyHarm c) :
    Scienter113a3 p c := hPurpose

theorem scienter113a8_intro {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .Recklessness p c) : Scienter113a8 p c := hRung

theorem scienter114_intro {p : Person} {c : ComplaintText}
    (hPurpose : SpecificPurposeProven p .ToTortureMaimOrDisfigure c) :
    Scienter114 p c := hPurpose


theorem scienter115a1_intro_impede {p : Person} {c : ComplaintText}
    (hPurpose : SpecificPurposeProven p .ToImpedeOrIntimidateOfficial c) :
    Scienter115a1 p c := Or.inl hPurpose


theorem scienter115a1_intro_retaliate {p : Person} {c : ComplaintText}
    (hPurpose : SpecificPurposeProven p .ToRetaliateForOfficialDuties c) :
    Scienter115a1 p c := Or.inr hPurpose

theorem scienter115a2_intro {p : Person} {c : ComplaintText}
    (hPurpose : SpecificPurposeProven p .ToRetaliateForOfficialDuties c) :
    Scienter115a2 p c := hPurpose

theorem scienter116a_intro {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .Knowledge p c) : Scienter116a p c := hRung

theorem scienter116a3_intro {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .Knowledge p c)
    (hPurpose : SpecificPurposeProven p .ToPerformFGM c) :
    Scienter116a3 p c := ⟨hRung, hPurpose⟩

theorem scienter117PriorConvictions_intro {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .StrictLiability p c) :
    Scienter117PriorConvictions p c := hRung



theorem scienter117PriorConvictions_of_any {rung : MentalState} {p : Person}
    {c : ComplaintText} (hProv : MentalStateProven p rung c) :
    Scienter117PriorConvictions p c :=
  ⟨rung, Nat.zero_le rung.rank, hProv⟩

theorem scienter118_intro {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .Knowledge p c)
    (hWillful : WillfulnessProven p c) : Scienter118 p c := ⟨hRung, hWillful⟩

theorem scienter119a_intro {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .Knowledge p c)
    (hPurpose : SpecificPurposeProven p .ToThreatenIntimidateOrIncite c) :
    Scienter119a p c := ⟨hRung, hPurpose⟩



theorem scienter152_intro {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .Knowledge p c)
    (hFraud : FraudulentIntentProven p c) : Scienter152 p c := ⟨hRung, hFraud⟩

theorem scienter152p5_intro {p : Person} {c : ComplaintText}
    (hBase : Scienter152 p c)
    (hPurpose : SpecificPurposeProven p .ToDefeatTitle11 c) :
    Scienter152p5 p c := ⟨hBase, hPurpose⟩

theorem scienter152p7_intro {p : Person} {c : ComplaintText}
    (hBase : Scienter152 p c)
    (hPurpose : SpecificPurposeProven p .ToDefeatTitle11 c) :
    Scienter152p7 p c := ⟨hBase, hPurpose⟩

theorem scienter153_intro {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .Knowledge p c)
    (hFraud : FraudulentIntentProven p c) : Scienter153 p c := ⟨hRung, hFraud⟩

theorem scienter154_intro {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .Knowledge p c) : Scienter154 p c := hRung

theorem scienter155_intro {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .Knowledge p c)
    (hFraud : FraudulentIntentProven p c)
    (hPurpose : SpecificPurposeProven p .ToFixFeesFromEstate c) :
    Scienter155 p c := ⟨hRung, hFraud, hPurpose⟩

theorem scienter156b_intro {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .Knowledge p c) : Scienter156b p c := hRung

theorem scienter157_intro {p : Person} {c : ComplaintText}
    (hDefraud : SpecificPurposeProven p .ToDefraud c)
    (hExecute : SpecificPurposeProven p .ToExecuteOrConcealScheme c) :
    Scienter157 p c := ⟨hDefraud, hExecute⟩



theorem scienter175SubsecA_intro {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .Knowledge p c)
    (hPurpose : SpecificPurposeProven p .ForUseAsWeapon c) :
    Scienter175SubsecA p c := ⟨hRung, hPurpose⟩

theorem scienter175SubsecB_intro {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .Knowledge p c)
    (hNoPeace : ¬ SpecificPurposeProven p .ForPeacefulPurpose c) :
    Scienter175SubsecB p c := ⟨hRung, hNoPeace⟩

theorem scienter175bSubsecA_intro {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .Knowledge p c)
    (hStatus : KnowsOwnRestrictedPersonStatus p c) :
    Scienter175bSubsecA p c := ⟨hRung, hStatus⟩


theorem scienter175bSubsecB_intro_knowledge {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .Knowledge p c) :
    Scienter175bSubsecB p c := Or.inl hRung


theorem scienter175bSubsecB_intro_reasonableCause {p : Person} {c : ComplaintText}
    (hCause : ReasonableCauseToBelieveProven p c) :
    Scienter175bSubsecB p c := Or.inr hCause

theorem scienter175bSubsecC_intro {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .Knowledge p c) :
    Scienter175bSubsecC p c := hRung

theorem scienter175c_intro {p : Person} {c : ComplaintText}
    (hRung : MeetsRequirement .Knowledge p c) : Scienter175c p c := hRung

theorem peacefulPurposeDefense_intro {p : Person} {c : ComplaintText}
    (hPurpose : SpecificPurposeProven p .ForPeacefulPurpose c) :
    PeacefulPurposeDefense p c := hPurpose

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Reslice.Scienter
