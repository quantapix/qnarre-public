import Proving.USC.T42.TitleVII.Procedure.Statute





namespace Proving.USC.T42.TitleVII.Procedure

open Proving.USC.Common


theorem timelyCharge_intro {p c}
    (hPractice : UnlawfulPracticeOccurred p c)
    (hFiled : ChargeFiledWithEEOC p c)
    (hWindow : WithinOneHundredEightyDayChargeWindow p c
                ∨ WithinThreeHundredDayChargeWindow p c) :
    TimelyCharge p c :=
  ⟨hPractice, hFiled, hWindow⟩


theorem deferralSatisfied_intro {p c}
    (hState : StateProceedingCommenced p c)
    (hElapsed : DeferralPeriodSatisfied p c) :
    DeferralSatisfied p c :=
  ⟨hState, hElapsed⟩


theorem timelySuit_intro {p c}
    (hRTS : RightToSueIssued p c)
    (hCommenced : CivilActionCommenced p c)
    (hWindow : WithinNinetyDaySuitWindow p c) :
    TimelySuit p c :=
  ⟨hRTS, hCommenced, hWindow⟩


theorem privateActionTimely_intro {p c}
    (hCharge : TimelyCharge p c) (hSuit : TimelySuit p c) :
    PrivateActionTimely p c :=
  ⟨hCharge, hSuit⟩


theorem federalActionTimely_intro {p c}
    (hPractice : UnlawfulPracticeOccurred p c)
    (hExhausted : AdminRemediesExhausted p c)
    (hCommenced : CivilActionCommenced p c)
    (hWindow : WithinNinetyDayFederalSuitWindow p c) :
    FederalActionTimely p c :=
  ⟨hPractice, hExhausted, hCommenced, hWindow⟩



theorem procedurallyReady_of_private {p c}
    (h : PrivateActionTimely p c) : ProcedurallyReady p c :=
  ProcedurallyReady.privateTrack h


theorem procedurallyReady_of_federal {p c}
    (h : FederalActionTimely p c) : ProcedurallyReady p c :=
  ProcedurallyReady.federalTrack h

end Proving.USC.T42.TitleVII.Procedure
