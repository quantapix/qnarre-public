import Proving.USC.Common.Types
import Proving.USC.T42.TitleVI.Sanction.Types
import Proving.USC.T42.TitleVI.Sanction.Predicates
import Proving.USC.T42.TitleVI.Sanction.Statute








namespace Proving.USC.T42.TitleVI.Sanction

open Proving.USC.Common




def sanction2000d1_intro {c : ComplaintText} (s : Sanction)
    (hH : WithinRange s TerminationOfAssistance2000d1)
    (hP : SanctionSought s c)
    (hF : ExpressFindingOnRecord c)
    (hV : VoluntaryComplianceFailed c)
    (hR : ReportedToCongress c)
    (hL : ThirtyDayLayoverElapsed c) :
    Sanction2000d1 c :=
  ⟨s, hH, hP, hF, hV, hR, hL⟩



def sanction2000d7_intro {p : Person} {c : ComplaintText} (s : Sanction)
    (hH : WithinRange s RemediesParity2000d7)
    (hP : SanctionSought s c)
    (hS : DefendantIsState p c)
    (hT : ViolationAfterEffectiveDate c) :
    Sanction2000d7 p c :=
  ⟨s, hH, hP, hS, hT⟩

end Proving.USC.T42.TitleVI.Sanction
