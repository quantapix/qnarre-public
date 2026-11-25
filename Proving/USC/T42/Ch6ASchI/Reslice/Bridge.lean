




















































































import Proving.USC.T42.Ch6ASchI.Reslice.Elements.Statute
import Proving.USC.T42.Ch6ASchI.Reslice.Deontic.Statute
import Proving.USC.T42.Ch6ASchI.Reslice.Ontology.Statute
import Proving.USC.T42.Ch6ASchI.Reslice.Procedure.Statute
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reslice.Bridge

open Proving.USC.Common






axiom m218ep : Elements.AdvisoryCouncil → Procedure.AdvisoryCouncil

axiom m218po : Procedure.AdvisoryCouncil → Ontology.Council

axiom m218pm : Procedure.CouncilMember → Ontology.CouncilMember

axiom m218od : Ontology.Council → Deontic.Entity


noncomputable def m218eo (co : Elements.AdvisoryCouncil) : Ontology.Council := m218po (m218ep co)

noncomputable def m218pd (co : Procedure.AdvisoryCouncil) : Deontic.Entity := m218od (m218po co)

noncomputable def m218ed (co : Elements.AdvisoryCouncil) : Deontic.Entity := m218pd (m218ep co)


axiom corr218_appointed {co : Elements.AdvisoryCouncil} {c : ComplaintText} :
    Elements.SecretaryAppointedAndOrganizedCouncil co c →
    Procedure.SecretaryAppointedMigrantHealthCouncil (m218ep co) c

axiom corr218_days {co : Elements.AdvisoryCouncil} {c : ComplaintText} :
    Procedure.daysFromJuly291975ToCouncilOrganization (m218ep co) c
      = Elements.daysFromJuly291975ToCouncilOrganization co c

axiom corr218_total {co : Elements.AdvisoryCouncil} {c : ComplaintText} :
    Procedure.councilMemberCount (m218ep co) c = Elements.councilMemberCount co c

axiom corr218_board {co : Elements.AdvisoryCouncil} {c : ComplaintText} :
    Procedure.councilGoverningBoardMemberCount (m218ep co) c
      = Elements.governingBoardMemberCount co c

axiom corr218_served {co : Elements.AdvisoryCouncil} {c : ComplaintText} :
    Procedure.councilBoardMembersServedByCenterCount (m218ep co) c
      = Elements.patientGoverningBoardMemberCount co c

axiom corr218_qualified {co : Elements.AdvisoryCouncil} {c : ComplaintText} :
    Procedure.councilHealthQualifiedMemberCount (m218ep co) c
      = Elements.professionallyQualifiedMemberCount co c






theorem s218_elements_implies_procedure
    {co : Elements.AdvisoryCouncil} {c : ComplaintText} (h : Elements.Section218 co c) :
    Procedure.Section218CouncilConstitution (m218ep co) c := by
  refine ⟨corr218_appointed h.appointedAndOrganized, ?_, ?_⟩
  · show Procedure.daysFromJuly291975ToCouncilOrganization (m218ep co) c ≤ 120
    rw [corr218_days]
    exact h.withinOneHundredTwentyDays
  · refine ⟨?_, ?_, ?_, ?_⟩
    · rw [corr218_total]; exact h.composition.totalMembers
    · rw [corr218_board]; exact h.composition.governingBoardMembers
    · rw [corr218_served]; exact h.composition.patientGoverningBoardMembers
    · rw [corr218_qualified]; exact h.composition.professionallyQualifiedMembers


axiom corr218_isCouncil {co : Procedure.AdvisoryCouncil} {c : ComplaintText} :
    Procedure.SecretaryAppointedMigrantHealthCouncil co c →
    Ontology.IsNationalAdvisoryCouncilOnMigrantHealth (m218po co) c








theorem s218_procedure_implies_ontology_modulo_gaps
    {co : Procedure.AdvisoryCouncil} {m : Procedure.CouncilMember} {c : ComplaintText}
    (h : Procedure.Section218CouncilConstitution co c)
    (gap_seatClass : Ontology.CouncilMemberQualification (m218pm m) c) :
    Ontology.CouncilComposition (m218po co) (m218pm m) c :=
  ⟨corr218_isCouncil h.appointed, gap_seatClass⟩


axiom corr218_addressee {co : Ontology.Council} {c : ComplaintText} :
    Ontology.IsNationalAdvisoryCouncilOnMigrantHealth co c →
    Deontic.AddresseeIsAdvisoryCouncil (m218od co) c


axiom corr218_requirement {co : Ontology.Council} {c : ComplaintText} :
    Ontology.IsNationalAdvisoryCouncilOnMigrantHealth co c →
    Deontic.MigrantHealthCouncilRequirementInEffect218 c






theorem s218_ontology_implies_deontic
    {co : Ontology.Council} {m : Ontology.CouncilMember} {c : ComplaintText}
    (h : Ontology.CouncilComposition co m c) :
    Deontic.Obligation218aAdvise (m218od co) c :=
  ⟨corr218_addressee h.council, corr218_requirement h.council⟩


theorem s218_procedure_implies_deontic
    {co : Procedure.AdvisoryCouncil} {c : ComplaintText}
    (h : Procedure.Section218CouncilConstitution co c) :
    Deontic.Obligation218aAdvise (m218pd co) c :=
  ⟨corr218_addressee (corr218_isCouncil h.appointed),
   corr218_requirement (corr218_isCouncil h.appointed)⟩





theorem s218_elements_implies_ontology_modulo_gaps
    {co : Elements.AdvisoryCouncil} {m : Procedure.CouncilMember} {c : ComplaintText}
    (h : Elements.Section218 co c)
    (gap_seatClass : Ontology.CouncilMemberQualification (m218pm m) c) :
    Ontology.CouncilComposition (m218eo co) (m218pm m) c :=
  s218_procedure_implies_ontology_modulo_gaps (s218_elements_implies_procedure h) gap_seatClass



theorem s218_elements_implies_deontic
    {co : Elements.AdvisoryCouncil} {c : ComplaintText} (h : Elements.Section218 co c) :
    Deontic.Obligation218aAdvise (m218ed co) c :=
  s218_procedure_implies_deontic (s218_elements_implies_procedure h)






axiom m231ep : Elements.Expenditure → Elements.Fund → Procedure.ServiceAndSupplyTransaction

axiom m231pof : Procedure.ServiceAndSupplyTransaction → Ontology.SupplyFund

axiom m231pos : Procedure.ServiceAndSupplyTransaction → Ontology.FundService

axiom phs231o : Ontology.SupplyFund → Deontic.Entity

axiom phs231p : Procedure.ServiceAndSupplyTransaction → Deontic.Entity


axiom corr231_reimbursed {x : Elements.Expenditure} {f : Elements.Fund} {c : ComplaintText} :
    Elements.FundReimbursedFromApplicableAppropriations x f c →
    Procedure.ServiceAndSupplyFundReimbursed (m231ep x f) c

axiom corr231_rate {x : Elements.Expenditure} {f : Elements.Fund} {c : ComplaintText} :
    Elements.ReimbursementRatesIncludeEnumeratedCharges x f c →
    Procedure.ReimbursementRateCoversStatutoryCostComponents (m231ep x f) c












theorem s231_elements_implies_procedure_modulo_gaps
    {x : Elements.Expenditure} {f : Elements.Fund} {c : ComplaintText}
    (h : Elements.Section231 x f c)
    (gap_centralServiceAuthorization :
      Procedure.CentralServiceAuthorizationComplete (m231ep x f) c)
    (gap_reimbursementOccasion : Procedure.ServicesPerformedOrStockFurnished (m231ep x f) c) :
    Procedure.Section231ReimbursementProper (m231ep x f) c :=
  ⟨gap_centralServiceAuthorization,
   Procedure.Section231ReimbursementOccasion.onPerformance gap_reimbursementOccasion
     (corr231_reimbursed h.reimbursed),
   corr231_rate h.ratesProperlyComputed⟩


axiom corr231_isFund {t : Procedure.ServiceAndSupplyTransaction} {c : ComplaintText} :
    Procedure.SurgeonGeneralDeterminedCentralService t c →
    Ontology.IsServiceAndSupplyFund (m231pof t) c

axiom corr231_isCentral {t : Procedure.ServiceAndSupplyTransaction} {c : ComplaintText} :
    Procedure.SurgeonGeneralDeterminedCentralService t c →
    Ontology.IsCentralServiceDeterminedBySurgeonGeneral (m231pos t) c

axiom corr231_costBased {t : Procedure.ServiceAndSupplyTransaction} {c : ComplaintText} :
    Procedure.ReimbursementRateCoversStatutoryCostComponents t c →
    Ontology.IsCostBasedReimbursementRate (m231pof t) c


theorem s231_procedure_implies_ontology
    {t : Procedure.ServiceAndSupplyTransaction} {c : ComplaintText}
    (h : Procedure.Section231ReimbursementProper t c) :
    Ontology.ServiceAndSupplyFundDefinition (m231pof t) (m231pos t) c :=
  ⟨corr231_isFund h.authorized.1,
   Ontology.AuthorizedFundService.centralService (corr231_isCentral h.authorized.1),
   corr231_costBased h.rateProper⟩



axiom corr231_phsAddresseeO {f : Ontology.SupplyFund} {c : ComplaintText} :
    Ontology.IsServiceAndSupplyFund f c → Deontic.AddresseeIsPublicHealthService (phs231o f) c


axiom corr231_conditionO {f : Ontology.SupplyFund} {c : ComplaintText} :
    Ontology.IsCostBasedReimbursementRate f c → Deontic.ServicesPerformedOrStockFurnished231 c


theorem s231_ontology_implies_deontic
    {f : Ontology.SupplyFund} {s : Ontology.FundService} {c : ComplaintText}
    (h : Ontology.ServiceAndSupplyFundDefinition f s c) :
    Deontic.Obligation231 (phs231o f) c :=
  ⟨corr231_phsAddresseeO h.fund, corr231_conditionO h.reimbursement⟩


axiom corr231_phsAddresseeP {t : Procedure.ServiceAndSupplyTransaction} {c : ComplaintText} :
    Procedure.ServiceAndSupplyFundReimbursed t c →
    Deontic.AddresseeIsPublicHealthService (phs231p t) c

axiom corr231_conditionP {t : Procedure.ServiceAndSupplyTransaction} {c : ComplaintText} :
    Procedure.ServiceAndSupplyFundReimbursed t c → Deontic.ServicesPerformedOrStockFurnished231 c




theorem s231_procedure_implies_deontic
    {t : Procedure.ServiceAndSupplyTransaction} {c : ComplaintText}
    (h : Procedure.Section231ReimbursementProper t c) :
    Deontic.Obligation231 (phs231p t) c := by
  have hr : Procedure.ServiceAndSupplyFundReimbursed t c := by
    cases h.occasion with
    | onPerformance _ hr => exact hr
    | inAdvance _ hr => exact hr
  exact ⟨corr231_phsAddresseeP hr, corr231_conditionP hr⟩



