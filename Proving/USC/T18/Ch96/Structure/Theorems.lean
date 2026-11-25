





import Proving.USC.T18.Ch96.Structure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.Structure

open Proving.USC.Common


theorem coherent1961_intro {c : ComplaintText}
    (csa : ReferencedSectionExists edge_1961_incorporates_csa102 c)
    (preds : ReferencedSectionExists edge_1961_incorporates_t18Predicates c)
    (t29 : ReferencedSectionExists edge_1961_incorporates_t29 c)
    (t11 : ReferencedSectionExists edge_1961_incorporates_t11 c)
    (s157 : ExceptionApplies edge_1961_except_t18_157 c)
    (ina : ReferencedSectionExists edge_1961_incorporates_ina c)
    (cur : ReferencedSectionExists edge_1961_incorporates_currencyAct c)
    (s2332b : ReferencedSectionExists edge_1961_incorporates_2332b c)
    : Coherent1961 c :=
  ⟨csa, preds, t29, t11, s157, ina, cur, s2332b⟩


theorem coherent1962_intro {c : ComplaintText}
    (hDefs : IncorporationHonored edge_1962_incorporates_1961 c)
    (hPrincipal : ReferencedSectionExists edge_1962a_incorporates_s2 c)
    (hConspiracy : ReferencedSectionExists edge_1962d_incorporates_1962abc c)
    : Coherent1962 c :=
  ⟨hDefs, hPrincipal, hConspiracy⟩


theorem coherent1963_intro {c : ComplaintText}
    (hPred : ReferencedSectionExists edge_1963_incorporates_1962 c)
    (hOverride : OverrideTriggered edge_1963f_notwithstanding_3302b c)
    (hException : ExceptionApplies edge_1963i_except_1963l c)
    : Coherent1963 c :=
  ⟨hPred, hOverride, hException⟩


theorem coherent1964_intro {c : ComplaintText}
    (hPred : ReferencedSectionExists edge_1964_incorporates_1962 c)
    : Coherent1964 c :=
  ⟨hPred⟩


theorem coherent1965_intro {c : ComplaintText}
    (hRemedy : ReferencedSectionExists edge_1965b_incorporates_1964 c)
    : Coherent1965 c :=
  ⟨hRemedy⟩


theorem coherent1968_intro {c : ComplaintText}
    (hDefs : IncorporationHonored edge_1968_incorporates_1961 c)
    : Coherent1968 c :=
  ⟨hDefs⟩

end Proving.USC.T18.Ch96.Structure
