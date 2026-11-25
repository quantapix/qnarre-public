















import Proving.USC.T18.Ch117.Elements.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T18.Ch117.Elements

open Proving.USC.Common (Person ComplaintText ActedWithScienter ProximateCause)






axiom TransportsIndividualInInterstateCommerce (p v : Person) (c : ComplaintText) : Prop





axiom UsesInterstateCommerceFacility (p : Person) (c : ComplaintText) : Prop




axiom TravelsInInterstateOrForeignCommerce (p : Person) (c : ComplaintText) : Prop




axiom TravelsInForeignCommerceOrResidesAbroad (p : Person) (c : ComplaintText) : Prop




axiom CausesIndividualToTravelInInterstateCommerce (p v : Person) (c : ComplaintText) : Prop








axiom IntentToEngageInProscribedSexualActivity (p : Person) (c : ComplaintText) : Prop




axiom IntentToEngageInIllicitSexualConduct (p : Person) (c : ComplaintText) : Prop




axiom IntentToPromoteOrFacilitateProstitution (p : Person) (c : ComplaintText) : Prop





axiom IntentToEnticeSolicitProscribedSexualActivity (p : Person) (c : ComplaintText) : Prop






axiom OwnsManagesOperatesInteractiveComputerService (p : Person) (c : ComplaintText) : Prop




axiom PromotesOrFacilitatesProstitutionOfFiveOrMore (p : Person) (c : ComplaintText) : Prop




axiom RecklessDisregardOfSexTraffickingContribution (p : Person) (c : ComplaintText) : Prop




axiom PersuadesInducesEnticesOrCoerces (p v : Person) (c : ComplaintText) : Prop




axiom ArrangesOrFacilitatesTravel (p v : Person) (c : ComplaintText) : Prop




axiom ForCommercialAdvantageOrPrivateGain (p : Person) (c : ComplaintText) : Prop




axiom KnowsTravelerIntendsIllicitSexualConduct (p : Person) (c : ComplaintText) : Prop





axiom KeepsOrHarborsForProstitution (p v : Person) (c : ComplaintText) : Prop




axiom KnowsOrRecklesslyDisregardsAlienStatus (p v : Person) (c : ComplaintText) : Prop




axiom FailsToFileRequiredStatement (p : Person) (c : ComplaintText) : Prop




axiom FalselyStatesOrFailsToDiscloseInStatement (p : Person) (c : ComplaintText) : Prop





axiom InitiatesTransmissionOfMinorIdentifyingInfo (p v : Person) (c : ComplaintText) : Prop






axiom IndividualUnderAge18 (v : Person) (c : ComplaintText) : Prop




axiom IndividualUnderAge16 (v : Person) (c : ComplaintText) : Prop




axiom IsUSCitizenOrPermanentResident (p : Person) (c : ComplaintText) : Prop





axiom IsInjuredPerson (p : Person) (c : ComplaintText) : Prop










axiom SexualActWithMinorUnder18 (p : Person) (c : ComplaintText) : Prop



axiom CommercialSexActWithMinorUnder18 (p : Person) (c : ComplaintText) : Prop



axiom ProducesChildPornography (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch117.Elements
