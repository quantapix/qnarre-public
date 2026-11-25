







import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.EqualRights.Reslice.Remedy

open Proving.USC.Common




inductive Enforcer where

  | privateRight

  | agencyOnly

  | criminal

  | mixed
  deriving DecidableEq, Repr


inductive Relief where

  | damages

  | compensatoryDamages

  | punitiveDamages

  | wrongfulDeathDamages

  | backpay

  | interestOnBackpay



  | section706gRelief

  | equitableRelief

  | injunction

  | declaratoryRelief

  | otherProperProceeding

  | attorneysFees

  | expertFees

  | costs
  deriving DecidableEq, Repr


inductive CapTier where

  | tier50k

  | tier100k

  | tier200k

  | tier300k
  deriving DecidableEq, Repr




def capAmountDollars : CapTier → Nat
  | .tier50k  =>  50000
  | .tier100k => 100000
  | .tier200k => 200000
  | .tier300k => 300000



def wrongfulDeathCapDollars1986 : Nat := 5000





def oneYearLimitationDays : Nat := 365

end Proving.USC.T42.EqualRights.Reslice.Remedy
