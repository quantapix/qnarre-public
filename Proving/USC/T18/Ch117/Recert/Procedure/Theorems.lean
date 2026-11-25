










import Proving.USC.T18.Ch117.Recert.Procedure.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Procedure

open Proving.USC.Common



theorem section2421AcTimelyCivilFiling_intro
    (plaintiff defendant : Person) (c : ComplaintText) (windowDays : Nat)
    (hViolation : ViolationOfSubsectionB defendant c)
    (hInjured : InjuredByReasonOfViolation plaintiff defendant c)
    (hForum : FiledInUnitedStatesDistrictCourt plaintiff c)
    (hWindow : WithinLimitationsWindow plaintiff c windowDays) :
    Section2421AcTimelyCivilFiling plaintiff defendant c windowDays :=
  ⟨hViolation, hInjured, hForum, hWindow⟩



theorem withinLimitationsWindow_intro
    (plaintiff : Person) (c : ComplaintText) (windowDays : Nat)
    (hOrder : AccrualDay plaintiff c ≤ FilingDay plaintiff c)
    (hWindow : FilingDay plaintiff c ≤ AccrualDay plaintiff c + windowDays) :
    WithinLimitationsWindow plaintiff c windowDays :=
  ⟨hOrder, hWindow⟩



theorem not_withinLimitationsWindow_of_late
    (plaintiff : Person) (c : ComplaintText) (windowDays : Nat)
    (hLate : AccrualDay plaintiff c + windowDays < FilingDay plaintiff c) :
    ¬ WithinLimitationsWindow plaintiff c windowDays := by
  intro hw
  have h2 : FilingDay plaintiff c ≤ AccrualDay plaintiff c + windowDays := hw.2
  omega


theorem section2421AcTimelyCivilFiling_reaches_filed
    (plaintiff defendant : Person) (c : ComplaintText) (windowDays : Nat)
    (h : Section2421AcTimelyCivilFiling plaintiff defendant c windowDays) :
    CivilReachable plaintiff defendant c windowDays CivilStage.Filed :=
  .filed (.accrued (.injured h.injured) h.predicateViolation) h.forum h.inWindow




theorem civilReachable_timeBarred_intro
    (plaintiff defendant : Person) (c : ComplaintText) (windowDays : Nat)
    (hInjured : InjuredByReasonOfViolation plaintiff defendant c)
    (hViolation : ViolationOfSubsectionB defendant c)
    (hForum : FiledInUnitedStatesDistrictCourt plaintiff c)
    (hLate : ¬ WithinLimitationsWindow plaintiff c windowDays) :
    CivilReachable plaintiff defendant c windowDays CivilStage.TimeBarred :=
  .timeBarred (.accrued (.injured hInjured) hViolation) hForum hLate



theorem section2421AdMandatoryRestitution_intro
    (defendant : Person) (c : ComplaintText)
    (hConvicted : ConvictedUnderSubsectionB2 defendant c)
    (hOrdered : RestitutionOrdered defendant c)
    (hScope : RestitutionScopeConsistentWithSection2327b defendant c) :
    Section2421AdMandatoryRestitution defendant c :=
  ⟨hConvicted, hOrdered, hScope⟩



theorem section2421Ad_courtDuty_of_conviction
    (defendant : Person) (c : ComplaintText)
    (hConvicted : ConvictedUnderSubsectionB2 defendant c) :
    CourtShallOrderRestitution defendant c :=
  restitutionDuty_of_convictionB2 defendant c hConvicted



theorem section2421AeDefense_intro
    (defendant : Person) (c : ComplaintText)
    (hCharge : ChargeUnderSubsectionAOrB1 defendant c)
    (hLegal : PromotionLegalInTargetedJurisdiction defendant c)
    (hBurden : ProvedByPreponderance defendant c) :
    Section2421AeDefense defendant c :=
  ⟨hCharge, hLegal, hBurden⟩






theorem section2421AeDefense_unavailable_forB2Only
    (defendant : Person) (c : ComplaintText)
    (hB2Only : ChargedUnderSubsectionB2Only defendant c) :
    ¬ Section2421AeDefense defendant c := by
  intro hDefense
  exact defenseUnavailable_forSubsectionB2Only defendant c hB2Only hDefense.chargeGate



