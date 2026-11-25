



import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch13.Reslice.Scienter.Types
import Proving.USC.T18.Ch13.Reslice.Scienter.Predicates
import Proving.USC.T18.Ch13.Reslice.Scienter.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch13.Reslice.Scienter

open Proving.USC.Common






theorem scienter245b_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState245b)
    (hProv : MentalStateProven p rung c) :
    Scienter245b p c :=
  ⟨rung, hReach, hProv⟩


theorem scienter245b1_intro {p : Person} {c : ComplaintText}
    (hWillful : Scienter245b p c)
    (hAim : ActedBecauseOf p .protectedFederalActivity c
          ∨ ActedInOrderToIntimidateFrom p .protectedFederalActivity c) :
    Scienter245b1 p c :=
  ⟨hWillful, hAim⟩


theorem scienter245b2_intro {p : Person} {c : ComplaintText}
    (hWillful : Scienter245b p c)
    (hAnimus : AnimusWithin p classes245b2 c)
    (hActivity : ActedBecauseOf p .protectedStateOrPrivateActivity c) :
    Scienter245b2 p c :=
  ⟨hWillful, hAnimus, hActivity⟩



theorem scienter245b3_intro {p : Person} {c : ComplaintText}
    (hWillful : Scienter245b p c) :
    Scienter245b3 p c :=
  ⟨hWillful, trivial⟩


theorem scienter245b4_intro {p : Person} {c : ComplaintText}
    (hWillful : Scienter245b p c)
    (hAim : ActedBecauseOf p .nondiscriminatoryParticipation c
          ∨ ActedInOrderToIntimidateFrom p .nondiscriminatoryParticipation c) :
    Scienter245b4 p c :=
  ⟨hWillful, hAim⟩


theorem scienter245b5_intro {p : Person} {c : ComplaintText}
    (hWillful : Scienter245b p c)
    (hAim : ActedBecauseOf p .aidingOrEncouragingParticipation c
          ∨ ActedInOrderToIntimidateFrom p .aidingOrEncouragingParticipation c) :
    Scienter245b5 p c :=
  ⟨hWillful, hAim⟩



theorem scienter245bAggravated_intro (p : Person) (c : ComplaintText) :
    Scienter245bAggravated p c :=
  trivial


theorem scienter245aCertification_intro {official : Person} {c : ComplaintText}
    (hJudgment : CertifyingOfficialJudgment official c) :
    Scienter245aCertification official c :=
  hJudgment


theorem scienter245Culpable_intro {p : Person} {c : ComplaintText}
    (hTheory : Scienter245Theory p c) :
    Scienter245Culpable p c :=
  hTheory





theorem scienter247b_intro (p : Person) (c : ComplaintText) :
    Scienter247b p c :=
  trivial


theorem scienter247a1_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState247a1)
    (hProv : MentalStateProven p rung c)
    (hBecause : ActedBecauseOf p .religiousCharacterOfProperty c) :
    Scienter247a1 p c :=
  ⟨⟨rung, hReach, hProv⟩, hBecause, trivial⟩


theorem scienter247a2_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState247a2)
    (hProv : MentalStateProven p rung c)
    (hObject : IntendedResult p .freeExerciseOfReligion c) :
    Scienter247a2 p c :=
  ⟨⟨rung, hReach, hProv⟩, hObject, trivial⟩


theorem scienter247c_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState247c)
    (hProv : MentalStateProven p rung c)
    (hAnimus : AnimusWithin p classes247c c) :
    Scienter247c p c :=
  ⟨⟨rung, hReach, hProv⟩, hAnimus⟩


theorem scienter247dGrading_intro (p : Person) (c : ComplaintText) :
    Scienter247dGrading p c :=
  trivial


theorem scienter247eCertification_intro {official : Person} {c : ComplaintText}
    (hJudgment : CertifyingOfficialJudgment official c) :
    Scienter247eCertification official c :=
  hJudgment


theorem scienter247Culpable_intro {p : Person} {c : ComplaintText}
    (hTheory : Scienter247Theory p c) :
    Scienter247Culpable p c :=
  hTheory




theorem scienter248a1_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState248a1)
    (hProv : MentalStateProven p rung c)
    (hAim : ActedBecauseOf p .reproductiveHealthServices c
          ∨ ActedInOrderToIntimidateFrom p .reproductiveHealthServices c) :
    Scienter248a1 p c :=
  ⟨⟨rung, hReach, hProv⟩, hAim⟩


theorem scienter248a2_intro {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState248a2)
    (hProv : MentalStateProven p rung c)
    (hObject : IntendedResult p .freeExerciseOfReligion c) :
    Scienter248a2 p c :=
  ⟨⟨rung, hReach, hProv⟩, hObject⟩



theorem scienter248a3_intro_facilityBecauseOfServices
    {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState248a3)
    (hProv : MentalStateProven p rung c)
    (hBecause : ActedBecauseOf p .reproductiveHealthServices c) :
    Scienter248a3 p c :=
  .facilityBecauseOfServices ⟨rung, hReach, hProv⟩ hBecause



theorem scienter248a3_intro_placeOfReligiousWorship
    {p : Person} {c : ComplaintText} (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState248a3)
    (hProv : MentalStateProven p rung c)
    (hObject : IntendedResult p .placeOfReligiousWorship c) :
    Scienter248a3 p c :=
  .placeOfReligiousWorship ⟨rung, hReach, hProv⟩ hObject


theorem scienter248bGrading_intro (p : Person) (c : ComplaintText) :
    Scienter248bGrading p c :=
  trivial



theorem scienter248c2Enforcement_intro {ag : Person} {c : ComplaintText}
    (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState248c2)
    (hProv : MentalStateProven ag rung c) :
    Scienter248c2Enforcement ag c :=
  ⟨rung, hReach, hProv⟩



theorem scienter248c3Enforcement_intro {ag : Person} {c : ComplaintText}
    (rung : MentalState)
    (hReach : rung.atLeast RequiredMentalState248c3)
    (hProv : MentalStateProven ag rung c) :
    Scienter248c3Enforcement ag c :=
  ⟨rung, hReach, hProv⟩


theorem scienter248Culpable_intro {p : Person} {c : ComplaintText}
    (hTheory : Scienter248Theory p c) :
    Scienter248Culpable p c :=
  hTheory




theorem ch13ScienterEstablished_intro_s245 {p : Person} {c : ComplaintText}
    (h : Scienter245Culpable p c) : Ch13ScienterEstablished p c :=
  .federallyProtectedActivities h


theorem ch13ScienterEstablished_intro_s247 {p : Person} {c : ComplaintText}
    (h : Scienter247Culpable p c) : Ch13ScienterEstablished p c :=
  .religiousProperty h


theorem ch13ScienterEstablished_intro_s248 {p : Person} {c : ComplaintText}
    (h : Scienter248Culpable p c) : Ch13ScienterEstablished p c :=
  .clinicAccess h

end Proving.USC.T18.Ch13.Reslice.Scienter