theorem s231_elements_implies_ontology_modulo_gaps
    {x : Elements.Expenditure} {f : Elements.Fund} {c : ComplaintText}
    (h : Elements.Section231 x f c)
    (gap_centralServiceAuthorization :
      Procedure.CentralServiceAuthorizationComplete (m231ep x f) c)
    (gap_reimbursementOccasion : Procedure.ServicesPerformedOrStockFurnished (m231ep x f) c) :
    Ontology.ServiceAndSupplyFundDefinition (m231pof (m231ep x f)) (m231pos (m231ep x f)) c :=
  s231_procedure_implies_ontology
    (s231_elements_implies_procedure_modulo_gaps h gap_centralServiceAuthorization
      gap_reimbursementOccasion)



theorem s231_elements_implies_deontic_modulo_gaps
    {x : Elements.Expenditure} {f : Elements.Fund} {c : ComplaintText}
    (h : Elements.Section231 x f c)
    (gap_centralServiceAuthorization :
      Procedure.CentralServiceAuthorizationComplete (m231ep x f) c)
    (gap_reimbursementOccasion : Procedure.ServicesPerformedOrStockFurnished (m231ep x f) c) :
    Deontic.Obligation231 (phs231p (m231ep x f)) c :=
  s231_procedure_implies_deontic
    (s231_elements_implies_procedure_modulo_gaps h gap_centralServiceAuthorization
      gap_reimbursementOccasion)






axiom m233ep : Elements.CivilAction → Procedure.CivilAction

axiom m233fn : Elements.ActOrOmission → Ontology.MedicalFunction

axiom m233dmg : Elements.ActOrOmission → Ontology.Damage


axiom m233pe : Procedure.DeemingApplication → Entity

axiom m233pd : Procedure.DeemingApplication → Deontic.Entity


axiom sec233p : Procedure.DeemingApplication → Person

axiom m233od : Entity → Deontic.Entity


axiom sec233o : Entity → Person


axiom corr233_suit {p : Person} {a : Elements.CivilAction} {c : ComplaintText} :
    Elements.CivilActionBroughtAgainstCoveredPerson a p c →
    Procedure.CivilActionBroughtAgainstDeemedPerson (m233ep a) c

axiom corr233_delivered {p : Person} {a : Elements.CivilAction} {c : ComplaintText} :
    Elements.DefendantDeliveredProcessToSuperiorOrDesignee p a c →
    Procedure.ProcessDeliveredToImmediateSuperiorOrDesignee (m233ep a) c


axiom corr233_timely {p : Person} {a : Elements.CivilAction} {c : ComplaintText} :
    Elements.daysFromServiceToProcessDelivery p a c
        ≤ Elements.deliveryDeadlineDaysSetByAttorneyGeneral p a c →
    Procedure.ProcessDeliveredWithinPrescribedTime (m233ep a) c

axiom corr233_copies {p : Person} {a : Elements.CivilAction} {c : ComplaintText} :
    Elements.ProcessCopiesFurnishedToUSAttorneyAGAndSecretary p a c →
    Procedure.CopiesOfPleadingFurnishedToFederalOfficers (m233ep a) c

axiom corr233_defended {a : Elements.CivilAction} {c : ComplaintText} :
    Elements.AttorneyGeneralDefendedAction a c →
    Procedure.AttorneyGeneralDefendedAction (m233ep a) c





theorem s233_elements_implies_procedure
    {p : Person} {a : Elements.CivilAction} {c : ComplaintText}
    (h : Elements.Section233b p a c) :
    Procedure.Section233FederalDefense (m233ep a) c :=
  ⟨⟨corr233_suit h.actionAgainstCoveredPerson, corr233_delivered h.processDelivered,
    corr233_timely h.timelyDelivery, corr233_copies h.copiesFurnished⟩,
   corr233_defended h.attorneyGeneralDefends⟩


axiom corr233_officer {p : Person} {c : ComplaintText} :
    Elements.IsCommissionedOfficerOrEmployeeOfPHS p c →
    Ontology.IsPublicHealthServiceOfficerOrEmployee p c

axiom corr233_scope {p : Person} {c : ComplaintText} :
    Elements.ActedWithinScopeOfOfficeOrEmployment p c →
    Ontology.ActsWithinScopeOfOfficeOrEmployment p c

axiom corr233_function {act : Elements.ActOrOmission} {c : ComplaintText} :
    Elements.InjuryResultsFromMedicalOrRelatedFunctions act c →
    Ontology.IsMedicalSurgicalDentalOrRelatedFunction (m233fn act) c

axiom corr233_damage {act : Elements.ActOrOmission} {c : ComplaintText} :
    Elements.ClaimIsForPersonalInjuryOrDeathDamage act c →
    Ontology.IsPersonalInjuryDamage (m233dmg act) c




theorem s233_elements_implies_ontology
    {p : Person} {act : Elements.ActOrOmission} {c : ComplaintText}
    (h : Elements.Section233a p act c) :
    Ontology.ExclusiveRemedySubject p (m233fn act) (m233dmg act) c :=
  ⟨corr233_officer h.phsOfficerOrEmployee, corr233_scope h.withinScope,
   corr233_function h.medicalFunctionCausation, corr233_damage h.personalInjuryDamage⟩


axiom corr233_addresseeOfficer {p : Person} {c : ComplaintText} :
    Elements.IsCommissionedOfficerOrEmployeeOfPHS p c →
    Deontic.AddresseeIsPhsOfficerOrEmployee p c

axiom corr233_pending {p : Person} {a : Elements.CivilAction} {c : ComplaintText} :
    Elements.CivilActionBroughtAgainstCoveredPerson a p c →
    Deontic.CivilActionAgainstCoveredPersonPending233 c




theorem s233_elements_implies_deontic
    {p : Person} {act : Elements.ActOrOmission} {a : Elements.CivilAction} {c : ComplaintText}
    (ha : Elements.Section233a p act c) (hb : Elements.Section233b p a c) :
    Deontic.Obligation233bProcess p c :=
  ⟨corr233_addresseeOfficer ha.phsOfficerOrEmployee, corr233_pending hb.actionAgainstCoveredPerson⟩


axiom corr233_riskPolicies {ap : Procedure.DeemingApplication} {c : ComplaintText} :
    Procedure.EntityRiskManagementPoliciesImplemented ap c →
    Ontology.HasMalpracticeRiskReductionPolicies (m233pe ap) c

axiom corr233_credentials {ap : Procedure.DeemingApplication} {c : ComplaintText} :
    Procedure.EntityProfessionalCredentialsVerified ap c →
    Ontology.HasVerifiedPractitionerCredentials (m233pe ap) c

axiom corr233_claims {ap : Procedure.DeemingApplication} {c : ComplaintText} :
    Procedure.EntityClaimsHistoryAcceptable ap c →
    Ontology.HasNoAdverseClaimsHistoryOrHasCooperated (m233pe ap) c

axiom corr233_estimates {ap : Procedure.DeemingApplication} {c : ComplaintText} :
    Procedure.EntityWillCooperateWithAttorneyGeneral ap c →
    Ontology.WillCooperateWithAttorneyGeneralOnEstimates (m233pe ap) c

axiom corr233_approvedPO {ap : Procedure.DeemingApplication} {c : ComplaintText} :
    Procedure.SecretaryApprovedDeemingApplication ap c →
    Ontology.SecretaryApprovedDeemingApplication (m233pe ap) c










theorem s233_procedure_implies_ontology_modulo_gaps
    {ap : Procedure.DeemingApplication} {c : ComplaintText}
    (h : Procedure.Section233DeemingDetermination ap c)
    (gap_publicOrNonprofit : Ontology.IsPublicOrNonprofitPrivateEntity (m233pe ap) c)
    (gap_federallyFunded : Ontology.ReceivesFederalFundsUnderHealthCenterProgram (m233pe ap) c) :
    Ontology.ApprovedDeemedEntity (m233pe ap) c :=
  ⟨⟨gap_publicOrNonprofit, gap_federallyFunded⟩,
   ⟨corr233_riskPolicies h.prerequisites.1, corr233_credentials h.prerequisites.2.1,
    corr233_claims h.prerequisites.2.2.1, corr233_estimates h.prerequisites.2.2.2⟩,
   corr233_approvedPO h.approved⟩


axiom corr233_secAddresseeP {ap : Procedure.DeemingApplication} {c : ComplaintText} :
    Procedure.SecretaryApprovedDeemingApplication ap c →
    Deontic.AddresseeIsSecretary (sec233p ap) c

axiom corr233_applicationDP {ap : Procedure.DeemingApplication} {c : ComplaintText} :
    Procedure.DeemingApplicationSubmittedToSecretary ap c →
    Deontic.SubmittedConformingDeemingApplication233 (m233pd ap) c

axiom corr233_riskDP {ap : Procedure.DeemingApplication} {c : ComplaintText} :
    Procedure.EntityRiskManagementPoliciesImplemented ap c →
    Deontic.HasMalpracticeRiskPoliciesAndProcedures233 (m233pd ap) c

axiom corr233_credDP {ap : Procedure.DeemingApplication} {c : ComplaintText} :
    Procedure.EntityProfessionalCredentialsVerified ap c →
    Deontic.HasVerifiedPractitionerCredentials233 (m233pd ap) c

axiom corr233_claimsDP {ap : Procedure.DeemingApplication} {c : ComplaintText} :
    Procedure.EntityClaimsHistoryAcceptable ap c →
    Deontic.HasCleanOrCooperativeClaimsHistory233 (m233pd ap) c

axiom corr233_estDP {ap : Procedure.DeemingApplication} {c : ComplaintText} :
    Procedure.EntityWillCooperateWithAttorneyGeneral ap c →
    Deontic.WillCooperateWithClaimsEstimate233 (m233pd ap) c

axiom corr233_deadlineDP {ap : Procedure.DeemingApplication} {c : ComplaintText} :
    Procedure.SecretaryDeterminedWithinThirtyDays ap c →
    Deontic.DeemingApplicationApprovableDeadline233 (m233pd ap) c






theorem s233_procedure_implies_deontic_modulo_gaps
    {ap : Procedure.DeemingApplication} {c : ComplaintText}
    (h : Procedure.Section233DeemingDetermination ap c)
    (gap_fundedEntity : Deontic.IsFederallyFundedHealthCenterEntity233 (m233pd ap) c) :
    Deontic.Power233g (sec233p ap) (m233pd ap) c :=
  ⟨corr233_secAddresseeP h.approved,
   ⟨gap_fundedEntity, corr233_applicationDP h.applied,
    corr233_riskDP h.prerequisites.1, corr233_credDP h.prerequisites.2.1,
    corr233_claimsDP h.prerequisites.2.2.1, corr233_estDP h.prerequisites.2.2.2,
    corr233_deadlineDP h.timely⟩⟩


axiom corr233_secAddresseeO {e : Entity} {c : ComplaintText} :
    Ontology.SecretaryApprovedDeemingApplication e c → Deontic.AddresseeIsSecretary (sec233o e) c

axiom corr233_fundedO {e : Entity} {c : ComplaintText} :
    Ontology.ReceivesFederalFundsUnderHealthCenterProgram e c →
    Deontic.IsFederallyFundedHealthCenterEntity233 (m233od e) c

axiom corr233_applicationDO {e : Entity} {c : ComplaintText} :
    Ontology.SecretaryApprovedDeemingApplication e c →
    Deontic.SubmittedConformingDeemingApplication233 (m233od e) c

