




import Proving.USC.Common.Types
import Proving.USC.T18.Ch11.EchoReslice.Structure.Types
import Proving.USC.T18.Ch11.EchoReslice.Structure.Predicates
import Proving.USC.T18.Ch11.EchoReslice.Structure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch11.EchoReslice.Structure

open Proving.USC.Common


theorem section201Incorporations_intro {c : ComplaintText}
    (hBPO : IncorporationHonored edge_201b_incorporates_201a1 c)
    (hBSO : IncorporationHonored edge_201b_incorporates_201a2 c)
    (hBOA : IncorporationHonored edge_201b_incorporates_201a3 c)
    (hCPO : IncorporationHonored edge_201c_incorporates_201a1 c)
    (hCSO : IncorporationHonored edge_201c_incorporates_201a2 c)
    (hCOA : IncorporationHonored edge_201c_incorporates_201a3 c)
    (hConf : DefinitionConfinedToSection edge_201b_incorporates_201a3 c)
    (hBFine : TitleWideIncorporationResolves edge_201b_fine_thisTitle c)
    (hCFine : TitleWideIncorporationResolves edge_201c_fine_thisTitle c)
    : Section201Incorporations c :=
  ⟨hBPO, hBSO, hBOA, hCPO, hCSO, hCOA, hConf, hBFine, hCFine⟩




theorem witnessFeeExceptionPath_statutoryFee_intro {c : ComplaintText}
    (h : WitnessFeeProvidedByLaw c) : WitnessFeeExceptionPath c :=
  .statutoryFee h


theorem witnessFeeExceptionPath_travelCost_intro {c : ComplaintText}
    (h : ReasonableTravelAndSubsistenceCost c) : WitnessFeeExceptionPath c :=
  .travelCost h


theorem witnessFeeExceptionPath_timeLost_intro {c : ComplaintText}
    (h : ReasonableValueOfTimeLost c) : WitnessFeeExceptionPath c :=
  .timeLost h


theorem witnessFeeExceptionPath_expertFee_intro {c : ComplaintText}
    (h : ReasonableExpertWitnessFee c) : WitnessFeeExceptionPath c :=
  .expertFee h


theorem witnessFeeCarveHonored_intro {r : Ref} {c : ComplaintText}
    (hApplies : ExceptionApplies r c)
    (hRoute : WitnessFeeExceptionPath c)
    : WitnessFeeCarveHonored r c :=
  ⟨hApplies, hRoute⟩


theorem section201dCarve_intro {c : ComplaintText}
    (hB3 : WitnessFeeCarveHonored edge_201b3_exceptAsProvided_201d c)
    (hB4 : WitnessFeeCarveHonored edge_201b4_exceptAsProvided_201d c)
    (hC2 : WitnessFeeCarveHonored edge_201c2_exceptAsProvided_201d c)
    (hC3 : WitnessFeeCarveHonored edge_201c3_exceptAsProvided_201d c)
    : Section201dCarve c :=
  ⟨hB3, hB4, hC2, hC3⟩


theorem section201SavingsCumulation_intro {c : ComplaintText}
    (hE1503 : ReferencedSectionExists edge_201e_savings_1503 c)
    (hE1504 : ReferencedSectionExists edge_201e_savings_1504 c)
    (hE1505 : ReferencedSectionExists edge_201e_savings_1505 c)
    (hP1503 : SavingsClauseHonored edge_201e_savings_1503 c)
    (hP1504 : SavingsClauseHonored edge_201e_savings_1504 c)
    (hP1505 : SavingsClauseHonored edge_201e_savings_1505 c)
    : Section201SavingsCumulation c :=
  ⟨hE1503, hE1504, hE1505, hP1503, hP1504, hP1505⟩


theorem section201DanglingRefs_intro {c : ComplaintText}
    (hDischarge : DanglingReferenceResolved dangling_201c1_properDischargeOfDuty c)
    (hFeeLaw : DanglingReferenceResolved dangling_201d_witnessFeesProvidedByLaw c)
    (hTestimony : DanglingReferenceResolved dangling_201b3_testimonyAuthority c)
    (hDuty : DanglingReferenceResolved dangling_201b1C_lawfulDuty c)
    (hFormer : DanglingReferenceResolved dangling_201c1_formerPublicOfficial c)
    : Section201DanglingRefs c :=
  ⟨hDischarge, hFeeLaw, hTestimony, hDuty, hFormer⟩


theorem coherent201_intro {c : ComplaintText}
    (hInc : Section201Incorporations c)
    (hCarve : Section201dCarve c)
    (hSav : Section201SavingsCumulation c)
    (hDang : Section201DanglingRefs c)
    : Coherent201 c :=
  ⟨hInc, hCarve, hSav, hDang⟩

end Proving.USC.T18.Ch11.EchoReslice.Structure
