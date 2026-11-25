









import Proving.USC.T42.Ch6ASchI.Part3.Procedure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.Ch6ASchI.Part3.Procedure

open Proving.USC.Common



theorem sec233TimelyRemovalAndSubstitution_intro {c : ComplaintText}
    (hDel : ProcessDelivered c) (hDT : Sec233ProcessDeliveredWithinAGTime c)
    (hCert : AGCertifiedScopeOfEmployment c) (hRem : RemovedBeforeTrial c)
    : Sec233TimelyRemovalAndSubstitution c :=
  ⟨hDel, hDT, hCert, hRem⟩


theorem sec233DeemingDetermination_intro {c : ComplaintText}
    (hSub : Sec233DeemApplicationSubmitted c)
    (hT : Sec233DeemingDeterminationWithin30Days c)
    : Sec233DeemingDetermination c :=
  ⟨hSub, hT⟩


theorem sec233ExhaustionSatisfied_intro_exhausted {c : ComplaintText}
    (h : AdminRemediesExhausted c) : Sec233ExhaustionSatisfied c :=
  .exhausted h


theorem sec233ExhaustionSatisfied_intro_default {c : ComplaintText}
    (h : Sec233SecretaryFailedWithin240Days c) : Sec233ExhaustionSatisfied c :=
  .secretaryDefaulted h


theorem sec218TimelyCouncilAppointment_intro {c : ComplaintText}
    (h : Sec218AppointedWithin120Days c) : Sec218TimelyCouncilAppointment c :=
  ⟨h⟩


theorem sec218aRepaymentObligationTriggered_intro {c : ComplaintText}
    (hE : Sec218aExceededThirtyDays c) (hL : Sec218aVoluntarilyLeft c)
    (hW : Sec218aLeftWithinObligation c)
    : Sec218aRepaymentObligationTriggered c :=
  ⟨hE, hL, hW⟩


theorem sec234ImmunityWindowSatisfied_intro {c : ComplaintText}
    (hR : Sec234WithinNinetyDayInitialPeriod c)
    (hP : Sec234ActOnOrAfterEffectiveDate c)
    (hA : Sec234AuthorizedByStateDeployment c) (hS : Sec234WithinScopeOfLicense c)
    : Sec234ImmunityWindowSatisfied c :=
  ⟨hR, hP, hA, hS⟩


theorem sec238lRecoveryTriggered_intro {c : ComplaintText}
    (hD : Sec238lRecoveryTriggeringDisposition c) (hW : Sec238lWithinTwentyYears c)
    (hN : Sec238lNoticeTimely c) : Sec238lRecoveryTriggered c :=
  ⟨hD, hW, hN⟩

end Proving.USC.T42.Ch6ASchI.Part3.Procedure
