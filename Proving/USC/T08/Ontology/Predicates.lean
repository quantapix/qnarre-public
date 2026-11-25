
















import Proving.USC.T08.Ontology.Types
import Proving.USC.Common.Types

namespace Proving.USC.T08.Ontology

open Proving.USC.Common



axiom IsAlien (p : Person) (c : ComplaintText) : Prop





axiom IsNationalOfUS (p : Person) (c : ComplaintText) : Prop



axiom IsNational (p : Person) (c : ComplaintText) : Prop






axiom IsLawfulPermanentResident (p : Person) (c : ComplaintText) : Prop




axiom IsImmigrant (p : Person) (c : ComplaintText) : Prop




axiom IsNonimmigrant (p : Person) (c : ComplaintText) : Prop




axiom IsPerson (p : Person) (c : ComplaintText) : Prop






axiom IsOrganization (e : Entity) (c : ComplaintText) : Prop




axiom IsUnitedStatesGeographic (g : GeographicArea) (c : ComplaintText) : Prop




axiom IsAggravatedFelony (o : Offense) (c : ComplaintText) : Prop





axiom IsConviction (cv : Conviction) (c : ComplaintText) : Prop





axiom IsRefugee (p : Person) (c : ComplaintText) : Prop









axiom IsCitizenOfUS (p : Person) (c : ComplaintText) : Prop




axiom OwesPermanentAllegianceToUS (p : Person) (c : ComplaintText) : Prop



axiom IsIndividual (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T08.Ontology
