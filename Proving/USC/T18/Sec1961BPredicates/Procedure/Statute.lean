












import Proving.USC.T18.Sec1961BPredicates.Procedure.Predicates

namespace Proving.USC.T18.Sec1961BPredicates.Procedure

open Proving.USC.Common








def ExceedsThirtyDays (n : Nat) : Prop := 30 < n


def AtLeastTwoSuccessiveDays (n : Nat) : Prop := 2 ≤ n


def AtLeastFivePersons (k : Nat) : Prop := 5 ≤ k



def OffenseAfterPriorFinal (priorFinal current : Nat) : Prop := priorFinal < current







structure FederalJurisdictionTransition (c : ComplaintText) : Prop where
  conduct      : ConductOccurred c
  circumstance : FederalCircumstanceMet c




structure ContinuousOperationDurationMet (n : Nat) (c : ComplaintText) : Prop where
  span    : OperationSpanIs n c
  exceeds : ExceedsThirtyDays n



structure FivePersonScaleMet (k : Nat) (c : ComplaintText) : Prop where
  count   : PersonCountIs k c
  atLeast : AtLeastFivePersons k







structure ProbableCausePresumption (k n : Nat) (c : ComplaintText) : Prop where
  warrantSought : WarrantSought c
  scale         : FivePersonScaleMet k c
  successiveOp  : OperationSpanIs n c
  twoDays       : AtLeastTwoSuccessiveDays n




structure CarrierDiscontinuanceDuty (c : ComplaintText) : Prop where
  notified        : WrittenNotificationServed c
  reasonableNotice : ReasonableNoticeToSubscriber c
  discontinued    : FacilityDiscontinued c




structure CarrierSafeHarbor (c : ComplaintText) : Prop where
  notified   : WrittenNotificationServed c
  compliance : ActDoneInComplianceWithNotice c



structure ForfeitureProcess (pr : Property) (c : ComplaintText) : Prop where
  used        : PropertyUsedInViolation pr c
  seized      : PropertySeized pr c
  adjudicated : ForfeitureAdjudicated pr c




structure MandatoryForfeitureOnConviction (pr : Property) (c : ComplaintText) : Prop where
  convicted   : ConvictionEntered c
  used        : PropertyUsedInViolation pr c
  adjudicated : ForfeitureAdjudicated pr c




structure RecidivistEnhancement (d₁ d₂ : Nat) (c : ComplaintText) : Prop where
  priorFinal     : PriorConvictionFinalDay d₁ c
  currentOffense : CurrentOffenseDay d₂ c
  afterPrior     : OffenseAfterPriorFinal d₁ d₂






inductive Reaches (c : ComplaintText) : State → Prop
  | start :
      ConductOccurred c → Reaches c State.ConductOccurred
  | jurisdiction :
      Reaches c State.ConductOccurred → FederalCircumstanceMet c →
        Reaches c State.FederalCircumstanceAttached

end Proving.USC.T18.Sec1961BPredicates.Procedure
