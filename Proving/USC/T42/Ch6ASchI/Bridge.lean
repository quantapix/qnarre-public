
































import Proving.USC.T42.Ch6ASchI.Elements.Statute
import Proving.USC.T42.Ch6ASchI.Deontic.Statute
import Proving.USC.T42.Ch6ASchI.Ontology.Statute
import Proving.USC.T42.Ch6ASchI.Procedure.Statute
import Proving.USC.T42.Ch6ASchI.Structure.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T42.Ch6ASchI.Bridge

open Proving.USC.Common










axiom e2oPayment201 : Elements.Payment → Ontology.Payment

axiom d2oPayment201 : Deontic.Payment → Ontology.Payment

axiom e2dPayment201 : Elements.Payment → Deontic.Payment


axiom corr201_eo {pay : Elements.Payment} {c : ComplaintText} :
    Elements.DescribedHemophiliaPayment pay c → Ontology.IsDescribedPayment (e2oPayment201 pay) c

axiom corr201_do {pay : Deontic.Payment} {c : ComplaintText} :
    Deontic.PaymentIsDescribed201 pay c → Ontology.IsDescribedPayment (d2oPayment201 pay) c

axiom corr201_ed {pay : Elements.Payment} {c : ComplaintText} :
    Elements.DescribedHemophiliaPayment pay c → Deontic.PaymentIsDescribed201 (e2dPayment201 pay) c



theorem s201_elements_implies_ontology {pay : Elements.Payment} {c : ComplaintText}
    (h : Elements.Section201Exclusion pay c) :
    Ontology.IsDescribedPayment (e2oPayment201 pay) c :=
  corr201_eo h.described



theorem s201_deontic_implies_ontology {pay : Deontic.Payment} {a : Deontic.Agency} {c : ComplaintText}
    (h : Deontic.Prohibition201Violated pay a c) :
    Ontology.IsDescribedPayment (d2oPayment201 pay) c :=
  corr201_do h.1.condition



theorem s201_elements_implies_deontic {pay : Elements.Payment} {c : ComplaintText}
    (h : Elements.Section201Exclusion pay c) :
    Deontic.PaymentIsDescribed201 (e2dPayment201 pay) c :=
  corr201_ed h.described







axiom e2pOfficer204 : Person → Procedure.Officer
axiom o2pOfficer204 : Person → Procedure.Officer


axiom corr204_eo_officer {p : Person} {c : ComplaintText} :
    Elements.AppointedByPresident p c → Ontology.IsCommissionedOfficer p c

axiom corr204_eo_citizen {p : Person} {c : ComplaintText} :
    Elements.IsUnitedStatesCitizen p c → Ontology.IsCitizenOfUS p c
axiom corr204_ep_appointed {p : Person} {c : ComplaintText} :
    Elements.AppointedByPresident p c → Procedure.AppointedByPresident (e2pOfficer204 p) c
axiom corr204_ep_citizen {p : Person} {c : ComplaintText} :
    Elements.IsUnitedStatesCitizen p c → Procedure.IsUnitedStatesCitizen (e2pOfficer204 p) c
axiom corr204_op_appointed {p : Person} {c : ComplaintText} :
    Ontology.IsCommissionedOfficer p c → Procedure.AppointedByPresident (o2pOfficer204 p) c
axiom corr204_op_citizen {p : Person} {c : ComplaintText} :
    Ontology.IsCitizenOfUS p c → Procedure.IsUnitedStatesCitizen (o2pOfficer204 p) c


theorem s204_elements_implies_ontology {p : Person} {c : ComplaintText}
    (h : Elements.Section204CommissionedOfficer p c) :
    Ontology.CommissionedOfficerQualification p c :=
  ⟨corr204_eo_officer h.appointed, corr204_eo_citizen h.citizen⟩


theorem s204_elements_implies_procedure {p : Person} {c : ComplaintText}
    (h : Elements.Section204CommissionedOfficer p c) :
    Procedure.ValidCommissionedAppointment (e2pOfficer204 p) c :=
  ⟨corr204_ep_appointed h.appointed, corr204_ep_citizen h.citizen⟩


theorem s204_ontology_implies_procedure {p : Person} {c : ComplaintText}
    (h : Ontology.CommissionedOfficerQualification p c) :
    Procedure.ValidCommissionedAppointment (o2pOfficer204 p) c :=
  ⟨corr204_op_appointed h.officer, corr204_op_citizen h.citizen⟩








axiom e2dOfficer204a : Person → Deontic.Officer
axiom p2dOfficer204a : Procedure.Officer → Deontic.Officer
axiom p2ePerson204a : Procedure.Officer → Person

