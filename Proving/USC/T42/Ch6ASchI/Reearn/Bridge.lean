























import Proving.USC.T42.Ch6ASchI.Reearn.Elements.Statute
import Proving.USC.T42.Ch6ASchI.Reearn.Deontic.Statute
import Proving.USC.T42.Ch6ASchI.Reearn.Ontology.Statute
import Proving.USC.T42.Ch6ASchI.Reearn.Procedure.Statute
import Proving.USC.T42.Ch6ASchI.Reearn.Structure.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reearn.Bridge

open Proving.USC.Common






axiom paymentED : Elements.Payment → Deontic.Payment

axiom paymentEO : Elements.Payment → Ontology.Payment


axiom releaseEP : Elements.Payment → Procedure.SettlementRelease


axiom changeEP : Elements.AgencyAction → Procedure.OrganizationalChange

axiom officerOf : Person → Procedure.CorpsOfficer

axiom personOfOfficer : Procedure.CorpsOfficer → Person

axiom nomineeOf : Person → Procedure.Nominee

axiom leaveOf : Person → Procedure.LeaveAccount

axiom periodOf : Person → Ontology.ServicePeriod

axiom detailOf : Person → Procedure.DetailAssignment


axiom bodyEO : Elements.AdvisoryBody → Entity

axiom bodyED : Elements.AdvisoryBody → Deontic.AdvisoryBody

axiom bodyOD : Entity → Deontic.AdvisoryBody

axiom bodyPO : Procedure.AdvisoryBody → Entity

axiom regulationOf : ComplaintText → Deontic.Regulation




axiom rosterOf : ComplaintText → Procedure.PositionRoster







axiom corr201_classFundD (pay : Elements.Payment) (c : ComplaintText) :
    Elements.PaymentFromWalkerClassSettlementFund pay c →
    Deontic.PaymentIsHemophiliaSettlementPayment (paymentED pay) c
axiom corr201_releaseD (pay : Elements.Payment) (c : ComplaintText) :
    Elements.PaymentUnderReleaseInLieuOfClassSettlement pay c →
    Deontic.PaymentIsHemophiliaSettlementPayment (paymentED pay) c
axiom corr201_fund101D (pay : Elements.Payment) (c : ComplaintText) :
    Elements.PaymentFromSection101Fund pay c →
    Deontic.PaymentIsHemophiliaSettlementPayment (paymentED pay) c
axiom corr201_medicaidD (pay : Elements.Payment) (c : ComplaintText) :
    Elements.DeterminationOfMedicaidEligibilityOrAmount c →
    Deontic.DeterminingMedicaidOrSsiEligibility (paymentED pay) c
axiom corr201_ssiD (pay : Elements.Payment) (c : ComplaintText) :
    Elements.DeterminationOfSsiEligibilityOrAmount c →
    Deontic.DeterminingMedicaidOrSsiEligibility (paymentED pay) c
axiom corr201_countedD (pay : Elements.Payment) (c : ComplaintText) :
    Elements.PaymentCountedAsIncomeOrResources pay c →
    Deontic.PaymentCountedAsIncomeOrResource (paymentED pay) c



theorem s201_elements_implies_deontic (pay : Elements.Payment) (c : ComplaintText)
    (h : Elements.Section201ExclusionViolated pay c) :
    Deontic.Prohibition201Violated (paymentED pay) c := by
  refine ⟨⟨?_, ?_⟩, corr201_countedD pay c h.counted⟩
  · cases h.exclusion with
    | subsectionA ha =>
      cases ha.payment with
      | classSettlement hf => exact corr201_classFundD pay c hf
      | releaseInLieu hr => exact corr201_releaseD pay c hr.inLieu
    | subsectionB hb => exact corr201_fund101D pay c hb.payment
  · cases h.exclusion with
    | subsectionA ha =>
      cases ha.determination with
      | medicaid hm => exact corr201_medicaidD pay c hm
      | ssi hs => exact corr201_ssiD pay c hs
    | subsectionB hb => exact corr201_ssiD pay c hb.determination

axiom corr201_classFundO (pay : Elements.Payment) (c : ComplaintText) :
    Elements.PaymentFromWalkerClassSettlementFund pay c →
    Ontology.IsClassSettlementFundPayment (paymentEO pay) c
axiom corr201_releaseO (pay : Elements.Payment) (c : ComplaintText) :
    Elements.PaymentUnderReleaseInLieuOfClassSettlement pay c →
    Ontology.IsReleaseInLieuOfClassSettlementPayment (paymentEO pay) c
axiom corr201_fund101O (pay : Elements.Payment) (c : ComplaintText) :
    Elements.PaymentFromSection101Fund pay c →
    Ontology.IsSection101FundPayment (paymentEO pay) c



theorem s201_elements_implies_ontology (pay : Elements.Payment) (c : ComplaintText)
    (h : Elements.Section201ExclusionApplies pay c) :
    Ontology.ExcludedPaymentClass (paymentEO pay) c := by
  cases h with
  | subsectionA ha =>
    cases ha.payment with
    | classSettlement hf => exact .classSettlementFund (corr201_classFundO pay c hf)
    | releaseInLieu hr => exact .releaseInLieu (corr201_releaseO pay c hr.inLieu)
  | subsectionB hb => exact .section101Fund (corr201_fund101O pay c hb.payment)

axiom corr201_inLieuP (pay : Elements.Payment) (c : ComplaintText) :
    Elements.PaymentUnderReleaseInLieuOfClassSettlement pay c →
    Procedure.ReleaseEnteredInLieuOfClassSettlement (releaseEP pay) c
axiom corr201_partiesP (pay : Elements.Payment) (c : ComplaintText) :
    Elements.ReleaseSignedByAllAffectedParties pay c →
    Procedure.ReleaseSignedByAllAffectedParties (releaseEP pay) c
axiom corr201_windowP (pay : Elements.Payment) (c : ComplaintText) :
    Elements.ReleaseTimelySigned pay c →
    Procedure.WithinReleaseSigningWindow (releaseEP pay)



theorem s201_elements_implies_procedure (pay : Elements.Payment) (c : ComplaintText)
    (h : Elements.ReleaseInLieuPayment pay c) :
    Procedure.TimelyHemophiliaSettlementRelease (releaseEP pay) c :=
  ⟨corr201_inLieuP pay c h.inLieu, corr201_partiesP pay c h.allParties,
   corr201_windowP pay c h.timely⟩



axiom corr203_actD (a : Elements.AgencyAction) (c : ComplaintText) :
    Elements.IsDivisionEstablishmentAbolitionTransferOrConsolidation a c →
    Deontic.DivisionEstablishedAbolishedOrTransferred c
axiom corr203_approvalDE (a : Elements.AgencyAction) (c : ComplaintText) :
    Deontic.SecretaryApprovedDivisionChange c →
    Elements.SecretaryApprovedDivisionAction a c
axiom corr203_approvalPE (a : Elements.AgencyAction) (c : ComplaintText) :
    Procedure.SecretaryApprovedOrganizationalUnitChange (changeEP a) c →
    Elements.SecretaryApprovedDivisionAction a c
axiom corr203_approvalPD (u : Procedure.OrganizationalChange) (c : ComplaintText) :
    Procedure.SecretaryApprovedOrganizationalUnitChange u c →
    Deontic.SecretaryApprovedDivisionChange c



theorem s203_elements_implies_deontic (a : Elements.AgencyAction) (c : ComplaintText)
    (h : Elements.Section203DivisionActionUnauthorized a c) :
    Deontic.Prohibition203DivisionChangeViolated c :=
  ⟨⟨corr203_actD a c h.divisionAction⟩,
   fun hApp => h.noApproval (corr203_approvalDE a c hApp)⟩



theorem s203_elements_implies_procedure (a : Elements.AgencyAction) (c : ComplaintText)
    (h : Elements.Section203DivisionActionUnauthorized a c) :
    ¬ Procedure.ValidOrganizationalUnitChange (changeEP a) c :=
  fun hv => h.noApproval (corr203_approvalPE a c hv.secretaryApproved)



theorem s203_deontic_implies_procedure (u : Procedure.OrganizationalChange)
    (c : ComplaintText) (h : Deontic.Prohibition203DivisionChangeViolated c) :
    ¬ Procedure.ValidOrganizationalUnitChange u c :=
  fun hv => h.2 (corr203_approvalPD u c hv.secretaryApproved)



axiom corr204_regularO (p : Person) (c : ComplaintText) :
    Elements.AppointedToRegularCorps p c → Ontology.IsRegularCorpsOfficer p c
axiom corr204_reserveO (p : Person) (c : ComplaintText) :
    Elements.AppointedToReadyReserveCorps p c → Ontology.IsReadyReserveCorpsOfficer p c
axiom corr204_warrantO (p : Person) (c : ComplaintText) :
    Elements.AppointedAsWarrantOfficerForHealthDeliverySupport p c →
    Ontology.IsWarrantOfficerOfService p c
