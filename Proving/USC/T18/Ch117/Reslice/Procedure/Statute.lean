







import Proving.USC.T18.Ch117.Reslice.Procedure.Predicates
import Proving.USC.T18.Ch117.Reslice.Procedure.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Procedure

open Proving.USC.Common








def defenseBearer2421Ae : Bearer := .Defendant


def defenseStandard2421Ae : Standard := .Preponderance


def defenseBearer2423i : Bearer := .Defendant


def defenseStandard2423i : Standard := .ClearAndConvincing







def IntentContemporaneousWithTravel (p : Person) (t : TravelEvent) (c : ComplaintText) : Prop :=
  (travelTiming p t c).startDay ≤ (travelTiming p t c).intentDay ∧
    (travelTiming p t c).intentDay ≤ (travelTiming p t c).endDay




def InchoateTargetCovered (d : Person) (c : ComplaintText) : Prop :=
  inchoateTargetSubsection d c ≠ Subsection2423.other















structure CivilRecoveryAvailable2421Ac
    (p : Person) (d : Person) (a : CivilAction) (ct : DistrictCourt)
    (c : ComplaintText) : Prop where
  injured          : PersonInjured p c
  byReason         : InjuryByReasonOfViolation p d c
  violationB       : ViolationOfSubsectionB d c
  actionFiled      : CivilActionFiled a p c
  appropriateForum : FiledInAppropriateDistrictCourt a ct c






structure MandatoryRestitution2421Ad
    (d : Person) (o : RestitutionOrder) (pr : Prosecution) (c : ComplaintText) : Prop where
  violationB2    : ViolationOfSubsectionB2 d c
  orderEntered   : RestitutionOrderEntered o pr c
  scopeConsistent : RestitutionScopeConsistentWith2327b o c





structure AffirmativeDefenseEstablished2421Ae
    (pr : Prosecution) (d : Person) (c : ComplaintText) : Prop where
  charged        : ProsecutionCommenced pr d c
  defenseReaches : ChargeUnderSubsectionAOrB1 pr c
  legalInForum   : PromotionLegalInTargetedJurisdiction d c
  burdenCarried  : DefenseProvenByPreponderance pr d c





structure AgeDefenseEstablished2423i
    (pr : Prosecution) (d : Person) (c : ComplaintText) : Prop where
  charged        : ProsecutionCommenced pr d c
  predicatedOnG2 : ProsecutionBasedOnIllicitSexualConductG2 pr c
  belief         : ReasonableBeliefVictimAtLeast18 d c
  burdenCarried  : DefenseProvenByClearAndConvincing pr d c





structure IntentTimingSatisfied2423h
    (d : Person) (t : TravelEvent) (c : ComplaintText) : Prop where
  travelOccurred : TransportationOrTravelOccurred t d c
  intent         : IntentToEngageInProscribedConduct d t c
  contemporaneous : IntentContemporaneousWithTravel d t c





structure InchoateRoutingSatisfied2423f
    (d : Person) (c : ComplaintText) : Prop where
  inchoateConduct : AttemptedOrConspiredToViolate d c
  targetCovered   : InchoateTargetCovered d c




def tInjury (p : Person) (d : Person) (c : ComplaintText) : Transition where
  source := State.Violation
  target := State.Injured
  guard  := PersonInjured p c ∧ InjuryByReasonOfViolation p d c


def tFiling (p : Person) (a : CivilAction) (c : ComplaintText) : Transition where
  source := State.Injured
  target := State.ActionFiled
  guard  := CivilActionFiled a p c



def tForum (a : CivilAction) (ct : DistrictCourt) (c : ComplaintText) : Transition where
  source := State.ActionFiled
  target := State.ForumEstablished
  guard  := FiledInAppropriateDistrictCourt a ct c


def tRecovery (d : Person) (c : ComplaintText) : Transition where
  source := State.ForumEstablished
  target := State.RecoveryAvailable
  guard  := ViolationOfSubsectionB d c


def tViolationEstablished (d : Person) (c : ComplaintText) : Transition where
  source := State.Violation
  target := State.ViolationEstablished
  guard  := ViolationOfSubsectionB2 d c


def tRestitution (o : RestitutionOrder) (pr : Prosecution) (c : ComplaintText) : Transition where
  source := State.ViolationEstablished
  target := State.RestitutionOrdered
  guard  := RestitutionOrderEntered o pr c ∧ RestitutionScopeConsistentWith2327b o c


def tCharge (pr : Prosecution) (d : Person) (c : ComplaintText) : Transition where
  source := State.Violation
  target := State.Charged
  guard  := ProsecutionCommenced pr d c


def tRaiseDefense (pr : Prosecution) (d : Person) (c : ComplaintText) : Transition where
  source := State.Charged
  target := State.DefenseRaised
  guard  := ChargeUnderSubsectionAOrB1 pr c ∧ PromotionLegalInTargetedJurisdiction d c


def tEstablishDefense (pr : Prosecution) (d : Person) (c : ComplaintText) : Transition where
  source := State.DefenseRaised
  target := State.DefenseEstablished
  guard  := DefenseProvenByPreponderance pr d c




inductive Reachable : State → State → Prop
  | refl (s : State) : Reachable s s
  | step (s m t : State) (tr : Transition)
      (hs : tr.source = s) (ht : tr.target = m) (hg : tr.guard)
      (rest : Reachable m t) : Reachable s t

end Proving.USC.T18.Ch117.Reslice.Procedure