axiom corr204a_ed_addressee {p : Person} {c : ComplaintText} :
    Elements.SubjectToReadinessRequirements p c → Deontic.AddresseeIsCorpsMember204a (e2dOfficer204a p) c
axiom corr204a_ed_notmeets {p : Person} {c : ComplaintText} :
    Elements.ReadinessDefault p c → ¬ Deontic.MeetsReadinessRequirements204a (e2dOfficer204a p) c
axiom corr204a_ed_nowaiver {p : Person} {c : ComplaintText} :
    (¬ Elements.ReadinessWaiverGranted p c) → ¬ Deontic.ReadinessWaiverGranted204a (e2dOfficer204a p) c

axiom corr204a_pd_addressee {o : Procedure.Officer} {c : ComplaintText} :
    Procedure.AnnualReadinessDeterminationMade o c → Deontic.AddresseeIsCorpsMember204a (p2dOfficer204a o) c
axiom corr204a_pd_notmeets {o : Procedure.Officer} {c : ComplaintText} :
    (¬ Procedure.MeetsReadinessRequirements o c) → ¬ Deontic.MeetsReadinessRequirements204a (p2dOfficer204a o) c
axiom corr204a_pd_nowaiver {o : Procedure.Officer} {c : ComplaintText} :
    (¬ Procedure.ReadinessWaiverGranted o c) → ¬ Deontic.ReadinessWaiverGranted204a (p2dOfficer204a o) c

axiom corr204a_pe_subject {o : Procedure.Officer} {c : ComplaintText} :
    Procedure.AnnualReadinessDeterminationMade o c → Elements.SubjectToReadinessRequirements (p2ePerson204a o) c
axiom corr204a_pe_failed {o : Procedure.Officer} {c : ComplaintText} :
    (¬ Procedure.MeetsReadinessRequirements o c) → Elements.FailedReadinessRequirements (p2ePerson204a o) c
axiom corr204a_pe_nowaiver {o : Procedure.Officer} {c : ComplaintText} :
    (¬ Procedure.ReadinessWaiverGranted o c) → ¬ Elements.ReadinessWaiverGranted (p2ePerson204a o) c


theorem s204a_elements_implies_deontic {p : Person} {c : ComplaintText}
    (h : Elements.Section204aDisciplinaryAction p c) :
    Deontic.Obligation204aReadinessMemberBreached (e2dOfficer204a p) c :=
  ⟨corr204a_ed_addressee h.subject, corr204a_ed_notmeets h.ground, corr204a_ed_nowaiver h.noWaiver⟩


theorem s204a_procedure_implies_deontic {o : Procedure.Officer} {c : ComplaintText}
    (h : Procedure.ReadinessDisciplineTrigger o c) :
    Deontic.Obligation204aReadinessMemberBreached (p2dOfficer204a o) c :=
  ⟨corr204a_pd_addressee h.determined, corr204a_pd_notmeets h.notCompliant, corr204a_pd_nowaiver h.notWaived⟩




theorem s204a_procedure_implies_elements {o : Procedure.Officer} {c : ComplaintText}
    (h : Procedure.ReadinessDisciplineTrigger o c) :
    Elements.Section204aDisciplinaryAction (p2ePerson204a o) c :=
  ⟨corr204a_pe_subject h.determined,
   .failedReadiness (corr204a_pe_failed h.notCompliant),
   corr204a_pe_nowaiver h.notWaived⟩







axiom e2pOfficer205 : Person → Procedure.Officer
axiom p2oPerson205 : Procedure.Officer → Person

axiom corr205_eo_regular {p : Person} {c : ComplaintText} :
    Elements.IsMemberOfRegularCorps p c → Ontology.IsMemberOfRegularCorps p c
axiom corr205_eo_training {p : Person} {c : ComplaintText} :
    Elements.HasPublicHealthTrainingOrExperience p c → Ontology.HasPublicHealthTrainingOrExperience p c
axiom corr205_ep_regular {p : Person} {c : ComplaintText} :
    Elements.IsMemberOfRegularCorps p c → Procedure.IsRegularCorpsMember (e2pOfficer205 p) c
axiom corr205_ep_qualified {p : Person} {c : ComplaintText} :
    Elements.HasPublicHealthTrainingOrExperience p c → Procedure.HasSpecializedPublicHealthTraining (e2pOfficer205 p) c
axiom corr205_ep_appointed {p : Person} {c : ComplaintText} :
    Elements.AppointedByPresidentWithSenateConsent p c → Procedure.AppointedSurgeonGeneral (e2pOfficer205 p) c
