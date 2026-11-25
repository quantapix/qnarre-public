import Proving.USC.T21.Structure.Types
import Proving.USC.T21.Structure.Predicates
import Proving.USC.T21.Structure.Statute
import Proving.USC.Common.Types





namespace Proving.USC.T21.Structure

open Proving.USC.Common (ComplaintText)


theorem coherent802_intro {c : ComplaintText}
    (hDrug : IncorporationHonored edge_802_12_incorporates_321g1 c)
    (hHemp : IncorporationHonored edge_802_16_incorporates_7_1639o c)
    (hSdf  : IncorporationHonored edge_802_58_incorporates_18_924e2 c)
    (hFrs  : IncorporationHonored edge_802_60_incorporates_812c c)
    (hIrc  : ReferencedSectionExists edge_802_6_incorporates_irc_subtitleE c)
    : Coherent802 c :=
  ⟨hDrug, hHemp, hSdf, hFrs, hIrc⟩



theorem coherent841_intro {c : ComplaintText}
    (hCs   : IncorporationHonored edge_841a_incorporates_802_6 c)
    (hCf   : IncorporationHonored edge_841a_incorporates_802_7 c)
    (hVerb : IncorporationHonored edge_841a_incorporates_802_verbs c)
    (hFdo  : IncorporationHonored edge_841b_incorporates_802_44 c)
    (hAuth : ReferencedSectionExists edge_841a_exceptAs_subchapterAuth c)
    (h849  : ReferencedSectionExists edge_841b_exceptAs_849 c)
    (h859  : ReferencedSectionExists edge_841b_exceptAs_859 c)
    (h860  : ReferencedSectionExists edge_841b_exceptAs_860 c)
    (h861  : ReferencedSectionExists edge_841b_exceptAs_861 c)
    (hFine : IncorporationHonored edge_841b_incorporates_t18_fines c)
    (hCov  : IncorporationHonored edge_841b7_incorporates_18_16 c)
    (h830  : IncorporationHonored edge_841cf_incorporates_830 c)
    (h3583 : ReferencedSectionExists edge_841b1C_notwithstanding_18_3583 c)
    (h844  : ReferencedSectionExists edge_841b4_incorporates_844 c)
    (h3607 : ReferencedSectionExists edge_841b4_incorporates_18_3607 c)
    : Coherent841 c :=
  ⟨hCs, hCf, hVerb, hFdo, hAuth, h849, h859, h860, h861, hFine, hCov, h830, h3583, h844, h3607⟩


theorem coherent846_intro {c : ComplaintText}
    (hOff : IncorporationHonored edge_846_incorporates_offenses c)
    (hPen : IncorporationHonored edge_846_incorporates_penalties c)
    : Coherent846 c :=
  ⟨hOff, hPen⟩



theorem sentencingPath841_standard_intro {c : ComplaintText}
    (hDefault : ReferencedSectionExists edge_841b_exceptAs_849 c)
    (hNoRedir : ReferencedSectionExists edge_841b4_notwithstanding_841b1D c)
    : SentencingPath841 c :=
  .standard hDefault hNoRedir



theorem sentencingPath841_redirected_intro {c : ComplaintText}
    (hFire : OverrideTriggered edge_841b4_notwithstanding_841b1D c)
    (h844  : IncorporationHonored edge_841b4_incorporates_844 c)
    (h3607 : IncorporationHonored edge_841b4_incorporates_18_3607 c)
    : SentencingPath841 c :=
  .redirected hFire h844 h3607

end Proving.USC.T21.Structure
