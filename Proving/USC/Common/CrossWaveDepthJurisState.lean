














import Proving.USC.T18.Ch42.Ontology.Predicates
import Proving.USC.T22.Ontology.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.Common.CrossWaveDepthJurisStateBridge

open Proving.USC.Common






axiom mapCh42Juris : Proving.USC.T18.Ch42.Ontology.Jurisdiction → JurisdictionalState


axiom mapT22Juris : Proving.USC.T22.Ontology.Jurisdiction → JurisdictionalState


axiom corr_ch42_state_to_common
    {s : Proving.USC.T18.Ch42.Ontology.Jurisdiction} {c : ComplaintText} :
    Proving.USC.T18.Ch42.Ontology.IsState s c →
    IsJurisdictionalState (mapCh42Juris s) c


axiom corr_t22_state_to_common
    {j : Proving.USC.T22.Ontology.Jurisdiction} {c : ComplaintText} :
    Proving.USC.T22.Ontology.IsState j c →
    IsJurisdictionalState (mapT22Juris j) c


theorem mint_ch42_jurisState
    {s : Proving.USC.T18.Ch42.Ontology.Jurisdiction} {c : ComplaintText}
    (h : Proving.USC.T18.Ch42.Ontology.IsState s c) :
    IsJurisdictionalState (mapCh42Juris s) c :=
  corr_ch42_state_to_common h


theorem mint_t22_jurisState
    {j : Proving.USC.T22.Ontology.Jurisdiction} {c : ComplaintText}
    (h : Proving.USC.T22.Ontology.IsState j c) :
    IsJurisdictionalState (mapT22Juris j) c :=
  corr_t22_state_to_common h

end Proving.USC.Common.CrossWaveDepthJurisStateBridge