axiom corr205_po_regular {o : Procedure.Officer} {c : ComplaintText} :
    Procedure.IsRegularCorpsMember o c → Ontology.IsMemberOfRegularCorps (p2oPerson205 o) c
axiom corr205_po_training {o : Procedure.Officer} {c : ComplaintText} :
    Procedure.HasSpecializedPublicHealthTraining o c → Ontology.HasPublicHealthTrainingOrExperience (p2oPerson205 o) c


theorem s205_elements_implies_ontology {p : Person} {c : ComplaintText}
    (h : Elements.Section205SurgeonGeneralEligibility p c) :
    Ontology.SurgeonGeneralEligibility p c :=
  ⟨corr205_eo_regular h.regularCorps, corr205_eo_training h.training⟩


theorem s205_elements_implies_procedure {p : Person} {c : ComplaintText}
    (h : Elements.Section205SurgeonGeneralEligibility p c) :
    Procedure.ValidSurgeonGeneralAppointment (e2pOfficer205 p) c :=
  ⟨corr205_ep_appointed h.appointed, corr205_ep_regular h.regularCorps, corr205_ep_qualified h.training⟩


theorem s205_procedure_implies_ontology {o : Procedure.Officer} {c : ComplaintText}
    (h : Procedure.ValidSurgeonGeneralAppointment o c) :
    Ontology.SurgeonGeneralEligibility (p2oPerson205 o) c :=
  ⟨corr205_po_regular h.regular, corr205_po_training h.qualified⟩







axiom e2pOfficer209d : Person → Procedure.Officer
axiom o2pOfficer209d : Person → Procedure.Officer

axiom corr209d_eo_grad {p : Person} {c : ComplaintText} :
    Elements.IsOsteopathyCollegeGraduate p c → Ontology.IsGraduateOfOsteopathyCollege p c
axiom corr209d_eo_majority {p : Person} {c : ComplaintText} :
    Elements.CollegeGraduatesEligibleForLicensureMajorityStates p c → Ontology.EligibleForLicensureInMajorityOfStates p c
axiom corr209d_eo_approved {p : Person} {c : ComplaintText} :
    Elements.CollegeApprovedByAcceptableBody p c → Ontology.ApprovedByAcceptableBody p c
axiom corr209d_ep_eligible {p : Person} {c : ComplaintText} :
    Elements.Section209dOsteopathEligibility p c → Procedure.IsEligibleOsteopathGraduate (e2pOfficer209d p) c
axiom corr209d_op_eligible {p : Person} {c : ComplaintText} :
    Ontology.OsteopathAppointmentEligibility p c → Procedure.IsEligibleOsteopathGraduate (o2pOfficer209d p) c




theorem s209d_elements_implies_ontology {p : Person} {c : ComplaintText}
    (h : Elements.Section209dOsteopathEligibility p c) :
    Ontology.OsteopathAppointmentEligibility p c :=
  match h.qualification with
  | .majorityStates hm => .viaMajorityStates (corr209d_eo_grad h.graduate) (corr209d_eo_majority hm)
  | .approvedBody ha => .viaApprovedBody (corr209d_eo_grad h.graduate) (corr209d_eo_approved ha)


theorem s209d_elements_implies_procedure {p : Person} {c : ComplaintText}
    (h : Elements.Section209dOsteopathEligibility p c) :
    Procedure.ValidOsteopathAppointmentEligibility (e2pOfficer209d p) c :=
  ⟨corr209d_ep_eligible h⟩


theorem s209d_ontology_implies_procedure {p : Person} {c : ComplaintText}
    (h : Ontology.OsteopathAppointmentEligibility p c) :
    Procedure.ValidOsteopathAppointmentEligibility (o2pOfficer209d p) c :=
  ⟨corr209d_op_eligible h⟩






def s201_tierA : Prop :=
  (∀ {pay c}, Elements.Section201Exclusion pay c → Ontology.IsDescribedPayment (e2oPayment201 pay) c)
  ∧ (∀ {pay a c}, Deontic.Prohibition201Violated pay a c → Ontology.IsDescribedPayment (d2oPayment201 pay) c)
  ∧ (∀ {pay c}, Elements.Section201Exclusion pay c → Deontic.PaymentIsDescribed201 (e2dPayment201 pay) c)
theorem s201_tierA_discharge : s201_tierA :=
  ⟨fun h => s201_elements_implies_ontology h,
   fun h => s201_deontic_implies_ontology h,
   fun h => s201_elements_implies_deontic h⟩