axiom corr233_riskDO {e : Entity} {c : ComplaintText} :
    Ontology.HasMalpracticeRiskReductionPolicies e c →
    Deontic.HasMalpracticeRiskPoliciesAndProcedures233 (m233od e) c

axiom corr233_credDO {e : Entity} {c : ComplaintText} :
    Ontology.HasVerifiedPractitionerCredentials e c →
    Deontic.HasVerifiedPractitionerCredentials233 (m233od e) c

axiom corr233_claimsDO {e : Entity} {c : ComplaintText} :
    Ontology.HasNoAdverseClaimsHistoryOrHasCooperated e c →
    Deontic.HasCleanOrCooperativeClaimsHistory233 (m233od e) c

axiom corr233_estDO {e : Entity} {c : ComplaintText} :
    Ontology.WillCooperateWithAttorneyGeneralOnEstimates e c →
    Deontic.WillCooperateWithClaimsEstimate233 (m233od e) c







theorem s233_ontology_implies_deontic_modulo_gaps
    {e : Entity} {c : ComplaintText}
    (h : Ontology.ApprovedDeemedEntity e c)
    (gap_transferMade : Deontic.DeemingApplicationApprovableDeadline233 (m233od e) c) :
    Deontic.Power233g (sec233o e) (m233od e) c :=
  ⟨corr233_secAddresseeO h.approved,
   ⟨corr233_fundedO h.described.federallyFunded, corr233_applicationDO h.approved,
    corr233_riskDO h.eligible.riskPolicies, corr233_credDO h.eligible.credentialsChecked,
    corr233_claimsDO h.eligible.claimsHistory, corr233_estDO h.eligible.willCooperate,
    gap_transferMade⟩⟩






axiom m234ep : Person → Elements.ActOrOmission → Elements.EmergencyDeclaration →
    Procedure.EmergencyResponse

axiom m234pohp : Procedure.EmergencyResponse → Ontology.HealthCarePractitioner

axiom m234pos : Procedure.EmergencyResponse → Ontology.HealthService

axiom m234ohp : Ontology.HealthCarePractitioner → Person


axiom corr234_enrolled {p : Person} {act : Elements.ActOrOmission}
    {ed : Elements.EmergencyDeclaration} {c : ComplaintText} :
    Elements.QualifyingCorpsMembership234 p c →
    Procedure.ProfessionalEnrolledInReserveCorpsOrEsarVhp (m234ep p act ed) c

axiom corr234_phe {p : Person} {act : Elements.ActOrOmission}
    {ed : Elements.EmergencyDeclaration} {c : ComplaintText} :
    Elements.RespondingToDeclaredPublicHealthEmergency p ed c →
    Procedure.PublicHealthEmergencyDeterminationInEffect (m234ep p act ed) c

axiom corr234_pres {p : Person} {act : Elements.ActOrOmission}
    {ed : Elements.EmergencyDeclaration} {c : ComplaintText} :
    Elements.RespondingToPresidentiallyDeclaredMajorDisasterOrEmergency p ed c →
    Procedure.MajorDisasterOrPresidentialEmergencyDeclared (m234ep p act ed) c

axiom corr234_withinPeriod {p : Person} {act : Elements.ActOrOmission}
    {ed : Elements.EmergencyDeclaration} {c : ComplaintText} :
    Elements.ActOrOmissionDuringInitialDeclarationPeriod act ed c →
    Procedure.ActOrOmissionWithinInitialPeriod (m234ep p act ed) c

axiom corr234_related {p : Person} {act : Elements.ActOrOmission}
    {ed : Elements.EmergencyDeclaration} {c : ComplaintText} :
    Elements.ActOrOmissionRelatedToEmergencyTreatment act ed c →
    Procedure.ActOrOmissionRelatedToEmergencyTreatment (m234ep p act ed) c

axiom corr234_state {p : Person} {act : Elements.ActOrOmission}
    {ed : Elements.EmergencyDeclaration} {c : ComplaintText} :
    Elements.ActOrOmissionInDeclaredState act ed c →
    Procedure.ActOrOmissionOccurredInCoveredState (m234ep p act ed) c

axiom corr234_capacity {p : Person} {act : Elements.ActOrOmission}
    {ed : Elements.EmergencyDeclaration} {c : ComplaintText} :
    Elements.ActedInMedicalReserveCorpsOrESARVHPCapacity p act c →
    Procedure.ActedInReserveCorpsOrEsarVhpCapacity (m234ep p act ed) c

axiom corr234_licScope {p : Person} {act : Elements.ActOrOmission}
    {ed : Elements.EmergencyDeclaration} {c : ComplaintText} :
    Elements.ServicesWithinScopeOfStateLicensure p act c →
    Procedure.ServicesWithinScopeOfLicensure (m234ep p act ed) c

axiom corr234_authorized {p : Person} {act : Elements.ActOrOmission}
    {ed : Elements.EmergencyDeclaration} {c : ComplaintText} :
    Elements.StateAuthorizedDeploymentPriorToActOrOmission p ed c →
    Procedure.StateAuthorizedDeploymentOfVolunteerSystem (m234ep p act ed) c



axiom corr234_authFirst {p : Person} {act : Elements.ActOrOmission}
    {ed : Elements.EmergencyDeclaration} {c : ComplaintText} :
    Elements.StateAuthorizedDeploymentPriorToActOrOmission p ed c →
    Procedure.DeploymentAuthorizationPrecededActOrOmission (m234ep p act ed) c

axiom corr234_temporal {p : Person} {act : Elements.ActOrOmission}
    {ed : Elements.EmergencyDeclaration} {c : ComplaintText} :
    Elements.ActOrOmissionOnOrAfterSection234EffectiveDate act c →
    Procedure.ClaimWithinSectionTemporalScope (m234ep p act ed) c








theorem s234_elements_implies_procedure_modulo_gaps
    {p : Person} {act : Elements.ActOrOmission} {ed : Elements.EmergencyDeclaration}
    {c : ComplaintText} (h : Elements.Section234 p act ed c)
    (gap_initialPeriodCap :
      Procedure.EmergencyInitialPeriodWithinNinetyDays (m234ep p act ed) c) :
    Procedure.Section234StateLawExclusivity (m234ep p act ed) c := by
  refine ⟨corr234_enrolled h.corpsMembership, ?_,
    corr234_withinPeriod h.duringInitialPeriod,
    corr234_related h.relatedToEmergencyTreatment,
    corr234_state h.inDeclaredState,
    corr234_capacity h.inCorpsCapacity,
    corr234_licScope h.withinLicensureScope,
    corr234_authorized h.priorStateAuthorization,
    corr234_authFirst h.priorStateAuthorization,
    corr234_temporal h.effectiveDateReach⟩
  cases h.emergencyResponse with
  | publicHealthEmergency hh _ =>
      exact Procedure.Section234EmergencyBasis.publicHealthEmergency
        (corr234_phe hh) gap_initialPeriodCap
  | presidentialDeclaration hh =>
      exact Procedure.Section234EmergencyBasis.presidentialDeclaration (corr234_pres hh)


axiom corr234_credentialed {e : Procedure.EmergencyResponse} {c : ComplaintText} :
    Procedure.ServicesWithinScopeOfLicensure e c →
    Ontology.IsLicensedRegisteredOrCertifiedToProvideHealthCareServices (m234pohp e) c


axiom corr234_provider {e : Procedure.EmergencyResponse} {c : ComplaintText} :
    Procedure.ProfessionalEnrolledInReserveCorpsOrEsarVhp e c →
    Ontology.IsProvidedByOrUnderSupervisionOfHealthCareProfessional (m234pos e) c

axiom corr234_registry {e : Procedure.EmergencyResponse} {c : ComplaintText} :
    Procedure.ProfessionalEnrolledInReserveCorpsOrEsarVhp e c →
    Ontology.EmergencyRegistryMembership (m234pohp e) c

axiom corr234_respondingO {e : Procedure.EmergencyResponse} {c : ComplaintText} :
    Procedure.Section234EmergencyBasis e c → Ontology.EmergencyResponseTrigger (m234pohp e) c


axiom corr234_timelyRelated {e : Procedure.EmergencyResponse} {c : ComplaintText} :
    Procedure.ActOrOmissionWithinInitialPeriod e c →
    Procedure.ActOrOmissionRelatedToEmergencyTreatment e c →
    Ontology.ActOrOmissionWithinInitialPeriodAndEmergencyRelated (m234pohp e) c

axiom corr234_inState {e : Procedure.EmergencyResponse} {c : ComplaintText} :
    Procedure.ActOrOmissionOccurredInCoveredState e c →
    Ontology.ActOrOmissionInDeterminationOrDeclarationState (m234pohp e) c

axiom corr234_inCapacityO {e : Procedure.EmergencyResponse} {c : ComplaintText} :
    Procedure.ActedInReserveCorpsOrEsarVhpCapacity e c →
    Ontology.ActedInCorpsOrRegistryCapacity (m234pohp e) c

axiom corr234_scopeO {e : Procedure.EmergencyResponse} {c : ComplaintText} :
    Procedure.ServicesWithinScopeOfLicensure e c →
    Ontology.ActedWithinScopeOfLicenseRegistrationOrCertification (m234pohp e) c

axiom corr234_authorizedO {e : Procedure.EmergencyResponse} {c : ComplaintText} :
    Procedure.StateAuthorizedDeploymentOfVolunteerSystem e c →
    Ontology.HadPriorStateDeploymentAuthorization (m234pohp e) c






theorem s234_procedure_implies_ontology_modulo_gaps
    {e : Procedure.EmergencyResponse} {c : ComplaintText}
    (h : Procedure.Section234StateLawExclusivity e c)
    (gap_servicePurpose : Ontology.HealthCareServicePurpose (m234pos e) c) :
    Ontology.CoveredEmergencyHealthProfessional (m234pohp e) (m234pos e) c :=
  ⟨⟨corr234_credentialed h.withinScope, ⟨corr234_provider h.enrolled, gap_servicePurpose⟩⟩,
   corr234_registry h.enrolled, corr234_respondingO h.basis,
   corr234_timelyRelated h.withinPeriod h.emergencyRelated,
   corr234_inState h.inCoveredState, corr234_inCapacityO h.inCapacity,
   corr234_scopeO h.withinScope, corr234_authorizedO h.authorized⟩


axiom corr234_addresseeD {hp : Ontology.HealthCarePractitioner} {c : ComplaintText} :
    Ontology.EmergencyRegistryMembership hp c →
    Deontic.AddresseeIsVolunteerEmergencyHealthProfessional (m234ohp hp) c

axiom corr234_respondingD {hp : Ontology.HealthCarePractitioner} {c : ComplaintText} :
    Ontology.EmergencyResponseTrigger hp c →
    Deontic.RespondingToDeclaredEmergency234 (m234ohp hp) c

axiom corr234_scopeD {hp : Ontology.HealthCarePractitioner} {c : ComplaintText} :
    Ontology.ActedWithinScopeOfLicenseRegistrationOrCertification hp c →
    Deontic.AllegedActWithinEmergencyResponseScope234 (m234ohp hp) c

