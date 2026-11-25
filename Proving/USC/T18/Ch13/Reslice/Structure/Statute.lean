import Proving.USC.T18.Ch13.Reslice.Structure.Predicates

set_option autoImplicit false





















namespace Proving.USC.T18.Ch13.Reslice.Structure

open Proving.USC.Common


structure Coherent245 (c : ComplaintText) : Prop where

  certificationConstraint :
    SubjectToConstraintSatisfied edge_245b_subjectTo_245a1_certification c

  stateJurisdictionSaved :
    SavingsClausePreserved edge_245a1_savings_stateJurisdiction c

  investigativeAuthoritySaved :
    SavingsClausePreserved edge_245a2_savings_federalInvestigation c

  catalog4A1 : IncorporationHonored edge_245b4A_incorporates_245b1 c

  catalog4A2 : IncorporationHonored edge_245b4A_incorporates_245b2 c

  catalog51 : IncorporationHonored edge_245b5_incorporates_245b1 c

  catalog52 : IncorporationHonored edge_245b5_incorporates_245b2 c


  speechDefinition :
    IncorporationHonored edge_245b5_incorporates_245b_speechDefinition c

  fineScheduleExists : ReferencedSectionExists edge_245b_incorporates_3571_fine c

  fineScheduleHonored : IncorporationHonored edge_245b_incorporates_3571_fine c

  stateDefinition : IncorporationHonored edge_245_incorporates_245d_stateDefinition c

  lodgingCarve2F :
    ExceptionApplies edge_245b2F_exceptAsProvided_lodgingProprietor c →
    ExceptionHonored edge_245b2F_exceptAsProvided_lodgingProprietor c

  lodgingCarve4A :
    ExceptionApplies edge_245b4A_exceptAsProvided_lodgingProprietor c →
    ExceptionHonored edge_245b4A_exceptAsProvided_lodgingProprietor c

  officerCarve :
    ExceptionApplies edge_245c_exceptAsProvided_lawEnforcementOfficer c →
    ExceptionHonored edge_245c_exceptAsProvided_lawEnforcementOfficer c


structure Coherent247 (c : ComplaintText) : Prop where

  commerceCircumstances : IncorporationHonored edge_247a_incorporates_247b_circumstances c

  punishmentA : IncorporationHonored edge_247a_incorporates_247d_punishment c

  punishmentC : IncorporationHonored edge_247c_incorporates_247d_punishment c

  fineScheduleExists : ReferencedSectionExists edge_247d_incorporates_3571_fine c

  fineScheduleHonored : IncorporationHonored edge_247d_incorporates_3571_fine c

  certificationConstraint : SubjectToConstraintSatisfied edge_247_subjectTo_247e_certification c

  propertyDefinitionA : IncorporationHonored edge_247a_incorporates_247f_definition c

  propertyDefinitionC : IncorporationHonored edge_247c_incorporates_247f_definition c

  limitationsConstraint : SubjectToConstraintSatisfied edge_247_subjectTo_247g_limitations c

  generalLimitationsExists : ReferencedSectionExists edge_247g_lexSpecialis_3282 c

  limitationsControls : LexSpecialisControls edge_247g_lexSpecialis_3282 c


structure Coherent248 (c : ComplaintText) : Prop where

  penaltiesConstraint : SubjectToConstraintSatisfied edge_248a_subjectTo_248b_penalties c

  remediesConstraint : SubjectToConstraintSatisfied edge_248a_subjectTo_248c_remedies c

  definitions : IncorporationHonored edge_248a_incorporates_248e_definitions c

  violationBackReference : IncorporationHonored edge_248b_incorporates_248a_violation c

  fineScheduleExists : ReferencedSectionExists edge_248b_incorporates_3571_fine c

  fineScheduleHonored : IncorporationHonored edge_248b_incorporates_3571_fine c


  fineOverride :
    OverrideTriggered edge_248b_notwithstanding_3571 c →
    OverrideHonored edge_248b_notwithstanding_3571 c

  prohibitedConductReference : IncorporationHonored edge_248c1A_incorporates_248a_conduct c

  standingLimit :
    ExceptionApplies edge_248c1A_exceptAsProvided_standingLimit c →
    ExceptionHonored edge_248c1A_exceptAsProvided_standingLimit c

  parentalCarve :
    ExceptionApplies edge_248a_exceptAsProvided_parentalCarve c →
    ExceptionHonored edge_248a_exceptAsProvided_parentalCarve c

  agReliefReference : IncorporationHonored edge_248c2B_incorporates_248c1B c

  stateAgReliefReference : IncorporationHonored edge_248c3B_incorporates_248c2B c

  firstAmendmentSaved : SavingsClausePreserved edge_248d1_savings_firstAmendment c

  existingRemediesSaved : SavingsClausePreserved edge_248d2_savings_existingRemedies c

  stateLawSaved : SavingsClausePreserved edge_248d3_savings_stateAndLocalLaw c


  federalNonExclusivity : SavingsClausePreserved edge_248d3_savings_247_nonExclusive c

  stateAbortionLawSaved : SavingsClausePreserved edge_248d4_savings_stateAbortionLaws c




inductive FineRegime248 (c : ComplaintText) : Prop where

  | general (h : IncorporationHonored edge_248b_incorporates_3571_fine c) : FineRegime248 c


  | nonviolentObstructionOverride
      (hTrig : OverrideTriggered edge_248b_notwithstanding_3571 c)
      (hHon : OverrideHonored edge_248b_notwithstanding_3571 c) : FineRegime248 c




inductive ProsecutionPath245 (c : ComplaintText) : Prop where

  | federal
      (h : SubjectToConstraintSatisfied edge_245b_subjectTo_245a1_certification c) :
      ProsecutionPath245 c

  | stateConcurrent
      (h : SavingsClausePreserved edge_245a1_savings_stateJurisdiction c) :
      ProsecutionPath245 c

end Proving.USC.T18.Ch13.Reslice.Structure
