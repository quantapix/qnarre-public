







import Proving.USC.Common.Types
import Proving.USC.T18.PredicateDefs.Procedure.Types
import Proving.USC.T18.PredicateDefs.Procedure.Predicates
import Proving.USC.T18.PredicateDefs.Procedure.Statute

namespace Proving.USC.T18.PredicateDefs.Procedure

open Proving.USC.Common


theorem proceedingIsOfficial_intro {op c}
    (hOfficial : IsOfficialProceeding op c) : ProceedingIsOfficial op c :=
  ⟨hOfficial⟩



theorem safeHarborApplies_intro {op c}
    (hOfficial : IsOfficialProceeding op c)
    (hBonaFide : BonaFideLegalRepresentation op c) : SafeHarborApplies op c :=
  ⟨hOfficial, hBonaFide⟩


theorem reachable_official_intro {op c}
    (h : ProceedingIsOfficial op c) : Reachable op c State.Official :=
  Reachable.official h


theorem reachable_safeHarbored_intro {op c}
    (h : SafeHarborApplies op c) : Reachable op c State.SafeHarbored :=
  Reachable.safeHarbor h

end Proving.USC.T18.PredicateDefs.Procedure