def s204_tierA : Prop :=
  (∀ {p c}, Elements.Section204CommissionedOfficer p c → Ontology.CommissionedOfficerQualification p c)
  ∧ (∀ {p c}, Elements.Section204CommissionedOfficer p c → Procedure.ValidCommissionedAppointment (e2pOfficer204 p) c)
  ∧ (∀ {p c}, Ontology.CommissionedOfficerQualification p c → Procedure.ValidCommissionedAppointment (o2pOfficer204 p) c)
theorem s204_tierA_discharge : s204_tierA :=
  ⟨fun h => s204_elements_implies_ontology h,
   fun h => s204_elements_implies_procedure h,
   fun h => s204_ontology_implies_procedure h⟩

def s204a_tierA : Prop :=
  (∀ {p c}, Elements.Section204aDisciplinaryAction p c → Deontic.Obligation204aReadinessMemberBreached (e2dOfficer204a p) c)
  ∧ (∀ {o c}, Procedure.ReadinessDisciplineTrigger o c → Deontic.Obligation204aReadinessMemberBreached (p2dOfficer204a o) c)
  ∧ (∀ {o c}, Procedure.ReadinessDisciplineTrigger o c → Elements.Section204aDisciplinaryAction (p2ePerson204a o) c)
theorem s204a_tierA_discharge : s204a_tierA :=
  ⟨fun h => s204a_elements_implies_deontic h,
   fun h => s204a_procedure_implies_deontic h,
   fun h => s204a_procedure_implies_elements h⟩

def s205_tierA : Prop :=
  (∀ {p c}, Elements.Section205SurgeonGeneralEligibility p c → Ontology.SurgeonGeneralEligibility p c)
  ∧ (∀ {p c}, Elements.Section205SurgeonGeneralEligibility p c → Procedure.ValidSurgeonGeneralAppointment (e2pOfficer205 p) c)
  ∧ (∀ {o c}, Procedure.ValidSurgeonGeneralAppointment o c → Ontology.SurgeonGeneralEligibility (p2oPerson205 o) c)
theorem s205_tierA_discharge : s205_tierA :=
  ⟨fun h => s205_elements_implies_ontology h,
   fun h => s205_elements_implies_procedure h,
   fun h => s205_procedure_implies_ontology h⟩

def s209d_tierA : Prop :=
  (∀ {p c}, Elements.Section209dOsteopathEligibility p c → Ontology.OsteopathAppointmentEligibility p c)
  ∧ (∀ {p c}, Elements.Section209dOsteopathEligibility p c → Procedure.ValidOsteopathAppointmentEligibility (e2pOfficer209d p) c)
  ∧ (∀ {p c}, Ontology.OsteopathAppointmentEligibility p c → Procedure.ValidOsteopathAppointmentEligibility (o2pOfficer209d p) c)
theorem s209d_tierA_discharge : s209d_tierA :=
  ⟨fun h => s209d_elements_implies_ontology h,
   fun h => s209d_elements_implies_procedure h,
   fun h => s209d_ontology_implies_procedure h⟩










axiom p2dAgency203 : Procedure.Division → Deontic.Agency
axiom corr203_pd_secretary {d : Procedure.Division} {c : ComplaintText} :
    Procedure.SecretaryApprovedDivisionChange d c → Deontic.AddresseeIsSecretary203 (p2dAgency203 d) c
axiom corr203_pd_assigned {d : Procedure.Division} {c : ComplaintText} :
    Procedure.DivisionChangeProposed d c → Deontic.AssignedOrEstablishedUnits203 (p2dAgency203 d) c
theorem s203_procedure_implies_deontic {d : Procedure.Division} {c : ComplaintText}
    (h : Procedure.ValidDivisionReorganization d c) :
    Deontic.Power203OrganizeExercised (p2dAgency203 d) c :=
  ⟨corr203_pd_secretary h.approved, corr203_pd_assigned h.proposed⟩


axiom p2dAgency206 : Procedure.Officer → Deontic.Agency
axiom corr206_pd_assigned {o : Procedure.Officer} {c : ComplaintText} :
    Procedure.DeputySurgeonGeneralAssigned o c → Deontic.AssignedDeputySurgeonGeneral206 (p2dAgency206 o) c
theorem s206_procedure_negates_deontic_breach {o : Procedure.Officer} {c : ComplaintText}
    (h : Procedure.ValidDeputySurgeonGeneralAssignment o c) :
    ¬ Deontic.Obligation206AssignDeputyBreached (p2dAgency206 o) c :=
  fun hB => hB.2 (corr206_pd_assigned h.assigned)