axiom corr204_transitionO (p : Person) (c : ComplaintText) :
    Elements.ClassifiedAsReserveCorpsOfficerBeforeMarch23_2010 p c →
    Ontology.IsDeemedRegularCorpsOfficerByTransition p c
axiom corr204_citizenED (p : Person) (c : ComplaintText) :
    Elements.IsUnitedStatesCitizen p c → Deontic.IsCitizenOfUnitedStates p c
axiom corr204_citizenOD (p : Person) (c : ComplaintText) :
    Ontology.IsUnitedStatesCitizen p c → Deontic.IsCitizenOfUnitedStates p c



theorem s204_elements_implies_ontology (p : Person) (c : ComplaintText)
    (h : Elements.Section204CommissionedOfficerStatus p c) :
    Ontology.CorpsMembership p c := by
  cases h with
  | regular hr => exact .regular (corr204_regularO p c hr.regularCorps)
  | readyReserve hr => exact .readyReserve (corr204_reserveO p c hr.readyReserve)
  | warrant hw => exact .warrantOfficerDeemed (corr204_warrantO p c hw.warrantAppointment)
  | deemedRegular hd => exact .transitionDeemed (corr204_transitionO p c hd.priorClassification)



theorem s204_elements_implies_deontic (p : Person) (cc : Deontic.CorpsComponent)
    (c : ComplaintText) (h : Elements.Section204RegularCorpsAppointment p c) :
    ¬ Deontic.Obligation204a2CitizenshipBreached p cc c :=
  fun hb => hb.2 (corr204_citizenED p c h.citizen)



theorem s204_ontology_implies_deontic (p : Person) (cc : Deontic.CorpsComponent)
    (c : ComplaintText) (h : Ontology.CommissionedOfficerQualification p c) :
    ¬ Deontic.Obligation204a2CitizenshipBreached p cc c :=
  fun hb => hb.2 (corr204_citizenOD p c h.citizen)



axiom corr204a_reqsED (c : ComplaintText) :
    Elements.ReadinessRequirementsEstablishedBySecretary c →
    Deontic.ReadinessRequirementsEstablished c
axiom corr204a_failMeetsED (p : Person) (c : ComplaintText) :
    Elements.FailedToMeetOrMaintainReadinessRequirements p c →
    ¬ Deontic.MemberMeetsReadinessRequirements p c
axiom corr204a_failOrdersED (p : Person) (c : ComplaintText) :
    Elements.FailedToComplyWithDeploymentOrders p c →
    ¬ Deontic.MemberCompliedWithDeploymentOrders p c
axiom corr204a_waiverDE (p : Person) (c : ComplaintText) :
    Deontic.ReadinessRequirementWaived p c →
    Elements.SecretaryGrantedReadinessWaiver p c




theorem s204a_elements_implies_deontic (p : Person) (c : ComplaintText)
    (h : Elements.Section204aDisciplinaryExposure p c) :
    Deontic.Obligation204aA3Breached p c := by
  refine ⟨⟨corr204a_reqsED c h.requirements⟩, ?_,
          fun hw => h.noWaiver (corr204a_waiverDE p c hw)⟩
  cases h.failure with
  | requirements hf => exact Or.inl (corr204a_failMeetsED p c hf)
  | orders ho => exact Or.inr (corr204a_failOrdersED p c ho)

axiom corr204a_officerIsMember (o : Procedure.CorpsOfficer) (c : ComplaintText) :
    Elements.IsMemberOfCommissionedCorps (personOfOfficer o) c
axiom corr204a_reqsPE (k : Procedure.ReadinessCycle) (c : ComplaintText) :
    Procedure.ReadinessRequirementsEstablishedBySecretary k c →
    Elements.ReadinessRequirementsEstablishedBySecretary c
axiom corr204a_meetsPE (o : Procedure.CorpsOfficer) (k : Procedure.ReadinessCycle)
    (c : ComplaintText) :
    ¬ Procedure.MeetsReadinessRequirements o k c →
    Elements.FailedToMeetOrMaintainReadinessRequirements (personOfOfficer o) c
axiom corr204a_ordersPE (o : Procedure.CorpsOfficer) (c : ComplaintText) :
    Procedure.FailedToComplyWithDeploymentOrder o c →
    Elements.FailedToComplyWithDeploymentOrders (personOfOfficer o) c
axiom corr204a_waiverEP (o : Procedure.CorpsOfficer) (c : ComplaintText) :
    Elements.SecretaryGrantedReadinessWaiver (personOfOfficer o) c →
    Procedure.ReadinessRequirementWaiverGranted o c



theorem s204a_procedure_implies_elements (o : Procedure.CorpsOfficer)
    (k : Procedure.ReadinessCycle) (c : ComplaintText)
    (h : Procedure.SubjectToReadinessDiscipline o k c) :
    Elements.Section204aDisciplinaryExposure (personOfOfficer o) c := by
  refine ⟨corr204a_officerIsMember o c, corr204a_reqsPE k c h.requirementsEstablished,
          ?_, fun hw => h.noWaiver (corr204a_waiverEP o c hw)⟩
  cases h.default with
  | inl hm => exact .requirements (corr204a_meetsPE o k c hm)
  | inr ho => exact .orders (corr204a_ordersPE o c ho)

axiom corr204a_meetsPD (o : Procedure.CorpsOfficer) (k : Procedure.ReadinessCycle)
    (c : ComplaintText) :
    ¬ Procedure.MeetsReadinessRequirements o k c →
    ¬ Deontic.MemberMeetsReadinessRequirements (personOfOfficer o) c
axiom corr204a_ordersPD (o : Procedure.CorpsOfficer) (c : ComplaintText) :
    Procedure.FailedToComplyWithDeploymentOrder o c →
    ¬ Deontic.MemberCompliedWithDeploymentOrders (personOfOfficer o) c
axiom corr204a_reqsPD (k : Procedure.ReadinessCycle) (c : ComplaintText) :
    Procedure.ReadinessRequirementsEstablishedBySecretary k c →
    Deontic.ReadinessRequirementsEstablished c
axiom corr204a_waiverDP (o : Procedure.CorpsOfficer) (c : ComplaintText) :
    Deontic.ReadinessRequirementWaived (personOfOfficer o) c →
    Procedure.ReadinessRequirementWaiverGranted o c


theorem s204a_procedure_implies_deontic (o : Procedure.CorpsOfficer)
    (k : Procedure.ReadinessCycle) (c : ComplaintText)
    (h : Procedure.SubjectToReadinessDiscipline o k c) :
    Deontic.Obligation204aA3Breached (personOfOfficer o) c := by
  refine ⟨⟨corr204a_reqsPD k c h.requirementsEstablished⟩, ?_,
          fun hw => h.noWaiver (corr204a_waiverDP o c hw)⟩
  cases h.default with
  | inl hm => exact Or.inl (corr204a_meetsPD o k c hm)
  | inr ho => exact Or.inr (corr204a_ordersPD o c ho)

axiom corr204a_meetsDO (p : Person) (c : ComplaintText) :
    Deontic.MemberMeetsReadinessRequirements p c →
    Ontology.MeetsCorpsReadinessRequirements p c
axiom corr204a_waiverDO (p : Person) (c : ComplaintText) :
    Deontic.ReadinessRequirementWaived p c → Ontology.IsReadinessWaiverGround p c






theorem s204a_ontology_implies_deontic_modulo_gaps (p : Person) (c : ComplaintText)
    (gap_204a_requirements_established : Deontic.ReadinessRequirementsEstablished c)
    (h : Ontology.UnwaivedReadinessDeficiency p c) :
    Deontic.Obligation204aA3Breached p c :=
  ⟨⟨gap_204a_requirements_established⟩,
   Or.inl (fun hm => h.notReady (corr204a_meetsDO p c hm)),
   fun hw => h.noWaiver (corr204a_waiverDO p c hw)⟩



axiom corr205_regularED (p : Person) (c : ComplaintText) :
    Elements.IsMemberOfRegularCorps p c → Deontic.IsMemberOfRegularCorps p c
axiom corr205_trainingED (p : Person) (c : ComplaintText) :
    Elements.HasSpecializedTrainingOrExperienceInPublicHealthPrograms p c →
    Deontic.HasPublicHealthTrainingOrExperience p c



theorem s205_elements_implies_deontic (p : Person) (c : ComplaintText)
    (h : Elements.Section205SurgeonGeneralAppointment p c) :
    ¬ Deontic.Obligation205QualificationsBreached p c := by
  intro hb
  cases hb.2 with
  | inl hr => exact hr (corr205_regularED p c h.regularCorpsMember)
  | inr hq => exact hq (corr205_trainingED p c h.qualifications)

axiom corr205_regularEO (p : Person) (c : ComplaintText) :
    Elements.IsMemberOfRegularCorps p c → Ontology.IsRegularCorpsOfficer p c
