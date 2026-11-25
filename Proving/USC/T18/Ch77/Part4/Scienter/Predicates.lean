










import Proving.USC.T18.Ch77.Part4.Scienter.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part4.Scienter

open Proving.USC.Common







axiom MentalStateProven
    (p : Person) (el : ScienterElement) (rung : MentalState) (c : ComplaintText) : Prop





axiom ActConstitutingViolationIsAdvertising (p : Person) (c : ComplaintText) : Prop




axiom ProsecutionUnderParagraphOne (c : ComplaintText) : Prop





axiom ReasonableOpportunityToObserve
    (defendant : Person) (subject : Person) (c : ComplaintText) : Prop







axiom SufficesForUnspecifiedDemand (rung : MentalState) (c : ComplaintText) : Prop





def RequiredMentalState1591aConduct : ScienterDemand := .atLeast .Knowledge




def RequiredMentalState1591Circumstance : ScienterDemand := .atLeast .Recklessness




def RequiredMentalState1591CircumstanceAdvertising : ScienterDemand := .atLeast .Knowledge



def RequiredMentalState1591e4 : ScienterDemand := .atLeast .Knowledge



def RequiredMentalState1591e2b : ScienterDemand := .atLeast .Specific






def RequiredMentalState1591cAgeRelieved : ScienterDemand := .atLeast .StrictLiability





def RequiredMentalState1591d : ScienterDemand := .unspecified

end Proving.USC.T18.Ch77.Part4.Scienter
