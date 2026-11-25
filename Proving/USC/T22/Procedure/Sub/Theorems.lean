






import Proving.USC.T22.Procedure.Sub.Types
import Proving.USC.T22.Procedure.Sub.Predicates
import Proving.USC.T22.Procedure.Sub.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T22.Procedure.Sub

open Proving.USC.Common


theorem apparatusConstituted_intro {c}
    (hTF : TaskForceEstablished c) (hOff : OfficeEstablished c)
    (hOG : OperatingGroupEstablished c) : ApparatusConstituted c :=
  ⟨hTF, hOff, hOG⟩


theorem directorSeated_intro {p c}
    (hOff : OfficeEstablished c) (hConf : DirectorConfirmedBySenate p c)
    : DirectorSeated p c :=
  ⟨hOff, hConf⟩


theorem timelyRegulations_intro {c}
    (hProm : RegulationsPromulgated c) (hWin : WithinNinetyDayWindow c)
    : TimelyRegulations c :=
  ⟨hProm, hWin⟩


theorem timelyAnnualReport_intro {c}
    (hSub : AnnualReportSubmitted c) (hWin : WithinAnnualReportWindow c)
    : TimelyAnnualReport c :=
  ⟨hSub, hWin⟩


theorem regionalGoalsFiled_intro {c}
    (hSub : RegionalGoalsSubmitted c) : RegionalGoalsFiled c :=
  ⟨hSub⟩


theorem dataNonresponsePresumption_intro {p c}
    (hReq : DataRequestIssued p c) (hNot : ¬ DataProvided p c)
    : DataNonresponsePresumption p c :=
  ⟨hReq, hNot⟩

end Proving.USC.T22.Procedure.Sub
