









import Proving.USC.T18.Ch77.Ontology.Types
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Ontology

open Proving.USC.Common



axiom IsSeriousHarm (h : SeriousHarm) (c : ComplaintText) : Prop




axiom IsAbuseOfLegalProcess (a : AbuseOfLegalProcess) (c : ComplaintText) : Prop



axiom IsCoercion (co : Coercion) (c : ComplaintText) : Prop



axiom IsCommercialSexAct (s : CommercialSexAct) (c : ComplaintText) : Prop




axiom IsVenture (v : Venture) (c : ComplaintText) : Prop



axiom IsParticipationInVenture (p : ParticipationInVenture) (c : ComplaintText) : Prop



axiom IsPeonage (x : Peonage) (c : ComplaintText) : Prop




axiom IsInvoluntaryServitude (x : InvoluntaryServitude) (c : ComplaintText) : Prop




axiom IsSlavery (x : Slavery) (c : ComplaintText) : Prop



axiom IsForcedLabor (x : ForcedLabor) (c : ComplaintText) : Prop




axiom IsSevereFormOfTrafficking (x : SevereFormOfTrafficking) (c : ComplaintText) : Prop




axiom IsGovernmentIdentificationDocument (d : GovernmentIdentificationDocument) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch77.Ontology
