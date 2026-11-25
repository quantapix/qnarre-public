





import Proving.USC.Common.Types
import Proving.USC.T18.Ch113.Counterfeiting.Procedure.Predicates
import Proving.USC.T18.Ch113.Counterfeiting.Procedure.Statute

namespace Proving.USC.T18.Ch113.Counterfeiting.Procedure

open Proving.USC.Common



theorem timelyCivilAction2318_intro {p c}
    (hAcc : ClaimAccrued2318 p c) (hCom : CivilActionCommenced2318 p c)
    (hWin : WithinThreeYearWindow2318 p c) : TimelyCivilAction2318 p c :=
  ⟨hAcc, hCom, hWin⟩



theorem statutoryDamagesElection2318_intro {p c}
    (hTimely : TimelyCivilAction2318 p c)
    (hElect : StatutoryDamagesElectionTimely2318 p c) :
    StatutoryDamagesElection2318 p c :=
  ⟨hTimely, hElect⟩



theorem trebleDamagesEligible2318_intro {p c}
    (hTimely : TimelyCivilAction2318 p c)
    (hSub : EnhancedDamagesWindowMet2318 p c) :
    TrebleDamagesEligible2318 p c :=
  ⟨hTimely, hSub⟩


theorem presentenceVictimStatement2319_intro {p c}
    (hStage : DuringPresentenceReport2319 c)
    (hRecv : VictimImpactStatementReceived2319 p c) :
    PresentenceVictimStatement2319 p c :=
  ⟨hStage, hRecv⟩


theorem presentenceVictimStatement2320_intro {p c}
    (hStage : DuringPresentenceReport2320 c)
    (hRecv : VictimImpactStatementReceived2320 p c) :
    PresentenceVictimStatement2320 p c :=
  ⟨hStage, hRecv⟩



theorem timelyAnnualReport2320_intro {c}
    (hFiled : AttorneyGeneralAnnualReportFiled2320 c)
    (hWin : WithinReportingYear2320 c) :
    TimelyAnnualReport2320 c :=
  ⟨hFiled, hWin⟩

end Proving.USC.T18.Ch113.Counterfeiting.Procedure
