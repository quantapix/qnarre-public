















import Proving.USC.Common.Types
import Proving.USC.T18.Ch117.Reslice.Structure.Types
import Proving.USC.T18.Ch117.Reslice.Structure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Structure

open Proving.USC.Common





structure Coherent2421A (c : ComplaintText) : Prop where

  icsDefinitionA : IncorporationHonored edge_2421Aa_incorporates_47usc230f c

  icsDefinitionB : IncorporationHonored edge_2421Ab_incorporates_47usc230f c

  icsCrossTitle : CrossTitleReferenceResolves edge_2421Aa_incorporates_47usc230f c

  traffickingRef : ReferencedSectionExists edge_2421Ab2_incorporates_1591a c

  traffickingScrivener : ScrivenerCorrectionApplied edge_2421Ab2_incorporates_1591a c

  civilRemedyRef : ReferencedSectionExists edge_2421Ac_incorporates_2421Ab c

  restitutionTrigger : ReferencedSectionExists edge_2421Ad_incorporates_2421Ab2 c

  restitutionScope : IncorporationHonored edge_2421Ad_incorporates_2327b c

  savings : SavingsClausePreserved edge_2421Ad_savings_otherPenalties c




inductive Restitution2421AdOverride (c : ComplaintText) : Prop
  |
    viaSection3663 : OverrideTriggered edge_2421Ad_notwithstanding_3663 c →
      Restitution2421AdOverride c
  |
    viaSection3663A : OverrideTriggered edge_2421Ad_notwithstanding_3663A c →
      Restitution2421AdOverride c




inductive Defense2421Ae (c : ComplaintText) : Prop
  |
    toSubsectionA : ExceptionApplies edge_2421Ae_exceptAsProvided_2421Aa c →
      Defense2421Ae c
  |
    toSubsectionB1 : ExceptionApplies edge_2421Ae_exceptAsProvided_2421Ab1 c →
      Defense2421Ae c





structure Section2423gIncorporationsResolve (c : ComplaintText) : Prop where

  sexualAct : IncorporationHonored edge_2423g1_incorporates_2246 c

  chapter109A : ReferencedSectionExists edge_2423g1_incorporates_ch109A c

  commercialSexAct : IncorporationHonored edge_2423g2_incorporates_1591 c

  childPornography : IncorporationHonored edge_2423g3_incorporates_2256_8 c





structure Coherent2423 (c : ComplaintText) : Prop where

  definitions : Section2423gIncorporationsResolve c

  travelDefinition : IncorporationHonored edge_2423b_incorporates_2423g c

  residenceDefinition : IncorporationHonored edge_2423c_incorporates_2423g c

  organizationDefinition : IncorporationHonored edge_2423d3_incorporates_2423g c

  facilitationDefinition : IncorporationHonored edge_2423e_incorporates_2423g c

  intentDefinition : IncorporationHonored edge_2423a_incorporates_2423h c

  scopeOfG : DefinitionalScopeRespected edge_2423g_lexSpecialis_2423 c

  scopeOfH : DefinitionalScopeRespected edge_2423h_lexSpecialis_2423 c

  inchoateRef : ReferencedSectionExists edge_2423f_incorporates_2423ae c



inductive Defense2423i (c : ComplaintText) : Prop
  |
    toCommercialSexActBranch : ExceptionApplies edge_2423i_exceptAsProvided_2423g2 c →
      Defense2423i c

end Proving.USC.T18.Ch117.Reslice.Structure
