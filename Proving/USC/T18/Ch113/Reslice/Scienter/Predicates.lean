import Proving.USC.T18.Ch113.Reslice.Scienter.Types
import Proving.USC.Common.Types

set_option autoImplicit false













namespace Proving.USC.T18.Ch113.Reslice.Scienter

open Proving.USC.Common





axiom MentalStateProven (p : Person) (rung : MentalState) (c : ComplaintText) : Prop






axiom MarkKnowledgeProven (p : Person) (rung : MentalState) (c : ComplaintText) : Prop



def RequiredMentalState2315 : MentalState := .Knowledge



def RequiredMentalState2318 : MentalState := .Knowledge



def RequiredMentalState2320aTraffic : MentalState := .Specific



def RequiredMentalState2320aMark : MentalState := .Knowledge




def RequiredMentalState2320b2 : MentalState := .Recklessness

end Proving.USC.T18.Ch113.Reslice.Scienter
