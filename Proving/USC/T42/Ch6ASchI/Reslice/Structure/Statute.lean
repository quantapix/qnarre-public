



















import Proving.USC.Common.Types
import Proving.USC.T42.Ch6ASchI.Reslice.Structure.Types
import Proving.USC.T42.Ch6ASchI.Reslice.Structure.Predicates

set_option autoImplicit false

namespace Proving.USC.T42.Ch6ASchI.Reslice.Structure

open Proving.USC.Common




structure Coherent218 (c : ComplaintText) : Prop where
  councilFundingBasis  : IncorporationHonored edge_218a_incorporates_254b c
  membershipBasis      : IncorporationHonored edge_218b_incorporates_254b c
  advisoryActProvisionExists : ReferencedSectionExists edge_218d_notwithstanding_5usc1013a c
  advisoryActOptOutFires : OverrideTriggered edge_218d_notwithstanding_5usc1013a c




structure Coherent233 (c : ComplaintText) : Prop where
  ftcaRemedyExists : ReferencedSectionExists edge_233a_incorporates_28usc1346b c
  ftcaRemedyIncorporated : IncorporationHonored edge_233a_incorporates_28usc1346b c
  administrativeSettlementBasis : IncorporationHonored edge_233a_incorporates_28usc2672 c
  exclusivityControls : LexSpecialisControls edge_233a_lexSpecialis_otherCivilActions c
  removalRegimeResolves : IncorporationHonored edge_233c_incorporates_28usc_ch171 c
  compromiseAuthorityResolves : IncorporationHonored edge_233d_incorporates_28usc2677 c
  intentionalTortExclusionDisapplied : OverrideTriggered edge_233e_notwithstanding_28usc2680h c
  holdHarmlessConditionResolves : IncorporationHonored edge_233f_incorporates_28usc2679b c
  deemingFundingConditionExists : ReferencedSectionExists edge_233g1A_subjectTo_233k3 c
  deemingExclusivityTracksSubsectionA : IncorporationHonored edge_233g1A_incorporates_233a c
  deemingApplicationRequirementsResolve : IncorporationHonored edge_233g1D_incorporates_233h c
  finalityExceptionHonored :
    ExceptionApplies edge_233g1F_exceptAsProvided_233i c →
      IncorporationHonored edge_233g1F_exceptAsProvided_233i c
  coveredEntityDefinitionResolves : IncorporationHonored edge_233g4_incorporates_254b c
  attorneyGeneralOverrideFires : OverrideTriggered edge_233i1_notwithstanding_233g1 c
  deDeemingGroundTracksSubsectionH : IncorporationHonored edge_233i1_incorporates_233h1 c
  corpsProtectionCarriesOver : MutatisMutandisApplicationResolves edge_233j_incorporates_254he c
  judgmentFundBasisResolves : IncorporationHonored edge_233k1A_incorporates_28usc1346_ch171 c
  stateCourtAdviceSubstitutesCertification : IncorporationHonored edge_233l1_incorporates_233c c
  managedCarePenaltyBasisResolves : IncorporationHonored edge_233m2_incorporates_ssa c
  exhaustionRegimeExists : ReferencedSectionExists edge_233p3A_subjectTo_partC c
  ftcaExhaustionPreserved : SavingsClauseHonored edge_233p3Aiii_savings_28usc_ch171 c
  smallpoxExclusivityTracksSubsectionA : IncorporationHonored edge_233p3B_incorporates_233a c
  smallpoxRemovalTracksSubsectionC : IncorporationHonored edge_233p4_incorporates_233c c
  smallpoxLiabilityExceptionHonored :
    ExceptionApplies edge_233p2B_exceptAsProvided_233p5Bii c →
      IncorporationHonored edge_233p2B_exceptAsProvided_233p5Bii c





