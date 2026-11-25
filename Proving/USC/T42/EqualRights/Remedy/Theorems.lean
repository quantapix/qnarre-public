






import Proving.USC.T42.EqualRights.Remedy.Types
import Proving.USC.T42.EqualRights.Remedy.Predicates
import Proving.USC.T42.EqualRights.Remedy.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

namespace Proving.USC.T42.EqualRights.Remedy

open Proving.USC.Common


theorem standing1981_intro {p c}
    (hPR : HasPrivateRightOfAction p c) (hInj : InjuryCognizable p c)
    (hCaus : CausedByViolation p c) (hRed : ReliefRedressable p c) :
    Standing1981 p c :=
  ⟨hPR, hInj, hCaus, hRed⟩


theorem remedyAvailable1981_intro {p c}
    (hStanding : Standing1981 p c) : RemedyAvailable1981 p c :=
  ⟨hStanding⟩


theorem standing1982_intro {p c}
    (hPR : HasPrivateRightOfAction p c) (hInj : InjuryCognizable p c)
    (hCaus : CausedByViolation p c) (hRed : ReliefRedressable p c) :
    Standing1982 p c :=
  ⟨hPR, hInj, hCaus, hRed⟩


theorem remedyAvailable1982_intro {p c}
    (hStanding : Standing1982 p c) : RemedyAvailable1982 p c :=
  ⟨hStanding⟩


theorem compensatoryAvailable1981a_intro {p c}
    (hGate : Section1981aGatewayMet p c) (hInj : InjuryCognizable p c)
    (hCaus : CausedByViolation p c) (hRed : ReliefRedressable p c) :
    CompensatoryAvailable1981a p c :=
  ⟨hGate, hInj, hCaus, hRed⟩


theorem punitiveAvailable1981a_intro {p c}
    (hComp : CompensatoryAvailable1981a p c) (hCulp : PunitiveEligible p c)
    (hNotGov : RespondentNotGovernment p c) : PunitiveAvailable1981a p c :=
  ⟨hComp, hCulp, hNotGov⟩


theorem remedyAvailable1981a_intro {p c}
    (hComp : CompensatoryAvailable1981a p c) : RemedyAvailable1981a p c :=
  .compensatory hComp

end Proving.USC.T42.EqualRights.Remedy
