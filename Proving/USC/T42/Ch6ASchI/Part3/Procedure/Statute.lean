












import Proving.USC.T42.Ch6ASchI.Part3.Procedure.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.Ch6ASchI.Part3.Procedure

open Proving.USC.Common





def Sec233ProcessDeliveredWithinAGTime (c : ComplaintText) : Prop :=
  Sec233ProcessDeliveryDay c ≤ Sec233ProcessDeliveryDeadlineDay c



def Sec233DeemingDeterminationWithin30Days (c : ComplaintText) : Prop :=
  Sec233DeemDeterminationDay c ≤ Sec233DeemApplicationReceiptDay c + 30



def Sec233AGAppearedWithin15Days (c : ComplaintText) : Prop :=
  Sec233AGAppearanceDay c ≤ Sec233AGNotificationDay c + 15



def Sec233SecretaryFailedWithin240Days (c : ComplaintText) : Prop :=
  Sec233BenefitRequestFiledDay c + 240 < Sec233FinalDeterminationDay c



def Sec218AppointedWithin120Days (c : ComplaintText) : Prop :=
  Sec218CouncilAppointmentDay c ≤ Sec218AppointmentTriggerDay c + 120



def Sec218aExceededThirtyDays (c : ComplaintText) : Prop :=
  30 < Sec218aTrainingDurationDays c




noncomputable def Sec218aObligationWindowDays (c : ComplaintText) : Nat :=
  max 180 (2 * Sec218aTrainingDurationDays c)



def Sec218aLeftWithinObligation (c : ComplaintText) : Prop :=
  Sec218aSeparationDay c ≤ Sec218aReturnToActiveDay c + Sec218aObligationWindowDays c



def Sec234WithinNinetyDayInitialPeriod (c : ComplaintText) : Prop :=
  Sec234DeterminationStartDay c ≤ Sec234ResponseDay c ∧
  Sec234ResponseDay c ≤ Sec234DeterminationStartDay c + 90



def Sec234ActOnOrAfterEffectiveDate (c : ComplaintText) : Prop :=
  Sec234EffectiveDay c ≤ Sec234ActDay c


def Sec236AnnualReportTimely (c : ComplaintText) : Prop :=
  Sec236AnnualReportSubmissionDay c ≤ Sec236AnnualReportDeadlineDay c



def Sec237aReportTimely (c : ComplaintText) : Prop :=
  Sec237aReportSubmissionDay c ≤ Sec237aReportDeadlineDay c


def Sec238hBiennialReportTimely (c : ComplaintText) : Prop :=
  Sec238hBiennialReportSubmissionDay c ≤ Sec238hBiennialReportDeadlineDay c



def Sec238jEvaluationReportTimely (c : ComplaintText) : Prop :=
  Sec238jEvaluationReportSubmissionDay c ≤ Sec238jEvaluationReportDeadlineDay c



def Sec237ExceptedAppointmentWithinCap (c : ComplaintText) : Prop :=
  Sec237AppointmentDurationDays c ≤ 730



def Sec238lWithinTwentyYears (c : ComplaintText) : Prop :=
  Sec238lTriggeringEventDay c ≤ Sec238lCompletionDay c + 7300



noncomputable def Sec238lNoticeDeadlineDay (c : ComplaintText) : Nat :=
  max (Sec238lTriggeringEventDay c + 10) (Sec238lStatutoryNoticeFloorDay c)



def Sec238lNoticeTimely (c : ComplaintText) : Prop :=
  Sec238lNoticeDay c ≤ Sec238lNoticeDeadlineDay c






structure Sec233TimelyRemovalAndSubstitution (c : ComplaintText) : Prop where
  delivered      : ProcessDelivered c
  deliveryTimely : Sec233ProcessDeliveredWithinAGTime c
  certified      : AGCertifiedScopeOfEmployment c
  removed        : RemovedBeforeTrial c



structure Sec233DeemingDetermination (c : ComplaintText) : Prop where
  submitted : Sec233DeemApplicationSubmitted c
  timely    : Sec233DeemingDeterminationWithin30Days c




inductive Sec233ExhaustionSatisfied (c : ComplaintText) : Prop
  | exhausted (h : AdminRemediesExhausted c)
  | secretaryDefaulted (h : Sec233SecretaryFailedWithin240Days c)


structure Sec218TimelyCouncilAppointment (c : ComplaintText) : Prop where
  appointedTimely : Sec218AppointedWithin120Days c




structure Sec218aRepaymentObligationTriggered (c : ComplaintText) : Prop where
  exceeded : Sec218aExceededThirtyDays c
  left     : Sec218aVoluntarilyLeft c
  within   : Sec218aLeftWithinObligation c




structure Sec234ImmunityWindowSatisfied (c : ComplaintText) : Prop where
  responded     : Sec234WithinNinetyDayInitialPeriod c
  postEffective : Sec234ActOnOrAfterEffectiveDate c
  authorized    : Sec234AuthorizedByStateDeployment c
  scope         : Sec234WithinScopeOfLicense c




structure Sec238lRecoveryTriggered (c : ComplaintText) : Prop where
  disposition  : Sec238lRecoveryTriggeringDisposition c
  within20yr   : Sec238lWithinTwentyYears c
  noticeTimely : Sec238lNoticeTimely c

end Proving.USC.T42.Ch6ASchI.Part3.Procedure