axiom corr205_trainingEO (p : Person) (c : ComplaintText) :
    Elements.HasSpecializedTrainingOrExperienceInPublicHealthPrograms p c →
    Ontology.HasPublicHealthTrainingOrExperience p c
axiom corr205_holdsOfficeEO (p : Person) (c : ComplaintText) :
    Elements.AppointedByPresidentWithSenateAdviceAndConsent p c →
    Ontology.IsSurgeonGeneral p c



theorem s205_elements_implies_ontology (p : Person) (c : ComplaintText)
    (h : Elements.Section205SurgeonGeneralAppointment p c) :
    Ontology.SurgeonGeneralQualification p c :=
  ⟨corr205_regularEO p c h.regularCorpsMember,
   corr205_trainingEO p c h.qualifications,
   corr205_holdsOfficeEO p c h.senateConfirmed⟩

axiom corr205_regularOD (p : Person) (c : ComplaintText) :
    Ontology.IsRegularCorpsOfficer p c → Deontic.IsMemberOfRegularCorps p c
axiom corr205_trainingOD (p : Person) (c : ComplaintText) :
    Ontology.HasPublicHealthTrainingOrExperience p c →
    Deontic.HasPublicHealthTrainingOrExperience p c


theorem s205_ontology_implies_deontic (p : Person) (c : ComplaintText)
    (h : Ontology.SurgeonGeneralQualification p c) :
    ¬ Deontic.Obligation205QualificationsBreached p c := by
  intro hb
  cases hb.2 with
  | inl hr => exact hr (corr205_regularOD p c h.regularCorps)
  | inr hq => exact hq (corr205_trainingOD p c h.publicHealth)

axiom corr205_nominatedEP (p : Person) (c : ComplaintText) :
    Elements.AppointedByPresidentWithSenateAdviceAndConsent p c →
    Procedure.SurgeonGeneralNominatedByPresident (nomineeOf p) c
axiom corr205_consentEP (p : Person) (c : ComplaintText) :
    Elements.AppointedByPresidentWithSenateAdviceAndConsent p c →
    Procedure.SenateAdviceAndConsentGiven (nomineeOf p) c
axiom corr205_fromRegularEP (p : Person) (c : ComplaintText) :
    Elements.IsMemberOfRegularCorps p c → Procedure.AppointedFromRegularCorps (nomineeOf p) c
axiom corr205_qualifiedEP (p : Person) (c : ComplaintText) :
    Elements.HasSpecializedTrainingOrExperienceInPublicHealthPrograms p c →
    Procedure.HasSpecializedPublicHealthTrainingOrExperience (nomineeOf p) c


theorem s205_elements_implies_procedure (p : Person) (c : ComplaintText)
    (h : Elements.Section205SurgeonGeneralAppointment p c) :
    Procedure.ValidSurgeonGeneralAppointment (nomineeOf p) c :=
  ⟨corr205_nominatedEP p c h.senateConfirmed, corr205_consentEP p c h.senateConfirmed,
   corr205_fromRegularEP p c h.regularCorpsMember,
   corr205_qualifiedEP p c h.qualifications⟩

axiom corr205_fromRegularPD (p : Person) (c : ComplaintText) :
    Procedure.AppointedFromRegularCorps (nomineeOf p) c → Deontic.IsMemberOfRegularCorps p c
axiom corr205_qualifiedPD (p : Person) (c : ComplaintText) :
    Procedure.HasSpecializedPublicHealthTrainingOrExperience (nomineeOf p) c →
    Deontic.HasPublicHealthTrainingOrExperience p c


theorem s205_procedure_implies_deontic (p : Person) (c : ComplaintText)
    (h : Procedure.ValidSurgeonGeneralAppointment (nomineeOf p) c) :
    ¬ Deontic.Obligation205QualificationsBreached p c := by
  intro hb
  cases hb.2 with
  | inl hr => exact hr (corr205_fromRegularPD p c h.fromRegularCorps)
  | inr hq => exact hq (corr205_qualifiedPD p c h.qualified)



axiom corr206_deputyED (p : Person) (c : ComplaintText) :
    Elements.AssignedToAdministerOfficeOfSurgeonGeneral p c →
    Deontic.DeputySurgeonGeneralAssigned c
axiom corr206_actingED (p : Person) (c : ComplaintText) :
    Elements.DesignatedToServeAsSurgeonGeneralDuringVacancy p c →
    Deontic.ActingSurgeonGeneralDesignated c



theorem s206_elements_implies_deontic (p : Person) (c : ComplaintText)
    (h : Elements.Section206DeputySurgeonGeneralAssignment p c) :
    ¬ Deontic.Obligation206aDeputyBreached c :=
  fun hb => hb (corr206_deputyED p c h.administersOffice)

axiom corr206_deputyEP (p : Person) (c : ComplaintText) :
    Elements.AssignedToAdministerOfficeOfSurgeonGeneral p c →
    Procedure.DeputySurgeonGeneralAssigned (officerOf p) c
axiom corr206_actingEP (p : Person) (q : Person) (c : ComplaintText) :
    Elements.DesignatedToServeAsSurgeonGeneralDuringVacancy q c →
    Procedure.ActingSurgeonGeneralDesignated (officerOf p) c



theorem s206_elements_implies_procedure (p q : Person) (c : ComplaintText)
    (hd : Elements.Section206DeputySurgeonGeneralAssignment p c)
    (ha : Elements.Section206ActingSurgeonGeneralDesignation q c) :
    Procedure.SurgeonGeneralSuccessionChainEstablished (officerOf p) c :=
  ⟨corr206_deputyEP p c hd.administersOffice, corr206_actingEP p q c ha.designated⟩

axiom corr206_deputyPD (o : Procedure.CorpsOfficer) (c : ComplaintText) :
    Procedure.DeputySurgeonGeneralAssigned o c → Deontic.DeputySurgeonGeneralAssigned c
axiom corr206_actingPD (o : Procedure.CorpsOfficer) (c : ComplaintText) :
    Procedure.ActingSurgeonGeneralDesignated o c → Deontic.ActingSurgeonGeneralDesignated c



theorem s206_procedure_implies_deontic (o : Procedure.CorpsOfficer) (c : ComplaintText)
    (h : Procedure.SurgeonGeneralSuccessionChainEstablished o c) :
    ¬ Deontic.Obligation206aDeputyBreached c ∧ ¬ Deontic.Obligation206dActingBreached c :=
  ⟨fun hb => hb (corr206_deputyPD o c h.deputyAssigned),
   fun hb => hb (corr206_actingPD o c h.actingDesignated)⟩

axiom cnt206_positionsED (c : ComplaintText) :
    Elements.numberOfSpecialTemporaryAssistantSurgeonGeneralPositions c
      = Deontic.temporaryAssistantSurgeonGeneralPositions c
axiom cnt206_baseED (c : ComplaintText) :
    Elements.peakActiveDutyOfficerCountPrecedingNinetyDays c
      = Deontic.activeDutyOfficerCapBase c




theorem s206_elements_cap_implies_deontic (c : ComplaintText)
    (h : Elements.WithinOnePercentTemporaryPositionCap c) :
    ¬ Deontic.Prohibition206c2CapViolated c := by
  have hp := cnt206_positionsED c
  have hb := cnt206_baseED c
  unfold Elements.WithinOnePercentTemporaryPositionCap at h
  unfold Deontic.Prohibition206c2CapViolated
  omega



axiom corr207_separationED (p : Person) (c : ComplaintText) :
    Elements.SeparationOrGradeReductionRequiredSolelyByGradeMaxima p c →
    Deontic.MaximaRequireSeparationOrGradeReduction c



theorem s207_elements_implies_deontic (p : Person) (c : ComplaintText)
    (h : Elements.Section207SeparationShieldClaim p c) :
    Deontic.Prohibition207dNoForcedSeparationViolated c :=
  corr207_separationED p c h.causedByMaxima

axiom cnt207_aboveEP (c : ComplaintText) :
    Elements.numberOfAssistantSurgeonsGeneralAboveBrigadierGrade c
      = Procedure.assistantSurgeonGeneralAboveBrigadierGeneralCount (rosterOf c)
axiom cnt207_positionsEP (c : ComplaintText) :
    Elements.numberOfAssistantSurgeonGeneralPositions c
      = Procedure.assistantSurgeonGeneralPositionCount (rosterOf c)


theorem s207_elements_implies_procedure (c : ComplaintText)
    (h : Elements.WithinAssistantSurgeonGeneralHigherGradeCap c) :
    Procedure.WithinOneHalfMajorGeneralLimit (rosterOf c) := by
  have ha := cnt207_aboveEP c
  have hp := cnt207_positionsEP c
  unfold Elements.WithinAssistantSurgeonGeneralHigherGradeCap at h
  unfold Procedure.WithinOneHalfMajorGeneralLimit
  omega