axiom corr234_authorizedD {hp : Ontology.HealthCarePractitioner} {c : ComplaintText} :
    Ontology.HadPriorStateDeploymentAuthorization hp c →
    Deontic.PriorStateDeploymentAuthorization234 (m234ohp hp) c






theorem s234_ontology_implies_deontic_modulo_gaps
    {hp : Ontology.HealthCarePractitioner} {s : Ontology.HealthService} {c : ComplaintText}
    (h : Ontology.CoveredEmergencyHealthProfessional hp s c)
    (gap_effectiveDate : Deontic.ActOccurredOnOrAfterEffectiveDate234 (m234ohp hp) c) :
    Deontic.Permission234a (m234ohp hp) c :=
  ⟨corr234_addresseeD h.registry,
   ⟨corr234_respondingD h.responding, corr234_scopeD h.withinScope,
    corr234_authorizedD h.authorized, gap_effectiveDate⟩⟩


theorem s234_procedure_implies_deontic_modulo_gaps
    {e : Procedure.EmergencyResponse} {c : ComplaintText}
    (h : Procedure.Section234StateLawExclusivity e c)
    (gap_servicePurpose : Ontology.HealthCareServicePurpose (m234pos e) c)
    (gap_effectiveDate : Deontic.ActOccurredOnOrAfterEffectiveDate234 (m234ohp (m234pohp e)) c) :
    Deontic.Permission234a (m234ohp (m234pohp e)) c :=
  s234_ontology_implies_deontic_modulo_gaps
    (s234_procedure_implies_ontology_modulo_gaps h gap_servicePurpose) gap_effectiveDate


theorem s234_elements_implies_ontology_modulo_gaps
    {p : Person} {act : Elements.ActOrOmission} {ed : Elements.EmergencyDeclaration}
    {c : ComplaintText} (h : Elements.Section234 p act ed c)
    (gap_initialPeriodCap :
      Procedure.EmergencyInitialPeriodWithinNinetyDays (m234ep p act ed) c)
    (gap_servicePurpose : Ontology.HealthCareServicePurpose (m234pos (m234ep p act ed)) c) :
    Ontology.CoveredEmergencyHealthProfessional
      (m234pohp (m234ep p act ed)) (m234pos (m234ep p act ed)) c :=
  s234_procedure_implies_ontology_modulo_gaps
    (s234_elements_implies_procedure_modulo_gaps h gap_initialPeriodCap) gap_servicePurpose


theorem s234_elements_implies_deontic_modulo_gaps
    {p : Person} {act : Elements.ActOrOmission} {ed : Elements.EmergencyDeclaration}
    {c : ComplaintText} (h : Elements.Section234 p act ed c)
    (gap_initialPeriodCap :
      Procedure.EmergencyInitialPeriodWithinNinetyDays (m234ep p act ed) c)
    (gap_servicePurpose : Ontology.HealthCareServicePurpose (m234pos (m234ep p act ed)) c)
    (gap_effectiveDate :
      Deontic.ActOccurredOnOrAfterEffectiveDate234 (m234ohp (m234pohp (m234ep p act ed))) c) :
    Deontic.Permission234a (m234ohp (m234pohp (m234ep p act ed))) c :=
  s234_ontology_implies_deontic_modulo_gaps
    (s234_elements_implies_ontology_modulo_gaps h gap_initialPeriodCap gap_servicePurpose)
    gap_effectiveDate






axiom m235ep : Elements.Regulation → Elements.Project → Procedure.MultigrantProject

axiom m235popr : Procedure.MultigrantProject → Ontology.Project

axiom m235popg : Procedure.MultigrantProject → Ontology.GrantProgram

axiom m235pou : Procedure.MultigrantProject → Ontology.AdministrativeUnit

axiom sec235p : Procedure.MultigrantProject → Person


axiom corr235_multigrant {reg : Elements.Regulation} {proj : Elements.Project}
    {c : ComplaintText} :
    Elements.GrantsSoughtOrMadeUnderTwoOrMorePrograms proj c →
    Procedure.GrantsSoughtUnderTwoOrMorePrograms (m235ep reg proj) c


axiom corr235_regs {reg : Elements.Regulation} {proj : Elements.Project} {c : ComplaintText} :
    Elements.RegulationFacilitatesAdministrationOrExpeditesPurposes reg proj c →
    Procedure.ConsolidationRegulationsPromulgated (m235ep reg proj) c

axiom corr235_waiverBack {reg : Elements.Regulation} {proj : Elements.Project}
    {c : ComplaintText} :
    Procedure.StatutoryRequirementWaivedOrSuspended (m235ep reg proj) c →
    Elements.RegulationWaivesOrSuspendsStatutoryRequirement reg proj c









theorem s235_elements_implies_procedure_modulo_gaps
    {reg : Elements.Regulation} {proj : Elements.Project} {c : ComplaintText}
    (h : Elements.Section235 reg proj c)
    (gap_singleUnit : Procedure.SingleAdministrativeUnitPerformsFunctions (m235ep reg proj) c)
    (gap_burdenReduced : Procedure.ApplicationAndReportingBurdenReduced (m235ep reg proj) c)
    (gap_uniform : Procedure.DuplicativeRequirementsMadeUniform (m235ep reg proj) c) :
    Procedure.Section235ConsolidatedAdministration (m235ep reg proj) c :=
  ⟨corr235_multigrant h.multipleProgramGrants, corr235_regs h.statutoryPurpose,
   gap_singleUnit, gap_burdenReduced, gap_uniform,
   fun hw => h.noProhibitedWaiver (corr235_waiverBack hw)⟩


axiom corr235_coveredProgram {pr : Procedure.MultigrantProject} {c : ComplaintText} :
    Procedure.GrantsSoughtUnderTwoOrMorePrograms pr c →
    Ontology.IsProgramCoveredByMultigrantAdministration (m235popg pr) c

axiom corr235_singleProject {pr : Procedure.MultigrantProject} {c : ComplaintText} :
    Procedure.GrantsSoughtUnderTwoOrMorePrograms pr c →
    Ontology.IsSingleProjectWithGrantsUnderTwoOrMorePrograms (m235popr pr) c

axiom corr235_unit {pr : Procedure.MultigrantProject} {c : ComplaintText} :
    Procedure.SingleAdministrativeUnitPerformsFunctions pr c →
    Ontology.IsUnitChargedWithAdministrationOfCoveredProgram (m235pou pr) c


theorem s235_procedure_implies_ontology
    {pr : Procedure.MultigrantProject} {c : ComplaintText}
    (h : Procedure.Section235ConsolidatedAdministration pr c) :
    Ontology.MultigrantProjectAdministration (m235popr pr) (m235popg pr) (m235pou pr) c :=
  ⟨corr235_coveredProgram h.multigrant, corr235_singleProject h.multigrant,
   Ontology.SingleAdministrativeUnitBasis.administersCoveredProgram (corr235_unit h.singleUnit)⟩


axiom corr235_secAddresseeP {pr : Procedure.MultigrantProject} {c : ComplaintText} :
    Procedure.ConsolidationRegulationsPromulgated pr c →
    Deontic.AddresseeIsSecretary (sec235p pr) c

axiom corr235_conditionP {pr : Procedure.MultigrantProject} {c : ComplaintText} :
    Procedure.GrantsSoughtUnderTwoOrMorePrograms pr c →
    Deontic.SingleProjectUnderMultiplePrograms235 c


theorem s235_procedure_implies_deontic
    {pr : Procedure.MultigrantProject} {c : ComplaintText}
    (h : Procedure.Section235ConsolidatedAdministration pr c) :
    Deontic.Power235 (sec235p pr) c :=
  ⟨corr235_secAddresseeP h.regulations, corr235_conditionP h.multigrant⟩


axiom corr235_conditionO {pr : Ontology.Project} {c : ComplaintText} :
    Ontology.IsSingleProjectWithGrantsUnderTwoOrMorePrograms pr c →
    Deontic.SingleProjectUnderMultiplePrograms235 c






theorem s235_ontology_implies_deontic_modulo_gaps
    {pr : Ontology.Project} {pg : Ontology.GrantProgram} {u : Ontology.AdministrativeUnit}
    {p : Person} {c : ComplaintText}
    (h : Ontology.MultigrantProjectAdministration pr pg u c)
    (gap_secretaryAddressee : Deontic.AddresseeIsSecretary p c) :
    Deontic.Power235 p c :=
  ⟨gap_secretaryAddressee, corr235_conditionO h.singleProject⟩


theorem s235_elements_implies_ontology_modulo_gaps
    {reg : Elements.Regulation} {proj : Elements.Project} {c : ComplaintText}
    (h : Elements.Section235 reg proj c)
    (gap_singleUnit : Procedure.SingleAdministrativeUnitPerformsFunctions (m235ep reg proj) c)
    (gap_burdenReduced : Procedure.ApplicationAndReportingBurdenReduced (m235ep reg proj) c)
    (gap_uniform : Procedure.DuplicativeRequirementsMadeUniform (m235ep reg proj) c) :
    Ontology.MultigrantProjectAdministration
      (m235popr (m235ep reg proj)) (m235popg (m235ep reg proj))
      (m235pou (m235ep reg proj)) c :=
  s235_procedure_implies_ontology
    (s235_elements_implies_procedure_modulo_gaps h gap_singleUnit gap_burdenReduced gap_uniform)


theorem s235_elements_implies_deontic_modulo_gaps
    {reg : Elements.Regulation} {proj : Elements.Project} {c : ComplaintText}
    (h : Elements.Section235 reg proj c)
    (gap_singleUnit : Procedure.SingleAdministrativeUnitPerformsFunctions (m235ep reg proj) c)
    (gap_burdenReduced : Procedure.ApplicationAndReportingBurdenReduced (m235ep reg proj) c)
    (gap_uniform : Procedure.DuplicativeRequirementsMadeUniform (m235ep reg proj) c) :
    Deontic.Power235 (sec235p (m235ep reg proj)) c :=
  s235_procedure_implies_deontic
    (s235_elements_implies_procedure_modulo_gaps h gap_singleUnit gap_burdenReduced gap_uniform)






axiom m236ep : Elements.Board → Procedure.OrphanProductsBoard

axiom m236po : Procedure.OrphanProductsBoard → Ontology.OrphanProductsBoard

axiom m236od : Ontology.OrphanProductsBoard → Deontic.Entity


noncomputable def m236pd (b : Procedure.OrphanProductsBoard) : Deontic.Entity :=
  m236od (m236po b)

noncomputable def m236ed (b : Elements.Board) : Deontic.Entity := m236pd (m236ep b)

noncomputable def m236eo (b : Elements.Board) : Ontology.OrphanProductsBoard :=
  m236po (m236ep b)


axiom corr236_constituted {bd : Elements.Board} {c : ComplaintText} :
    Elements.OrphanProductsBoardEstablishedInDepartment bd c →
    Procedure.OrphanProductsBoardConstituted (m236ep bd) c

axiom corr236_consulted {bd : Elements.Board} {c : ComplaintText} :
    Elements.BoardConsultedInterestedPersonsWithOralViewOpportunity bd c →
    Procedure.BoardAffordedOpportunityForOralViews (m236ep bd) c

