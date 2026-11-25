import Proving.USC.Common.Types
import Proving.USC.T42.TitleVI.Sanction.Types
import Proving.USC.T42.TitleVI.Sanction.Predicates














namespace Proving.USC.T42.TitleVI.Sanction

open Proving.USC.Common





def TerminationOfAssistance2000d1 : Sanction :=
  ⟨.Forfeiture, 0, .program, .Ceiling⟩





def RemediesParity2000d7 : Sanction :=
  ⟨.Penalty, 0, .recipient, .Exact⟩





def WithinRange (sought stat : Sanction) : Prop :=
  match stat.dir with
  | .Ceiling => sought.reach.rank ≤ stat.reach.rank ∧ sought.bound ≤ stat.bound
  | .Floor   => stat.reach.rank ≤ sought.reach.rank ∧ stat.bound ≤ sought.bound
  | .Exact   => sought.reach.rank = stat.reach.rank ∧ sought.bound = stat.bound






structure Sanction2000d1 (c : ComplaintText) where
  sought    : Sanction
  honours   : WithinRange sought TerminationOfAssistance2000d1
  pleaded   : SanctionSought sought c
  finding   : ExpressFindingOnRecord c
  voluntary : VoluntaryComplianceFailed c
  reported  : ReportedToCongress c
  layover   : ThirtyDayLayoverElapsed c




structure Sanction2000d7 (p : Person) (c : ComplaintText) where
  sought  : Sanction
  honours : WithinRange sought RemediesParity2000d7
  pleaded : SanctionSought sought c
  isState : DefendantIsState p c
  inTime  : ViolationAfterEffectiveDate c

end Proving.USC.T42.TitleVI.Sanction
