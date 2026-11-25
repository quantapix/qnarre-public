























import Proving.USC.T42.Ch21Core.Structure.Types
import Proving.USC.T42.Ch21Core.Structure.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T42.Ch21Core.Structure

open Proving.USC.Common






structure Coherent1981 (c : ComplaintText) : Prop where
  contractsDefinitionScoped :
    DefinitionalScopeRespected edge_1981b_defScope_1981 c












structure Coherent1981a (c : ComplaintText) : Prop where

  enforcementExists : ReferencedSectionExists edge_1981a_a1_inc_2000e5 c

  enforcementHonored : IncorporationHonored edge_1981a_a1_inc_2000e5 c
  federalSectorExists : ReferencedSectionExists edge_1981a_a1_inc_2000e16 c

  prohibitionHonored : IncorporationHonored edge_1981a_a1_inc_2000e2 c
  retaliationHonored : IncorporationHonored edge_1981a_a1_inc_2000e3 c

  section1981Priority : SubordinationRespected edge_1981a_a1_subjectTo_1981 c

  backpayExcluded : ExceptionApplies edge_1981a_b2_exc_2000e5g c

  goodFaithBar : ExceptionApplies edge_1981a_a3_exc_12112b5 c

  section1981Saved : SavingsClausePreserved edge_1981a_b4_savings_1981 c

  rehabActResolves : CrossTitleReferenceResolves edge_1981a_a2_inc_29_791 c
  rehabRemediesResolve : CrossTitleReferenceResolves edge_1981a_a2_inc_29_794a c

  adaHonored : IncorporationHonored edge_1981a_a2_inc_12112 c
  adaProceduresHonored : IncorporationHonored edge_1981a_a2_inc_12117a c

  claimantClassHonored : IncorporationHonored edge_1981a_d1A_inc_2000e c
  claimantClassAdaHonored : IncorporationHonored edge_1981a_d1B_inc_12111 c





inductive Section1981aDamagesBasis (c : ComplaintText) : Prop where

  | titleVII
      (hEnf : IncorporationHonored edge_1981a_a1_inc_2000e5 c)
      (hProhib : IncorporationHonored edge_1981a_a1_inc_2000e2 c)
      (hNo1981 : SubordinationRespected edge_1981a_a1_subjectTo_1981 c)
      : Section1981aDamagesBasis c

  | rehabOrAda
      (hRehab : CrossTitleReferenceResolves edge_1981a_a2_inc_29_791 c)
      (hAda : IncorporationHonored edge_1981a_a2_inc_12112 c)
      : Section1981aDamagesBasis c



structure Coherent1983 (c : ComplaintText) : Prop where

  federalRightIdentified : OpenEndedIncorporationIdentified edge_1983_inc_constitutionAndLaws c

  dcActsDeemed : IncorporationHonored edge_1983_inc_dcActs c

  judicialOfficerProviso : ExceptionApplies edge_1983_exc_judicialOfficer c

  exhaustionRespected : SubordinationRespected edge_1983_subjectTo_1997e_a c

  screeningRespected : SubordinationRespected edge_1983_subjectTo_1997e_c c







structure Coherent1985 (c : ComplaintText) : Prop where
  remedyReachesClause1 : IncorporationHonored edge_1985_3_inc_1985_1 c
  remedyReachesClause2 : IncorporationHonored edge_1985_3_inc_1985_2 c







structure Coherent1986 (c : ComplaintText) : Prop where
  section1985Exists : ReferencedSectionExists edge_1986_inc_1985 c
  predicateWrongsHonored : IncorporationHonored edge_1986_inc_1985 c
  oneYearProviso : ExceptionApplies edge_1986_exc_oneYear c



structure Coherent1988 (c : ComplaintText) : Prop where

  revisedStatutesResolve : ReferencedSectionExists edge_1988_a_inc_rsTitles c

  federalLawPrimary : LexSpecialisControls edge_1988_a_lexSpecialis_usLaws c

  borrowedLawConsistent : SubordinationRespected edge_1988_a_subjectTo_usConstAndLaws c

  feeRosterMembership : EnumeratedIncorporationMembership edge_1988_b_inc_1983 c
  section1981InRoster : ReferencedSectionExists edge_1988_b_inc_1981 c
  section1986InRoster : ReferencedSectionExists edge_1988_b_inc_1986 c
  titleIXResolves : CrossTitleReferenceResolves edge_1988_b_inc_20_1681 c
  vawaResolves : CrossTitleReferenceResolves edge_1988_b_inc_34_12361 c

  judicialOfficerProviso : ExceptionApplies edge_1988_b_exc_judicialOfficer c

  expertFeeRidesOnB : SubordinationRespected edge_1988_c_subjectTo_1988_b c
  expertFeeRoster : EnumeratedIncorporationMembership edge_1988_c_inc_1981a c

  prisonerFeeCap : SubordinationRespected edge_1988_subjectTo_1997e_d c



inductive Section1988aGoverningLaw (c : ComplaintText) : Prop where
  | federalLawSuffices
      (h : LexSpecialisControls edge_1988_a_lexSpecialis_usLaws c)
      : Section1988aGoverningLaw c
  | stateCommonLawFills
      (hDeficient : LexSpecialisControls edge_1988_a_lexSpecialis_usLaws c)
      (hBorrowed : IncorporationHonored edge_1988_a_inc_stateCommonLaw c)
      (hConsistent : SubordinationRespected edge_1988_a_subjectTo_usConstAndLaws c)
      : Section1988aGoverningLaw c







