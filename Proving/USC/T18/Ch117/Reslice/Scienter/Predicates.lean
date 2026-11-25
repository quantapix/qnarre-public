





import Proving.USC.T18.Ch117.Reslice.Scienter.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Scienter

open Proving.USC.Common









def RequiredMentalState : Provision → Option MentalState
  | .s2421A_a         => some .Specific
  | .s2421A_bChapeau  => some .Specific
  | .s2421A_b1        => some .StrictLiability
  | .s2421A_b2        => some .Recklessness
  | .s2423_aTransport => some .Knowledge
  | .s2423_aPurpose   => some .Specific
  | .s2423_aAge       => none
  | .s2423_b          => some .Specific
  | .s2423_c          => some .StrictLiability
  | .s2423_d          => some .Specific
  | .s2423_eGain      => some .Specific
  | .s2423_eKnowledge => some .Knowledge




def RequiredStandard : Defense → ProofStandard
  | .jurisdictionLegality2421Ae => .Preponderance
  | .reasonableBeliefAdult2423i => .ClearAndConvincing







axiom MentalStateProven (p : Person) (prov : Provision) (rung : MentalState)
    (c : ComplaintText) : Prop




axiom AffirmativeDefenseEstablished (p : Person) (d : Defense) (std : ProofStandard)
    (c : ComplaintText) : Prop





axiom IntentToPromoteOrFacilitateProstitution (p : Person) (s : InteractiveComputerService)
    (c : ComplaintText) : Prop





axiom IntentThatIndividualEngageInProhibitedSexualActivity (p : Person) (v : Person)
    (c : ComplaintText) : Prop




axiom IntentToEngageInIllicitSexualConduct (p : Person) (k : IllicitSexualConduct)
    (c : ComplaintText) : Prop





axiom PurposeOfIllicitSexualConductThroughOrganization (p : Person) (e : Entity)
    (k : IllicitSexualConduct) (c : ComplaintText) : Prop





axiom PurposeOfCommercialAdvantageOrPrivateFinancialGain (p : Person)
    (c : ComplaintText) : Prop





axiom KnowledgeOfTravelersIllicitIntent (p : Person) (t : Person)
    (c : ComplaintText) : Prop




axiom IntentConcurrentWithConveyance (p : Person) (v : Conveyance)
    (c : ComplaintText) : Prop






axiom ProsecutionRestsOnCommercialSexActTheory (c : ComplaintText) : Prop

end Proving.USC.T18.Ch117.Reslice.Scienter