axiom corr207_maximaPD (a : Procedure.AppropriationAct) (c : ComplaintText) :
    Procedure.GradeMaximaRegulationsPrescribed a c →
    Deontic.GradeMaximaPrescribedByRegulation c



theorem s207_procedure_implies_deontic (a : Procedure.AppropriationAct)
    (t : Procedure.PositionRoster) (c : ComplaintText)
    (h : Procedure.ValidGradeMaximaRegulation a t c) :
    ¬ Deontic.Obligation207dMaximaBreached c :=
  fun hb => hb (corr207_maximaPD a c h.regulationsPrescribed)



axiom corr209_aboveDE (p : Person) (g : Deontic.Grade) (c : ComplaintText) :
    Deontic.IsGradeAboveJuniorAssistant g c →
    Elements.AppointmentAboveJuniorAssistantGrade p c
axiom corr209_examED (p : Person) (c : ComplaintText) :
    Elements.PassedPrescribedAppointmentExamination p c →
    Deontic.PromotionExaminationPassed p c






theorem s209_elements_implies_deontic (p : Person) (g : Deontic.Grade) (c : ComplaintText)
    (h : Elements.Section209RegularCorpsOriginalAppointment p c) :
    ¬ Deontic.Prohibition209a1ExaminationViolated p g c :=
  fun hv => hv.2 (corr209_examED p c (h.examination (corr209_aboveDE p g c hv.1.condition)))

axiom cnt209_ageEP (p : Person) (c : ComplaintText) :
    Elements.ageAtAppointment p c = Procedure.ageAtAppointmentYears (nomineeOf p)
axiom cnt209_serviceEP (p : Person) (c : ComplaintText) :
    Elements.yearsOfActiveServiceAtAppointment p c
      = Procedure.yearsOfActiveServiceAtAppointment (nomineeOf p)



theorem s209_elements_implies_procedure (p : Person) (c : ComplaintText)
    (h : Elements.ServiceOffsetSatisfied p c) :
    Procedure.AgeFortyFourBarCleared (nomineeOf p) := by
  have ha := cnt209_ageEP p c
  have hs := cnt209_serviceEP p c
  unfold Elements.ServiceOffsetSatisfied at h
  unfold Procedure.AgeFortyFourBarCleared
  omega

axiom corr209_clearedPD (p : Person) (c : ComplaintText) :
    Procedure.AgeFortyFourBarCleared (nomineeOf p) →
    Deontic.AgeFortyFourExceptionApplies p c



theorem s209_procedure_implies_deontic (p : Person) (g : Deontic.Grade) (c : ComplaintText)
    (h : Procedure.AgeFortyFourBarCleared (nomineeOf p)) :
    ¬ Deontic.Prohibition209a3AgeFortyFourViolated p g c :=
  fun hv => hv.2.2 (corr209_clearedPD p c h)



axiom corr209d_majorityED (p : Person) (c : ComplaintText) :
    Elements.GraduateOfOsteopathyCollegeLicensableInMajorityOfStates p c →
    Deontic.IsOsteopathyGraduateFromRecognizedCollege p c
axiom corr209d_approvedED (p : Person) (c : ComplaintText) :
    Elements.GraduateOfOsteopathyCollegeApprovedByAcceptableBody p c →
    Deontic.IsOsteopathyGraduateFromRecognizedCollege p c



theorem s209d_elements_implies_deontic (p : Person) (c : ComplaintText)
    (h : Elements.Section209dAppointmentEligibility p c) :
    Deontic.Permission209dOsteopath p c := by
  cases h.qualification with
  | majorityStateLicensure hm => exact corr209d_majorityED p c hm
  | secretaryAcceptableApproval hs => exact corr209d_approvedED p c hs

axiom corr209d_majorityEP (p : Person) (c : ComplaintText) :
    Elements.GraduateOfOsteopathyCollegeLicensableInMajorityOfStates p c →
    Procedure.EligibleOsteopathyGraduate (nomineeOf p) c
axiom corr209d_approvedEP (p : Person) (c : ComplaintText) :
    Elements.GraduateOfOsteopathyCollegeApprovedByAcceptableBody p c →
    Procedure.EligibleOsteopathyGraduate (nomineeOf p) c


theorem s209d_elements_implies_procedure (p : Person) (c : ComplaintText)
    (h : Elements.Section209dAppointmentEligibility p c) :
    Procedure.EligibleOsteopathyGraduate (nomineeOf p) c := by
  cases h.qualification with
  | majorityStateLicensure hm => exact corr209d_majorityEP p c hm
  | secretaryAcceptableApproval hs => exact corr209d_approvedEP p c hs

axiom corr209d_eligiblePD (p : Person) (c : ComplaintText) :
    Procedure.EligibleOsteopathyGraduate (nomineeOf p) c →
    Deontic.IsOsteopathyGraduateFromRecognizedCollege p c


theorem s209d_procedure_implies_deontic (p : Person) (c : ComplaintText)
    (h : Procedure.EligibleOsteopathyGraduate (nomineeOf p) c) :
    Deontic.Permission209dOsteopath p c :=
  corr209d_eligiblePD p c h







axiom corr210_activeED (p : Person) (c : ComplaintText) :
    Elements.IsOnActiveDuty p c → Deontic.IsOnActiveDutyOrEntitledToRetiredPay p c
axiom corr210_retiredED (p : Person) (c : ComplaintText) :
    Elements.IsRetiredOfficerEntitledToRetiredPay p c →
    Deontic.IsOnActiveDutyOrEntitledToRetiredPay p c



theorem s210_elements_implies_deontic (p : Person) (c : ComplaintText)
    (h : Elements.Section210SupplyPurchaseClass p c) :
    Deontic.Permission210bPurchase p c := by
  cases h with
  | activeDuty _ hActive => exact corr210_activeED p c hActive
  | retired hr => exact corr210_retiredED p c hr

axiom cnt210_rateED (p : Person) (c : ComplaintText) :
    Elements.dailyCompensationRateCents p c = Deontic.councilMemberDailyCompensationRate c
axiom cnt210_capED (c : ComplaintText) :
    Elements.grade18DailyEquivalentRateCents c = Deontic.gs18DailyEquivalentRate c


theorem s210_elements_cap_implies_deontic (p : Person) (c : ComplaintText)
    (h : Elements.WithinGs18DailyEquivalentCap p c) :
    ¬ Deontic.Prohibition210cRateCapViolated c := by
  have hr := cnt210_rateED p c
  have hc := cnt210_capED c
  unfold Elements.WithinGs18DailyEquivalentCap at h
  unfold Deontic.Prohibition210cRateCapViolated
  omega



axiom corr210_1_regulationsED (p : Person) (c : ComplaintText) :
    Elements.LeaveGrantedInAccordanceWithPresidentialRegulations p c →
    Deontic.TakenInAccordanceWithRegulations (regulationOf c) c
axiom corr210_1_noDeductionED (p : Person) (c : ComplaintText) :
    ¬ Elements.DeductionMadeFromPayAndAllowancesForLeave p c →
    Deontic.LeaveGrantedWithoutPayDeduction p c



theorem s210_1_elements_implies_deontic (p : Person) (c : ComplaintText)
    (h : Elements.Section210_1LeaveEntitlement p c) :
    Deontic.Permission210_1aLeave p (regulationOf c) c :=
  ⟨corr210_1_regulationsED p c h.underRegulations,
   corr210_1_noDeductionED p c h.noDeduction⟩

axiom corr210_1_regulationsEP (p : Person) (c : ComplaintText) :
    Elements.LeaveGrantedInAccordanceWithPresidentialRegulations p c →
    Procedure.LeaveGrantedUnderPresidentialRegulations (leaveOf p) c
axiom cnt210_1_daysEP (p : Person) (c : ComplaintText) :
    Elements.accumulatedAnnualLeaveDays p c = Procedure.accumulatedAnnualLeaveDays (leaveOf p)



theorem s210_1_elements_implies_procedure (p : Person) (c : ComplaintText)
    (h : Elements.Section210_1LeaveEntitlement p c) :
    Procedure.ValidLeaveGrant (leaveOf p) c := by
  refine ⟨corr210_1_regulationsEP p c h.underRegulations, ?_⟩
  have hd := cnt210_1_daysEP p c
  have hcap := h.withinCap
  unfold Elements.WithinAccumulatedAnnualLeaveCap at hcap
  unfold Procedure.WithinAccumulatedAnnualLeaveCap
  omega

axiom cnt210_1_daysPD (p : Person) (c : ComplaintText) :
    Procedure.accumulatedAnnualLeaveDays (leaveOf p)
      = Deontic.accumulatedAnnualLeaveDaysAuthorized c


