














import Proving.USC.T18.Ch71.Procedure.Types
import Proving.USC.T18.Ch71.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch71.Procedure

open Proving.USC.Common



structure Transition where
  fromState : State
  toState   : State
  guard     : Prop




def depositToNonmailable (c : ComplaintText) : Transition :=
  ⟨State.Deposited, State.DeclaredNonmailable, NonmailableDeterminationMade c⟩


def nonmailableToWithdrawn (c : ComplaintText) : Transition :=
  ⟨State.DeclaredNonmailable, State.WithdrawnFromMails, WithdrawnFromMails c⟩











def IsSubsequentOffenseTiming (c : ComplaintText) : Prop :=
  PriorOffenseDay c ≤ CurrentOffenseDay c



def toSubsequentTier (c : ComplaintText) : Transition :=
  ⟨State.OffenseEstablished, State.SubsequentOffenseTier, IsSubsequentOffenseTiming c⟩










def QuantityThresholdMet (c : ComplaintText) : Prop :=
  2 ≤ NumCopiesTransported c


def toPresumptionRaised (c : ComplaintText) : Transition :=
  ⟨State.OffenseEstablished, State.PresumptionRaised, QuantityThresholdMet c⟩






structure NonmailableWithdrawal (p : Person) (c : ComplaintText) : Prop where
  deposited  : MatterDeposited p c
  determined : NonmailableDeterminationMade c
  withdrawn  : WithdrawnFromMails c




structure SubsequentOffense (p : Person) (c : ComplaintText) : Prop where
  offense       : OffenseCommitted p c
  priorOccurred : PriorSuchOffenseOccurred p c
  priorPrecedes : IsSubsequentOffenseTiming c




structure DistributionPresumption (p : Person) (c : ComplaintText) : Prop where
  offense      : OffenseCommitted p c
  thresholdMet : QuantityThresholdMet c
  notRebutted  : ¬ PresumptionRebutted p c



structure BroadcastOffense (p : Person) (c : ComplaintText) : Prop where
  uttered : ObsceneLanguageUttered p c

end Proving.USC.T18.Ch71.Procedure