theorem section2423hTimelyIntent_intro
    (defendant : Person) (c : ComplaintText)
    (hIntent : IntentionToEngageInProscribedActivity defendant c)
    (hTiming : IntentContemporaneousWithTravel defendant c) :
    Section2423hTimelyIntent defendant c :=
  ⟨hIntent, hTiming⟩



theorem intentContemporaneousWithTravel_intro
    (defendant : Person) (c : ComplaintText)
    (hStart : TravelStartDay defendant c ≤ IntentHeldDay defendant c)
    (hEnd : IntentHeldDay defendant c ≤ TravelEndDay defendant c) :
    IntentContemporaneousWithTravel defendant c :=
  ⟨hStart, hEnd⟩



theorem not_intentContemporaneous_of_lateIntent
    (defendant : Person) (c : ComplaintText)
    (hLate : TravelEndDay defendant c < IntentHeldDay defendant c) :
    ¬ IntentContemporaneousWithTravel defendant c := by
  intro hc
  have h2 : IntentHeldDay defendant c ≤ TravelEndDay defendant c := hc.2
  omega


theorem not_intentContemporaneous_of_earlyIntent
    (defendant : Person) (c : ComplaintText)
    (hEarly : IntentHeldDay defendant c < TravelStartDay defendant c) :
    ¬ IntentContemporaneousWithTravel defendant c := by
  intro hc
  have h1 : TravelStartDay defendant c ≤ IntentHeldDay defendant c := hc.1
  omega



theorem section2423fInchoateStep_intro
    (defendant : Person) (c : ComplaintText)
    (hAct : AttemptedOrConspiredToViolate defendant c)
    (hScope : TargetSubsectionWithinAToE defendant c) :
    Section2423fInchoateStep defendant c :=
  ⟨hAct, hScope⟩


theorem section2423f_punishableAsCompleted
    (defendant : Person) (c : ComplaintText)
    (h : Section2423fInchoateStep defendant c) :
    PunishableAsCompletedViolation defendant c :=
  inchoatePunishable_sameManner defendant c h.inchoateAct h.targetInScope



theorem section2423iDefense_intro
    (defendant : Person) (c : ComplaintText)
    (hProng : ProsecutionBasedOnCommercialSexActProng defendant c)
    (hBelief : ReasonableBeliefVictimAtLeast18 defendant c)
    (hBurden : EstablishedByClearAndConvincingEvidence defendant c) :
    Section2423iDefense defendant c :=
  ⟨hProng, hBelief, hBurden⟩



theorem ch117ProceduralPosture_civil_intro
    (plaintiff defendant : Person) (c : ComplaintText) (windowDays : Nat)
    (h : Section2421AcTimelyCivilFiling plaintiff defendant c windowDays) :
    Ch117ProceduralPosture defendant c :=
  .civilAction plaintiff windowDays h

theorem ch117ProceduralPosture_restitution_intro
    (defendant : Person) (c : ComplaintText)
    (h : Section2421AdMandatoryRestitution defendant c) :
    Ch117ProceduralPosture defendant c :=
  .mandatoryRestitution h

theorem ch117ProceduralPosture_inchoate_intro
    (defendant : Person) (c : ComplaintText)
    (h : Section2423fInchoateStep defendant c) :
    Ch117ProceduralPosture defendant c :=
  .inchoate h

theorem ch117DefenseCarried_2421Ae_intro
    (defendant : Person) (c : ComplaintText)
    (h : Section2421AeDefense defendant c) :
    Ch117DefenseCarried defendant c :=
  .section2421Ae BurdenQuantum.preponderance h

theorem ch117DefenseCarried_2423i_intro
    (defendant : Person) (c : ComplaintText)
    (h : Section2423iDefense defendant c) :
    Ch117DefenseCarried defendant c :=
  .section2423i BurdenQuantum.clearAndConvincing h

end Proving.USC.T18.Ch117.Recert.Procedure
