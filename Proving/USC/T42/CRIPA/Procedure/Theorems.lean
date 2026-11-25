








import Proving.USC.T42.CRIPA.Procedure.Types
import Proving.USC.T42.CRIPA.Procedure.Predicates
import Proving.USC.T42.CRIPA.Procedure.Statute

namespace Proving.USC.T42.CRIPA.Procedure

open Proving.USC.Common




theorem timelyCertification_intro {i a c}
    (hCause : HasReasonableCause i c)
    (hNotice : PreActionNoticeGiven i c)
    (h49 : Within49DayNoticeWindow i c)
    (h7 : Within7DayInvestigationNoticeWindow i c)
    (hCert : CertificationMadeAndSigned a c) :
    TimelyCertification i a c :=
  ⟨hCause, hNotice, h49, h7, hCert⟩



theorem validCommencement_intro {i a c}
    (hCert : TimelyCertification i a c)
    (hFiled : ComplaintFiled a c)
    (hSigned : AGPersonallySignedComplaint a c) :
    ValidCommencement i a c :=
  ⟨hCert, hFiled, hSigned⟩



theorem timelyIntervention_intro {a c}
    (hHost : HostActionCommenced a c)
    (hMotion : MotionToInterveneFiled a c)
    (hAfter90 : After90DayInterventionWindow a c)
    (hCertSigned : InterventionCertificationSigned a c) :
    TimelyIntervention a c :=
  ⟨hHost, hMotion, hAfter90, hCertSigned⟩



theorem validSubpoenaEnforcement_intro {s c}
    (hIssued : SubpoenaIssued s c)
    (hOrder : ComplianceOrderIssued s c) :
    ValidSubpoenaEnforcement s c :=
  ⟨hIssued, hOrder⟩




theorem maintainablePrisonerSuit_intro {a c}
    (hBrought : PrisonerActionBrought a c)
    (hExhausted : AdministrativeRemediesExhausted a c)
    (hPhys : PhysicalInjuryPrerequisiteMet a c)
    (hSurvives : SurvivesScreeningDismissal a c) :
    MaintainablePrisonerSuit a c :=
  ⟨hBrought, hExhausted, hPhys, hSurvives⟩



theorem filed_reachable {i a c}
    (hCommence : ValidCommencement i a c) :
    Reachable i a c State.Filed :=
  Reachable.file hCommence

end Proving.USC.T42.CRIPA.Procedure
