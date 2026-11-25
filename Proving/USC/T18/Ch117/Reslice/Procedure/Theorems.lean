








import Proving.USC.T18.Ch117.Reslice.Procedure.Statute
import Proving.USC.T18.Ch117.Reslice.Procedure.Predicates
import Proving.USC.T18.Ch117.Reslice.Procedure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Procedure

open Proving.USC.Common







theorem intentContemporaneousWithTravel_intro
    {p : Person} {t : TravelEvent} {c : ComplaintText}
    (hLo : (travelTiming p t c).startDay ≤ (travelTiming p t c).intentDay)
    (hHi : (travelTiming p t c).intentDay ≤ (travelTiming p t c).endDay) :
    IntentContemporaneousWithTravel p t c :=
  ⟨hLo, hHi⟩


theorem inchoateTargetCovered_intro
    {d : Person} {c : ComplaintText}
    (h : inchoateTargetSubsection d c ≠ Subsection2423.other) :
    InchoateTargetCovered d c :=
  h




theorem civilRecoveryAvailable2421Ac_intro
    {p d : Person} {a : CivilAction} {ct : DistrictCourt} {c : ComplaintText}
    (hInjured : PersonInjured p c)
    (hByReason : InjuryByReasonOfViolation p d c)
    (hViolationB : ViolationOfSubsectionB d c)
    (hFiled : CivilActionFiled a p c)
    (hForum : FiledInAppropriateDistrictCourt a ct c) :
    CivilRecoveryAvailable2421Ac p d a ct c :=
  ⟨hInjured, hByReason, hViolationB, hFiled, hForum⟩


theorem mandatoryRestitution2421Ad_intro
    {d : Person} {o : RestitutionOrder} {pr : Prosecution} {c : ComplaintText}
    (hViolationB2 : ViolationOfSubsectionB2 d c)
    (hOrder : RestitutionOrderEntered o pr c)
    (hScope : RestitutionScopeConsistentWith2327b o c) :
    MandatoryRestitution2421Ad d o pr c :=
  ⟨hViolationB2, hOrder, hScope⟩


theorem affirmativeDefenseEstablished2421Ae_intro
    {pr : Prosecution} {d : Person} {c : ComplaintText}
    (hCharged : ProsecutionCommenced pr d c)
    (hReaches : ChargeUnderSubsectionAOrB1 pr c)
    (hLegal : PromotionLegalInTargetedJurisdiction d c)
    (hBurden : DefenseProvenByPreponderance pr d c) :
    AffirmativeDefenseEstablished2421Ae pr d c :=
  ⟨hCharged, hReaches, hLegal, hBurden⟩


theorem ageDefenseEstablished2423i_intro
    {pr : Prosecution} {d : Person} {c : ComplaintText}
    (hCharged : ProsecutionCommenced pr d c)
    (hG2 : ProsecutionBasedOnIllicitSexualConductG2 pr c)
    (hBelief : ReasonableBeliefVictimAtLeast18 d c)
    (hBurden : DefenseProvenByClearAndConvincing pr d c) :
    AgeDefenseEstablished2423i pr d c :=
  ⟨hCharged, hG2, hBelief, hBurden⟩


theorem intentTimingSatisfied2423h_intro
    {d : Person} {t : TravelEvent} {c : ComplaintText}
    (hTravel : TransportationOrTravelOccurred t d c)
    (hIntent : IntentToEngageInProscribedConduct d t c)
    (hWhen : IntentContemporaneousWithTravel d t c) :
    IntentTimingSatisfied2423h d t c :=
  ⟨hTravel, hIntent, hWhen⟩


theorem inchoateRoutingSatisfied2423f_intro
    {d : Person} {c : ComplaintText}
    (hInchoate : AttemptedOrConspiredToViolate d c)
    (hTarget : InchoateTargetCovered d c) :
    InchoateRoutingSatisfied2423f d c :=
  ⟨hInchoate, hTarget⟩




theorem civilLane_reachable
    {p d : Person} {a : CivilAction} {ct : DistrictCourt} {c : ComplaintText}
    (h : CivilRecoveryAvailable2421Ac p d a ct c) :
    Reachable State.Violation State.RecoveryAvailable :=
  Reachable.step State.Violation State.Injured State.RecoveryAvailable
      (tInjury p d c) rfl rfl ⟨h.injured, h.byReason⟩ <|
    Reachable.step State.Injured State.ActionFiled State.RecoveryAvailable
        (tFiling p a c) rfl rfl h.actionFiled <|
      Reachable.step State.ActionFiled State.ForumEstablished State.RecoveryAvailable
          (tForum a ct c) rfl rfl h.appropriateForum <|
        Reachable.step State.ForumEstablished State.RecoveryAvailable State.RecoveryAvailable
            (tRecovery d c) rfl rfl h.violationB (Reachable.refl State.RecoveryAvailable)



theorem restitutionLane_reachable
    {d : Person} {o : RestitutionOrder} {pr : Prosecution} {c : ComplaintText}
    (h : MandatoryRestitution2421Ad d o pr c) :
    Reachable State.Violation State.RestitutionOrdered :=
  Reachable.step State.Violation State.ViolationEstablished State.RestitutionOrdered
      (tViolationEstablished d c) rfl rfl h.violationB2 <|
    Reachable.step State.ViolationEstablished State.RestitutionOrdered State.RestitutionOrdered
        (tRestitution o pr c) rfl rfl ⟨h.orderEntered, h.scopeConsistent⟩
        (Reachable.refl State.RestitutionOrdered)


theorem defenseLane_reachable
    {pr : Prosecution} {d : Person} {c : ComplaintText}
    (h : AffirmativeDefenseEstablished2421Ae pr d c) :
    Reachable State.Violation State.DefenseEstablished :=
  Reachable.step State.Violation State.Charged State.DefenseEstablished
      (tCharge pr d c) rfl rfl h.charged <|
    Reachable.step State.Charged State.DefenseRaised State.DefenseEstablished
        (tRaiseDefense pr d c) rfl rfl ⟨h.defenseReaches, h.legalInForum⟩ <|
      Reachable.step State.DefenseRaised State.DefenseEstablished State.DefenseEstablished
          (tEstablishDefense pr d c) rfl rfl h.burdenCarried
          (Reachable.refl State.DefenseEstablished)

end Proving.USC.T18.Ch117.Reslice.Procedure
