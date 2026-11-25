import Proving.USC.T42.TitleVII.Procedure.Predicates







namespace Proving.USC.T42.TitleVII.Procedure

open Proving.USC.Common





structure Transition (σ : Type) where
  frm   : σ
  to    : σ
  guard : Prop







structure TimelyCharge (p : AggrievedParty) (c : ComplaintText) : Prop where
  practice : UnlawfulPracticeOccurred p c
  filed    : ChargeFiledWithEEOC p c
  inWindow : WithinOneHundredEightyDayChargeWindow p c
              ∨ WithinThreeHundredDayChargeWindow p c




structure DeferralSatisfied (p : AggrievedParty) (c : ComplaintText) : Prop where
  stateProceeding : StateProceedingCommenced p c
  deferralElapsed : DeferralPeriodSatisfied p c






structure TimelySuit (p : AggrievedParty) (c : ComplaintText) : Prop where
  rightToSue : RightToSueIssued p c
  commenced  : CivilActionCommenced p c
  inWindow   : WithinNinetyDaySuitWindow p c







structure PrivateActionTimely (p : AggrievedParty) (c : ComplaintText) : Prop where
  charge : TimelyCharge p c
  suit   : TimelySuit p c






structure FederalActionTimely (p : AggrievedParty) (c : ComplaintText) : Prop where
  practice  : UnlawfulPracticeOccurred p c
  exhausted : AdminRemediesExhausted p c
  commenced : CivilActionCommenced p c
  inWindow  : WithinNinetyDayFederalSuitWindow p c



inductive ProcedurallyReady (p : AggrievedParty) (c : ComplaintText) : Prop
  | privateTrack : PrivateActionTimely p c → ProcedurallyReady p c
  | federalTrack : FederalActionTimely p c → ProcedurallyReady p c

end Proving.USC.T42.TitleVII.Procedure
