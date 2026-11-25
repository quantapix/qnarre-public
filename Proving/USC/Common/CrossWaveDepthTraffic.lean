









import Proving.USC.T18.Ch113.Counterfeiting.Ontology.Predicates
import Proving.USC.T18.Sec1961BPredicates.Ontology.Predicates
import Proving.USC.Common.Predicates

namespace Proving.USC.Common.CrossWaveDepthTrafficBridge

open Proving.USC.Common







axiom mapCtfTraffic : Proving.USC.T18.Ch113.Counterfeiting.Ontology.TraffickingAct → TraffickConduct


axiom mapSec1961BTraffic : Proving.USC.T18.Sec1961BPredicates.Ontology.TraffickingConduct → TraffickConduct


axiom corr_ctf_traffic_to_common
    {t : Proving.USC.T18.Ch113.Counterfeiting.Ontology.TraffickingAct} {c : ComplaintText} :
    Proving.USC.T18.Ch113.Counterfeiting.Ontology.IsTraffic t c →
    IsTraffic (mapCtfTraffic t) c


axiom corr_sec1961B_traffic_to_common
    {k : Proving.USC.T18.Sec1961BPredicates.Ontology.TraffickingConduct} {c : ComplaintText} :
    Proving.USC.T18.Sec1961BPredicates.Ontology.IsTraffic k c →
    IsTraffic (mapSec1961BTraffic k) c


theorem mint_ctf_traffic
    {t : Proving.USC.T18.Ch113.Counterfeiting.Ontology.TraffickingAct} {c : ComplaintText}
    (h : Proving.USC.T18.Ch113.Counterfeiting.Ontology.IsTraffic t c) :
    IsTraffic (mapCtfTraffic t) c :=
  corr_ctf_traffic_to_common h


theorem mint_sec1961B_traffic
    {k : Proving.USC.T18.Sec1961BPredicates.Ontology.TraffickingConduct} {c : ComplaintText}
    (h : Proving.USC.T18.Sec1961BPredicates.Ontology.IsTraffic k c) :
    IsTraffic (mapSec1961BTraffic k) c :=
  corr_sec1961B_traffic_to_common h

end Proving.USC.Common.CrossWaveDepthTrafficBridge
