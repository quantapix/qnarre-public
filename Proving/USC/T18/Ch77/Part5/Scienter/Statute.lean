import Proving.USC.T18.Ch77.Part5.Scienter.Predicates

set_option autoImplicit false









namespace Proving.USC.T18.Ch77.Part5.Scienter

open Proving.USC.Common










def DemandMet (dmd : ScienterDemand) (d : Person) (el : ScienterElement1591)
    (c : ComplaintText) : Prop :=
  match dmd with
  | .atLeastRung .StrictLiability => True
  | .atLeastRung m => ∃ rung : MentalState, rung.atLeast m ∧ MentalStateProvenAsTo d el rung c
  | .unspecified => UnspecifiedScienterSatisfied d el c



def RequiredConductScienter1591a : ScienterDemand := .atLeastRung .Knowledge





def RequiredParticipationScienter1591e4 : ScienterDemand := .atLeastRung .Knowledge









def RequiredMeansScienter1591a (advertising : Bool) : ScienterDemand :=
  if advertising then .atLeastRung .Knowledge else .atLeastRung .Recklessness













def RequiredAgeScienter1591 (advertising underA1 observed : Bool) : ScienterDemand :=
  if underA1 && observed then .atLeastRung .StrictLiability
  else if advertising then .atLeastRung .Knowledge
  else .atLeastRung .Recklessness





def RequiredObstructionScienter1591d : ScienterDemand := .unspecified





inductive CircumstanceScienter1591 (d v : Person) (c : ComplaintText) : Prop
  | byMeans (h : DemandMet (RequiredMeansScienter1591a (actIsAdvertising d c))
      d .meansCircumstance c)
  | byAge (h : DemandMet (RequiredAgeScienter1591 (actIsAdvertising d c)
      (chargedUnderParagraph1 d c) (hadReasonableOpportunityToObserve d v c))
      d .ageCircumstance c)



structure Scienter1591a1 (d v : Person) (c : ComplaintText) : Prop where
  conduct : DemandMet RequiredConductScienter1591a d .traffickingActA1 c
  circumstance : CircumstanceScienter1591 d v c




structure Scienter1591a2 (d v : Person) (c : ComplaintText) : Prop where
  benefit : DemandMet RequiredConductScienter1591a d .benefitFromVentureA2 c
  participation : DemandMet RequiredParticipationScienter1591e4 d .participationInVenture c
  circumstance : CircumstanceScienter1591 d v c


inductive Culpable1591a (d v : Person) (c : ComplaintText) : Prop
  | viaParagraph1 (h : Scienter1591a1 d v c)
  | viaParagraph2 (h : Scienter1591a2 d v c)



def Scienter1591d (d : Person) (c : ComplaintText) : Prop :=
  DemandMet RequiredObstructionScienter1591d d .obstructionD c

end Proving.USC.T18.Ch77.Part5.Scienter
