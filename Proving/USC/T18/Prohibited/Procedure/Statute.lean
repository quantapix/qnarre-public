













import Proving.USC.T18.Prohibited.Procedure.Types
import Proving.USC.T18.Prohibited.Procedure.Predicates
import Proving.USC.T18.Prohibited.Procedure.Doctrine
import Proving.USC.Common.Types

namespace Proving.USC.T18.Prohibited.Procedure

open Proving.USC.Common




structure Transition where
  fromState : State
  toState   : State
  guard     : Prop






structure TimelyFiling (t : ViolationTarget) (p : Person) (c : ComplaintText) : Prop where
  accrued    : ClaimAccrued p c
  predicated : ViolationPredicated t p c
  filed      : ComplaintFiled p c
  inWindow   : WithinFourYearWindow p c




def timelyTransition (t : ViolationTarget) (p : Person) (c : ComplaintText) : Transition :=
  { fromState := State.Accrued, toState := State.Filed, guard := TimelyFiling t p c }





inductive ProcedurallyTimely (p : Person) (c : ComplaintText) : Prop
  | viaA (h : TimelyFiling ViolationTarget.subA p c) : ProcedurallyTimely p c
  | viaB (h : TimelyFiling ViolationTarget.subB p c) : ProcedurallyTimely p c
  | viaC (h : TimelyFiling ViolationTarget.subC p c) : ProcedurallyTimely p c
  | viaD (h : TimelyFiling ViolationTarget.subD p c) : ProcedurallyTimely p c

end Proving.USC.T18.Prohibited.Procedure
