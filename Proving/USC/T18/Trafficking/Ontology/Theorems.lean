







import Proving.USC.Common.Types
import Proving.USC.T18.Trafficking.Ontology.Types
import Proving.USC.T18.Trafficking.Ontology.Predicates
import Proving.USC.T18.Trafficking.Ontology.Statute

namespace Proving.USC.T18.Trafficking.Ontology

open Proving.USC.Common (ComplaintText Person Entity)



theorem coercionContent_ofAbuse_intro {c : ComplaintText}
    (a : AbuseOfLegalProcess) (hA : IsAbuseOfLegalProcess a c) : CoercionContent c :=
  .abuseOfLegalProcess a hA



theorem coercionContent_ofSeriousHarm_intro {c : ComplaintText}
    (h : SeriousHarm) (hH : IsSeriousHarm h c) : CoercionContent c :=
  .threatOfSeriousHarm h hH



theorem coercionMembership_intro {co : Coercion} {c : ComplaintText}
    (hMem : IsCoercion co c) (hContent : CoercionContent c) : CoercionMembership co c :=
  ⟨hMem, hContent⟩




theorem participationContent_intro {pv : ParticipationInVenture} {v : Entity}
    {c : ComplaintText}
    (hVenture : IsVenture v c) (hPart : IsParticipationInVenture pv c)
    : ParticipationContent pv v c :=
  ⟨hVenture, hPart⟩

end Proving.USC.T18.Trafficking.Ontology
