






import Proving.USC.Common.Types
import Proving.USC.T42.TitleVIIDef.Structure.Types
import Proving.USC.T42.TitleVIIDef.Structure.Predicates
import Proving.USC.T42.TitleVIIDef.Structure.Statute

namespace Proving.USC.T42.TitleVIIDef.Structure

open Proving.USC.Common


theorem coherent2000e_intro {c : ComplaintText}
    (t5Exists     : ReferencedSectionExists edge_2000e_b_incorporates_t5_2102 c)
    (t5Honored    : IncorporationHonored    edge_2000e_b_incorporates_t5_2102 c)
    (t26Honored   : IncorporationHonored    edge_2000e_b_incorporates_t26_501c c)
    (nlraHonored  : IncorporationHonored    edge_2000e_e_incorporates_nlra c)
    (lmrdaHonored : IncorporationHonored    edge_2000e_h_incorporates_lmrda c)
    (ocslaHonored : IncorporationHonored    edge_2000e_i_incorporates_ocsla c)
    (e16Exists    : ReferencedSectionExists edge_2000e_n_incorporates_2000e16 c)
    : Coherent2000e c :=
  ⟨t5Exists, t5Honored, t26Honored, nlraHonored, lmrdaHonored, ocslaHonored, e16Exists⟩


theorem coherent2000e2_intro {c : ComplaintText}
    (defsHonored      : IncorporationHonored    edge_2000e2_incorporates_defs c)
    (eqPayHonored     : IncorporationHonored    edge_2000e2_h_incorporates_t29_206d c)
    (csaExists        : ReferencedSectionExists edge_2000e2_k3_incorporates_csa c)
    (frcp24Exists     : ReferencedSectionExists edge_2000e2_n_incorporates_frcp24 c)
    (bfoqOverride     : OverrideTriggered       edge_2000e2_e_notwithstanding_subchapter c)
    (motivatingExcept : ExceptionApplies        edge_2000e2_m_exceptAsProvided_subchapter c)
    : Coherent2000e2 c :=
  ⟨defsHonored, eqPayHonored, csaExists, frcp24Exists, bfoqOverride, motivatingExcept⟩


theorem coherent2000e3_intro {c : ComplaintText}
    (defsHonored   : IncorporationHonored edge_2000e3_incorporates_defs c)
    (anchorHonored : IncorporationHonored edge_2000e3_a_incorporates_2000e2 c)
    (bfoqException : ExceptionApplies     edge_2000e3_b_exceptAsProvided_bfoq c)
    : Coherent2000e3 c :=
  ⟨defsHonored, anchorHonored, bfoqException⟩

end Proving.USC.T42.TitleVIIDef.Structure
