import Proving.USC.T18.Ch113.Reslice.Structure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false








namespace Proving.USC.T18.Ch113.Reslice.Structure

open Proving.USC.Common


theorem coherent2315_intro {c : ComplaintText}
    (hMed : IncorporationHonored edge_2315_incorporates_670 c)
    (hPath : Punishment2315Path c)
    : Coherent2315 c :=
  { medProductDefHonored := hMed, punishmentPath := hPath }


theorem coherent2318_intro {c : ComplaintText}
    (hTraffic : IncorporationHonored edge_2318_incorporates_2320f c)
    (hCopyright : IncorporationHonored edge_2318_incorporates_t17s101 c)
    (hAircraft : IncorporationHonored edge_2318_incorporates_t49s46501 c)
    (hForfeiture : ReferencedSectionExists edge_2318_subjectTo_2323 c)
    (hSavings : ExceptionApplies edge_2318_savings_otherLaw c)
    : Coherent2318 c :=
  { trafficDefHonored := hTraffic
    copyrightDefsHonored := hCopyright
    aircraftJurisHonored := hAircraft
    forfeitureRegimeExists := hForfeiture
    savingsHonored := hSavings }


theorem coherent2320_intro {c : ComplaintText}
    (hForfeiture : ReferencedSectionExists edge_2320_subjectTo_2323 c)
    (hSavings : ExceptionApplies edge_2320_savings_otherLaw c)
    (hLanham : IncorporationHonored edge_2320_incorporates_t15s1051 c)
    (hLanham42 : IncorporationHonored edge_2320_incorporates_t15s1124 c)
    (hT36 : IncorporationHonored edge_2320_incorporates_t36s220506 c)
    (hFdca : IncorporationHonored edge_2320_incorporates_t21s321 c)
    (hReport : ReferencedSectionExists edge_2320_incorporates_t28s522 c)
    (hSibling : IncorporationHonored edge_2320_incorporates_2318 c)
    : Coherent2320 c :=
  { forfeitureRegimeExists := hForfeiture
    savingsHonored := hSavings
    lanhamActHonored := hLanham
    lanham42Honored := hLanham42
    t36DesignationHonored := hT36
    fdcaDrugHonored := hFdca
    agReportExists := hReport
    sibling2318Honored := hSibling }

end Proving.USC.T18.Ch113.Reslice.Structure
