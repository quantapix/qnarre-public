





import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Procedure

open Proving.USC.Common




opaque Prosecution : Type





opaque CivilPenaltyAction : Type




opaque Investigation : Type


opaque District : Type


opaque ReceivershipApplication : Type



opaque RegulatoryNotification : Type








inductive ProsecutionState where
  | Uncharged
  | Charged
  | VenueLaid
  | TimeBarred
  deriving DecidableEq, Repr







inductive CivilActionState where
  | Unfiled
  | Filed
  | ServiceComplete
  | JurisdictionEstablished
  | AssetsSecured
  deriving DecidableEq, Repr





inductive InvestigationState where
  | Unopened
  | Opened
  | Supervised
  deriving DecidableEq, Repr








def statutoryYearDays : Nat := 365


def sevenYearWindowDays : Nat := 7 * statutoryYearDays


def extortionateRateThresholdPercent : Nat := 45


def outstandingCreditThresholdDollars : Nat := 100



def extraterritorialValueThresholdDollars : Nat := 10000

end Proving.USC.T18.Ch42Ch95.Procedure
