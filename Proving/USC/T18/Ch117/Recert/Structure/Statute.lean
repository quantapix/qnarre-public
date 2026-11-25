







import Proving.USC.Common.Types
import Proving.USC.T18.Ch117.Recert.Structure.Types
import Proving.USC.T18.Ch117.Recert.Structure.Predicates

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch117.Recert.Structure

open Proving.USC.Common





structure ExceptionCoherent (r : Ref) (c : ComplaintText) : Prop where
  referentResolves : InternalSubsectionReferenceResolves r c
  honoredIfTriggered : ExceptionApplies r c → ExceptionHonored r c




structure IcsDefinitionResolves (r : Ref) (n : EditorialNote) (c : ComplaintText) : Prop where
  termBound : DefinitionalTermBound r c
  crossTitle : CrossTitleReferenceResolves r c
  defectHarmless : EditorialDefectDoesNotDefeatReference n c




inductive Restitution2421AOverride (c : ComplaintText) : Prop where

  | over3663
      (exists3663 : ReferencedSectionExists edge_2421Ad_notwithstanding_3663 c)
      (fires : OverrideTriggered edge_2421Ad_notwithstanding_3663 c)

  | over3663A
      (exists3663A : ReferencedSectionExists edge_2421Ad_notwithstanding_3663A c)
      (fires : OverrideTriggered edge_2421Ad_notwithstanding_3663A c)




structure Restitution2421ADirective (c : ComplaintText) : Prop where
  override : Restitution2421AOverride c
  overrideDefectHarmless : EditorialDefectDoesNotDefeatReference note_2421Ad_override c
  trigger : InternalSubsectionReferenceResolves edge_2421Ad_incorporates_2421Ab2 c
  scopeExists : ReferencedSectionExists edge_2421Ad_incorporates_2327b c
  scopeHonored : IncorporationHonored edge_2421Ad_incorporates_2327b c
  savingsPreserved : SavingsClausePreserves edge_2421Ad_savings_otherLaw c
  savingsScopeDetermined : OpenReferenceScopeDetermined edge_2421Ad_savings_otherLaw c



structure Coherent2421A (c : ComplaintText) : Prop where
  icsSubsectionA : IcsDefinitionResolves edge_2421Aa_incorporates_47usc230f note_2421Aa_ics c
  icsSubsectionB : IcsDefinitionResolves edge_2421Ab_incorporates_47usc230f note_2421Ab_ics c
  traffickingExists : ReferencedSectionExists edge_2421Ab2_incorporates_1591a c
  traffickingHonored : IncorporationHonored edge_2421Ab2_incorporates_1591a c
  traffickingDefectHarmless : EditorialDefectDoesNotDefeatReference note_2421Ab2_1591a c
  privateRightReferent : InternalSubsectionReferenceResolves edge_2421Ac_incorporates_2421Ab c
  restitution : Restitution2421ADirective c
  defenseToSubsectionA : ExceptionCoherent edge_2421Ae_exceptAsProvided_2421Aa c
  defenseToSubsectionB1 : ExceptionCoherent edge_2421Ae_exceptAsProvided_2421Ab1 c



structure Inchoate2423Resolves (c : ComplaintText) : Prop where
  toSubsectionA : InternalSubsectionReferenceResolves edge_2423f_incorporates_2423a c
  toSubsectionB : InternalSubsectionReferenceResolves edge_2423f_incorporates_2423b c
  toSubsectionC : InternalSubsectionReferenceResolves edge_2423f_incorporates_2423c c
  toSubsectionD : InternalSubsectionReferenceResolves edge_2423f_incorporates_2423d c
  toSubsectionE : InternalSubsectionReferenceResolves edge_2423f_incorporates_2423e c






structure Section2423gIncorporationsResolve (c : ComplaintText) : Prop where
  sexualActBound : DefinitionalTermBound edge_2423g1_incorporates_2246 c
  sexualActExists : ReferencedSectionExists edge_2423g1_incorporates_2246 c
  chapter109AExists : ReferencedChapterExists edge_2423g1_incorporates_ch109A c
  chapter109AHonored : IncorporationHonored edge_2423g1_incorporates_ch109A c
  commercialSexActBound : DefinitionalTermBound edge_2423g2_incorporates_1591 c
  commercialSexActExists : ReferencedSectionExists edge_2423g2_incorporates_1591 c
  childPornographyBound : DefinitionalTermBound edge_2423g3_incorporates_2256_8 c
  childPornographyExists : ReferencedSectionExists edge_2423g3_incorporates_2256_8 c
  localDefinitionControls : SectionLocalDefinitionControls edge_2423g_lexSpecialis_2423 c



structure Coherent2423 (c : ComplaintText) : Prop where
  openCriminalLawScope : OpenReferenceScopeDetermined edge_2423a_incorporates_openCriminalLaw c
  inchoate : Inchoate2423Resolves c
  definitions : Section2423gIncorporationsResolve c
  intentGlossControls : SectionLocalDefinitionControls edge_2423h_lexSpecialis_2423 c
  ageDefense : ExceptionCoherent edge_2423i_exceptAsProvided_2423g2 c


structure CoherentCh117Recert (c : ComplaintText) : Prop where
  s2421A : Coherent2421A c
  s2423 : Coherent2423 c

end Proving.USC.T18.Ch117.Recert.Structure
