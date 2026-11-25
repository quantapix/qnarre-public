
















import Proving.USC.T42.CRIPA.Procedure.Types

namespace Proving.USC.T42.CRIPA.Procedure

open Proving.USC.Common






axiom HasReasonableCause (i : Institution) (c : ComplaintText) : Prop




axiom ComplaintFiled (a : Action) (c : ComplaintText) : Prop




axiom AGPersonallySignedComplaint (a : Action) (c : ComplaintText) : Prop







axiom PreActionNoticeGiven (i : Institution) (c : ComplaintText) : Prop





axiom Within49DayNoticeWindow (i : Institution) (c : ComplaintText) : Prop





axiom Within7DayInvestigationNoticeWindow (i : Institution) (c : ComplaintText) : Prop





axiom CertificationMadeAndSigned (a : Action) (c : ComplaintText) : Prop







axiom FederalDepartmentNoticeGiven (i : Institution) (c : ComplaintText) : Prop







axiom HostActionCommenced (a : Action) (c : ComplaintText) : Prop



axiom MotionToInterveneFiled (a : Action) (c : ComplaintText) : Prop





axiom After90DayInterventionWindow (a : Action) (c : ComplaintText) : Prop






axiom InterventionCertificationSigned (a : Action) (c : ComplaintText) : Prop






axiom SubpoenaIssued (s : Subpoena) (c : ComplaintText) : Prop





axiom ComplianceOrderIssued (s : Subpoena) (c : ComplaintText) : Prop






axiom PrisonerActionBrought (a : Action) (c : ComplaintText) : Prop





axiom AdministrativeRemediesExhausted (a : Action) (c : ComplaintText) : Prop





axiom PhysicalInjuryPrerequisiteMet (a : Action) (c : ComplaintText) : Prop






axiom SurvivesScreeningDismissal (a : Action) (c : ComplaintText) : Prop

end Proving.USC.T42.CRIPA.Procedure
