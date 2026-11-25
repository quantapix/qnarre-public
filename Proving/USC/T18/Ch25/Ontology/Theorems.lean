






import Proving.USC.T18.Ch25.Ontology.Types
import Proving.USC.T18.Ch25.Ontology.Predicates
import Proving.USC.T18.Ch25.Ontology.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch25.Ontology

open Proving.USC.Common



theorem counterfeitObligation_intro {o : Obligation} {c : ComplaintText}
    (hGenus : IsObligationOrSecurity o c) (hFalsified : Falsified o c)
    : CounterfeitObligation o c :=
  ⟨hGenus, hFalsified⟩

end Proving.USC.T18.Ch25.Ontology
