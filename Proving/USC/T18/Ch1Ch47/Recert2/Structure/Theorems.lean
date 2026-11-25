



import Proving.USC.T18.Ch1Ch47.Recert2.Structure.Types
import Proving.USC.T18.Ch1Ch47.Recert2.Structure.Predicates
import Proving.USC.T18.Ch1Ch47.Recert2.Structure.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Tactic

set_option autoImplicit false

namespace Proving.USC.T18.Ch1Ch47.Recert2.Structure

open Proving.USC.Common

theorem section7IncorporationsResolve_intro {c : ComplaintText}
    (hTargets : ∀ r ∈ refs7, ReferencedSectionExists r c)
    (hIna : IncorporationHonored edge_7_9_incorporates_ina101 c)
    (hTreaty : SavingsClausePreserves edge_7_9_savings_treaties c)
    (hMeja : ExceptionApplies edge_7_9_exceptAsProvided_3261a c)
    (hScope : ScopeClauseReaches scope_7_title
      "18 USC — any section using \"special maritime and territorial jurisdiction of the United States\"" c)
    : Section7IncorporationsResolve c :=
  ⟨hTargets, hIna, hTreaty, hMeja, hScope⟩

theorem section20IncorporationsResolve_intro {c : ComplaintText}
    (hTargets : ∀ r ∈ refs20, ReferencedSectionExists r c)
    (hPopular : ∀ r ∈ refs20PopularName, PopularNameReferenceResolves r c)
    (hMortgage : IncorporationHonored edge_20_10_incorporates_18usc27 c)
    (hDefect : EditorialDefectDoesNotDefeatReference edge_20_8_incorporates_fra25a c)
    (hScope : ScopeClauseReaches scope_20_title
      "18 USC — any section using \"financial institution\"" c)
    : Section20IncorporationsResolve c :=
  ⟨hTargets, hPopular, hMortgage, hDefect, hScope⟩

theorem coherent21_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_21_b_incorporates_115 c)
    (hHonored : IncorporationHonored edge_21_b_incorporates_115 c)
    (hTransfer : ScopeClauseReaches scope_21_a_title "18 USC § 1028(a)(2)" c)
    (hPossession : ScopeClauseReaches scope_21_a_title "18 USC § 1028(a)(6)" c)
    : Coherent21 c :=
  ⟨hExists, hHonored, hTransfer, hPossession⟩

theorem section23IncorporationsResolve_intro {c : ComplaintText}
    (hTargets : ∀ r ∈ refs23, ReferencedSectionExists r c)
    (hScope : ScopeClauseReaches scope_23_title
      "18 USC — any section using \"court of the United States\"" c)
    (hOpen : ExceptionApplies edge_23_exceptAsProvided_openEnded c)
    (hDefect : EditorialDefectDoesNotDefeatReference edge_23_exceptAsProvided_openEnded c)
    : Section23IncorporationsResolve c :=
  ⟨hTargets, hScope, hOpen, hDefect⟩

theorem section24IncorporationsResolve_intro {c : ComplaintText}
    (hTargets : ∀ r ∈ refs24, ReferencedSectionExists r c)
    (hIntra : ∀ r ∈ refs24IntraTitle, IncorporationHonored r c)
    (hPopular : ∀ r ∈ refs24PopularName, PopularNameReferenceResolves r c)
    (hCondition : ConditionalIncorporationTriggered edge_24_a2_incorporates_24b c)
    (hDefect : EditorialDefectDoesNotDefeatReference edge_24_a2_incorporates_ffdca301 c)
    (hScope : ScopeClauseReaches scope_24_title
      "18 USC — any section using \"Federal health care offense\"" c)
    : Section24IncorporationsResolve c :=
  ⟨hTargets, hIntra, hPopular, hCondition, hDefect, hScope⟩

theorem coherent1028_intro {c : ComplaintText}
    (hTargets : ∀ r ∈ refs1028, ReferencedSectionExists r c)
    (hCircumstance : IncorporationHonored edge_1028a_incorporates_1028c c)
    (hPenalty : ReferencedSectionExists edge_1028a_subjectTo_1028b c)
    (hTier3 : ExceptionApplies edge_1028b1_exceptAsProvided_1028b3 c)
    (hTier4 : ExceptionApplies edge_1028b1_exceptAsProvided_1028b4 c)
    (hSpecific : LexSpecialisControls edge_1028b1D_lexSpecialis_1028b2B c)
    (hResidual : LexSpecialisControls edge_1028b1_lexSpecialis_1028b6 c)
    (hAccessDevice : IncorporationHonored edge_1028d7D_incorporates_1029e c)
    (hStolenProof : IncorporationHonored edge_1028a2_incorporates_21a c)
    (hSavings : SavingsClausePreserves edge_1028e_savings_ch224 c)
    (hForfeitureExists : ReferencedSectionExists edge_1028g_subjectTo_21usc853 c)
    (hForfeitureResolves : PopularNameReferenceResolves edge_1028g_subjectTo_21usc853 c)
    (hForfeitureCarveOut : ExceptionApplies edge_1028g_exceptAsProvided_21usc853d c)
    (hDefect : EditorialDefectDoesNotDefeatReference edge_1028b2A_incorporates_1028a c)
    (hScope1028A : ScopeClauseReaches scope_1028_d "18 USC § 1028A" c)
    : Coherent1028 c :=
  ⟨hTargets, hCircumstance, hPenalty, hTier3, hTier4, hSpecific, hResidual,
   hAccessDevice, hStolenProof, hSavings, hForfeitureExists, hForfeitureResolves,
   hForfeitureCarveOut, hDefect, hScope1028A⟩



