






import Proving.USC.T18.Remedy.Predicates

namespace Proving.USC.T18.Remedy
open Proving.USC.Common



structure Standing1964c (p : Person) (c : ComplaintText) : Prop where
  privateRight : HasPrivateRightOfAction p c
  injury       : InjuryCognizable p c
  causation    : CausedByViolation p c


def s1962cEnforcer : Enforcer := .privateRight

def s1962cRelief : List Relief := [.trebleDamages, .costs, .attorneysFees]

end Proving.USC.T18.Remedy
