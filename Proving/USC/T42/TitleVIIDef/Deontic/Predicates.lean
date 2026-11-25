















import Proving.USC.T42.TitleVIIDef.Deontic.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.TitleVIIDef.Deontic

open Proving.USC.Common















axiom IsCoveredEmployer (p : Person) (c : ComplaintText) : Prop






axiom IsRespondent (p : Person) (c : ComplaintText) : Prop





axiom AddresseeEmployer (p : Person) (c : ComplaintText) : Prop



axiom AddresseeEmploymentAgency (p : Person) (c : ComplaintText) : Prop



axiom AddresseeLaborOrganization (p : Person) (c : ComplaintText) : Prop





axiom AddresseeTrainingController (p : Person) (c : ComplaintText) : Prop






axiom DiscriminatoryActOccurred (p : Person) (c : ComplaintText) : Prop




axiom BecauseOfProtectedGround (p : Person) (g : ProtectedGround) (c : ComplaintText) : Prop






axiom CausesUnjustifiedDisparateImpact (p : Person) (c : ComplaintText) : Prop




axiom ProtectedGroundWasMotivatingFactor (p : Person) (c : ComplaintText) : Prop





axiom AlteredTestScoresOnProtectedGround (p : Person) (c : ComplaintText) : Prop















axiom ExceptionApplies (p : Person) (c : ComplaintText) : Prop







axiom AddresseeRetaliation (p : Person) (c : ComplaintText) : Prop




axiom RetaliatoryActOccurred (p : Person) (c : ComplaintText) : Prop





axiom ProtectedActivityOccurred (p : Person) (c : ComplaintText) : Prop





axiom PublishedDiscriminatoryAdvertisement (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVIIDef.Deontic
