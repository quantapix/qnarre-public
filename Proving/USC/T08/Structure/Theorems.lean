





import Proving.USC.T08.Structure.Types
import Proving.USC.T08.Structure.Predicates
import Proving.USC.T08.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T08.Structure

open Proving.USC.Common


theorem coherent1324_intro {c : ComplaintText}
    (hAlienExists : ReferencedSectionExists edge_1324_incorporates_1101 c)
    (hAlien       : IncorporationHonored    edge_1324_incorporates_1101 c)
    (hSbi         : IncorporationHonored    edge_1324_incorporates_t18_1365 c)
    (hUnauth      : IncorporationHonored    edge_1324_incorporates_1324a c)
    (hFine        : IncorporationHonored    edge_1324_incorporates_t18_fine c)
    (hForfeiture  : ReferencedSectionExists edge_1324_subjectTo_t18_981 c)
    : Coherent1324 c :=
  { alienDefExists := hAlienExists, alienDefHonored := hAlien, sbiDefHonored := hSbi,
    unauthDefHonored := hUnauth, fineHonored := hFine, forfeitureRegime := hForfeiture }


theorem coherent1327_intro {c : ComplaintText}
    (hG2Exists : ReferencedSectionExists edge_1327_incorporates_1182a2 c)
    (hG2       : IncorporationHonored    edge_1327_incorporates_1182a2 c)
    (hG3       : IncorporationHonored    edge_1327_incorporates_1182a3 c)
    (hAgg      : IncorporationHonored    edge_1327_incorporates_aggFelony c)
    (hFine     : ReferencedSectionExists edge_1327_incorporates_t18_fine c)
    : Coherent1327 c :=
  { ground2Exists := hG2Exists, ground2Honored := hG2, ground3Honored := hG3,
    aggFelonyHonored := hAgg, fineExists := hFine }


theorem coherent1328_intro {c : ComplaintText}
    (hAlien : IncorporationHonored    edge_1328_incorporates_1101 c)
    (hFine  : ReferencedSectionExists edge_1328_incorporates_t18_fine c)
    : Coherent1328 c :=
  { alienDefHonored := hAlien, fineExists := hFine }


theorem override1324_fre_intro {c : ComplaintText}
    (h : OverrideTriggered edge_1324_notwithstanding_fre c) : Override1324 c :=
  .freDeposition h


theorem carveout_religious_intro {c : ComplaintText}
    (h : ExceptionApplies edge_1324_exceptReligious c) : Carveout c :=
  .religiousVolunteer h

end Proving.USC.T08.Structure
