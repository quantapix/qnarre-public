








import Proving.USC.T42.EqualRights.Structure.Statute
import Proving.USC.T42.EqualRights.Structure.Predicates
import Proving.USC.T42.EqualRights.Structure.Types
import Proving.USC.Common.Types

namespace Proving.USC.T42.EqualRights.Structure

open Proving.USC.Common

theorem coherent1981_intro {c}
    (hInc : IncorporationHonored edge_1981a_incorporates_1981b c)
    (hExists : ReferencedSectionExists edge_1981a_incorporates_1981b c)
    : Coherent1981 c :=
  ⟨hInc, hExists⟩

theorem coherent1982_intro : Coherent1982 :=
  ⟨trivial⟩

theorem coherent1981a_intro {c}
    (hProc : IncorporationHonored edge_1981a_incorporates_2000e5 c)
    (hProcExists : ReferencedSectionExists edge_1981a_incorporates_2000e5 c)
    (hProhib : IncorporationHonored edge_1981a_incorporates_2000e2 c)
    (hPriority : ExceptionApplies edge_1981a_subjectTo_1981 c)
    (hCarve : OverrideTriggered edge_1981a_subjectTo_2000e5g c)
    (hSaved : SavingsRespected edge_1981a_savings_1981 c)
    : Coherent1981a c :=
  ⟨hProc, hProcExists, hProhib, hPriority, hCarve, hSaved⟩

end Proving.USC.T42.EqualRights.Structure
