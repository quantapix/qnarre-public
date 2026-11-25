








import Proving.USC.Common.Types
import Proving.USC.T18.Spec.Remedy.Types
import Proving.USC.T18.Spec.Remedy.Predicates

namespace Proving.USC.T18.Spec.Remedy

open Proving.USC.Common





structure Standing1964c (p : Person) (c : ComplaintText) : Prop where
  privateRight : HasPrivateRightOfAction p c
  violation    : ViolationEstablished c
  injury       : InjuryCognizable p c
  causation    : CausedByViolation p c




structure GovernmentCivil1964ab (c : ComplaintText) : Prop where
  violation   : ViolationEstablished c
  agProceeding : AttorneyGeneralProceeding c
  injunctive  : InjunctiveReliefAvailable c



structure CriminalForfeiture1963 (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  conviction  : CriminalConviction p c
  forfeitable : ForfeitableInterest e c



inductive ChapterRemedy (p : Person) (e : Entity) (c : ComplaintText) : Prop
  | privateTreble (h : Standing1964c p c)        : ChapterRemedy p e c
  | governmentCivil (h : GovernmentCivil1964ab c) : ChapterRemedy p e c
  | criminal (h : CriminalForfeiture1963 p e c)   : ChapterRemedy p e c




def s1964cEnforcer : Enforcer := .privateRight

def s1964cRelief : List Relief := [.trebleDamages, .costs, .attorneysFees]


def s1964abEnforcer : Enforcer := .mixed

def s1964aRelief : List Relief := [.injunction, .divestiture, .dissolution]


def s1963Enforcer : Enforcer := .criminal

def s1963Relief : List Relief := [.fine, .imprisonment, .criminalForfeiture]

end Proving.USC.T18.Spec.Remedy