structure Sec1997IncorporationsResolve (c : ComplaintText) : Prop where

  subchapterScope : DefinitionalScopeRespected edge_subchapter_inc_1997 c

  soleNexusCarveOut : ExceptionApplies edge_1997_1_exc_1997_2 c

  ssaTitleXVIResolves : ReferencedSectionExists edge_1997_2_inc_ssa_1381 c
  ssaTitleXVIIIResolves : ReferencedSectionExists edge_1997_2_inc_ssa_1395 c
  ssaTitleXIXResolves : ReferencedSectionExists edge_1997_2_inc_ssa_1396 c



structure Coherent1997a (c : ComplaintText) : Prop where
  institutionDefinitionHonored : IncorporationHonored edge_1997a_a_inc_1997 c

  correctionalNarrowing : ExceptionApplies edge_1997a_a_exc_1997_1Bii c

  certificationRespected : SubordinationRespected edge_1997a_subjectTo_1997b c

  federalNoticeRespected : SubordinationRespected edge_1997a_subjectTo_1997h c

  grievanceProcedureExcluded : ExceptionApplies edge_1997a_exc_1997e_b c



structure Coherent1997a1 (c : ComplaintText) : Prop where
  institutionDefinitionHonored : IncorporationHonored edge_1997a1_a_inc_1997 c

  investigationPredicate : IncorporationHonored edge_1997a1_a_inc_subchapter c

  useRestrictionHonored : ExceptionApplies edge_1997a1_c_exc_useRestriction c


  contemptReadingApplied :
    EditorialDefectReadingApplied "42 USC § 1997a-1(b)(2)"
      "punished by the court as a contempt of that court" c



structure Coherent1997b (c : ComplaintText) : Prop where
  actionReferenceExists : ReferencedSectionExists edge_1997b_a_inc_1997a c
  actionReferenceHonored : IncorporationHonored edge_1997b_a_inc_1997a c



structure Coherent1997c (c : ComplaintText) : Prop where
  institutionDefinitionHonored : IncorporationHonored edge_1997c_a1_inc_1997 c

  ninetyDayBarException : ExceptionApplies edge_1997c_a1_exc_1997c_a2 c
  federalNoticeRespected : SubordinationRespected edge_1997c_subjectTo_1997h c
  grievanceProcedureExcluded : ExceptionApplies edge_1997c_exc_1997e_b c

  otherFeeProvisionsSaved : SavingsClausePreserved edge_1997c_d_savings_otherFees c







structure Coherent1997e (c : ComplaintText) : Prop where
  exhaustionReaches1983 : IncorporationHonored edge_1997e_a_inc_1983 c
  exhaustionReachesOtherLaw : OpenEndedIncorporationIdentified edge_1997e_a_inc_otherFederalLaw c

  preExhaustionDismissal : ExceptionApplies edge_1997e_a_exc_1997e_c2 c
  screeningReaches1983 : IncorporationHonored edge_1997e_c1_inc_1983 c

  cripaRosterMembership : EnumeratedIncorporationMembership edge_1997e_b_inc_1997a c
  cripaRosterMembership2 : EnumeratedIncorporationMembership edge_1997e_b_inc_1997c c

  feeCapAttachesTo1988 : IncorporationHonored edge_1997e_d1_inc_1988 c

  cjaRateResolves : CrossTitleReferenceResolves edge_1997e_d3_inc_18_3006A c

  sexualActDefinitionResolves : CrossTitleReferenceResolves edge_1997e_e_inc_18_2246 c

  pretrialReaches1983 : IncorporationHonored edge_1997e_f1_inc_1983 c

  waiverOverride : OverrideTriggered edge_1997e_g1_notwithstanding_otherLaw c

  prisonerDefinitionScoped : DefinitionalScopeRespected edge_1997e_h_defScope_1997e c




inductive PrisonConditionsActionPathway (c : ComplaintText) : Prop where
  | exhausted
      (h : SubordinationRespected edge_1983_subjectTo_1997e_a c)
      : PrisonConditionsActionPathway c
  | dismissedPreExhaustion
      (h : ExceptionApplies edge_1997e_a_exc_1997e_c2 c)
      (hScreen : SubordinationRespected edge_1983_subjectTo_1997e_c c)
      : PrisonConditionsActionPathway c



structure Coherent1997f (c : ComplaintText) : Prop where
  reportVehicleResolves : CrossTitleReferenceResolves edge_1997f_inc_28_522 c
  subchapterScopeHonored : IncorporationHonored edge_1997f_inc_subchapter c



structure Coherent1997h (c : ComplaintText) : Prop where
  initiationReferenceHonored : IncorporationHonored edge_1997h_inc_1997a c
  interventionReferenceHonored : IncorporationHonored edge_1997h_inc_1997c c



structure Coherent1997i (c : ComplaintText) : Prop where
  noStandardsOfCareRegulations : DisclaimerScopeHonored edge_1997i_savings_subchapter c



structure Coherent1997j (c : ComplaintText) : Prop where
  privateRightsUnchanged : SavingsClausePreserved edge_1997j_savings_existingLaw c
  noDelayOrPrejudice : DisclaimerScopeHonored edge_1997j_savings_privateLitigation c







inductive CripaUnitedStatesParticipation (c : ComplaintText) : Prop where
  | initiation (h : Coherent1997a c) : CripaUnitedStatesParticipation c
  | intervention (h : Coherent1997c c) : CripaUnitedStatesParticipation c

end Proving.USC.T42.Ch21Core.Structure