theorem s210_1_procedure_implies_deontic (p : Person) (c : ComplaintText)
    (h : Procedure.WithinAccumulatedAnnualLeaveCap (leaveOf p)) :
    ¬ Deontic.Prohibition210_1bLeaveCapViolated c := by
  have hd := cnt210_1_daysPD p c
  unfold Procedure.WithinAccumulatedAnnualLeaveCap at h
  unfold Deontic.Prohibition210_1bLeaveCapViolated
  omega



axiom corr210b_changedED (p : Person) (c : ComplaintText) :
    Elements.CategoryAssignmentChanged p c → Deontic.CategoryAssignmentChanged p c
axiom corr210b_findingDE (p : Person) (pc : Elements.ProfessionalCategory)
    (c : ComplaintText) :
    Deontic.ReassignmentFindingSupportsChange p c →
    Elements.Section210bCategoryChangeAuthority p pc c





theorem s210b_elements_implies_deontic (p : Person) (pc : Elements.ProfessionalCategory)
    (c : ComplaintText) (h : Elements.Section210bUnlawfulCategoryChangeClaim p pc c) :
    Deontic.Prohibition210bBReassignmentViolated p c :=
  ⟨⟨corr210b_changedED p c h.changed⟩,
   fun hf => h.noAuthority (corr210b_findingDE p pc c hf)⟩

axiom corr210b_erroneousPE (o : Procedure.CorpsOfficer) (c : ComplaintText) :
    Procedure.CategoryAssignmentFoundErroneous o c →
    Elements.OriginalCategoryAssignmentErroneous (personOfOfficer o) c
axiom corr210b_transferPE (o : Procedure.CorpsOfficer) (pc : Elements.ProfessionalCategory)
    (c : ComplaintText) :
    Procedure.EquallyQualifiedForRequestedCategoryTransfer o c →
    Elements.Section210bQualifiedTransferRequest (personOfOfficer o) pc c



theorem s210b_procedure_implies_elements (o : Procedure.CorpsOfficer)
    (pc : Elements.ProfessionalCategory) (c : ComplaintText)
    (h : Procedure.ValidCategoryReassignment o c) :
    Elements.Section210bCategoryChangeAuthority (personOfOfficer o) pc c := by
  cases h with
  | originalErroneous _ he => exact .erroneousOriginal (corr210b_erroneousPE o c he)
  | qualifiedTransferRequest _ ht => exact .qualifiedTransfer (corr210b_transferPE o pc c ht)

axiom corr210b_reassignmentPD (o : Procedure.CorpsOfficer) (c : ComplaintText) :
    Procedure.ValidCategoryReassignment o c →
    Deontic.ReassignmentFindingSupportsChange (personOfOfficer o) c


theorem s210b_procedure_implies_deontic (o : Procedure.CorpsOfficer) (c : ComplaintText)
    (h : Procedure.ValidCategoryReassignment o c) :
    ¬ Deontic.Prohibition210bBReassignmentViolated (personOfOfficer o) c :=
  fun hv => hv.2 (corr210b_reassignmentPD o c h)



axiom corr211_examED (p : Person) (c : ComplaintText) :
    Elements.PassedPromotionExamination p c → Deontic.PromotionExaminationPassed p c



theorem s211_elements_implies_deontic (p : Person) (g : Deontic.Grade) (c : ComplaintText)
    (h : Elements.Section211PermanentPromotion p c) :
    ¬ Deontic.Prohibition211aUnexaminedPromotionViolated p g c :=
  fun hv => hv.2 (corr211_examED p c h.examination)

axiom corr211_assistantEP (p : Person) (c : ComplaintText) :
    Elements.HoldsPermanentRankInAssistantGrade p c →
    Procedure.HoldsAssistantGrade (officerOf p) c
axiom corr211_seniorEP (p : Person) (c : ComplaintText) :
    Elements.HoldsPermanentRankInSeniorAssistantGrade p c →
    Procedure.HoldsSeniorAssistantGrade (officerOf p) c
axiom corr211_fullEP (p : Person) (c : ComplaintText) :
    Elements.HoldsPermanentRankInFullGrade p c → Procedure.HoldsFullGrade (officerOf p) c
axiom cnt211_yearsEP (p : Person) (c : ComplaintText) :
    Elements.yearsOfServiceAboveJuniorAssistantGrade p c
      = Procedure.yearsOfServiceAboveJuniorAssistantGrade (officerOf p)



theorem s211_elements_implies_procedure (p : Person) (c : ComplaintText)
    (h : Elements.Section211LengthOfServiceEligibility p c) :
    Procedure.LengthOfServicePromotionRipe (officerOf p) c := by
  have hy := cnt211_yearsEP p c
  unfold Procedure.LengthOfServicePromotionRipe
  cases h with
  | fromAssistant hRank hYears =>
    refine Or.inl ⟨corr211_assistantEP p c hRank, ?_⟩
    unfold Elements.CompletedThreeYearsAboveJuniorAssistant at hYears
    omega
  | fromSeniorAssistant hRank hYears =>
    refine Or.inr (Or.inl ⟨corr211_seniorEP p c hRank, ?_⟩)
    unfold Elements.CompletedTenYearsAboveJuniorAssistant at hYears
    omega
  | fromFull hRank hYears =>
    refine Or.inr (Or.inr ⟨corr211_fullEP p c hRank, ?_⟩)
    unfold Elements.CompletedSeventeenYearsAboveJuniorAssistant at hYears
    omega

axiom corr211_examPD (o : Procedure.CorpsOfficer) (m : Procedure.PromotionAction)
    (c : ComplaintText) :
    Procedure.PromotionExaminationPassed m c →
    Deontic.PromotionExaminationPassed (personOfOfficer o) c



theorem s211_procedure_implies_deontic (o : Procedure.CorpsOfficer)
    (m : Procedure.PromotionAction) (e : Procedure.ExaminationRecord)
    (g : Deontic.Grade) (c : ComplaintText)
    (h : Procedure.ValidLengthOfServicePromotion o m e c) :
    ¬ Deontic.Prohibition211aUnexaminedPromotionViolated (personOfOfficer o) g c :=
  fun hv => hv.2 (corr211_examPD o m c h.examPassed)



axiom corr211c_internshipED (p : Person) (c : ComplaintText) :
    Elements.CompletedMedicalInternshipByDateOfAppointment p c →
    Deontic.CompletedMedicalInternshipAtAppointment p c
axiom corr211c_duplicateDE (p : Person) (c : ComplaintText) :
    Deontic.SimilarInternshipCreditUnderOtherLaw p c →
    Elements.ReceivedSimilarInternshipCreditUnderOtherLaw p c
axiom corr211c_creditDE (p : Person) (c : ComplaintText) :
    Deontic.OneYearPromotionCreditGranted p c →
    Elements.CreditedWithOneYearForPromotionAndSeniority p c




theorem s211c_elements_implies_deontic (p : Person) (c : ComplaintText)
    (h : Elements.Section211cCreditDenied p c) :
    Deontic.Obligation211cCreditBreached p c :=
  ⟨⟨corr211c_internshipED p c h.entitlement.internship⟩,
   fun hs => h.entitlement.noDuplicateCredit (corr211c_duplicateDE p c hs),
   fun hg => h.notCredited (corr211c_creditDE p c hg)⟩

axiom corr211c_medicalEO (p : Person) (c : ComplaintText) :
    Elements.IsMedicalOfficerOfRegularCorps p c → Ontology.IsRegularCorpsOfficer p c
axiom corr211c_internshipEO (p : Person) (c : ComplaintText) :
    Elements.CompletedMedicalInternshipByDateOfAppointment p c →
    Ontology.HasCompletedMedicalInternship p c



theorem s211c_elements_implies_ontology (p : Person) (c : ComplaintText)
    (h : Elements.Section211cCreditEntitlement p c) :
    Ontology.MedicalInternshipCredit p c :=
  ⟨corr211c_medicalEO p c h.medicalOfficer, corr211c_internshipEO p c h.internship⟩

axiom corr211c_internshipOD (p : Person) (c : ComplaintText) :
    Ontology.HasCompletedMedicalInternship p c →
    Deontic.CompletedMedicalInternshipAtAppointment p c



theorem s211c_ontology_implies_deontic (p : Person) (c : ComplaintText)
    (h : Ontology.MedicalInternshipCredit p c) :
    Deontic.Obligation211cCredit p c :=
  ⟨corr211c_internshipOD p c h.internship⟩



axiom corr212_ageED (p : Person) (c : ComplaintText) :
    Elements.AttainedAgeSixtyFour p c → Deontic.AttainedAgeSixtyFour p c
axiom corr212_appliedED (p : Person) (c : ComplaintText) :
    Elements.AppliedForRetirement p c → Deontic.AppliedForRetirement p c




theorem s212_elements_implies_deontic (p : Person) (c : ComplaintText)
    (h : Elements.Section212AgeRetirementOnApplication p c) :
    Deontic.Permission212a1Retirement p c :=
  ⟨corr212_ageED p c h.age, corr212_appliedED p c h.applied⟩

