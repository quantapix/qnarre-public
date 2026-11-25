










import Proving.USC.T18.CommercePredicates.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.CommercePredicates.Structure

open Proving.USC.Common


theorem coherent1958_intro {c : ComplaintText}
    (hDefs : IncorporationHonored edge_1958_incorporates_1959 c)
    (hExt  : ReferencedSectionExists edge_1958_incorporates_stateOrUSLaw c)
    (hFine : ReferencedSectionExists edge_1958_incorporates_3571 c)
    : Coherent1958 c :=
  { defsShared1959 := hDefs, externalLawExists := hExt, fineScheduleExists := hFine }


theorem coherent1960_intro {c : ComplaintText}
    (hReg  : IncorporationHonored edge_1960_incorporates_t31_5330 c)
    (hState : ReferencedSectionExists edge_1960_incorporates_stateLaw c)
    (hFine : ReferencedSectionExists edge_1960_incorporates_3571 c)
    : Coherent1960 c :=
  { t31RegHonored := hReg, stateLawExists := hState, fineScheduleExists := hFine }

end Proving.USC.T18.CommercePredicates.Structure