inductive Section233DeemingRoute (c : ComplaintText) : Prop


  | fundedEntity
      (hEntity : IncorporationHonored edge_233g4_incorporates_254b c)
      (hExclusive : IncorporationHonored edge_233g1A_incorporates_233a c)
      : Section233DeemingRoute c


  | freeClinicHealthProfessional
      (hApply : MutatisMutandisApplicationResolves edge_233o5_incorporates_233ghil c)
      (hFund : ReferencedSectionExists edge_233o5_subjectTo_233o6 c)
      : Section233DeemingRoute c


  | healthProfessionalVolunteer
      (hApply : MutatisMutandisApplicationResolves edge_233q3_incorporates_233ghil c)
      (hService : IncorporationHonored edge_233q1_incorporates_254b c)
      : Section233DeemingRoute c


  | smallpoxCoveredPerson
      (hExclusive : IncorporationHonored edge_233p3B_incorporates_233a c)
      (hRemoval : IncorporationHonored edge_233p4_incorporates_233c c)
      : Section233DeemingRoute c




structure Coherent234 (c : ComplaintText) : Prop where
  generalOverrideFires : OverrideTriggered edge_234a_notwithstanding_anyOtherLaw c
  reserveCorpsMembershipResolves : IncorporationHonored edge_234a_incorporates_300hh15 c
  volunteerRegistryResolves : IncorporationHonored edge_234a_incorporates_247d7b c
  situsStateLawControls : LexSpecialisControls edge_234a_lexSpecialis_situsStateLaw c
  licensureCarveOutHonored :
    ExceptionApplies edge_234a_exceptAsProvided_licensure c →
      IncorporationHonored edge_234a_exceptAsProvided_licensure c
  volunteerProtectionActPreserved : SavingsClauseHonored edge_234b_savings_volunteerProtectionAct c
  supersessionScopeRespected : PreemptionScopeRespected edge_234c_notwithstanding_otherStateLaw c



inductive Section234TriggeringEvent (c : ComplaintText) : Prop

  | publicHealthEmergency
      (h : IncorporationHonored edge_234a1A_incorporates_247da c)
      : Section234TriggeringEvent c

  | presidentialMajorDisaster
      (h : IncorporationHonored edge_234a1B_incorporates_5170 c)
      : Section234TriggeringEvent c

  | nationalEmergency
      (h : IncorporationHonored edge_234a1B_incorporates_50usc1621 c)
      : Section234TriggeringEvent c






structure Coherent235 (c : ComplaintText) : Prop where
  subchapterVProgramBasis : IncorporationHonored edge_235_incorporates_subchV c
  subchapterViProgramBasis : IncorporationHonored edge_235_incorporates_subchVI c
  researchGrantBasis : IncorporationHonored edge_235_incorporates_242b c
  formulaGrantBasis : IncorporationHonored edge_235_incorporates_246 c
  statutoryRequirementsPreserved : SavingsClauseHonored edge_235_savings_statutoryRequirements c





structure Coherent236 (c : ComplaintText) : Prop where
  orphanDrugSubchapterResolves : IncorporationHonored edge_236c1A_incorporates_ffdcaSubchB c
  investigationalExemptionResolves : IncorporationHonored edge_236c5_incorporates_21usc355i c
  approvedDrugNoticeResolves : IncorporationHonored edge_236c5_incorporates_21usc355c c
  biologicsLicenseResolves : IncorporationHonored edge_236c5_incorporates_42usc262 c
  designationRegisterResolves : IncorporationHonored edge_236e1_incorporates_21usc360bb c
  developmentGrantReportResolves : IncorporationHonored edge_236e_incorporates_21usc360ee c




structure Coherent237 (c : ComplaintText) : Prop where
  appointmentOverrideFires : OverrideTriggered edge_237b_notwithstanding_title5Appointment c
  personnelSystemsDisapplied : OverrideTriggered edge_237b_notwithstanding_title5Systems c
  qualificationStandardResolves : IncorporationHonored edge_237b_incorporates_generalSchedule c
  payCeilingResolves : IncorporationHonored edge_237d2_incorporates_3usc102 c
  reappointmentOverrideFires : OverrideTriggered edge_237e_notwithstanding_title5Appointment c