axiom corr236_submitted {bd : Elements.Board} {c : ComplaintText} :
    Elements.AnnualReportSubmittedByJune1 bd c →
    Procedure.AnnualReportSubmittedToCongressionalCommittees (m236ep bd) c


axiom corr236_byDeadline {bd : Elements.Board} {c : ComplaintText} :
    Elements.AnnualReportSubmittedByJune1 bd c →
    Procedure.AnnualReportSubmittedByJuneFirst (m236ep bd) c

axiom corr236_components {bd : Elements.Board} {c : ComplaintText} :
    Elements.AnnualReportIncludesComponentAgencyReports bd c →
    Procedure.ComponentAgencyReportsFurnishedForInclusion (m236ep bd) c

axiom corr236_contents {bd : Elements.Board} {c : ComplaintText} :
    Elements.AnnualReportContainsRequiredContents bd c →
    Procedure.AnnualReportContainsStatutoryContents (m236ep bd) c









theorem s236_elements_implies_procedure_modulo_gaps
    {bd : Elements.Board} {c : ComplaintText} (h : Elements.Section236 bd c)
    (gap_precedingYear : Procedure.AnnualReportCoversPrecedingCalendarYear (m236ep bd) c) :
    Procedure.Section236AnnualReporting (m236ep bd) c :=
  ⟨corr236_constituted h.constitution.established,
   corr236_consulted h.consultation,
   corr236_submitted h.annualReport.timely,
   corr236_byDeadline h.annualReport.timely,
   gap_precedingYear,
   corr236_components h.annualReport.componentReports,
   corr236_contents h.annualReport.requiredContents⟩


axiom corr236_isBoard {b : Procedure.OrphanProductsBoard} {c : ComplaintText} :
    Procedure.OrphanProductsBoardConstituted b c → Ontology.IsOrphanProductsBoard (m236po b) c







theorem s236_procedure_implies_ontology_modulo_gaps
    {b : Procedure.OrphanProductsBoard} {m : Ontology.BoardMember} {c : ComplaintText}
    (h : Procedure.Section236AnnualReporting b c)
    (gap_seatClass : Ontology.OrphanProductsBoardMember m c) :
    Ontology.OrphanProductsBoardComposition (m236po b) m c :=
  ⟨corr236_isBoard h.constituted, gap_seatClass⟩


axiom corr236_addresseeO {b : Ontology.OrphanProductsBoard} {c : ComplaintText} :
    Ontology.IsOrphanProductsBoard b c → Deontic.AddresseeIsOrphanProductsBoard (m236od b) c

axiom corr236_conditionO {b : Ontology.OrphanProductsBoard} {c : ComplaintText} :
    Ontology.IsOrphanProductsBoard b c → Deontic.OrphanProductsBoardConstituted236 (m236od b) c




theorem s236_ontology_implies_deontic
    {b : Ontology.OrphanProductsBoard} {m : Ontology.BoardMember} {c : ComplaintText}
    (h : Ontology.OrphanProductsBoardComposition b m c) :
    Deontic.Obligation236c (m236od b) c :=
  ⟨corr236_addresseeO h.board, corr236_conditionO h.board⟩


theorem s236_procedure_implies_deontic
    {b : Procedure.OrphanProductsBoard} {c : ComplaintText}
    (h : Procedure.Section236AnnualReporting b c) :
    Deontic.Obligation236c (m236pd b) c :=
  ⟨corr236_addresseeO (corr236_isBoard h.constituted),
   corr236_conditionO (corr236_isBoard h.constituted)⟩




theorem s236_elements_implies_deontic
    {bd : Elements.Board} {c : ComplaintText} (h : Elements.Section236 bd c) :
    Deontic.Obligation236c (m236ed bd) c :=
  ⟨corr236_addresseeO (corr236_isBoard (corr236_constituted h.constitution.established)),
   corr236_conditionO (corr236_isBoard (corr236_constituted h.constitution.established))⟩



theorem s236_elements_implies_ontology_modulo_gaps
    {bd : Elements.Board} {m : Ontology.BoardMember} {c : ComplaintText}
    (h : Elements.Section236 bd c)
    (gap_seatClass : Ontology.OrphanProductsBoardMember m c) :
    Ontology.OrphanProductsBoardComposition (m236eo bd) m c :=
  ⟨corr236_isBoard (corr236_constituted h.constitution.established), gap_seatClass⟩






axiom m237ep : Person → Elements.ExpertService → Procedure.ServiceAppointment

axiom m237posv : Procedure.ServiceAppointment → Ontology.BiomedicalService

axiom m237eosv : Elements.ExpertService → Ontology.BiomedicalService

axiom m237eom : Person → Ontology.ServiceMember


axiom sec237e : Elements.ExpertService → Person

axiom sec237p : Procedure.ServiceAppointment → Person


axiom corr237_appointed {p : Person} {s : Elements.ExpertService} {c : ComplaintText} :
    Elements.AppointedBySecretaryWithoutRegardToTitle5 p s c →
    Procedure.SecretaryAppointedMemberToConteService (m237ep p s) c

axiom corr237_degree {p : Person} {s : Elements.ExpertService} {c : ComplaintText} :
    Elements.QualifyingDegree237b p c →
    Procedure.AppointeeHoldsQualifyingDoctoralOrMastersDegree (m237ep p s) c

axiom corr237_gs15 {p : Person} {s : Elements.ExpertService} {c : ComplaintText} :
    Elements.MeetsOPMQualificationStandardsForGS15 p c →
    Procedure.AppointeeMeetsGeneralScheduleFifteenQualificationStandards (m237ep p s) c

axiom corr237_count {p : Person} {s : Elements.ExpertService} {c : ComplaintText} :
    Procedure.conteServiceMemberCount (m237ep p s) c = Elements.serviceMemberCount s c

axiom corr237_appraisal {p : Person} {s : Elements.ExpertService} {c : ComplaintText} :
    Elements.PerformanceAppraisalSystemProvidesSystematicAppraisal s c →
    Procedure.PerformanceAppraisalSystemEstablished (m237ep p s) c




theorem s237_elements_implies_procedure
    {p : Person} {s : Elements.ExpertService} {c : ComplaintText}
    (h : Elements.Section237 p s c) :
    Procedure.Section237ServiceAppointment (m237ep p s) c := by
  refine ⟨corr237_appointed h.appointment.appointedBySecretary,
    ⟨corr237_degree h.appointment.degree, corr237_gs15 h.appointment.opmStandards⟩, ?_,
    corr237_appraisal h.appraisalSystem.systematicAppraisal⟩
  show Procedure.conteServiceMemberCount (m237ep p s) c ≤ 2000
  rw [corr237_count]
  exact h.establishment.membershipWithinCap


axiom corr237_isService {s : Elements.ExpertService} {c : ComplaintText} :
    Elements.ConteServiceEstablishedInPublicHealthService s c →
    Ontology.IsSeniorBiomedicalResearchAndProductAssessmentService (m237eosv s) c

axiom corr237_ceilingE {s : Elements.ExpertService} {c : ComplaintText} :
    Ontology.membersInService (m237eosv s) c = Elements.serviceMemberCount s c

axiom corr237_systematic {s : Elements.ExpertService} {c : ComplaintText} :
    Elements.PerformanceAppraisalSystemProvidesSystematicAppraisal s c →
    Ontology.ProvidesSystematicPerformanceAppraisal (m237eosv s) c

axiom corr237_encourages {s : Elements.ExpertService} {c : ComplaintText} :
    Elements.PerformanceAppraisalSystemEncouragesExcellence s c →
    Ontology.EncouragesExcellenceInPerformance (m237eosv s) c


theorem s237_elements_implies_ontology
    {p : Person} {s : Elements.ExpertService} {c : ComplaintText}
    (h : Elements.Section237 p s c) :
    Ontology.ConteServiceDefinition (m237eosv s) c := by
  refine ⟨corr237_isService h.establishment.establishedInPublicHealthService, ?_,
    corr237_systematic h.appraisalSystem.systematicAppraisal,
    corr237_encourages h.appraisalSystem.encouragesExcellence⟩
  show Ontology.membersInService (m237eosv s) c ≤ 2000
  rw [corr237_ceilingE]
  exact h.establishment.membershipWithinCap


axiom corr237_outstanding {p : Person} {c : ComplaintText} :
    Elements.IsOutstandingInBiomedicalOrProductAssessmentField p c →
    Ontology.IsOutstandingInBiomedicalOrProductAssessmentField (m237eom p) c

axiom corr237_degreeO {p : Person} {c : ComplaintText} :
    Elements.QualifyingDegree237b p c → Ontology.QualifyingAdvancedDegree (m237eom p) c

axiom corr237_gsO {p : Person} {c : ComplaintText} :
    Elements.MeetsOPMQualificationStandardsForGS15 p c →
    Ontology.MeetsGradeFifteenQualificationStandards (m237eom p) c








theorem s237_elements_implies_ontology_member
    {p : Person} {s : Elements.ExpertService} {c : ComplaintText}
    (h : Elements.Section237 p s c) :
    Ontology.ServiceMemberEligibility (m237eom p) c :=
  ⟨corr237_outstanding h.appointment.outstandingInField,
   corr237_degreeO h.appointment.degree, corr237_gsO h.appointment.opmStandards⟩


axiom corr237_isServiceP {s : Procedure.ServiceAppointment} {c : ComplaintText} :
    Procedure.SecretaryAppointedMemberToConteService s c →
    Ontology.IsSeniorBiomedicalResearchAndProductAssessmentService (m237posv s) c

axiom corr237_ceilingP {s : Procedure.ServiceAppointment} {c : ComplaintText} :
    Ontology.membersInService (m237posv s) c = Procedure.conteServiceMemberCount s c


axiom corr237_systematicP {s : Procedure.ServiceAppointment} {c : ComplaintText} :
    Procedure.PerformanceAppraisalSystemEstablished s c →
    Ontology.ProvidesSystematicPerformanceAppraisal (m237posv s) c

axiom corr237_encouragesP {s : Procedure.ServiceAppointment} {c : ComplaintText} :
    Procedure.PerformanceAppraisalSystemEstablished s c →
    Ontology.EncouragesExcellenceInPerformance (m237posv s) c



theorem s237_procedure_implies_ontology
    {s : Procedure.ServiceAppointment} {c : ComplaintText}
    (h : Procedure.Section237ServiceAppointment s c) :
    Ontology.ConteServiceDefinition (m237posv s) c := by
  refine ⟨corr237_isServiceP h.appointed, ?_,
    corr237_systematicP h.appraisal, corr237_encouragesP h.appraisal⟩
  show Ontology.membersInService (m237posv s) c ≤ 2000
  rw [corr237_ceilingP]
  exact h.withinCap


axiom corr237_secAddresseeE {p : Person} {s : Elements.ExpertService} {c : ComplaintText} :
    Elements.AppointedBySecretaryWithoutRegardToTitle5 p s c →
    Deontic.AddresseeIsSecretary (sec237e s) c

axiom corr237_inOperationE {s : Elements.ExpertService} {c : ComplaintText} :
    Elements.ConteServiceEstablishedInPublicHealthService s c →
    Deontic.ConteServiceInOperation237 c