axiom cnt212_ageEP (p : Person) (c : ComplaintText) :
    Elements.attainedAgeYears p c = Procedure.ageYearsAtRetirement (officerOf p)
axiom cnt212_serviceEP (p : Person) (c : ComplaintText) :
    Elements.yearsOfActiveServiceForRetirement p c
      = Procedure.yearsOfActiveService (officerOf p)
axiom cnt212_sgYearsEP (p : Person) (c : ComplaintText) :
    Elements.yearsOfServiceInSurgeonGeneralPositions p c
      = Procedure.yearsInSurgeonGeneralOrAssistantSurgeonGeneralService (officerOf p)









theorem s212_elements_implies_procedure_modulo_gaps (p : Person) (c : ComplaintText)
    (gap_212a5_regular_corps_service_base :
      25 ≤ Procedure.yearsOfActiveService (officerOf p))
    (h : Elements.Section212RetirementEntitlement p c) :
    Procedure.RetirementEligibility (officerOf p) c := by
  cases h with
  | onAge ha =>
    refine .ageSixtyFour ?_
    have hage := ha.age
    have he := cnt212_ageEP p c
    unfold Elements.AttainedAgeSixtyFour at hage
    unfold Procedure.AgeSixtyFourRetirementEligible
    omega
  | onThirtyYears ht =>
    refine .thirtyYears ?_
    have hsv := ht.service
    have he := cnt212_serviceEP p c
    unfold Elements.CompletedThirtyYearsActiveService at hsv
    unfold Procedure.ThirtyYearRetirementEligible
    omega
  | asSurgeonGeneral hs =>
    refine .seniorVoluntary ?_
    have h1 := hs.officeYears
    have e1 := cnt212_sgYearsEP p c
    have h2 := gap_212a5_regular_corps_service_base
    unfold Elements.CompletedFourYearsInSurgeonGeneralPositions at h1
    unfold Procedure.SeniorOfficerVoluntaryRetirementEligible
    omega

axiom cnt212_agePD (p : Person) (c : ComplaintText) :
    Procedure.ageYearsAtRetirement (officerOf p) = Elements.attainedAgeYears p c



theorem s212_procedure_implies_deontic (p : Person) (c : ComplaintText)
    (happ : Deontic.AppliedForRetirement p c)
    (h : Procedure.AgeSixtyFourRetirementEligible (officerOf p)) :
    Deontic.Permission212a1Retirement p c := by
  refine ⟨corr212_ageED p c ?_, happ⟩
  have he := cnt212_agePD p c
  unfold Procedure.AgeSixtyFourRetirementEligible at h
  unfold Elements.AttainedAgeSixtyFour
  omega



axiom corr213_warED (p : Person) (c : ComplaintText) :
    Elements.ActiveServicePerformedInTimeOfWar p c →
    Deontic.PerformedQualifyingActiveService p c
axiom corr213_detailED (p : Person) (c : ComplaintText) :
    Elements.ActiveServicePerformedOnDetailWithArmedForces p c →
    Deontic.PerformedQualifyingActiveService p c
axiom corr213_militaryED (p : Person) (c : ComplaintText) :
    Elements.ActiveServicePerformedWhileServicePartOfMilitaryForces p c →
    Deontic.PerformedQualifyingActiveService p c
axiom corr213_exceptedDE (p : Person) (c : ComplaintText) :
    Deontic.BenefitClaimedIsRetiredPayOrUniformAllowance p c →
    Elements.BenefitClaimedIsRetiredPayOrUniformAllowance c



theorem s213_elements_implies_deontic (p : Person) (c : ComplaintText)
    (h : Elements.Section213MilitaryBenefitsClaim p c) :
    Deontic.Permission213aMilitaryBenefits p c := by
  refine ⟨?_, fun he => h.notExcepted (corr213_exceptedDE p c he)⟩
  cases h.service with
  | timeOfWar hw => exact corr213_warED p c hw
  | detailWithArmedForces hd => exact corr213_detailED p c hd
  | partOfMilitaryForces hm => exact corr213_militaryED p c hm

axiom corr213_warEO (p : Person) (c : ComplaintText) :
    Elements.ActiveServicePerformedInTimeOfWar p c →
    Ontology.IsWartimeActiveService (periodOf p) c
axiom corr213_detailEO (p : Person) (c : ComplaintText) :
    Elements.ActiveServicePerformedOnDetailWithArmedForces p c →
    Ontology.IsDetailToArmedForce (periodOf p) c
axiom corr213_militaryEO (p : Person) (c : ComplaintText) :
    Elements.ActiveServicePerformedWhileServicePartOfMilitaryForces p c →
    Ontology.IsServiceMilitarizedByExecutiveOrder (periodOf p) c



theorem s213_elements_implies_ontology (p : Person) (c : ComplaintText)
    (h : Elements.Section213QualifyingActiveService p c) :
    Ontology.MilitaryBenefitQualifyingService (periodOf p) c := by
  cases h with
  | timeOfWar hw => exact .wartime (corr213_warEO p c hw)
  | detailWithArmedForces hd => exact .detailToArmedForce (corr213_detailEO p c hd)
  | partOfMilitaryForces hm => exact .militarizedByExecutiveOrder (corr213_militaryEO p c hm)

axiom corr213_warOD (p : Person) (c : ComplaintText) :
    Ontology.IsWartimeActiveService (periodOf p) c →
    Deontic.PerformedQualifyingActiveService p c
axiom corr213_detailOD (p : Person) (c : ComplaintText) :
    Ontology.IsDetailToArmedForce (periodOf p) c →
    Deontic.PerformedQualifyingActiveService p c
axiom corr213_militaryOD (p : Person) (c : ComplaintText) :
    Ontology.IsServiceMilitarizedByExecutiveOrder (periodOf p) c →
    Deontic.PerformedQualifyingActiveService p c


theorem s213_ontology_implies_deontic (p : Person) (c : ComplaintText)
    (h : Ontology.MilitaryBenefitQualifyingService (periodOf p) c) :
    Deontic.PerformedQualifyingActiveService p c := by
  cases h with
  | wartime hw => exact corr213_warOD p c hw
  | detailToArmedForce hd => exact corr213_detailOD p c hd
  | militarizedByExecutiveOrder hm => exact corr213_militaryOD p c hm



axiom corr213a_authorityDE (c : ComplaintText) :
    Deontic.Title10AuthorityExercisedByHhsSecretary c →
    Elements.AuthorityExercisedBySecretaryOfHhsOrDesignee c



theorem s213a_elements_implies_deontic (p : Person) (c : ComplaintText)
    (h : Elements.Section213aWrongAuthorityClaim p c) :
    Deontic.Obligation213aBAuthorityBreached c :=
  fun ha => h.wrongAuthority (corr213a_authorityDE c ha)

axiom corr213a_authorityPE (o : Procedure.CorpsOfficer) (c : ComplaintText) :
    Procedure.SecretaryOrDesigneeExercisedTitleTenAuthority o c →
    Elements.AuthorityExercisedBySecretaryOfHhsOrDesignee c




theorem s213a_elements_implies_procedure (p : Person) (o : Procedure.CorpsOfficer)
    (d : Procedure.EmergencyDeclaration) (c : ComplaintText)
    (h : Elements.Section213aWrongAuthorityClaim p c) :
    ¬ Procedure.MilitaryBenefitsEntitlement o d c :=
  fun hm => h.wrongAuthority (corr213a_authorityPE o c hm.authorityExercised)

axiom corr213a_authorityPD (o : Procedure.CorpsOfficer) (c : ComplaintText) :
    Procedure.SecretaryOrDesigneeExercisedTitleTenAuthority o c →
    Deontic.Title10AuthorityExercisedByHhsSecretary c


theorem s213a_deontic_implies_procedure (o : Procedure.CorpsOfficer)
    (d : Procedure.EmergencyDeclaration) (c : ComplaintText)
    (h : Deontic.Obligation213aBAuthorityBreached c) :
    ¬ Procedure.MilitaryBenefitsEntitlement o d c :=
  fun hm => h (corr213a_authorityPD o c hm.authorityExercised)

axiom corr213a_trainingDE (p : Person) (c : ComplaintText) :
    Deontic.OrderedToActiveDutyForTrainingOverThirtyDays p c →
    Elements.OrderedToActiveDutyForTrainingMoreThanThirtyDays p c
axiom corr213a_claimantED (p : Person) (c : ComplaintText) :
    Elements.Section213Claimant p c → Deontic.IsOfficerOrSurvivingBeneficiary p c







theorem s213a_elements_entitlement_implies_deontic_modulo_gaps (p : Person)
    (c : ComplaintText)
    (gap_213a_chapter61_claim : Elements.ClaimUnderChapter61Sections1201To1203 c)
    (h : Elements.Section213aEntitlement p c) :
    Deontic.Permission213aTitle10Rights p c :=
  ⟨corr213a_claimantED p c h.claimant,
   fun ht => h.chapter61Carve gap_213a_chapter61_claim (corr213a_trainingDE p c ht)⟩