structure Coherent237a (c : ComplaintText) : Prop where
  mandateRunsThroughEstablishedOffice : IncorporationHonored edge_237ab_incorporates_237aa c
  grantAuthorityCrossReferenceResolves : IncorporationHonored edge_237ab7_incorporates_237ac c
  evaluationCrossReferenceResolves : IncorporationHonored edge_237ac2_incorporates_237ac1 c





structure Coherent238a (c : ComplaintText) : Prop where
  carveOutTargetResolves : IncorporationHonored edge_238a_exceptAsProvided_249a c
  carveOutHonored :
    ExceptionApplies edge_238a_exceptAsProvided_249a c →
      IncorporationHonored edge_238a_exceptAsProvided_249a c




structure Coherent238l (c : ComplaintText) : Prop where
  priorLawFundingBasisPreserved : PriorLawIncorporationPreserved sref_238la_cmhca c
  priorLawTransfereeTestPreserved : PriorLawIncorporationPreserved sref_238la1A_cmhca222 c
  recoveryAmountCrossReferenceResolves : IncorporationHonored edge_238la_incorporates_238lc c
  noticeDutyCrossReferenceResolves : IncorporationHonored edge_238lb_incorporates_238la c
  waiverHonored :
    ExceptionApplies edge_238ld_exceptAsProvided_238la c →
      IncorporationHonored edge_238ld_exceptAsProvided_238la c
  noPrejudgmentLien : SavingsClauseHonored edge_238le_savings_lienLaw c



inductive Section238lInterestPeriodRoute (c : ComplaintText) : Prop

  | noticeGiven
      (h : IncorporationHonored edge_238lc2Bi_incorporates_238lb c)
      : Section238lInterestPeriodRoute c

  | noticeOmitted
      (h : IncorporationHonored edge_238lc2Bii_incorporates_238lb c)
      : Section238lInterestPeriodRoute c




structure Coherent238m (c : ComplaintText) : Prop where
  emergencyServicePaymentBasisResolves : IncorporationHonored edge_238ma1B_incorporates_247d c
  quarantineServicePaymentBasisResolves : IncorporationHonored edge_238ma1B_incorporates_249 c
  competitionRequirementDisapplied : OverrideTriggered edge_238mb1_notwithstanding_41usc6101 c
  carrierContractTermsResolve :
    MutatisMutandisApplicationResolves edge_238md_incorporates_1395u_de c
  fiscalAgentDefinitionResolves : IncorporationHonored edge_238me_incorporates_1395uf1 c
  tribalOrganizationAuthorityResolves : IncorporationHonored edge_238me_incorporates_isda c











structure Ch6ASchIReferenceDefects (c : ComplaintText) : Prop where
  s218GrantReferenceFlagged : TargetEditoriallyDefective sref_218a_254b c
  s218MembershipReferenceFlagged : TargetEditoriallyDefective sref_218b_254b c
  s233InsuranceReferenceFlagged : TargetEditoriallyDefective sref_233g1Gii_254b_256a c
  s233AppropriationReferenceFlagged : TargetEditoriallyDefective sref_233k2_254b_256a c
  s233ReportReferenceFlagged : TargetEditoriallyDefective sref_233n1C_254b_256a c
  s233SubclauseReferenceFlagged : TargetEditoriallyDefective sref_233p7Bv_subclause c
  s235SubchapterViiFlagged : TargetEditoriallyDefective sref_235_subchVII c
  s235FormulaGrantFlagged : TargetEditoriallyDefective sref_235_246 c
  s236TaxCreditFlagged : TargetEditoriallyDefective sref_236e_44H c
  s238aCarveOutFlagged : TargetEditoriallyDefective sref_238a_249a c
  s238mCarrierSubsectionsFlagged : TargetEditoriallyDefective sref_238md_1395u_de c
  s238mCarrierDefinitionFlagged : TargetEditoriallyDefective sref_238me_1395uf1 c
  s238lPriorActPreserved : PriorLawIncorporationPreserved sref_238la_cmhca c
  s238lPriorSectionPreserved : PriorLawIncorporationPreserved sref_238la1A_cmhca222 c










end Proving.USC.T42.Ch6ASchI.Reslice.Structure
