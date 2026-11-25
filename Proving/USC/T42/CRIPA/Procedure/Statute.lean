













import Proving.USC.T42.CRIPA.Procedure.Types
import Proving.USC.T42.CRIPA.Procedure.Predicates

namespace Proving.USC.T42.CRIPA.Procedure

open Proving.USC.Common



structure Transition where
  src   : State
  dst   : State
  guard : Prop






structure TimelyCertification (i : Institution) (a : Action) (c : ComplaintText) : Prop where
  cause       : HasReasonableCause i c
  notice      : PreActionNoticeGiven i c
  in49        : Within49DayNoticeWindow i c
  in7         : Within7DayInvestigationNoticeWindow i c
  certSigned  : CertificationMadeAndSigned a c





structure ValidCommencement (i : Institution) (a : Action) (c : ComplaintText) : Prop where
  certified   : TimelyCertification i a c
  filed       : ComplaintFiled a c
  agSigned    : AGPersonallySignedComplaint a c






structure TimelyIntervention (a : Action) (c : ComplaintText) : Prop where
  host        : HostActionCommenced a c
  motion      : MotionToInterveneFiled a c
  after90     : After90DayInterventionWindow a c
  certSigned  : InterventionCertificationSigned a c





structure ValidSubpoenaEnforcement (s : Subpoena) (c : ComplaintText) : Prop where
  issued      : SubpoenaIssued s c
  order       : ComplianceOrderIssued s c





structure MaintainablePrisonerSuit (a : Action) (c : ComplaintText) : Prop where
  brought     : PrisonerActionBrought a c
  exhausted   : AdministrativeRemediesExhausted a c
  physInjury  : PhysicalInjuryPrerequisiteMet a c
  survives    : SurvivesScreeningDismissal a c





inductive Reachable (i : Institution) (a : Action) (c : ComplaintText) : State → Prop

  | start (h : HasReasonableCause i c) : Reachable i a c State.ReasonableCause

  | certify (h : TimelyCertification i a c) :
      Reachable i a c State.Certified

  | file (h : ValidCommencement i a c) :
      Reachable i a c State.Filed

end Proving.USC.T42.CRIPA.Procedure