axiom corr214_releasedED (p : Person) (c : ComplaintText) :
    Elements.ReleasedFromActiveCommissionedServiceForRetirement p c →
    Deontic.ReleasedFromActiveServiceForRetirement p c
axiom corr214_priorDE (p : Person) (c : ComplaintText) :
    Deontic.PreviouslyPresentedRetirementFlag p c →
    Elements.PreviouslyPresentedUnitedStatesFlagOnRetirement p c
axiom corr214_presentedDE (p : Person) (c : ComplaintText) :
    Deontic.UnitedStatesFlagPresented p c →
    Elements.UnitedStatesFlagPresentedBySecretary p c




theorem s214_elements_implies_deontic (p : Person) (c : ComplaintText)
    (hn : ¬ Elements.UnitedStatesFlagPresentedBySecretary p c)
    (h : Elements.Section214FlagEntitlement p c) :
    Deontic.Obligation214aFlagBreached p c :=
  ⟨⟨corr214_releasedED p c h.released⟩,
   fun hp => h.notPreviouslyPresented (corr214_priorDE p c hp),
   fun hp => hn (corr214_presentedDE p c hp)⟩

axiom corr214_presentedPE (o : Procedure.CorpsOfficer) (f : Procedure.FlagPresentation)
    (c : ComplaintText) :
    Procedure.FlagPresentedBySecretary f c →
    Elements.UnitedStatesFlagPresentedBySecretary (personOfOfficer o) c
axiom corr214_costPE (o : Procedure.CorpsOfficer) (f : Procedure.FlagPresentation)
    (c : ComplaintText) :
    Procedure.FlagPresentedAtNoCostToRecipient f c →
    ¬ Elements.ChargedCostForFlagPresentation (personOfOfficer o) c



theorem s214_elements_implies_procedure (o : Procedure.CorpsOfficer)
    (f : Procedure.FlagPresentation) (c : ComplaintText)
    (h : Elements.Section214FlagClaim (personOfOfficer o) c) :
    ¬ Procedure.FlagPresentationDue o f c := by
  intro hd
  cases h.theory with
  | notPresented hn => exact hn (corr214_presentedPE o f c hd.presentedBySecretary)
  | chargedCost hc => exact corr214_costPE o f c hd.noCostToRecipient hc

axiom corr214_presentedPD (o : Procedure.CorpsOfficer) (f : Procedure.FlagPresentation)
    (c : ComplaintText) :
    Procedure.FlagPresentedBySecretary f c →
    Deontic.UnitedStatesFlagPresented (personOfOfficer o) c


theorem s214_deontic_implies_procedure (o : Procedure.CorpsOfficer)
    (f : Procedure.FlagPresentation) (c : ComplaintText)
    (h : Deontic.Obligation214aFlagBreached (personOfOfficer o) c) :
    ¬ Procedure.FlagPresentationDue o f c :=
  fun hd => h.2.2 (corr214_presentedPD o f c hd.presentedBySecretary)

axiom corr214_officerEO (p : Person) (c : ComplaintText) :
    Elements.IsCommissionedOfficerOfService p c → Ontology.CorpsMembership p c
axiom corr214_eligibleEO (p : Person) (c : ComplaintText) :
    Elements.ReleasedFromActiveCommissionedServiceForRetirement p c →
    ¬ Elements.PreviouslyPresentedUnitedStatesFlagOnRetirement p c →
    Ontology.IsFlagEligibleRetiringOfficer p c



theorem s214_elements_implies_ontology (p : Person) (c : ComplaintText)
    (h : Elements.Section214FlagEntitlement p c) :
    Ontology.FlagPresentationEligibility p c :=
  ⟨corr214_officerEO p c h.officer,
   corr214_eligibleEO p c h.released h.notPreviouslyPresented⟩



axiom corr215_stateDetailED (p : Person) (c : ComplaintText) :
    Elements.DetailedBySurgeonGeneralToAssistStateOrSubdivision p c →
    Deontic.IsDetailedUnderSection215 p c
axiom corr215_studyDetailED (p : Person) (c : ComplaintText) :
    Elements.DetailedToCongressionalCommitteeOrNonprofitInstitution p c →
    Deontic.IsDetailedUnderSection215 p c



theorem s215_elements_implies_deontic (p : Person) (c : ComplaintText)
    (h : Elements.Section215CreditableDetail p c) :
    Deontic.Obligation215dPay p c := by
  cases h with
  | stateDetail hs => exact ⟨corr215_stateDetailED p c hs.detailed⟩
  | specialStudyDetail hd => exact ⟨corr215_studyDetailED p c hd.detailed⟩

axiom corr215_soleAuthorityPE (p : Person) (c : ComplaintText) :
    Procedure.SecretaryExercisedSoleDeploymentAuthority (detailOf p) c →
    ¬ Elements.DeployedByEntityOtherThanSecretary p c
axiom corr215_exceptionPE (p : Person) (c : ComplaintText) :
    Procedure.DeploymentAuthorityExceptionApplies (detailOf p) c →
    Elements.AssignedToCoastGuardOrDepartmentOfDefense p c ∨
      Elements.NegotiatedAgencyAgreementGovernsDeployment c




theorem s215_elements_implies_procedure (p : Person) (c : ComplaintText)
    (h : Elements.Section215UnlawfulDeploymentClaim p c) :
    ¬ Procedure.ValidEmergencyDeploymentDirection (detailOf p) c := by
  intro hv
  cases hv.authority with
  | inl hs => exact corr215_soleAuthorityPE p c hs h.deployedByOther
  | inr he =>
    cases corr215_exceptionPE p c he with
    | inl hcg => exact h.notCoastGuardOrDefense hcg
    | inr hna => exact h.noNegotiatedAgreement hna

axiom corr215_soleAuthorityPD (p : Person) (c : ComplaintText) :
    Procedure.SecretaryExercisedSoleDeploymentAuthority (detailOf p) c →
    ¬ Deontic.DeployedByOtherThanSecretary p c
axiom corr215_exceptionPD (p : Person) (c : ComplaintText) :
    Procedure.DeploymentAuthorityExceptionApplies (detailOf p) c →
    Deontic.DeploymentAuthorityExclusionApplies p c


theorem s215_deontic_implies_procedure (p : Person) (c : ComplaintText)
    (h : Deontic.Prohibition215eSoleAuthorityViolated p c) :
    ¬ Procedure.ValidEmergencyDeploymentDirection (detailOf p) c := by
  intro hv
  cases hv.authority with
  | inl hs => exact corr215_soleAuthorityPD p c hs h.1.act
  | inr he => exact h.2 (corr215_exceptionPD p c he)



axiom corr217_warED (c : ComplaintText) : Elements.TimeOfWar c → Deontic.IsTimeOfWar c
axiom corr217_emergencyED (c : ComplaintText) :
    Elements.EmergencyInvolvingNationalDefenseProclaimedByPresident c →
    Deontic.PresidentialEmergencyProclaimed c
axiom corr217_declaredED (c : ComplaintText) :
    Elements.PresidentDeclaredCorpsMilitaryServiceByExecutiveOrder c →
    Deontic.CommissionedCorpsDeclaredMilitaryService c



theorem s217_elements_implies_deontic (c : ComplaintText)
    (h : Elements.Section217MilitaryServiceDeclaration c) :
    Deontic.Power217Declaration c := by
  refine ⟨?_, corr217_declaredED c h.executiveOrder⟩
  cases h.trigger with
  | war hw => exact Or.inl (corr217_warED c hw)
  | nationalDefenseEmergency he => exact Or.inr (corr217_emergencyED c he)

axiom corr217_warPD (d : Procedure.EmergencyDeclaration) (c : ComplaintText) :
    Procedure.WarOrProclaimedEmergencyInEffect d c →
    Deontic.IsTimeOfWar c ∨ Deontic.PresidentialEmergencyProclaimed c
axiom corr217_orderPD (d : Procedure.EmergencyDeclaration) (c : ComplaintText) :
    Procedure.ExecutiveOrderDeclaringMilitaryServiceIssued d c →
    Deontic.CommissionedCorpsDeclaredMilitaryService c


theorem s217_procedure_implies_deontic (o : Procedure.CorpsOfficer)
    (d : Procedure.EmergencyDeclaration) (c : ComplaintText)
    (h : Procedure.MilitaryServiceDeclarationInEffect o d c) :
    Deontic.Power217Declaration c :=
  ⟨corr217_warPD d c h.warOrEmergency, corr217_orderPD d c h.executiveOrder⟩

axiom corr217_ucmjEP (p : Person) (d : Procedure.EmergencyDeclaration)
    (c : ComplaintText) :
    Elements.SubjectToUcmjUnderPresidentialRegulations p c →
    Procedure.SubjectToUniformCodeOfMilitaryJustice (officerOf p) d c
