







import Proving.USC.T08.Inadmissibility.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T08.Inadmissibility.Ontology

open Proving.USC.Common






axiom IsAlien (a : Alien) (c : ComplaintText) : Prop





axiom IsLawfulPermanentResident (a : Alien) (c : ComplaintText) : Prop




axiom IsAuthorizedToWork (a : Alien) (c : ComplaintText) : Prop





axiom IsUnauthorizedAlien (a : Alien) (c : ComplaintText) : Prop





axiom IsEntity (e : Entity) (c : ComplaintText) : Prop






axiom IsTerroristActivity (act : Activity) (c : ComplaintText) : Prop





axiom EngagesInTerroristActivity (a : Alien) (c : ComplaintText) : Prop





axiom IsTerroristOrganization (o : Organization) (c : ComplaintText) : Prop






axiom IsRepresentative (a : Alien) (o : Organization) (c : ComplaintText) : Prop





axiom IsUnitedStatesWorker (p : Person) (c : ComplaintText) : Prop









axiom IsHealthRelatedGround (a : Alien) (c : ComplaintText) : Prop



axiom IsCriminalGround (a : Alien) (c : ComplaintText) : Prop



axiom IsSecurityGround (a : Alien) (c : ComplaintText) : Prop



axiom IsPublicChargeGround (a : Alien) (c : ComplaintText) : Prop



axiom IsLaborCertGround (a : Alien) (c : ComplaintText) : Prop



axiom IsIllegalEntrantGround (a : Alien) (c : ComplaintText) : Prop



axiom IsDocumentationGround (a : Alien) (c : ComplaintText) : Prop



axiom IsIneligibleCitizenshipGround (a : Alien) (c : ComplaintText) : Prop



axiom IsPreviouslyRemovedGround (a : Alien) (c : ComplaintText) : Prop



axiom IsMiscellaneousGround (a : Alien) (c : ComplaintText) : Prop

end Proving.USC.T08.Inadmissibility.Ontology
