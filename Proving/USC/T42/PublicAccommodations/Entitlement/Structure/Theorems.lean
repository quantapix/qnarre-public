






import Proving.USC.T42.PublicAccommodations.Entitlement.Structure.Statute

namespace Proving.USC.T42.PublicAccommodations.Entitlement.Structure

open Proving.USC.Common


theorem coherent2000a_intro {c : ComplaintText}
    (hDefExists : ReferencedSectionExists edge_2000a_incorporates_def c)
    (hDefHonored : IncorporationHonored edge_2000a_incorporates_def c)
    (hCommExists : ReferencedSectionExists edge_2000a_incorporates_commerce c)
    (hCommHonored : IncorporationHonored edge_2000a_incorporates_commerce c)
    (hExcScope : ReferencedSectionExists edge_2000a_exceptAsProvided_b c)
    : Coherent2000a c :=
  { defExists := hDefExists, defHonored := hDefHonored,
    commerceExists := hCommExists, commerceHonored := hCommHonored,
    exceptionScopeExists := hExcScope }


theorem coherent2000a3_intro {c : ComplaintText}
    (hProhibExists : ReferencedSectionExists edge_2000a3_incorporates_2000a2 c)
    (hProhibHonored : IncorporationHonored edge_2000a3_incorporates_2000a2 c)
    (hCrsExists : ReferencedSectionExists edge_2000a3_incorporates_subchVIII c)
    : Coherent2000a3 c :=
  { prohibActExists := hProhibExists, prohibActHonored := hProhibHonored,
    crsExists := hCrsExists }


theorem coherent2000a6_intro {c : ComplaintText}
    (hJurisdiction : ReferencedSectionExists edge_2000a6_incorporates_subch c)
    (hExclusive : OverrideTriggered edge_2000a6_lexSpecialis c)
    (hSavings : SavingsHonored edge_2000a6_savings_otherLaw c)
    : Coherent2000a6 c :=
  { jurisdictionExists := hJurisdiction, exclusiveness := hExclusive,
    savings := hSavings }

end Proving.USC.T42.PublicAccommodations.Entitlement.Structure
