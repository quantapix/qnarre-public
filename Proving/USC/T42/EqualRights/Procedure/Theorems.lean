







import Proving.USC.T42.EqualRights.Procedure.Types
import Proving.USC.T42.EqualRights.Procedure.Predicates
import Proving.USC.T42.EqualRights.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.EqualRights.Procedure

open Proving.USC.Common



theorem timelyEqualRightsFiling_intro {p c}
    (hAcc : ClaimAccrued p c) (hFiled : ComplaintFiled p c)
    (hWin : WithinLimitationsWindow p c) : TimelyEqualRightsFiling p c :=
  ⟨hAcc, hFiled, hWin⟩



theorem section1981aGateway_intro {p a c}
    (hUnder : BroughtUnderTitleVII p a c) (hExh : ExhaustedTitleVII p a c)
    (hNo1981 : CannotRecoverUnder1981 p a c) : Section1981aGateway p a c :=
  ⟨hUnder, hExh, hNo1981⟩



theorem section1981aJuryProcedure_intro {p a c}
    (hGate : Section1981aGateway p a c) (hDemand : JuryTrialDemanded p a c)
    : Section1981aJuryProcedure p a c :=
  ⟨hGate, hDemand⟩


theorem reachesFiled_viaEqualRights_intro {p c}
    (h : TimelyEqualRightsFiling p c) : ReachesFiled p c :=
  ReachesFiled.viaEqualRights h


theorem reachesFiled_viaDamages_intro {p c} (a : DamagesAction)
    (hGate : Section1981aGateway p a c) (hFiled : ComplaintFiled p c)
    (hWin : WithinLimitationsWindow p c) : ReachesFiled p c :=
  ReachesFiled.viaDamages a hGate hFiled hWin

end Proving.USC.T42.EqualRights.Procedure