axiom corr217_warEP (d : Procedure.EmergencyDeclaration) (c : ComplaintText) :
    Elements.TimeOfWar c ∨ Elements.EmergencyInvolvingNationalDefenseProclaimedByPresident c →
    Procedure.WarOrProclaimedEmergencyInEffect d c
axiom corr217_orderEP (d : Procedure.EmergencyDeclaration) (c : ComplaintText) :
    Elements.PresidentDeclaredCorpsMilitaryServiceByExecutiveOrder c →
    Procedure.ExecutiveOrderDeclaringMilitaryServiceIssued d c
axiom corr217_periodEP (d : Procedure.EmergencyDeclaration) (c : ComplaintText) :
    Elements.WithinPeriodPrescribedByPresident c →
    Procedure.WithinPeriodPrescribedByPresident d c



theorem s217_elements_implies_procedure (p : Person) (d : Procedure.EmergencyDeclaration)
    (c : ComplaintText) (h : Elements.Section217UcmjJurisdiction p c) :
    Procedure.MilitaryServiceDeclarationInEffect (officerOf p) d c := by
  refine ⟨?_, corr217_orderEP d c h.declaration.executiveOrder,
          corr217_periodEP d c h.declaration.withinPeriod,
          corr217_ucmjEP p d c h.prescribedByRegulation⟩
  cases h.declaration.trigger with
  | war hw => exact corr217_warEP d c (Or.inl hw)
  | nationalDefenseEmergency he => exact corr217_warEP d c (Or.inr he)



axiom corr217a_appointedED (p : Person) (ab : Elements.AdvisoryBody) (c : ComplaintText) :
    Elements.AppointedToAdvisoryBodyBySecretary p ab c →
    Deontic.AdvisoryBodyAppointedBySecretary (bodyED ab) c



theorem s217a_elements_implies_deontic (p : Person) (ab : Elements.AdvisoryBody)
    (c : ComplaintText) (h : Elements.Section217aAppointment p ab c) :
    Deontic.Power217aAppointment (bodyED ab) c :=
  corr217a_appointedED p ab c h.appointed

axiom corr217a_bodyEO (ab : Elements.AdvisoryBody) (c : ComplaintText) :
    Elements.AdvisoryBodyAdvisesSecretaryInConnectionWithHisFunctions ab c →
    Ontology.IsSecretarialAdvisoryBody (bodyEO ab) c
axiom corr217a_nonFullTimeEO (p : Person) (c : ComplaintText) :
    ¬ Elements.IsRegularFullTimeEmployeeOfUnitedStates p c →
    Ontology.IsNonFullTimeAdvisoryMember p c
axiom corr217a_compensationEO (p : Person) (ab : Elements.AdvisoryBody)
    (c : ComplaintText) :
    Elements.AttendedAdvisoryBodyMeetingOrEngagedOnItsBusiness p ab c →
    Ontology.IsAdvisoryCouncilMemberEntitledToCompensation p c



theorem s217a_elements_implies_ontology (p : Person) (ab : Elements.AdvisoryBody)
    (c : ComplaintText) (h : Elements.Section217aCompensationEntitlement p ab c) :
    Ontology.AdvisoryBodyMembership (bodyEO ab) p c :=
  ⟨corr217a_bodyEO ab c h.appointment.advisoryPurpose,
   corr217a_nonFullTimeEO p c h.notFullTimeEmployee,
   corr217a_compensationEO p ab c h.service⟩

axiom corr217a_bodyOD (b : Entity) (c : ComplaintText) :
    Ontology.IsSecretarialAdvisoryBody b c →
    Deontic.AdvisoryBodyAppointedBySecretary (bodyOD b) c


theorem s217a_ontology_implies_deontic (b : Entity) (p : Person) (c : ComplaintText)
    (h : Ontology.AdvisoryBodyMembership b p c) :
    Deontic.Power217aAppointment (bodyOD b) c :=
  corr217a_bodyOD b c h.body

axiom corr217a_appointedPD (b : Procedure.AdvisoryBody) (c : ComplaintText) :
    Procedure.AdvisoryCouncilAppointedBySecretary b c →
    Deontic.AdvisoryBodyAppointedBySecretary (bodyOD (bodyPO b)) c


theorem s217a_procedure_implies_deontic (b : Procedure.AdvisoryBody)
    (n : Procedure.Nominee) (c : ComplaintText)
    (h : Procedure.ValidAdvisoryCouncilAppointment b n c) :
    Deontic.Power217aAppointment (bodyOD (bodyPO b)) c :=
  corr217a_appointedPD b c h.appointedBySecretary



axiom corr217a1_phsED (p : Person) (ab : Elements.AdvisoryBody) (c : ComplaintText) :
    Elements.IsAdvisoryCommitteeImplementingPublicHealthServiceAct ab c →
    Deontic.IsAppointmentToCoveredAdvisoryCommittee p c
axiom corr217a1_alcoholED (p : Person) (ab : Elements.AdvisoryBody) (c : ComplaintText) :
    Elements.IsAdvisoryCommitteeImplementingAlcoholAbuseAct ab c →
    Deontic.IsAppointmentToCoveredAdvisoryCommittee p c
axiom corr217a1_consideredED (p : Person) (ab : Elements.AdvisoryBody)
    (c : ComplaintText) :
    Elements.PoliticalAffiliationConsideredInAppointment p ab c →
    Deontic.PoliticalAffiliationConsidered p c



theorem s217a1_elements_implies_deontic (p : Person) (ab : Elements.AdvisoryBody)
    (c : ComplaintText) (h : Elements.Section217a1PoliticalAffiliationClaim p ab c) :
    Deontic.Prohibition217a1PoliticalAffiliationViolated p c := by
  refine ⟨⟨?_⟩, corr217a1_consideredED p ab c h.considered⟩
  cases h.covered with
  | publicHealthServiceAct hp => exact corr217a1_phsED p ab c hp
  | alcoholAbuseAct ha => exact corr217a1_alcoholED p ab c ha

axiom corr217a1_consideredEO (p : Person) (ab : Elements.AdvisoryBody)
    (c : ComplaintText) :
    Elements.PoliticalAffiliationConsideredInAppointment p ab c →
    Ontology.ConsideredPoliticalAffiliationInAppointment p (bodyEO ab) c



theorem s217a1_elements_implies_ontology (p : Person) (ab : Elements.AdvisoryBody)
    (c : ComplaintText) (h : Elements.Section217a1PoliticalAffiliationClaim p ab c) :
    ¬ Ontology.ApoliticalAdvisoryAppointment p (bodyEO ab) c :=
  fun ha => ha.withoutAffiliation (corr217a1_consideredEO p ab c h.considered)

axiom corr217a1_consideredDO (p : Person) (b : Entity) (c : ComplaintText) :
    Deontic.PoliticalAffiliationConsidered p c →
    Ontology.ConsideredPoliticalAffiliationInAppointment p b c



theorem s217a1_ontology_implies_deontic (p : Person) (b : Entity) (c : ComplaintText)
    (h : Ontology.ApoliticalAdvisoryAppointment p b c) :
    ¬ Deontic.Prohibition217a1PoliticalAffiliationViolated p c :=
  fun hv => h.withoutAffiliation (corr217a1_consideredDO p b c hv.2)

axiom corr217a1_apoliticalPE (p : Person) (ab : Elements.AdvisoryBody)
    (c : ComplaintText) :
    Procedure.AppointedWithoutRegardToPoliticalAffiliation (nomineeOf p) c →
    ¬ Elements.PoliticalAffiliationConsideredInAppointment p ab c




theorem s217a1_elements_implies_procedure (p : Person) (ab : Elements.AdvisoryBody)
    (b : Procedure.AdvisoryBody) (c : ComplaintText)
    (h : Elements.Section217a1PoliticalAffiliationClaim p ab c) :
    ¬ Procedure.ValidAdvisoryCouncilAppointment b (nomineeOf p) c :=
  fun hv => corr217a1_apoliticalPE p ab c hv.apolitical h.considered

axiom corr217a1_apoliticalPD (p : Person) (c : ComplaintText) :
    Procedure.AppointedWithoutRegardToPoliticalAffiliation (nomineeOf p) c →
    ¬ Deontic.PoliticalAffiliationConsidered p c


theorem s217a1_deontic_implies_procedure (p : Person) (b : Procedure.AdvisoryBody)
    (c : ComplaintText)
    (h : Deontic.Prohibition217a1PoliticalAffiliationViolated p c) :
    ¬ Procedure.ValidAdvisoryCouncilAppointment b (nomineeOf p) c :=
  fun hv => corr217a1_apoliticalPD p c hv.apolitical h.2

end Proving.USC.T42.Ch6ASchI.Reearn.Bridge
