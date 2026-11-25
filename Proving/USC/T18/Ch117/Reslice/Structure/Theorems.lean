





import Proving.USC.Common.Types
import Proving.USC.T18.Ch117.Reslice.Structure.Types
import Proving.USC.T18.Ch117.Reslice.Structure.Predicates
import Proving.USC.T18.Ch117.Reslice.Structure.Statute

set_option autoImplicit false

namespace Proving.USC.T18.Ch117.Reslice.Structure

open Proving.USC.Common


theorem coherent2421A_intro {c : ComplaintText}
    (hIcsA : IncorporationHonored edge_2421Aa_incorporates_47usc230f c)
    (hIcsB : IncorporationHonored edge_2421Ab_incorporates_47usc230f c)
    (hCross : CrossTitleReferenceResolves edge_2421Aa_incorporates_47usc230f c)
    (hTraf : ReferencedSectionExists edge_2421Ab2_incorporates_1591a c)
    (hScriv : ScrivenerCorrectionApplied edge_2421Ab2_incorporates_1591a c)
    (hCivil : ReferencedSectionExists edge_2421Ac_incorporates_2421Ab c)
    (hRestTrig : ReferencedSectionExists edge_2421Ad_incorporates_2421Ab2 c)
    (hRestScope : IncorporationHonored edge_2421Ad_incorporates_2327b c)
    (hSavings : SavingsClausePreserved edge_2421Ad_savings_otherPenalties c)
    : Coherent2421A c :=
  { icsDefinitionA := hIcsA
  , icsDefinitionB := hIcsB
  , icsCrossTitle := hCross
  , traffickingRef := hTraf
  , traffickingScrivener := hScriv
  , civilRemedyRef := hCivil
  , restitutionTrigger := hRestTrig
  , restitutionScope := hRestScope
  , savings := hSavings }


theorem restitution2421AdOverride_intro_viaSection3663 {c : ComplaintText}
    (h : OverrideTriggered edge_2421Ad_notwithstanding_3663 c)
    : Restitution2421AdOverride c :=
  .viaSection3663 h


theorem restitution2421AdOverride_intro_viaSection3663A {c : ComplaintText}
    (h : OverrideTriggered edge_2421Ad_notwithstanding_3663A c)
    : Restitution2421AdOverride c :=
  .viaSection3663A h


theorem defense2421Ae_intro_toSubsectionA {c : ComplaintText}
    (h : ExceptionApplies edge_2421Ae_exceptAsProvided_2421Aa c)
    : Defense2421Ae c :=
  .toSubsectionA h


theorem defense2421Ae_intro_toSubsectionB1 {c : ComplaintText}
    (h : ExceptionApplies edge_2421Ae_exceptAsProvided_2421Ab1 c)
    : Defense2421Ae c :=
  .toSubsectionB1 h


theorem section2423gIncorporationsResolve_intro {c : ComplaintText}
    (hAct : IncorporationHonored edge_2423g1_incorporates_2246 c)
    (hCh : ReferencedSectionExists edge_2423g1_incorporates_ch109A c)
    (hComm : IncorporationHonored edge_2423g2_incorporates_1591 c)
    (hCp : IncorporationHonored edge_2423g3_incorporates_2256_8 c)
    : Section2423gIncorporationsResolve c :=
  { sexualAct := hAct
  , chapter109A := hCh
  , commercialSexAct := hComm
  , childPornography := hCp }


theorem coherent2423_intro {c : ComplaintText}
    (hDefs : Section2423gIncorporationsResolve c)
    (hTravel : IncorporationHonored edge_2423b_incorporates_2423g c)
    (hResidence : IncorporationHonored edge_2423c_incorporates_2423g c)
    (hOrg : IncorporationHonored edge_2423d3_incorporates_2423g c)
    (hFacil : IncorporationHonored edge_2423e_incorporates_2423g c)
    (hIntent : IncorporationHonored edge_2423a_incorporates_2423h c)
    (hScopeG : DefinitionalScopeRespected edge_2423g_lexSpecialis_2423 c)
    (hScopeH : DefinitionalScopeRespected edge_2423h_lexSpecialis_2423 c)
    (hInchoate : ReferencedSectionExists edge_2423f_incorporates_2423ae c)
    : Coherent2423 c :=
  { definitions := hDefs
  , travelDefinition := hTravel
  , residenceDefinition := hResidence
  , organizationDefinition := hOrg
  , facilitationDefinition := hFacil
  , intentDefinition := hIntent
  , scopeOfG := hScopeG
  , scopeOfH := hScopeH
  , inchoateRef := hInchoate }


theorem defense2423i_intro {c : ComplaintText}
    (h : ExceptionApplies edge_2423i_exceptAsProvided_2423g2 c)
    : Defense2423i c :=
  .toCommercialSexActBranch h

end Proving.USC.T18.Ch117.Reslice.Structure
