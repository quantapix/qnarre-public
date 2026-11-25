








import Proving.USC.T42.Structure.Statute

namespace Proving.USC.T42.Structure

open Proving.USC.Common

theorem coherent1981a_intro {c}
    (hRegime  : ReferencedSectionExists edge_1981a_incorporates_2000e5 c)
    (hIncorp  : IncorporationHonored edge_1981a_incorporates_2000e5 c)
    (h1981Ex  : ReferencedSectionExists edge_1981a_lexSpecialis_1981 c)
    (h1981Sav : SavingsPreserved edge_1981a_savings_1981 c)
    : Coherent1981a c :=
  ⟨hRegime, hIncorp, h1981Ex, h1981Sav⟩

theorem coherent1983Base_intro {c}
    (hRight  : ReferencedSectionExists edge_1983_incorporates_federalRight c)
    (hIncorp : IncorporationHonored edge_1983_incorporates_federalRight c)
    : Coherent1983Base c :=
  ⟨hRight, hIncorp⟩

theorem coherent1983_ordinary_intro {c}
    (base : Coherent1983Base c)
    (hNoExc : ReferencedSectionExists edge_1983_exceptAsProvided_judicialOfficer c)
    : Coherent1983 c :=
  .ordinary base hNoExc

theorem coherent1983_judicialOfficer_intro {c}
    (base : Coherent1983Base c)
    (hExc : ExceptionApplies edge_1983_exceptAsProvided_judicialOfficer c)
    (hOvr : OverrideTriggered edge_1983_exceptAsProvided_judicialOfficer c)
    : Coherent1983 c :=
  .judicialOfficer base hExc hOvr

theorem coherent1986_intro {c}
    (hEx     : ReferencedSectionExists edge_1986_incorporates_1985 c)
    (hIncorp : IncorporationHonored edge_1986_incorporates_1985 c)
    : Coherent1986 c :=
  ⟨hEx, hIncorp⟩

theorem coherent2000d1_intro {c}
    (hEx     : ReferencedSectionExists edge_2000d1_incorporates_2000d c)
    (hIncorp : IncorporationHonored edge_2000d1_incorporates_2000d c)
    : Coherent2000d1 c :=
  ⟨hEx, hIncorp⟩

theorem coherent2000d7_intro {c}
    (hEx     : ReferencedSectionExists edge_2000d7_incorporates_2000d c)
    (hIncorp : IncorporationHonored edge_2000d7_incorporates_2000d c)
    (hOvr    : OverrideTriggered edge_2000d7_notwithstanding_eleventhAmd c)
    : Coherent2000d7 c :=
  ⟨hEx, hIncorp, hOvr⟩

end Proving.USC.T42.Structure