theorem s237_elements_implies_deontic
    {p : Person} {s : Elements.ExpertService} {c : ComplaintText}
    (h : Elements.Section237 p s c) :
    Deontic.Obligation237c (sec237e s) c :=
  ⟨corr237_secAddresseeE h.appointment.appointedBySecretary,
   corr237_inOperationE h.establishment.establishedInPublicHealthService⟩


axiom corr237_secAddresseeP {s : Procedure.ServiceAppointment} {c : ComplaintText} :
    Procedure.SecretaryAppointedMemberToConteService s c →
    Deontic.AddresseeIsSecretary (sec237p s) c

axiom corr237_inOperationP {s : Procedure.ServiceAppointment} {c : ComplaintText} :
    Procedure.SecretaryAppointedMemberToConteService s c → Deontic.ConteServiceInOperation237 c


theorem s237_procedure_implies_deontic
    {s : Procedure.ServiceAppointment} {c : ComplaintText}
    (h : Procedure.Section237ServiceAppointment s c) :
    Deontic.Obligation237c (sec237p s) c :=
  ⟨corr237_secAddresseeP h.appointed, corr237_inOperationP h.appointed⟩


axiom corr237_inOperationO {sv : Ontology.BiomedicalService} {c : ComplaintText} :
    Ontology.IsSeniorBiomedicalResearchAndProductAssessmentService sv c →
    Deontic.ConteServiceInOperation237 c






theorem s237_ontology_implies_deontic_modulo_gaps
    {sv : Ontology.BiomedicalService} {p : Person} {c : ComplaintText}
    (h : Ontology.ConteServiceDefinition sv c)
    (gap_secretaryAddressee : Deontic.AddresseeIsSecretary p c) :
    Deontic.Obligation237c p c :=
  ⟨gap_secretaryAddressee, corr237_inOperationO h.service⟩






axiom m237aep : Elements.Office → Procedure.WomensHealthOffice

axiom m237aeo : Elements.Office → Ontology.WomensHealthOffice

axiom m237apo : Procedure.WomensHealthOffice → Ontology.WomensHealthOffice

axiom sec237ae : Elements.Office → Person



axiom corr237a_office {o : Elements.Office} {c : ComplaintText} :
    Elements.OfficeOnWomensHealthEstablishedWithinOfficeOfSecretary o c →
    Elements.OfficeHeadedByDeputyAssistantSecretaryForWomensHealth o c →
    Procedure.OfficeOnWomensHealthEstablishedUnderDeputyAssistantSecretary (m237aep o) c

axiom corr237a_committee {o : Elements.Office} {c : ComplaintText} :
    Elements.EstablishedCoordinatingCommitteeOnWomensHealth o c →
    Procedure.CoordinatingCommitteeEstablished (m237aep o) c

axiom corr237a_center {o : Elements.Office} {c : ComplaintText} :
    Elements.EstablishedNationalWomensHealthInformationCenter o c →
    Procedure.NationalWomensHealthInformationCenterEstablished (m237aep o) c

axiom corr237a_submitted {o : Elements.Office} {c : ComplaintText} :
    Elements.BiennialReportSubmittedToCongress o c →
    Procedure.BiennialReportSubmittedToCongress (m237aep o) c

axiom corr237a_evaluations {o : Elements.Office} {c : ComplaintText} :
    Elements.ProvidedForProjectEvaluationsAndDissemination o c →
    Procedure.GrantProjectEvaluationsProvided (m237aep o) c







theorem s237a_elements_implies_procedure_modulo_gaps
    {o : Elements.Office} {c : ComplaintText} (h : Elements.Section237a o c)
    (gap_firstReportTiming : Procedure.FirstReportWithinOneYear (m237aep o) c)
    (gap_biennialCadence : Procedure.SubsequentReportsBiennial (m237aep o) c) :
    Procedure.Section237aReportingCycle (m237aep o) c :=
  ⟨⟨corr237a_office h.establishment.establishedWithinOfficeOfSecretary
      h.establishment.headedByDeputyAssistantSecretary,
    corr237a_committee h.duties.coordinatingCommittee,
    corr237a_center h.duties.informationCenter⟩,
   corr237a_submitted h.biennialReport,
   gap_firstReportTiming, gap_biennialCadence,
   corr237a_evaluations h.fundingAuthority.evaluationsAndDissemination⟩


axiom corr237a_isOffice {o : Elements.Office} {c : ComplaintText} :
    Elements.OfficeOnWomensHealthEstablishedWithinOfficeOfSecretary o c →
    Ontology.IsOfficeOnWomensHealth (m237aeo o) c

axiom corr237a_headed {o : Elements.Office} {c : ComplaintText} :
    Elements.OfficeHeadedByDeputyAssistantSecretaryForWomensHealth o c →
    Ontology.IsHeadedByDeputyAssistantSecretaryForWomensHealth (m237aeo o) c


theorem s237a_elements_implies_ontology
    {o : Elements.Office} {c : ComplaintText} (h : Elements.Section237a o c) :
    Ontology.WomensHealthOfficeDefinition (m237aeo o) c :=
  ⟨corr237a_isOffice h.establishment.establishedWithinOfficeOfSecretary,
   corr237a_headed h.establishment.headedByDeputyAssistantSecretary⟩


axiom corr237a_isOfficeP {o : Procedure.WomensHealthOffice} {c : ComplaintText} :
    Procedure.OfficeOnWomensHealthEstablishedUnderDeputyAssistantSecretary o c →
    Ontology.IsOfficeOnWomensHealth (m237apo o) c

axiom corr237a_headedP {o : Procedure.WomensHealthOffice} {c : ComplaintText} :
    Procedure.OfficeOnWomensHealthEstablishedUnderDeputyAssistantSecretary o c →
    Ontology.IsHeadedByDeputyAssistantSecretaryForWomensHealth (m237apo o) c




theorem s237a_procedure_implies_ontology
    {o : Procedure.WomensHealthOffice} {c : ComplaintText}
    (h : Procedure.Section237aReportingCycle o c) :
    Ontology.WomensHealthOfficeDefinition (m237apo o) c :=
  ⟨corr237a_isOfficeP h.established.office, corr237a_headedP h.established.office⟩


axiom corr237a_secAddresseeE {o : Elements.Office} {c : ComplaintText} :
    Elements.SecretaryMadeGrantsOrEnteredAgreements o c →
    Deontic.AddresseeIsSecretary (sec237ae o) c

axiom corr237a_conditionE {o : Elements.Office} {c : ComplaintText} :
    Elements.OfficeOnWomensHealthEstablishedWithinOfficeOfSecretary o c →
    Deontic.OfficeOnWomensHealthEstablished237a c




theorem s237a_elements_implies_deontic
    {o : Elements.Office} {c : ComplaintText} (h : Elements.Section237a o c) :
    Deontic.Obligation237aB (sec237ae o) c :=
  ⟨corr237a_secAddresseeE h.fundingAuthority.awardsMade,
   corr237a_conditionE h.establishment.establishedWithinOfficeOfSecretary⟩


axiom corr237a_conditionP {o : Procedure.WomensHealthOffice} {c : ComplaintText} :
    Procedure.OfficeOnWomensHealthEstablishedUnderDeputyAssistantSecretary o c →
    Deontic.OfficeOnWomensHealthEstablished237a c





theorem s237a_procedure_implies_deontic_modulo_gaps
    {o : Procedure.WomensHealthOffice} {p : Person} {c : ComplaintText}
    (h : Procedure.Section237aReportingCycle o c)
    (gap_secretaryAddressee : Deontic.AddresseeIsSecretary p c) :
    Deontic.Obligation237aB p c :=
  ⟨gap_secretaryAddressee, corr237a_conditionP h.established.office⟩


axiom corr237a_conditionO {o : Ontology.WomensHealthOffice} {c : ComplaintText} :
    Ontology.IsOfficeOnWomensHealth o c → Deontic.OfficeOnWomensHealthEstablished237a c




theorem s237a_ontology_implies_deontic_modulo_gaps
    {o : Ontology.WomensHealthOffice} {p : Person} {c : ComplaintText}
    (h : Ontology.WomensHealthOfficeDefinition o c)
    (gap_secretaryAddressee : Deontic.AddresseeIsSecretary p c) :
    Deontic.Obligation237aB p c :=
  ⟨gap_secretaryAddressee, corr237a_conditionO h.office⟩






axiom m238aep : Elements.Hospital → Procedure.HospitalUseAgreement

axiom m238apoh : Procedure.HospitalUseAgreement → Ontology.Hospital

axiom m238apop : Procedure.HospitalUseAgreement → Person

axiom m238aeoh : Elements.Hospital → Ontology.Hospital

axiom m238aeop : Elements.Hospital → Person

axiom imm238ao : Ontology.Hospital → Deontic.Entity

axiom imm238ap : Procedure.HospitalUseAgreement → Deontic.Entity

axiom imm238ae : Elements.Hospital → Deontic.Entity


axiom corr238a_agreement {h : Elements.Hospital} {c : ComplaintText} :
    Elements.HeadsOfConcernedDepartmentsAgreed h c →
    Procedure.InterdepartmentalAgreementPermitsHospitalUse (m238aep h) c

axiom corr238a_utilities {h : Elements.Hospital} {c : ComplaintText} :
    Elements.SurgeonGeneralReimbursedActualCostOfUtilitiesAndSupplies h c →
    Procedure.SurgeonGeneralReimbursedForUtilitiesAndSupplies (m238aep h) c

axiom corr238a_noUpkeep {h : Elements.Hospital} {c : ComplaintText} :
    ¬ Elements.ChargeMadeForPhysicalUpkeepOfHospitals h c →
    Procedure.NoChargeMadeForPhysicalUpkeep (m238aep h) c

axiom corr238a_detainee {p : Person} {h : Elements.Hospital} {c : ComplaintText} :
    Elements.ImmigrationServiceReimbursedForCareOfDetainedPersons p h c →
    Procedure.ImmigrationServiceReimbursedForDetaineeCare (m238aep h) c

axiom corr238a_entitleBack {p : Person} {h : Elements.Hospital} {c : ComplaintText} :
    Procedure.DetaineeEntitledToCareUnderSection249a (m238aep h) c →
    Elements.DetainedPersonEntitledToCareUnderSection249a p c





theorem s238a_elements_implies_procedure
    {p : Person} {h : Elements.Hospital} {c : ComplaintText}
    (hUse : Elements.Section238aUse h c)
    (hDet : Elements.Section238aDetaineeReimbursement p h c) :
    Procedure.Section238aReimbursementObligations (m238aep h) c :=
  ⟨corr238a_agreement hUse.departmentHeadsAgreed,
   corr238a_utilities hUse.actualCostReimbursed,
   corr238a_noUpkeep hUse.noUpkeepCharge,
   corr238a_detainee hDet.reimbursed,
   fun he => hDet.noSection249aEntitlement (corr238a_entitleBack he)⟩


axiom corr238a_isHospitalP {ag : Procedure.HospitalUseAgreement} {c : ComplaintText} :
    Procedure.InterdepartmentalAgreementPermitsHospitalUse ag c →
    Ontology.IsImmigrationStationHospital (m238apoh ag) c

