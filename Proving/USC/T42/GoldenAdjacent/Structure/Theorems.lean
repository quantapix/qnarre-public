







import Proving.USC.T42.GoldenAdjacent.Structure.Statute

namespace Proving.USC.T42.GoldenAdjacent.Structure

open Proving.USC.Common

theorem coherent1982_intro {c}
    (hHook : ReferencedSectionExists edge_1982_enforcedBy_1988b c)
    : Coherent1982 c := ⟨hHook⟩

theorem coherent1988a_intro {c}
    (hJur : IncorporationHonored edge_1988a_incorporates_rs c)
    (hSav : ReferencedSectionExists edge_1988a_savings_stateLaw c)
    : Coherent1988a c := ⟨hJur, hSav⟩

theorem coherent1988b_intro {c}
    (hEnum : EnforcementTargetEnumerated edge_1988b_target_1983 c)
    (hExists : ReferencedSectionExists edge_1988b_target_1983 c)
    (hExc : ExceptionApplies edge_1988b_except_judicialOfficer c)
    : Coherent1988b c := ⟨hEnum, hExists, hExc⟩

theorem coherent1988c_intro {c}
    (hRides : IncorporationHonored edge_1988c_subjectTo_1988b c)
    (hExists : ReferencedSectionExists edge_1988c_target_1981 c)
    : Coherent1988c c := ⟨hRides, hExists⟩

end Proving.USC.T42.GoldenAdjacent.Structure
