










import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Scienter

open Proving.USC.Common





instance instDecidableAtLeast (a b : MentalState) : Decidable (MentalState.atLeast a b) :=
  Nat.decLe b.rank a.rank











inductive ScienterElement2421A where
  | PromoteFacilitateProstitution
  | FiveOrMorePersons
  | ContributionToSexTrafficking
deriving DecidableEq








inductive ScienterElement2423 where

  | TransportationOfIndividual



  | AgeUnder18


  | IntendedProstitutionOrChargeableSexualActivity


  | TravelInCommerce

  | IntendedIllicitSexualConduct


  | EngagingInIllicitSexualConduct


  | OrganizationalActInFurtherance

  | CommercialAdvantageOrPrivateFinancialGain


  | TravelerIntentToEngageInIllicitSexualConduct
deriving DecidableEq





inductive Provision2423 where
  | SubsecA
  | SubsecB
  | SubsecC
  | SubsecD
  | SubsecE
deriving DecidableEq

end Proving.USC.T18.Ch117.Recert.Scienter