axiom asg207 : ComplaintText → Deontic.AssistantSurgeonGeneralGradeCount207
axiom corr207_higher {c : ComplaintText} :
    (asg207 c).higherGrade = Procedure.AsstSurgeonGeneralAboveBrigadierCount c
axiom corr207_positions {c : ComplaintText} :
    (asg207 c).positions = Procedure.Section206bPositionCount c
theorem s207_procedure_negates_deontic_violation {c : ComplaintText}
    (h : Procedure.ValidGradeStrengthRegulation c) :
    ¬ Deontic.Prohibition207AsgCapViolated (asg207 c) := by
  have hw : Procedure.AsstSurgeonGeneralAboveBrigadierCount c * 2 ≤ Procedure.Section206bPositionCount c :=
    h.withinHalf
  unfold Deontic.Prohibition207AsgCapViolated
  rw [corr207_higher, corr207_positions]
  omega


axiom e2pOfficer209 : Person → Procedure.Officer
axiom corr209_ep_appt {p : Person} {c : ComplaintText} :
    Elements.IsOriginalAppointmentToPermittedGrade p c → Procedure.OriginalAppointmentMade (e2pOfficer209 p) c
axiom corr209_ep_exam {p : Person} {c : ComplaintText} :
    Elements.PassedAppointmentExamination p c → Procedure.ExaminationPassed (e2pOfficer209 p) c
axiom corr209_ep_age {p : Person} {c : ComplaintText} :
    Elements.AgeAppointmentBarSatisfied p c → Procedure.AgeEligibleForAppointment (e2pOfficer209 p) c
theorem s209_elements_implies_procedure {p : Person} {c : ComplaintText}
    (h : Elements.Section209OriginalAppointment p c) :
    Procedure.ValidOriginalAppointment (e2pOfficer209 p) c :=
  ⟨corr209_ep_appt h.permittedGrade, corr209_ep_exam h.passedExam, corr209_ep_age h.ageBar⟩


axiom e2dOfficer210 : Person → Deontic.Officer
axiom corr210_ed_addressee {p : Person} {c : ComplaintText} :
    Elements.OfficerEntitledToPayAndAllowances p c → Deontic.AddresseeIsCommissionedOfficer210 (e2dOfficer210 p) c
axiom corr210_ed_entitled {p : Person} {c : ComplaintText} :
    Elements.OfficerEntitledToPayAndAllowances p c → Deontic.EntitledToPayAndAllowances210 (e2dOfficer210 p) c
theorem s210_elements_implies_deontic {p : Person} {c : ComplaintText}
    (h : Elements.Section210PayEntitlement p c) :
    Deontic.Permission210PayPermitted (e2dOfficer210 p) c :=
  ⟨corr210_ed_addressee h.entitled, corr210_ed_entitled h.entitled⟩


axiom p2dOfficer210_1 : Procedure.Officer → Deontic.Officer
axiom corr210_1_pd_addressee {o : Procedure.Officer} {c : ComplaintText} :
    Procedure.LeaveGranted o c → Deontic.AddresseeIsActiveDutyOfficer210_1 (p2dOfficer210_1 o) c
axiom corr210_1_pd_granted {o : Procedure.Officer} {c : ComplaintText} :
    Procedure.LeaveGranted o c → Deontic.GrantedAnnualAndSickLeave210_1 (p2dOfficer210_1 o) c
theorem s210_1_procedure_implies_deontic {o : Procedure.Officer} {c : ComplaintText}
    (h : Procedure.ValidLeaveAccumulation o c) :
    Deontic.Permission210_1LeavePermitted (p2dOfficer210_1 o) c :=
  ⟨corr210_1_pd_addressee h.granted, corr210_1_pd_granted h.granted⟩


axiom p2dOfficer210b : Procedure.Officer → Deontic.Officer
axiom corr210b_pd_finding {o : Procedure.Officer} {c : ComplaintText} :
    Procedure.SurgeonGeneralReassignmentFinding o c → Deontic.SurgeonGeneralFindingMade210b (p2dOfficer210b o) c
theorem s210b_procedure_negates_deontic_violation {o : Procedure.Officer} {c : ComplaintText}
    (h : Procedure.ValidCategoryReassignment o c) :
    ¬ Deontic.Prohibition210bChangeAssignmentViolated (p2dOfficer210b o) c :=
  fun hV => hV.2 (corr210b_pd_finding h.finding)

end Proving.USC.T42.Ch6ASchI.Bridge
