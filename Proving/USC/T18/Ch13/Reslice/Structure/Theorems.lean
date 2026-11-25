import Proving.USC.T18.Ch13.Reslice.Structure.Statute

set_option autoImplicit false





namespace Proving.USC.T18.Ch13.Reslice.Structure

open Proving.USC.Common

theorem coherent245_intro {c : ComplaintText}
    (hCert : SubjectToConstraintSatisfied edge_245b_subjectTo_245a1_certification c)
    (hState : SavingsClausePreserved edge_245a1_savings_stateJurisdiction c)
    (hInvest : SavingsClausePreserved edge_245a2_savings_federalInvestigation c)
    (hCat4A1 : IncorporationHonored edge_245b4A_incorporates_245b1 c)
    (hCat4A2 : IncorporationHonored edge_245b4A_incorporates_245b2 c)
    (hCat51 : IncorporationHonored edge_245b5_incorporates_245b1 c)
    (hCat52 : IncorporationHonored edge_245b5_incorporates_245b2 c)
    (hSpeech : IncorporationHonored edge_245b5_incorporates_245b_speechDefinition c)
    (hFineEx : ReferencedSectionExists edge_245b_incorporates_3571_fine c)
    (hFineHon : IncorporationHonored edge_245b_incorporates_3571_fine c)
    (hStateDef : IncorporationHonored edge_245_incorporates_245d_stateDefinition c)
    (hLodge2F : ExceptionApplies edge_245b2F_exceptAsProvided_lodgingProprietor c →
                ExceptionHonored edge_245b2F_exceptAsProvided_lodgingProprietor c)
    (hLodge4A : ExceptionApplies edge_245b4A_exceptAsProvided_lodgingProprietor c →
                ExceptionHonored edge_245b4A_exceptAsProvided_lodgingProprietor c)
    (hOfficer : ExceptionApplies edge_245c_exceptAsProvided_lawEnforcementOfficer c →
                ExceptionHonored edge_245c_exceptAsProvided_lawEnforcementOfficer c)
    : Coherent245 c :=
  ⟨hCert, hState, hInvest, hCat4A1, hCat4A2, hCat51, hCat52, hSpeech,
   hFineEx, hFineHon, hStateDef, hLodge2F, hLodge4A, hOfficer⟩

theorem coherent247_intro {c : ComplaintText}
    (hCommerce : IncorporationHonored edge_247a_incorporates_247b_circumstances c)
    (hPunA : IncorporationHonored edge_247a_incorporates_247d_punishment c)
    (hPunC : IncorporationHonored edge_247c_incorporates_247d_punishment c)
    (hFineEx : ReferencedSectionExists edge_247d_incorporates_3571_fine c)
    (hFineHon : IncorporationHonored edge_247d_incorporates_3571_fine c)
    (hCert : SubjectToConstraintSatisfied edge_247_subjectTo_247e_certification c)
    (hPropA : IncorporationHonored edge_247a_incorporates_247f_definition c)
    (hPropC : IncorporationHonored edge_247c_incorporates_247f_definition c)
    (hLimit : SubjectToConstraintSatisfied edge_247_subjectTo_247g_limitations c)
    (hGenEx : ReferencedSectionExists edge_247g_lexSpecialis_3282 c)
    (hControls : LexSpecialisControls edge_247g_lexSpecialis_3282 c)
    : Coherent247 c :=
  ⟨hCommerce, hPunA, hPunC, hFineEx, hFineHon, hCert, hPropA, hPropC,
   hLimit, hGenEx, hControls⟩

theorem coherent248_intro {c : ComplaintText}
    (hPen : SubjectToConstraintSatisfied edge_248a_subjectTo_248b_penalties c)
    (hRem : SubjectToConstraintSatisfied edge_248a_subjectTo_248c_remedies c)
    (hDefs : IncorporationHonored edge_248a_incorporates_248e_definitions c)
    (hBack : IncorporationHonored edge_248b_incorporates_248a_violation c)
    (hFineEx : ReferencedSectionExists edge_248b_incorporates_3571_fine c)
    (hFineHon : IncorporationHonored edge_248b_incorporates_3571_fine c)
    (hOverride : OverrideTriggered edge_248b_notwithstanding_3571 c →
                 OverrideHonored edge_248b_notwithstanding_3571 c)
    (hConduct : IncorporationHonored edge_248c1A_incorporates_248a_conduct c)
    (hStanding : ExceptionApplies edge_248c1A_exceptAsProvided_standingLimit c →
                 ExceptionHonored edge_248c1A_exceptAsProvided_standingLimit c)
    (hParental : ExceptionApplies edge_248a_exceptAsProvided_parentalCarve c →
                 ExceptionHonored edge_248a_exceptAsProvided_parentalCarve c)
    (hAgRelief : IncorporationHonored edge_248c2B_incorporates_248c1B c)
    (hStateAg : IncorporationHonored edge_248c3B_incorporates_248c2B c)
    (hFirstAm : SavingsClausePreserved edge_248d1_savings_firstAmendment c)
    (hExisting : SavingsClausePreserved edge_248d2_savings_existingRemedies c)
    (hStateLaw : SavingsClausePreserved edge_248d3_savings_stateAndLocalLaw c)
    (hNonExcl : SavingsClausePreserved edge_248d3_savings_247_nonExclusive c)
    (hAbortion : SavingsClausePreserved edge_248d4_savings_stateAbortionLaws c)
    : Coherent248 c :=
  ⟨hPen, hRem, hDefs, hBack, hFineEx, hFineHon, hOverride, hConduct,
   hStanding, hParental, hAgRelief, hStateAg, hFirstAm, hExisting,
   hStateLaw, hNonExcl, hAbortion⟩

theorem fineRegime248_general_intro {c : ComplaintText}
    (h : IncorporationHonored edge_248b_incorporates_3571_fine c) : FineRegime248 c :=
  .general h

theorem fineRegime248_override_intro {c : ComplaintText}
    (hTrig : OverrideTriggered edge_248b_notwithstanding_3571 c)
    (hHon : OverrideHonored edge_248b_notwithstanding_3571 c) : FineRegime248 c :=
  .nonviolentObstructionOverride hTrig hHon

theorem prosecutionPath245_federal_intro {c : ComplaintText}
    (h : SubjectToConstraintSatisfied edge_245b_subjectTo_245a1_certification c)
    : ProsecutionPath245 c :=
  .federal h

theorem prosecutionPath245_state_intro {c : ComplaintText}
    (h : SavingsClausePreserved edge_245a1_savings_stateJurisdiction c)
    : ProsecutionPath245 c :=
  .stateConcurrent h

end Proving.USC.T18.Ch13.Reslice.Structure
