






import Proving.USC.T42.ReligiousFreedom.Procedure.Statute

namespace Proving.USC.T42.ReligiousFreedom.Procedure

open Proving.USC.Common



theorem validlyAdoptedRegulation_intro {r c}
    (hProp : RegulationProposed r c)
    (hCons : ConsultationHeld r c)
    (hRfra : RfraBalanceSurvived r c) :
    ValidlyAdoptedRegulation r c :=
  ⟨hProp, hCons, hRfra⟩




theorem policyGovernedAct_intro {d c}
    (hDay : PolicyActEpochDay d c)
    (hWin : ActOnOrAfterPolicyEffective d) :
    PolicyGovernedAct d c :=
  ⟨hDay, hWin⟩


theorem placementViolationRouted_intro {p c}
    (hProc : InPlacementProcess p c)
    (hNon  : PlacementNoncomplianceOccurred p c) :
    PlacementViolationRouted p c :=
  ⟨hProc, hNon⟩

end Proving.USC.T42.ReligiousFreedom.Procedure
