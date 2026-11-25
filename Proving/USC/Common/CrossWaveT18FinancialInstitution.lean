















































import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

import Proving.USC.T18.PredicateDefs.Ontology.Predicates

import Proving.USC.T18.RacketeeringActs.Ontology.Predicates

namespace Proving.USC.Common.CrossWaveT18FinancialInstitution

open Proving.USC.Common










axiom mapPredDefsFiToEntity : Proving.USC.T18.PredicateDefs.Ontology.FinancialInstitution → Entity




axiom corr_predDefs_fi_to_common
    {x : Proving.USC.T18.PredicateDefs.Ontology.FinancialInstitution} {c : ComplaintText} :
    Proving.USC.T18.PredicateDefs.Ontology.IsFinancialInstitution x c →
    IsFinancialInstitution (mapPredDefsFiToEntity x) c




axiom corr_racketeering_fi_to_common
    {e : Entity} {c : ComplaintText} :
    Proving.USC.T18.RacketeeringActs.Ontology.IsFinancialInstitution e c →
    IsFinancialInstitution e c




theorem mint_predDefs_financialInstitution
    {x : Proving.USC.T18.PredicateDefs.Ontology.FinancialInstitution} {c : ComplaintText}
    (h : Proving.USC.T18.PredicateDefs.Ontology.IsFinancialInstitution x c) :
    IsFinancialInstitution (mapPredDefsFiToEntity x) c :=
  corr_predDefs_fi_to_common h





theorem mint_racketeering_financialInstitution
    {e : Entity} {c : ComplaintText}
    (h : Proving.USC.T18.RacketeeringActs.Ontology.IsFinancialInstitution e c) :
    IsFinancialInstitution e c :=
  corr_racketeering_fi_to_common h

end Proving.USC.Common.CrossWaveT18FinancialInstitution
