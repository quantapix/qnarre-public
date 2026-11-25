










import Proving.USC.Common.Types
import Proving.USC.T18.PredicateDefs.Elements.Types
import Proving.USC.T18.PredicateDefs.Elements.Predicates
import Proving.USC.T18.PredicateDefs.Elements.Statute

namespace Proving.USC.T18.PredicateDefs.Elements

open Proving.USC.Common




theorem isFinancialInstitution_intro {i c}
    (h : FIInsuredDepository i c) : IsFinancialInstitution i c :=
  .insuredDepository h



theorem schemeToDefraud1346_intro {s c}
    (h : DeprivesHonestServices s c) : SchemeToDefraud1346 s c :=
  h



theorem isOfficialProceeding_intro {pr c}
    (h : OPFederalCourt pr c) : IsOfficialProceeding pr c :=
  .federalCourt h




theorem corruptConductForProceeding_intro {pa pr c}
    (hProc : IsOfficialProceeding pr c)
    (hCorrupt : ActedCorruptly pa c)
    (hNotBonaFide : ¬ BonaFideLegalRepresentation pa pr c) :
    CorruptConductForProceeding pa pr c :=
  ⟨hProc, hCorrupt, hNotBonaFide⟩

end Proving.USC.T18.PredicateDefs.Elements
