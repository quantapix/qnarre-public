









import Proving.USC.T22.Procedure.Sub.Types
import Proving.USC.T22.Procedure.Sub.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T22.Procedure.Sub

open Proving.USC.Common





def WithinNinetyDayWindow (c : ComplaintText) : Prop :=
  RegulationsPromulgationDelayDays c ≤ 90



def WithinAnnualReportWindow (c : ComplaintText) : Prop :=
  AnnualReportSubmissionDayOfYear c ≤ 121






structure ApparatusConstituted (c : ComplaintText) : Prop where
  taskForce      : TaskForceEstablished c
  office         : OfficeEstablished c
  operatingGroup : OperatingGroupEstablished c



structure DirectorSeated (p : Person) (c : ComplaintText) : Prop where
  office    : OfficeEstablished c
  confirmed : DirectorConfirmedBySenate p c



structure TimelyRegulations (c : ComplaintText) : Prop where
  promulgated : RegulationsPromulgated c
  inWindow    : WithinNinetyDayWindow c



structure TimelyAnnualReport (c : ComplaintText) : Prop where
  submitted : AnnualReportSubmitted c
  inWindow  : WithinAnnualReportWindow c



structure RegionalGoalsFiled (c : ComplaintText) : Prop where
  submitted : RegionalGoalsSubmitted c





structure DataNonresponsePresumption (p : Person) (c : ComplaintText) : Prop where
  requested   : DataRequestIssued p c
  notProvided : ¬ DataProvided p c

end Proving.USC.T22.Procedure.Sub
