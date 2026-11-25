





import Proving.USC.T31.Ontology.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.Common.CrossWaveDepthPersonBridge

open Proving.USC.Common




axiom corr_t31_person_iff {p : Person} {c : ComplaintText} :
    Proving.USC.T31.Ontology.IsPerson p c ↔ IsPersonInUS p c


theorem collapse_t31_person {p : Person} {c : ComplaintText}
    (h : Proving.USC.T31.Ontology.IsPerson p c) : IsPersonInUS p c :=
  corr_t31_person_iff.mp h

end Proving.USC.Common.CrossWaveDepthPersonBridge
