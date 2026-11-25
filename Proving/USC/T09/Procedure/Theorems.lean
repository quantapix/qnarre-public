









import Proving.USC.T09.Procedure.Statute

namespace Proving.USC.T09.Procedure

open Proving.USC.Common

theorem compelStep_intro {p a app c}
    (hAgg : AggrievedByFailureToArbitrate p a c)
    (hPet : PetitionToCompelFiled p app c)
    (hNot : FiveDayNoticeServed p app c)
    (hOrd : OrderToCompelIssued p c) : CompelStep p a app c :=
  ⟨hAgg, hPet, hNot, hOrd⟩

theorem stayStep_intro {p a c}
    (hApp : StayApplicationMade p a c) : StayStep p a c :=
  ⟨hApp⟩

theorem constituteStep_intro {a c}
    (hApt : ArbitratorsAppointed a c) : ConstituteStep a c :=
  ⟨hApt⟩

theorem confirmTimely_intro {p aw app c}
    (hMade : AwardMade aw c)
    (hApplied : ConfirmationApplied p aw app c)
    (hWin : WithinOneYearWindow aw app c)
    (hNot : ConfirmationNoticeServed p app c) : ConfirmTimely p aw app c :=
  ⟨hMade, hApplied, hWin, hNot⟩

theorem vacateTimely_intro {p aw app c}
    (hMade : AwardMade aw c)
    (hGround : VacaturGroundShown aw c)
    (hServed : VacaturMotionServed p app c)
    (hWin : WithinThreeMonthWindow aw app c) : VacateTimely p aw app c :=
  ⟨hMade, hGround, hServed, hWin⟩

theorem modifyTimely_intro {p aw app c}
    (hMade : AwardMade aw c)
    (hGround : ModificationGroundShown aw c)
    (hServed : VacaturMotionServed p app c)
    (hWin : WithinThreeMonthWindow aw app c) : ModifyTimely p aw app c :=
  ⟨hMade, hGround, hServed, hWin⟩

theorem appealAvailable_intro {c}
    (hApp : OrderAppealable c) : AppealAvailable c :=
  ⟨hApp⟩




theorem confirmed_reachable {p a aw app c}
    (hCompel : CompelStep p a app c)
    (hConst : ConstituteStep a c)
    (hMade : AwardMade aw c)
    (hConfirm : ConfirmTimely p aw app c)
    : Reachable p a aw app c State.Confirmed :=
  .confirmed (.awarded (.constituted (.compelled .start hCompel) hConst) hMade) hConfirm



theorem vacated_reachable {p a aw app c}
    (hCompel : CompelStep p a app c)
    (hConst : ConstituteStep a c)
    (hMade : AwardMade aw c)
    (hVacate : VacateTimely p aw app c)
    : Reachable p a aw app c State.Vacated :=
  .vacated (.awarded (.constituted (.compelled .start hCompel) hConst) hMade) hVacate

end Proving.USC.T09.Procedure