axiom corr238a_isAgreementP {ag : Procedure.HospitalUseAgreement} {c : ComplaintText} :
    Procedure.InterdepartmentalAgreementPermitsHospitalUse ag c →
    Ontology.IsInterdepartmentalUseAgreement (m238apoh ag) c






theorem s238a_procedure_implies_ontology_modulo_gaps
    {ag : Procedure.HospitalUseAgreement} {c : ComplaintText}
    (h : Procedure.Section238aReimbursementObligations ag c)
    (gap_phsPatient : Ontology.IsPublicHealthServicePatient (m238apop ag) c) :
    Ontology.ImmigrationStationHospitalUse (m238apoh ag) (m238apop ag) c :=
  ⟨corr238a_isHospitalP h.agreement, corr238a_isAgreementP h.agreement, gap_phsPatient⟩


axiom corr238a_isHospitalE {h : Elements.Hospital} {c : ComplaintText} :
    Elements.ImmigrationServicePermittedPHSUseOfStationHospital h c →
    Ontology.IsImmigrationStationHospital (m238aeoh h) c

axiom corr238a_isAgreementE {h : Elements.Hospital} {c : ComplaintText} :
    Elements.HeadsOfConcernedDepartmentsAgreed h c →
    Ontology.IsInterdepartmentalUseAgreement (m238aeoh h) c

axiom corr238a_patientE {h : Elements.Hospital} {c : ComplaintText} :
    Elements.UseIsForCareOfPublicHealthServicePatients h c →
    Ontology.IsPublicHealthServicePatient (m238aeop h) c




theorem s238a_elements_implies_ontology
    {h : Elements.Hospital} {c : ComplaintText} (hUse : Elements.Section238aUse h c) :
    Ontology.ImmigrationStationHospitalUse (m238aeoh h) (m238aeop h) c :=
  ⟨corr238a_isHospitalE hUse.usePermitted,
   corr238a_isAgreementE hUse.departmentHeadsAgreed,
   corr238a_patientE hUse.forPublicHealthServicePatients⟩


axiom corr238a_immAddresseeO {h : Ontology.Hospital} {c : ComplaintText} :
    Ontology.IsImmigrationStationHospital h c →
    Deontic.AddresseeIsImmigrationService (imm238ao h) c

axiom corr238a_conditionO {h : Ontology.Hospital} {c : ComplaintText} :
    Ontology.IsInterdepartmentalUseAgreement h c →
    Deontic.InterdepartmentalAgreementInEffect238a c


theorem s238a_ontology_implies_deontic
    {h : Ontology.Hospital} {p : Person} {c : ComplaintText}
    (hu : Ontology.ImmigrationStationHospitalUse h p c) :
    Deontic.Permission238a (imm238ao h) c :=
  ⟨corr238a_immAddresseeO hu.hospital, corr238a_conditionO hu.agreement⟩


axiom corr238a_immAddresseeP {ag : Procedure.HospitalUseAgreement} {c : ComplaintText} :
    Procedure.InterdepartmentalAgreementPermitsHospitalUse ag c →
    Deontic.AddresseeIsImmigrationService (imm238ap ag) c

axiom corr238a_conditionP {ag : Procedure.HospitalUseAgreement} {c : ComplaintText} :
    Procedure.InterdepartmentalAgreementPermitsHospitalUse ag c →
    Deontic.InterdepartmentalAgreementInEffect238a c


theorem s238a_procedure_implies_deontic
    {ag : Procedure.HospitalUseAgreement} {c : ComplaintText}
    (h : Procedure.Section238aReimbursementObligations ag c) :
    Deontic.Permission238a (imm238ap ag) c :=
  ⟨corr238a_immAddresseeP h.agreement, corr238a_conditionP h.agreement⟩


axiom corr238a_immAddresseeE {h : Elements.Hospital} {c : ComplaintText} :
    Elements.ImmigrationServicePermittedPHSUseOfStationHospital h c →
    Deontic.AddresseeIsImmigrationService (imm238ae h) c

axiom corr238a_conditionE {h : Elements.Hospital} {c : ComplaintText} :
    Elements.HeadsOfConcernedDepartmentsAgreed h c →
    Deontic.InterdepartmentalAgreementInEffect238a c


theorem s238a_elements_implies_deontic
    {h : Elements.Hospital} {c : ComplaintText} (hUse : Elements.Section238aUse h c) :
    Deontic.Permission238a (imm238ae h) c :=
  ⟨corr238a_immAddresseeE hUse.usePermitted, corr238a_conditionE hUse.departmentHeadsAgreed⟩






axiom m238lep : Elements.Facility → Elements.Transfer → Procedure.AssistedFacility

axiom m238lpo : Procedure.AssistedFacility → Ontology.Facility

axiom m238lod : Ontology.Facility → Deontic.Facility

axiom us238lo : Ontology.Facility → Deontic.Entity


noncomputable def m238lpd (f : Procedure.AssistedFacility) : Deontic.Facility :=
  m238lod (m238lpo f)

noncomputable def us238lp (f : Procedure.AssistedFacility) : Deontic.Entity :=
  us238lo (m238lpo f)


axiom corr238l_funds {fac : Elements.Facility} {tr : Elements.Transfer} {c : ComplaintText} :
    Elements.FacilityFundedUnderCommunityMentalHealthCentersAct fac c →
    Procedure.FederalFundsPaidUnderCommunityMentalHealthCentersAct (m238lep fac tr) c

axiom corr238l_saleUnqual {fac : Elements.Facility} {tr : Elements.Transfer}
    {c : ComplaintText} :
    Elements.FacilitySoldOrTransferred fac tr c →
    Elements.TransfereeNotQualifiedToApplyUnderSection222 tr c →
    Procedure.FacilitySoldOrTransferredToUnqualifiedEntity (m238lep fac tr) c

axiom corr238l_saleDisapp {fac : Elements.Facility} {tr : Elements.Transfer}
    {c : ComplaintText} :
    Elements.FacilitySoldOrTransferred fac tr c →
    Elements.TransfereeDisapprovedByStateMentalHealthAgency tr c →
    Procedure.TransfereeDisapprovedByStateMentalHealthAgency (m238lep fac tr) c

axiom corr238l_cessation {fac : Elements.Facility} {tr : Elements.Transfer}
    {c : ComplaintText} :
    Elements.FacilityCeasedUseForComprehensiveMentalHealthServices fac c →
    Procedure.FacilityCeasedUseInComprehensiveMentalHealthServices (m238lep fac tr) c

axiom corr238l_years {fac : Elements.Facility} {tr : Elements.Transfer} {c : ComplaintText} :
    Procedure.yearsFromCompletionOrAcquisitionToTriggeringEvent (m238lep fac tr) c
      = Elements.yearsFromCompletionOrAcquisitionToTriggeringEvent fac c

axiom corr238l_waiverBack {fac : Elements.Facility} {tr : Elements.Transfer}
    {c : ComplaintText} :
    Procedure.SecretaryWaivedRecoveryRightsForGoodCause (m238lep fac tr) c →
    Elements.SecretaryWaivedRecoveryForGoodCause fac c












theorem s238l_elements_implies_procedure_modulo_gaps
    {fac : Elements.Facility} {tr : Elements.Transfer} {c : ComplaintText}
    (h : Elements.Section238l fac tr c)
    (gap_valuationVenue :
      Procedure.RecoveryActionBroughtInDistrictWhereFacilitySituated (m238lep fac tr) c) :
    Procedure.Section238lRecoveryEntitlement (m238lep fac tr) c := by
  refine ⟨corr238l_funds h.communityMentalHealthFunded, ?_, ?_, gap_valuationVenue,
    fun hw => h.noWaiver (corr238l_waiverBack hw)⟩
  · cases h.triggeringEvent with
    | saleOrTransfer hs hd =>
        cases hd with
        | unqualifiedTransferee hu =>
            exact Procedure.Section238lTriggeringEvent.saleToUnqualified
              (corr238l_saleUnqual hs hu)
        | disapprovedTransferee hdd =>
            exact Procedure.Section238lTriggeringEvent.saleToDisapproved
              (corr238l_saleDisapp hs hdd)
    | cessationOfUse hc =>
        exact Procedure.Section238lTriggeringEvent.cessationOfUse (corr238l_cessation hc)
  · show Procedure.yearsFromCompletionOrAcquisitionToTriggeringEvent (m238lep fac tr) c ≤ 20
    rw [corr238l_years]
    exact Nat.le_of_lt h.withinTwentyYears


axiom corr238l_fundedO {f : Procedure.AssistedFacility} {c : ComplaintText} :
    Procedure.FederalFundsPaidUnderCommunityMentalHealthCentersAct f c →
    Ontology.IsCommunityMentalHealthCentersActFundedFacility (m238lpo f) c

axiom corr238l_windowO {f : Procedure.AssistedFacility} {c : ComplaintText} :
    Procedure.TriggeringEventWithinTwentyYears f c →
    Ontology.WithinTwentyYearPostCompletionOrAcquisitionPeriod (m238lpo f) c

axiom corr238l_trigUnqualO {f : Procedure.AssistedFacility} {c : ComplaintText} :
    Procedure.FacilitySoldOrTransferredToUnqualifiedEntity f c →
    Ontology.TransferredToEntityIneligibleUnderSection222 (m238lpo f) c

axiom corr238l_trigDisappO {f : Procedure.AssistedFacility} {c : ComplaintText} :
    Procedure.TransfereeDisapprovedByStateMentalHealthAgency f c →
    Ontology.TransfereeDisapprovedByStateMentalHealthAgency (m238lpo f) c

axiom corr238l_trigCessO {f : Procedure.AssistedFacility} {c : ComplaintText} :
    Procedure.FacilityCeasedUseInComprehensiveMentalHealthServices f c →
    Ontology.CeasedUseForComprehensiveMentalHealthServices (m238lpo f) c

axiom corr238l_waiverBackO {f : Procedure.AssistedFacility} {c : ComplaintText} :
    Ontology.SecretaryWaivedRecoveryForGoodCause (m238lpo f) c →
    Procedure.SecretaryWaivedRecoveryRightsForGoodCause f c





theorem s238l_procedure_implies_ontology
    {f : Procedure.AssistedFacility} {c : ComplaintText}
    (h : Procedure.Section238lRecoveryEntitlement f c) :
    Ontology.RecoveryEntitlement (m238lpo f) c := by
  refine ⟨corr238l_fundedO h.federalFunds, corr238l_windowO h.withinTwentyYears, ?_,
    fun hw => h.noWaiver (corr238l_waiverBackO hw)⟩
  cases h.event with
  | saleToUnqualified hu =>
      exact Ontology.RecoveryTriggeringEvent.transferToIneligible (corr238l_trigUnqualO hu)
  | saleToDisapproved hd =>
      exact Ontology.RecoveryTriggeringEvent.transferToDisapproved (corr238l_trigDisappO hd)
  | cessationOfUse hc =>
      exact Ontology.RecoveryTriggeringEvent.cessationOfCenterUse (corr238l_trigCessO hc)



axiom corr238l_usAddresseeO {f : Ontology.Facility} {c : ComplaintText} :
    Ontology.IsCommunityMentalHealthCentersActFundedFacility f c →
    Deontic.AddresseeIsUnitedStates (us238lo f) c

