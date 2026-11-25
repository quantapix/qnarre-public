













import Proving.USC.T42.EqualRights.Remedy.Types
import Proving.USC.T42.EqualRights.Remedy.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.EqualRights.Remedy

open Proving.USC.Common





structure Standing1981 (p : Person) (c : ComplaintText) : Prop where
  privateRight : HasPrivateRightOfAction p c
  injury       : InjuryCognizable p c
  causation    : CausedByViolation p c
  redressable  : ReliefRedressable p c



def s1981Enforcer : Enforcer := .privateRight



def s1981Relief : List Relief :=
  [.equitableRelief, .compensatoryDamages, .attorneysFees, .costs]


structure RemedyAvailable1981 (p : Person) (c : ComplaintText) : Prop where
  standing : Standing1981 p c





structure Standing1982 (p : Person) (c : ComplaintText) : Prop where
  privateRight : HasPrivateRightOfAction p c
  injury       : InjuryCognizable p c
  causation    : CausedByViolation p c
  redressable  : ReliefRedressable p c


def s1982Enforcer : Enforcer := .privateRight



def s1982Relief : List Relief :=
  [.equitableRelief, .compensatoryDamages, .attorneysFees, .costs]


structure RemedyAvailable1982 (p : Person) (c : ComplaintText) : Prop where
  standing : Standing1982 p c












def s1981aEnforcer : Enforcer := .mixed





def s1981aCompensatoryRelief : List Relief :=
  [.compensatoryDamages, .backpay, .attorneysFees, .costs]



structure CompensatoryAvailable1981a (p : Person) (c : ComplaintText) : Prop where
  gateway     : Section1981aGatewayMet p c
  injury      : InjuryCognizable p c
  causation   : CausedByViolation p c
  redressable : ReliefRedressable p c




structure PunitiveAvailable1981a (p : Person) (c : ComplaintText) : Prop where
  compensatory  : CompensatoryAvailable1981a p c
  culpability   : PunitiveEligible p c
  notGovernment : RespondentNotGovernment p c




inductive RemedyAvailable1981a (p : Person) (c : ComplaintText) : Prop
  | compensatory (h : CompensatoryAvailable1981a p c) : RemedyAvailable1981a p c
  | punitive     (h : PunitiveAvailable1981a p c)     : RemedyAvailable1981a p c

end Proving.USC.T42.EqualRights.Remedy
