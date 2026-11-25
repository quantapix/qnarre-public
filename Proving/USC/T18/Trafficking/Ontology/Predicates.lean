












import Proving.USC.Common.Types
import Proving.USC.T18.Trafficking.Ontology.Types

namespace Proving.USC.T18.Trafficking.Ontology

open Proving.USC.Common (ComplaintText Person Entity)




axiom IsSeriousHarm (h : SeriousHarm) (c : ComplaintText) : Prop




axiom IsAbuseOfLegalProcess (a : AbuseOfLegalProcess) (c : ComplaintText) : Prop




axiom IsCoercion (co : Coercion) (c : ComplaintText) : Prop




axiom IsCommercialSexAct (s : CommercialSexAct) (c : ComplaintText) : Prop





axiom IsVenture (v : Entity) (c : ComplaintText) : Prop





axiom IsParticipationInVenture (pv : ParticipationInVenture) (c : ComplaintText) : Prop








axiom IsPeonage (x : Peonage) (c : ComplaintText) : Prop




axiom IsLaborOrServices (x : LaborOrServices) (c : ComplaintText) : Prop

end Proving.USC.T18.Trafficking.Ontology
