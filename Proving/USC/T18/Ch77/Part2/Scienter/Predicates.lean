








import Proving.USC.Common.Types
import Proving.USC.T18.Ch77.Part2.Scienter.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part2.Scienter

open Proving.USC.Common






axiom MentalStateProven (p : Person) (t : ScienterTarget) (rung : MentalState)
    (c : ComplaintText) : Prop







axiom actConstitutingViolationIsAdvertising1591 (p : Person) (c : ComplaintText) : Bool






axiom chargedUnderSubsection1591a1 (p : Person) (c : ComplaintText) : Bool








axiom reasonableOpportunityToObserve1591c (p : Person) (c : ComplaintText) : Bool






def RequiredMentalState1591a1 : MentalState := .Knowledge




def RequiredMentalState1591a2 : MentalState := .Knowledge





def RequiredMentalState1591e4 : MentalState := .Knowledge





def RequiredMentalState1591e2B : MentalState := .Specific





def RequiredMentalState1591e1 : MentalState := .Specific









def RequiredMentalState1591aMeans (posture : ChargingPosture) : MentalState :=
  if posture.actIsAdvertising then .Knowledge else .Recklessness











def RequiredMentalState1591aAge (posture : ChargingPosture) : MentalState :=
  if posture.underSubsectionA1 && posture.reasonableOpportunityToObserve then
    .StrictLiability
  else if posture.actIsAdvertising then
    .Knowledge
  else
    .Recklessness









def RequiredMentalState1591d : Option MentalState := none

end Proving.USC.T18.Ch77.Part2.Scienter
