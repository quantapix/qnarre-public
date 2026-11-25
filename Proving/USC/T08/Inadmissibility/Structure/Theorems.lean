





import Proving.USC.T08.Inadmissibility.Structure.Statute

namespace Proving.USC.T08.Inadmissibility.Structure

open Proving.USC.Common


theorem coherent1182_intro {c : ComplaintText}
    (hCsa : IncorporationHonored edge_1182_incorporates_21_802 c)
    (hTraf : IncorporationHonored edge_1182_incorporates_22_7102 c)
    (hMl : ReferencedSectionExists edge_1182_incorporates_18_1956 c)
    (hTo : ReferencedSectionExists edge_1182_incorporates_08_1189 c)
    (hAos : ReferencedSectionExists edge_1182_incorporates_08_1183a c)
    (hEvl : ReferencedSectionExists edge_1182_incorporates_08_1324a c)
    (hHc : ReferencedSectionExists edge_1182_subjectTo_1182r c)
    : Coherent1182 c :=
  ⟨hCsa, hTraf, hMl, hTo, hAos, hEvl, hHc⟩



theorem coherent1324a_intro {c : ComplaintText}
    (hUa : IncorporationHonored edge_1324a_incorporates_internal_h3 c)
    (hAa : IncorporationHonored edge_1324a_incorporates_29_1802 c)
    (hApa : ReferencedSectionExists edge_1324a_incorporates_05_554 c)
    (hFraud : ReferencedSectionExists edge_1324a_incorporates_18_1546 c)
    (hGf : ExceptionApplies edge_1324a_affirmativeDefense_b c)
    : Coherent1324a c :=
  ⟨hUa, hAa, hApa, hFraud, hGf⟩


theorem override1324a_copyDocuments_intro {c : ComplaintText}
    (h : OverrideTriggered edge_1324a_notwithstanding_b4 c) : Override1324a c :=
  .copyDocuments h


theorem override1324a_statePreemption_intro {c : ComplaintText}
    (h : OverrideTriggered edge_1324a_lexSpecialis_preempt_h2 c) : Override1324a c :=
  .statePreemption h

end Proving.USC.T08.Inadmissibility.Structure
