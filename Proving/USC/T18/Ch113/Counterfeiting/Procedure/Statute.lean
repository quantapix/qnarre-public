









import Proving.USC.Common.Types
import Proving.USC.T18.Ch113.Counterfeiting.Procedure.Types
import Proving.USC.T18.Ch113.Counterfeiting.Procedure.Predicates

namespace Proving.USC.T18.Ch113.Counterfeiting.Procedure

open Proving.USC.Common



structure GuardedTransition where
  src   : CivilActionState
  dst   : CivilActionState
  guard : Prop






structure TimelyCivilAction2318 (p : Person) (c : ComplaintText) : Prop where
  accrued   : ClaimAccrued2318 p c
  commenced : CivilActionCommenced2318 p c
  inWindow  : WithinThreeYearWindow2318 p c




structure StatutoryDamagesElection2318 (p : Person) (c : ComplaintText) : Prop where
  timely   : TimelyCivilAction2318 p c
  election : StatutoryDamagesElectionTimely2318 p c




structure TrebleDamagesEligible2318 (p : Person) (c : ComplaintText) : Prop where
  timely     : TimelyCivilAction2318 p c
  subsequent : EnhancedDamagesWindowMet2318 p c





structure PresentenceVictimStatement2319 (p : Person) (c : ComplaintText) : Prop where
  duringReport : DuringPresentenceReport2319 c
  received     : VictimImpactStatementReceived2319 p c



structure PresentenceVictimStatement2320 (p : Person) (c : ComplaintText) : Prop where
  duringReport : DuringPresentenceReport2320 c
  received     : VictimImpactStatementReceived2320 p c





structure TimelyAnnualReport2320 (c : ComplaintText) : Prop where
  filed      : AttorneyGeneralAnnualReportFiled2320 c
  withinYear : WithinReportingYear2320 c






inductive ChapterProcedureCompleted (p : Person) (c : ComplaintText) : Prop
  | civilAction    : TimelyCivilAction2318 p c → ChapterProcedureCompleted p c
  | sentencing2319 : PresentenceVictimStatement2319 p c → ChapterProcedureCompleted p c
  | sentencing2320 : PresentenceVictimStatement2320 p c → ChapterProcedureCompleted p c
  | annualReport   : TimelyAnnualReport2320 c → ChapterProcedureCompleted p c

end Proving.USC.T18.Ch113.Counterfeiting.Procedure
