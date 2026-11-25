








import Proving.USC.T18.Ch75.Ontology.Predicates
import Proving.USC.T18.Sec1961BPredicates.Ontology.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.Common.CrossWaveDepthIdDocBridge

open Proving.USC.Common






axiom mapCh75IdDoc : Proving.USC.T18.Ch75.Ontology.IdentificationDocument → IdentificationDocument


axiom mapSec1961BIdDoc : Proving.USC.T18.Sec1961BPredicates.Ontology.IdentificationDocument → IdentificationDocument


axiom corr_ch75_idDoc_to_common
    {d : Proving.USC.T18.Ch75.Ontology.IdentificationDocument} {c : ComplaintText} :
    Proving.USC.T18.Ch75.Ontology.IsIdentificationDocument d c →
    IsIdentificationDocument (mapCh75IdDoc d) c


axiom corr_sec1961B_idDoc_to_common
    {d : Proving.USC.T18.Sec1961BPredicates.Ontology.IdentificationDocument} {c : ComplaintText} :
    Proving.USC.T18.Sec1961BPredicates.Ontology.IsIdentificationDocument d c →
    IsIdentificationDocument (mapSec1961BIdDoc d) c


theorem mint_ch75_idDoc
    {d : Proving.USC.T18.Ch75.Ontology.IdentificationDocument} {c : ComplaintText}
    (h : Proving.USC.T18.Ch75.Ontology.IsIdentificationDocument d c) :
    IsIdentificationDocument (mapCh75IdDoc d) c :=
  corr_ch75_idDoc_to_common h


theorem mint_sec1961B_idDoc
    {d : Proving.USC.T18.Sec1961BPredicates.Ontology.IdentificationDocument} {c : ComplaintText}
    (h : Proving.USC.T18.Sec1961BPredicates.Ontology.IsIdentificationDocument d c) :
    IsIdentificationDocument (mapSec1961BIdDoc d) c :=
  corr_sec1961B_idDoc_to_common h

end Proving.USC.Common.CrossWaveDepthIdDocBridge
