




import Proving.USC.Common.Types
import Proving.USC.T18.Ch117.Recert.Structure.Types
import Proving.USC.T18.Ch117.Recert.Structure.Predicates
import Proving.USC.T18.Ch117.Recert.Structure.Statute

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Structure

open Proving.USC.Common

theorem exceptionCoherent_intro {r : Ref} {c : ComplaintText}
    (hRef : InternalSubsectionReferenceResolves r c)
    (hHon : ExceptionApplies r c → ExceptionHonored r c)
    : ExceptionCoherent r c :=
  ⟨hRef, hHon⟩

theorem icsDefinitionResolves_intro {r : Ref} {n : EditorialNote} {c : ComplaintText}
    (hBound : DefinitionalTermBound r c)
    (hCross : CrossTitleReferenceResolves r c)
    (hDefect : EditorialDefectDoesNotDefeatReference n c)
    : IcsDefinitionResolves r n c :=
  ⟨hBound, hCross, hDefect⟩


theorem restitution2421AOverride_over3663_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_2421Ad_notwithstanding_3663 c)
    (hFires : OverrideTriggered edge_2421Ad_notwithstanding_3663 c)
    : Restitution2421AOverride c :=
  .over3663 hExists hFires


theorem restitution2421AOverride_over3663A_intro {c : ComplaintText}
    (hExists : ReferencedSectionExists edge_2421Ad_notwithstanding_3663A c)
    (hFires : OverrideTriggered edge_2421Ad_notwithstanding_3663A c)
    : Restitution2421AOverride c :=
  .over3663A hExists hFires

theorem restitution2421ADirective_intro {c : ComplaintText}
    (hOverride : Restitution2421AOverride c)
    (hDefect : EditorialDefectDoesNotDefeatReference note_2421Ad_override c)
    (hTrigger : InternalSubsectionReferenceResolves edge_2421Ad_incorporates_2421Ab2 c)
    (hScopeExists : ReferencedSectionExists edge_2421Ad_incorporates_2327b c)
    (hScopeHonored : IncorporationHonored edge_2421Ad_incorporates_2327b c)
    (hSavings : SavingsClausePreserves edge_2421Ad_savings_otherLaw c)
    (hSavingsScope : OpenReferenceScopeDetermined edge_2421Ad_savings_otherLaw c)
    : Restitution2421ADirective c :=
  ⟨hOverride, hDefect, hTrigger, hScopeExists, hScopeHonored, hSavings, hSavingsScope⟩

theorem coherent2421A_intro {c : ComplaintText}
    (hIcsA : IcsDefinitionResolves edge_2421Aa_incorporates_47usc230f note_2421Aa_ics c)
    (hIcsB : IcsDefinitionResolves edge_2421Ab_incorporates_47usc230f note_2421Ab_ics c)
    (hTraffickingExists : ReferencedSectionExists edge_2421Ab2_incorporates_1591a c)
    (hTraffickingHonored : IncorporationHonored edge_2421Ab2_incorporates_1591a c)
    (hTraffickingDefect : EditorialDefectDoesNotDefeatReference note_2421Ab2_1591a c)
    (hPrivateRight : InternalSubsectionReferenceResolves edge_2421Ac_incorporates_2421Ab c)
    (hRestitution : Restitution2421ADirective c)
    (hDefenseA : ExceptionCoherent edge_2421Ae_exceptAsProvided_2421Aa c)
    (hDefenseB1 : ExceptionCoherent edge_2421Ae_exceptAsProvided_2421Ab1 c)
    : Coherent2421A c :=
  ⟨hIcsA, hIcsB, hTraffickingExists, hTraffickingHonored, hTraffickingDefect,
   hPrivateRight, hRestitution, hDefenseA, hDefenseB1⟩

theorem inchoate2423Resolves_intro {c : ComplaintText}
    (hA : InternalSubsectionReferenceResolves edge_2423f_incorporates_2423a c)
    (hB : InternalSubsectionReferenceResolves edge_2423f_incorporates_2423b c)
    (hC : InternalSubsectionReferenceResolves edge_2423f_incorporates_2423c c)
    (hD : InternalSubsectionReferenceResolves edge_2423f_incorporates_2423d c)
    (hE : InternalSubsectionReferenceResolves edge_2423f_incorporates_2423e c)
    : Inchoate2423Resolves c :=
  ⟨hA, hB, hC, hD, hE⟩

theorem section2423gIncorporationsResolve_intro {c : ComplaintText}
    (hSexualActBound : DefinitionalTermBound edge_2423g1_incorporates_2246 c)
    (hSexualActExists : ReferencedSectionExists edge_2423g1_incorporates_2246 c)
    (hChapterExists : ReferencedChapterExists edge_2423g1_incorporates_ch109A c)
    (hChapterHonored : IncorporationHonored edge_2423g1_incorporates_ch109A c)
    (hCommercialBound : DefinitionalTermBound edge_2423g2_incorporates_1591 c)
    (hCommercialExists : ReferencedSectionExists edge_2423g2_incorporates_1591 c)
    (hChildPornBound : DefinitionalTermBound edge_2423g3_incorporates_2256_8 c)
    (hChildPornExists : ReferencedSectionExists edge_2423g3_incorporates_2256_8 c)
    (hLocalControls : SectionLocalDefinitionControls edge_2423g_lexSpecialis_2423 c)
    : Section2423gIncorporationsResolve c :=
  ⟨hSexualActBound, hSexualActExists, hChapterExists, hChapterHonored,
   hCommercialBound, hCommercialExists, hChildPornBound, hChildPornExists,
   hLocalControls⟩

theorem coherent2423_intro {c : ComplaintText}
    (hOpenScope : OpenReferenceScopeDetermined edge_2423a_incorporates_openCriminalLaw c)
    (hInchoate : Inchoate2423Resolves c)
    (hDefinitions : Section2423gIncorporationsResolve c)
    (hIntentGloss : SectionLocalDefinitionControls edge_2423h_lexSpecialis_2423 c)
    (hAgeDefense : ExceptionCoherent edge_2423i_exceptAsProvided_2423g2 c)
    : Coherent2423 c :=
  ⟨hOpenScope, hInchoate, hDefinitions, hIntentGloss, hAgeDefense⟩

theorem coherentCh117Recert_intro {c : ComplaintText}
    (h2421A : Coherent2421A c)
    (h2423 : Coherent2423 c)
    : CoherentCh117Recert c :=
  ⟨h2421A, h2423⟩

end Proving.USC.T18.Ch117.Recert.Structure
