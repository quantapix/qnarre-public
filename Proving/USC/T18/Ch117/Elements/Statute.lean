




















import Proving.USC.T18.Ch117.Elements.Predicates

namespace Proving.USC.T18.Ch117.Elements

open Proving.USC.Common (Person ComplaintText ActedWithScienter ProximateCause)





inductive IllicitSexualConduct (p : Person) (c : ComplaintText) : Prop where
  | sexualAct        (h : SexualActWithMinorUnder18 p c)
  | commercialSexAct (h : CommercialSexActWithMinorUnder18 p c)
  | childPorn        (h : ProducesChildPornography p c)




abbrev EngagesInIllicitSexualConduct (p : Person) (c : ComplaintText) : Prop :=
  IllicitSexualConduct p c





structure Section2421a (p v : Person) (c : ComplaintText) : Prop where
  scienter   : ActedWithScienter p c
  transports : TransportsIndividualInInterstateCommerce p v c
  intent     : IntentToEngageInProscribedSexualActivity p c






structure Section2421A_a (p : Person) (c : ComplaintText) : Prop where
  usesCommerce : UsesInterstateCommerceFacility p c
  operatesICS  : OwnsManagesOperatesInteractiveComputerService p c
  intent       : IntentToPromoteOrFacilitateProstitution p c


inductive Aggravator2421A_b (p : Person) (c : ComplaintText) : Prop where
  | fiveOrMore          (h : PromotesOrFacilitatesProstitutionOfFiveOrMore p c)
  | recklessTrafficking (h : RecklessDisregardOfSexTraffickingContribution p c)


structure Section2421A_b (p : Person) (c : ComplaintText) : Prop where
  base       : Section2421A_a p c
  aggravator : Aggravator2421A_b p c



structure Section2421A_c (plaintiff defendant : Person) (c : ComplaintText) : Prop where
  violation : Section2421A_b defendant c
  injury    : IsInjuredPerson plaintiff c
  causation : ProximateCause plaintiff c





structure Section2422a (p v : Person) (c : ComplaintText) : Prop where
  scienter    : ActedWithScienter p c
  entices     : PersuadesInducesEnticesOrCoerces p v c
  causesTravel : CausesIndividualToTravelInInterstateCommerce p v c
  intent      : IntentToEngageInProscribedSexualActivity p c


structure Section2422b (p v : Person) (c : ComplaintText) : Prop where
  scienter     : ActedWithScienter p c
  usesCommerce : UsesInterstateCommerceFacility p c
  entices      : PersuadesInducesEnticesOrCoerces p v c
  minor        : IndividualUnderAge18 v c
  intent       : IntentToEngageInProscribedSexualActivity p c





structure Section2423a (p v : Person) (c : ComplaintText) : Prop where
  scienter   : ActedWithScienter p c
  transports : TransportsIndividualInInterstateCommerce p v c
  minor      : IndividualUnderAge18 v c
  intent     : IntentToEngageInProscribedSexualActivity p c



structure Section2423b (p : Person) (c : ComplaintText) : Prop where
  travels : TravelsInInterstateOrForeignCommerce p c
  intent  : IntentToEngageInIllicitSexualConduct p c



structure Section2423c (p : Person) (c : ComplaintText) : Prop where
  citizen : IsUSCitizenOrPermanentResident p c
  travels : TravelsInForeignCommerceOrResidesAbroad p c
  engages : EngagesInIllicitSexualConduct p c




structure Section2423e (p v : Person) (c : ComplaintText) : Prop where
  purpose    : ForCommercialAdvantageOrPrivateGain p c
  arranges   : ArrangesOrFacilitatesTravel p v c
  knowsIntent : KnowsTravelerIntendsIllicitSexualConduct p c





inductive Violation2424 (p : Person) (c : ComplaintText) : Prop where
  | failsToFile    (h : FailsToFileRequiredStatement p c)
  | falseStatement (h : FalselyStatesOrFailsToDiscloseInStatement p c)



structure Section2424a (p v : Person) (c : ComplaintText) : Prop where
  keepsHarbors   : KeepsOrHarborsForProstitution p v c
  alienKnowledge : KnowsOrRecklesslyDisregardsAlienStatus p v c
  violation      : Violation2424 p c






structure Section2425 (p v : Person) (c : ComplaintText) : Prop where
  scienter     : ActedWithScienter p c
  usesCommerce : UsesInterstateCommerceFacility p c
  initiates    : InitiatesTransmissionOfMinorIdentifyingInfo p v c
  minorUnder16 : IndividualUnderAge16 v c
  intent       : IntentToEnticeSolicitProscribedSexualActivity p c

end Proving.USC.T18.Ch117.Elements
