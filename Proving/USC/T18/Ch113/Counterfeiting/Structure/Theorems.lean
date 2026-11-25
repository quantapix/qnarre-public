







import Proving.USC.T18.Ch113.Counterfeiting.Structure.Statute

namespace Proving.USC.T18.Ch113.Counterfeiting.Structure

open Proving.USC.Common

theorem coherent2318_intro {c : ComplaintText}
    (hTraffic    : IncorporationHonored edge_2318_incorporates_2320f c)
    (hCopyTerms  : IncorporationHonored edge_2318_incorporates_t17_101 c)
    (hAircraft   : IncorporationHonored edge_2318_incorporates_t49_46501 c)
    (hForfeiture : ReferencedSectionExists edge_2318_subjectTo_2323 c)
    : Coherent2318 c :=
  ⟨hTraffic, hCopyTerms, hAircraft, hForfeiture⟩

theorem coherent2319_intro {c : ComplaintText}
    (hCriminal      : IncorporationHonored edge_2319_incorporates_t17_506a c)
    (hCopyTerms     : IncorporationHonored edge_2319_incorporates_t17_101 c)
    (hExclusive     : IncorporationHonored edge_2319_incorporates_t17_106 c)
    (hLimitations   : ReferencedSectionExists edge_2319_subjectTo_t17_107_122 c)
    : Coherent2319 c :=
  ⟨hCriminal, hCopyTerms, hExclusive, hLimitations⟩

theorem coherent2320_intro {c : ComplaintText}
    (hForfeiture  : ReferencedSectionExists edge_2320_subjectTo_2323 c)
    (hLanham      : IncorporationHonored edge_2320_incorporates_lanham c)
    (hDesignation : IncorporationHonored edge_2320_incorporates_t36_220506 c)
    (hDrug        : IncorporationHonored edge_2320_incorporates_t21_321 c)
    (hAgReport    : ReferencedSectionExists edge_2320_incorporates_t28_522 c)
    : Coherent2320 c :=
  ⟨hForfeiture, hLanham, hDesignation, hDrug, hAgReport⟩



theorem section2320_offense_intro {c : ComplaintText}
    (h : Coherent2320 c) : Section2320Disposition c :=
  .offense h



theorem section2320_repackaging_intro {c : ComplaintText}
    (h : ExceptionApplies edge_2320_exceptAsProvided_repackaging c)
    : Section2320Disposition c :=
  .repackagingException h

end Proving.USC.T18.Ch113.Counterfeiting.Structure
