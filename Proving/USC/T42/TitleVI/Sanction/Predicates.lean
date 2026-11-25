import Proving.USC.Common.Types
import Proving.USC.T42.TitleVI.Sanction.Types














namespace Proving.USC.T42.TitleVI.Sanction

open Proving.USC.Common




axiom SanctionSought (s : Sanction) (c : ComplaintText) : Prop




axiom ExpressFindingOnRecord (c : ComplaintText) : Prop




axiom VoluntaryComplianceFailed (c : ComplaintText) : Prop





axiom ReportedToCongress (c : ComplaintText) : Prop




axiom ThirtyDayLayoverElapsed (c : ComplaintText) : Prop





axiom DefendantIsState (p : Person) (c : ComplaintText) : Prop




axiom ViolationAfterEffectiveDate (c : ComplaintText) : Prop

end Proving.USC.T42.TitleVI.Sanction