theorem section1028PenaltyPath_intro {c : ComplaintText}
    (h : OverrideTriggered edge_1028b1_exceptAsProvided_1028b3 c)
    : Section1028PenaltyPath c :=
  .tier3 h

theorem section1028PenaltyPath_intro_tier4 {c : ComplaintText}
    (h : OverrideTriggered edge_1028b1_exceptAsProvided_1028b4 c)
    : Section1028PenaltyPath c :=
  .tier4 h

theorem section1028PenaltyPath_intro_graded {c : ComplaintText}
    (h : ReferencedSectionExists edge_1028a_subjectTo_1028b c)
    : Section1028PenaltyPath c :=
  .graded h

theorem section1028PenaltyPath_intro_residual {c : ComplaintText}
    (h : LexSpecialisControls edge_1028b1_lexSpecialis_1028b6 c)
    : Section1028PenaltyPath c :=
  .residual h

theorem coherent1029_intro {c : ComplaintText}
    (hTargets : ∀ r ∈ refs1029, ReferencedSectionExists r c)
    (hPenalty : ReferencedSectionExists edge_1029a_subjectTo_1029c c)
    (hAttempt : IncorporationHonored edge_1029b1_incorporates_1029a c)
    (hConspiracy : ReferencedSectionExists edge_1029b2_subjectTo_1029c c)
    (hForfeitureExists : ReferencedSectionExists edge_1029c2_subjectTo_21usc853 c)
    (hForfeitureCarveOut : ExceptionApplies edge_1029c2_exceptAsProvided_21usc853d c)
    (hCcsm : IncorporationHonored edge_1029e7_incorporates_18usc20 c)
    (hExtraterritorial : IncorporationHonored edge_1029h_incorporates_18usc20 c)
    (hWiretap : ReferencedSectionExists edge_1029e8_incorporates_ch119 c)
    (hCarrier : IncorporationHonored edge_1029g1_incorporates_1029e10 c)
    (hPopular : ∀ r ∈ refs1029PopularName, PopularNameReferenceResolves r c)
    (hSavings : SavingsClausePreserves edge_1029f_savings_ch224 c)
    (hScope : ScopeClauseReaches scope_1029_e "18 USC § 1029" c)
    : Coherent1029 c :=
  ⟨hTargets, hPenalty, hAttempt, hConspiracy, hForfeitureExists, hForfeitureCarveOut,
   hCcsm, hExtraterritorial, hWiretap, hCarrier, hPopular, hSavings, hScope⟩



theorem section1029a9ExemptionPath_intro {c : ComplaintText}
    (h : ExceptionApplies edge_1029g1_exceptAsProvided_1029a9 c)
    : Section1029a9ExemptionPath c :=
  .carrierProtection h

theorem section1029a9ExemptionPath_intro_research {c : ComplaintText}
    (h : ExceptionApplies edge_1029g2_exceptAsProvided_1029a9 c)
    : Section1029a9ExemptionPath c :=
  .researchDefense h

theorem section1029a9ExemptionPath_intro_lawEnforcement {c : ComplaintText}
    (h : SavingsClausePreserves edge_1029f_savings_ch224 c)
    : Section1029a9ExemptionPath c :=
  .lawEnforcement h

theorem ch1DefinitionsReachCh47_intro {c : ComplaintText}
    (hFi1029e7 : ScopeClauseReaches scope_20_title "18 USC § 1029(e)(7)" c)
    (hFi1029h : ScopeClauseReaches scope_20_title "18 USC § 1029(h)" c)
    (hProof : ScopeClauseReaches scope_21_a_title "18 USC § 1028(a)(2)" c)
    (hHonor1029e7 : IncorporationHonored edge_1029e7_incorporates_18usc20 c)
    (hHonor1029h : IncorporationHonored edge_1029h_incorporates_18usc20 c)
    : Ch1DefinitionsReachCh47 c :=
  ⟨hFi1029e7, hFi1029h, hProof, hHonor1029e7, hHonor1029h⟩

end Proving.USC.T18.Ch1Ch47.Recert2.Structure
