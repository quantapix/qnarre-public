











import Proving.USC.T18.Ch77TailCompletion.Scienter.Types

namespace Proving.USC.T18.Ch77TailCompletion.Scienter

open Proving.USC.Common






axiom MentalStateProven (p : Person) (rung : MentalState) (c : ComplaintText) : Prop



















def RequiredMentalState : Ch77Offense → MentalState
  | .s1583  => .Specific
  | .s1584  => .Specific
  | .s1593A => .Recklessness
  | .s1594  => .Specific
  | .s1595  => .Negligence
  | .s1597  => .Knowledge

end Proving.USC.T18.Ch77TailCompletion.Scienter