axiom corr238l_soldD {f : Ontology.Facility} {c : ComplaintText} :
    Ontology.TransferredToEntityIneligibleUnderSection222 f c →
    Deontic.SoldOrTransferredToDisqualifiedEntity238l (m238lod f) c

axiom corr238l_disappD {f : Ontology.Facility} {c : ComplaintText} :
    Ontology.TransfereeDisapprovedByStateMentalHealthAgency f c →
    Deontic.SoldOrTransferredToDisqualifiedEntity238l (m238lod f) c

axiom corr238l_cessD {f : Ontology.Facility} {c : ComplaintText} :
    Ontology.CeasedUseForComprehensiveMentalHealthServices f c →
    Deontic.CeasedUseByCommunityMentalHealthCenter238l (m238lod f) c

axiom corr238l_windowD {f : Ontology.Facility} {c : ComplaintText} :
    Ontology.WithinTwentyYearPostCompletionOrAcquisitionPeriod f c →
    Deontic.WithinTwentyYearRecoveryWindow238l (m238lod f) c





theorem s238l_ontology_implies_deontic
    {f : Ontology.Facility} {c : ComplaintText} (h : Ontology.RecoveryEntitlement f c) :
    Deontic.Power238lA (us238lo f) (m238lod f) c := by
  refine ⟨corr238l_usAddresseeO h.fundedFacility, ⟨?_, corr238l_windowD h.withinWindow⟩⟩
  cases h.trigger with
  | transferToIneligible hu =>
      exact Deontic.RecoveryTriggeringEvent238l.soldOrTransferred (corr238l_soldD hu)
  | transferToDisapproved hd =>
      exact Deontic.RecoveryTriggeringEvent238l.soldOrTransferred (corr238l_disappD hd)
  | cessationOfCenterUse hc =>
      exact Deontic.RecoveryTriggeringEvent238l.ceasedUse (corr238l_cessD hc)



theorem s238l_procedure_implies_deontic
    {f : Procedure.AssistedFacility} {c : ComplaintText}
    (h : Procedure.Section238lRecoveryEntitlement f c) :
    Deontic.Power238lA (us238lp f) (m238lpd f) c :=
  s238l_ontology_implies_deontic (s238l_procedure_implies_ontology h)


theorem s238l_elements_implies_ontology_modulo_gaps
    {fac : Elements.Facility} {tr : Elements.Transfer} {c : ComplaintText}
    (h : Elements.Section238l fac tr c)
    (gap_valuationVenue :
      Procedure.RecoveryActionBroughtInDistrictWhereFacilitySituated (m238lep fac tr) c) :
    Ontology.RecoveryEntitlement (m238lpo (m238lep fac tr)) c :=
  s238l_procedure_implies_ontology
    (s238l_elements_implies_procedure_modulo_gaps h gap_valuationVenue)


theorem s238l_elements_implies_deontic_modulo_gaps
    {fac : Elements.Facility} {tr : Elements.Transfer} {c : ComplaintText}
    (h : Elements.Section238l fac tr c)
    (gap_valuationVenue :
      Procedure.RecoveryActionBroughtInDistrictWhereFacilitySituated (m238lep fac tr) c) :
    Deontic.Power238lA (us238lp (m238lep fac tr)) (m238lpd (m238lep fac tr)) c :=
  s238l_procedure_implies_deontic
    (s238l_elements_implies_procedure_modulo_gaps h gap_valuationVenue)






axiom m238mep : Elements.FiscalAgentContract → Elements.FiscalAgent →
    Procedure.FiscalAgentContract

axiom m238mpo : Procedure.FiscalAgentContract → Ontology.FiscalAgent

axiom m238meo : Elements.FiscalAgent → Ontology.FiscalAgent

axiom m238med : Elements.FiscalAgent → Deontic.Entity

axiom m238mpd : Procedure.FiscalAgentContract → Deontic.Entity

axiom m238mod : Ontology.FiscalAgent → Deontic.Entity

axiom sec238me : Elements.FiscalAgentContract → Person

axiom sec238mp : Procedure.FiscalAgentContract → Person


axiom corr238m_efficiency {k : Elements.FiscalAgentContract} {fa : Elements.FiscalAgent}
    {c : ComplaintText} :
    Elements.SecretaryFoundEntityWillPerformEfficientlyAndEffectively fa k c →
    Procedure.SecretaryFoundEntityWillPerformEfficientlyAndEffectively (m238mep k fa) c

axiom corr238m_responsibility {k : Elements.FiscalAgentContract} {fa : Elements.FiscalAgent}
    {c : ComplaintText} :
    Elements.SecretaryFoundEntityMeetsFinancialAndLegalRequirements fa k c →
    Procedure.SecretaryFoundEntityMeetsResponsibilityRequirements (m238mep k fa) c

axiom corr238m_contracted {k : Elements.FiscalAgentContract} {fa : Elements.FiscalAgent}
    {c : ComplaintText} :
    Elements.SecretaryEnteredContractWithFiscalAgent k fa c →
    Procedure.FiscalAgentContractEntered (m238mep k fa) c

axiom corr238m_functions {k : Elements.FiscalAgentContract} {fa : Elements.FiscalAgent}
    {c : ComplaintText} :
    Elements.PaymentDeterminationFunction238m k c →
    Procedure.FiscalAgentDeterminedAmountsPayable (m238mep k fa) c

axiom corr238m_audits {k : Elements.FiscalAgentContract} {fa : Elements.FiscalAgent}
    {c : ComplaintText} :
    Elements.ContractProvidesForAuditsOfRecords k c →
    Procedure.FiscalAgentAuditedRecordsForPaymentPropriety (m238mep k fa) c


theorem s238m_elements_implies_procedure
    {k : Elements.FiscalAgentContract} {fa : Elements.FiscalAgent} {c : ComplaintText}
    (h : Elements.Section238m k fa c) :
    Procedure.Section238mFiscalAgentContract (m238mep k fa) c :=
  ⟨corr238m_efficiency h.findings.efficientAndEffectivePerformance,
   corr238m_responsibility h.findings.financialAndLegalCapacity,
   corr238m_contracted h.contractEntered,
   corr238m_functions h.functions.paymentDetermination,
   corr238m_audits h.functions.audits⟩


axiom corr238m_classO {fa : Elements.FiscalAgent} {c : ComplaintText} :
    Elements.FiscalAgentStatus238m fa c → Ontology.FiscalAgentClass (m238meo fa) c

axiom corr238m_efficientO {k : Elements.FiscalAgentContract} {fa : Elements.FiscalAgent}
    {c : ComplaintText} :
    Elements.SecretaryFoundEntityWillPerformEfficientlyAndEffectively fa k c →
    Ontology.PerformsObligationsEfficientlyAndEffectively (m238meo fa) c

axiom corr238m_responsibleO {k : Elements.FiscalAgentContract} {fa : Elements.FiscalAgent}
    {c : ComplaintText} :
    Elements.SecretaryFoundEntityMeetsFinancialAndLegalRequirements fa k c →
    Ontology.MeetsFinancialResponsibilityAndLegalAuthorityRequirements (m238meo fa) c


theorem s238m_elements_implies_ontology
    {k : Elements.FiscalAgentContract} {fa : Elements.FiscalAgent} {c : ComplaintText}
    (h : Elements.Section238m k fa c) :
    Ontology.FiscalAgentContractEligibility (m238meo fa) c :=
  ⟨corr238m_classO h.agentStatus,
   corr238m_efficientO h.findings.efficientAndEffectivePerformance,
   corr238m_responsibleO h.findings.financialAndLegalCapacity⟩


axiom corr238m_efficientPO {k : Procedure.FiscalAgentContract} {c : ComplaintText} :
    Procedure.SecretaryFoundEntityWillPerformEfficientlyAndEffectively k c →
    Ontology.PerformsObligationsEfficientlyAndEffectively (m238mpo k) c

axiom corr238m_responsiblePO {k : Procedure.FiscalAgentContract} {c : ComplaintText} :
    Procedure.SecretaryFoundEntityMeetsResponsibilityRequirements k c →
    Ontology.MeetsFinancialResponsibilityAndLegalAuthorityRequirements (m238mpo k) c







theorem s238m_procedure_implies_ontology_modulo_gaps
    {k : Procedure.FiscalAgentContract} {c : ComplaintText}
    (h : Procedure.Section238mFiscalAgentContract k c)
    (gap_agentClass : Ontology.FiscalAgentClass (m238mpo k) c) :
    Ontology.FiscalAgentContractEligibility (m238mpo k) c :=
  ⟨gap_agentClass, corr238m_efficientPO h.findingEfficiency,
   corr238m_responsiblePO h.findingResponsibility⟩


axiom corr238m_secAddresseeE {k : Elements.FiscalAgentContract} {fa : Elements.FiscalAgent}
    {c : ComplaintText} :
    Elements.SecretaryEnteredContractWithFiscalAgent k fa c →
    Deontic.AddresseeIsSecretary (sec238me k) c

axiom corr238m_conditionE {k : Elements.FiscalAgentContract} {fa : Elements.FiscalAgent}
    {c : ComplaintText} :
    Elements.SecretaryEnteredContractWithFiscalAgent k fa c →
    Deontic.FiscalAgentFunctionsNeeded238m c


theorem s238m_elements_implies_deontic
    {k : Elements.FiscalAgentContract} {fa : Elements.FiscalAgent} {c : ComplaintText}
    (h : Elements.Section238m k fa c) :
    Deontic.Permission238mA (sec238me k) (m238med fa) c :=
  ⟨corr238m_secAddresseeE h.contractEntered, corr238m_conditionE h.contractEntered⟩


axiom corr238m_secAddresseeP {k : Procedure.FiscalAgentContract} {c : ComplaintText} :
    Procedure.SecretaryFoundEntityWillPerformEfficientlyAndEffectively k c →
    Deontic.AddresseeIsSecretary (sec238mp k) c

axiom corr238m_conditionP {k : Procedure.FiscalAgentContract} {c : ComplaintText} :
    Procedure.FiscalAgentContractEntered k c → Deontic.FiscalAgentFunctionsNeeded238m c


theorem s238m_procedure_implies_deontic
    {k : Procedure.FiscalAgentContract} {c : ComplaintText}
    (h : Procedure.Section238mFiscalAgentContract k c) :
    Deontic.Permission238mA (sec238mp k) (m238mpd k) c :=
  ⟨corr238m_secAddresseeP h.findingEfficiency, corr238m_conditionP h.contracted⟩


axiom corr238m_conditionO {fa : Ontology.FiscalAgent} {c : ComplaintText} :
    Ontology.FiscalAgentClass fa c → Deontic.FiscalAgentFunctionsNeeded238m c





theorem s238m_ontology_implies_deontic_modulo_gaps
    {fa : Ontology.FiscalAgent} {p : Person} {c : ComplaintText}
    (h : Ontology.FiscalAgentContractEligibility fa c)
    (gap_secretaryAddressee : Deontic.AddresseeIsSecretary p c) :
    Deontic.Permission238mA p (m238mod fa) c :=
  ⟨gap_secretaryAddressee, corr238m_conditionO h.agentClass⟩

end Proving.USC.T42.Ch6ASchI.Reslice.Bridge
