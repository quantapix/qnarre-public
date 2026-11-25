







import Proving.USC.T18.Ch77.Ontology.Types
import Proving.USC.T18.Ch77.Ontology.Predicates
import Proving.USC.T18.Ch77.Ontology.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Ontology

open Proving.USC.Common


theorem isVenture_intro {v : Venture} {c : ComplaintText}
    (hv : IsVenture v c) : VentureMembership v c := ⟨hv⟩



theorem isParticipationInVenture_intro {p : ParticipationInVenture} {v : Venture}
    {c : ComplaintText} (hp : IsParticipationInVenture p c) (hv : IsVenture v c)
    : ParticipationMembership p v c := ⟨hp, hv⟩



theorem coercionMembership_intro {co : Coercion} {c : ComplaintText}
    (h : IsCoercion co c) : CoercionMembership co c :=
  .seriousHarmOrRestraint h



theorem forcedLaborMeans_intro {fl : ForcedLabor} {c : ComplaintText}
    (h : IsForcedLabor fl c) : ForcedLaborMeans fl c :=
  .forceOrRestraint h

end Proving.USC.T18.Ch77.Ontology
